FROM alpine:3.18

ARG PORT_SSH
ARG PORT_POSTGRES
ARG ACCESS_USER
ARG MDP_USER
ARG PATH_BACKUP
ARG PATH_LOGS
ARG PATH_SCRIPT

# 70 is the standard uid/gid for "postgres" in Alpine
# https://git.alpinelinux.org/aports/tree/main/postgresql/postgresql.pre-install?h=3.12-stable
RUN set -eux; \
	addgroup -g 70 -S postgres; \
	adduser -u 70 -S -D -G postgres -H -h /var/lib/postgresql -s /bin/sh postgres; \
	mkdir -p /var/lib/postgresql; \
	chown -R postgres:postgres /var/lib/postgresql

# su-exec (gosu-compatible) is installed further down

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
# alpine doesn't require explicit locale-file generation
ENV LANG en_US.utf8

RUN mkdir /docker-entrypoint-initdb.d

ENV PG_MAJOR 15
ENV PG_VERSION 15.4
ENV PG_SHA256 baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9

ENV DOCKER_PG_LLVM_DEPS \
		llvm15-dev \
		clang15

RUN set -eux; \
	\
	wget -O postgresql.tar.bz2 "https://ftp.postgresql.org/pub/source/v$PG_VERSION/postgresql-$PG_VERSION.tar.bz2"; \
	echo "$PG_SHA256 *postgresql.tar.bz2" | sha256sum -c -; \
	mkdir -p /usr/src/postgresql; \
	tar \
		--extract \
		--file postgresql.tar.bz2 \
		--directory /usr/src/postgresql \
		--strip-components 1 \
	; \
	rm postgresql.tar.bz2; \
	\
	apk add --no-cache --virtual .build-deps \
		$DOCKER_PG_LLVM_DEPS \
		bison \
		coreutils \
		dpkg-dev dpkg \
		flex \
		g++ \
		gcc \
		krb5-dev \
		libc-dev \
		libedit-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		openldap-dev \
		openssl-dev \
		perl-dev \
		perl-ipc-run \
		perl-utils \
		python3-dev \
		tcl-dev \
		util-linux-dev \
		zlib-dev \
# https://www.postgresql.org/docs/10/static/release-10.html#id-1.11.6.9.5.13
		icu-dev \
# https://www.postgresql.org/docs/14/release-14.html#id-1.11.6.5.5.3.7
		lz4-dev \
# https://www.postgresql.org/docs/15/release-15.html "--with-zstd to enable Zstandard builds"
		zstd-dev \
	; \
	\
	cd /usr/src/postgresql; \
# update "DEFAULT_PGSOCKET_DIR" to "/var/run/postgresql" (matching Debian)
# see https://anonscm.debian.org/git/pkg-postgresql/postgresql.git/tree/debian/patches/51-default-sockets-in-var.patch?id=8b539fcb3e093a521c095e70bdfa76887217b89f
	awk '$1 == "#define" && $2 == "DEFAULT_PGSOCKET_DIR" && $3 == "\"/tmp\"" { $3 = "\"/var/run/postgresql\""; print; next } { print }' src/include/pg_config_manual.h > src/include/pg_config_manual.h.new; \
	grep '/var/run/postgresql' src/include/pg_config_manual.h.new; \
	mv src/include/pg_config_manual.h.new src/include/pg_config_manual.h; \
	gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"; \
# explicitly update autoconf config.guess and config.sub so they support more arches/libcs
	wget -O config/config.guess 'https://git.savannah.gnu.org/cgit/config.git/plain/config.guess?id=7d3d27baf8107b630586c962c057e22149653deb'; \
	wget -O config/config.sub 'https://git.savannah.gnu.org/cgit/config.git/plain/config.sub?id=7d3d27baf8107b630586c962c057e22149653deb'; \
	\
# https://git.alpinelinux.org/aports/tree/community/postgresql12/APKBUILD?h=3.18-stable&id=a470294e6d6ca7059e41c54769b7c3c26ec901d4#n158
	export LLVM_CONFIG="/usr/lib/llvm15/bin/llvm-config"; \
# https://git.alpinelinux.org/aports/tree/community/postgresql12/APKBUILD?h=3.18-stable&id=a470294e6d6ca7059e41c54769b7c3c26ec901d4#n163
	export CLANG=clang-15; \
	\
# configure options taken from:
# https://anonscm.debian.org/cgit/pkg-postgresql/postgresql.git/tree/debian/rules?h=9.5
	./configure \
		--enable-option-checking=fatal \
		--build="$gnuArch" \
# "/usr/src/postgresql/src/backend/access/common/tupconvert.c:105: undefined reference to `libintl_gettext'"
#		--enable-nls \
		--enable-integer-datetimes \
		--enable-thread-safety \
		--enable-tap-tests \
# skip debugging info -- we want tiny size instead
#		--enable-debug \
		--disable-rpath \
		--with-uuid=e2fs \
		--with-pgport=5432 \
		--with-system-tzdata=/usr/share/zoneinfo \
		--prefix=/usr/local \
		--with-includes=/usr/local/include \
		--with-libraries=/usr/local/lib \
		--with-gssapi \
		--with-ldap \
		--with-tcl \
		--with-perl \
		--with-python \
#		--with-pam \
		--with-openssl \
		--with-libxml \
		--with-libxslt \
		--with-icu \
		--with-llvm \
		--with-lz4 \
		--with-zstd \
	; \
	make -j "$(nproc)" world; \
	make install-world; \
	make -C contrib install; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
# Remove plperl, plpython and pltcl dependencies by default to save image size
# To use the pl extensions, those have to be installed in a derived image
			| grep -v -e perl -e python -e tcl \
	)"; \
	apk add --no-cache --virtual .postgresql-rundeps \
		$runDeps \
		bash \
		su-exec \
		tzdata \
		zstd \
# https://wiki.alpinelinux.org/wiki/Release_Notes_for_Alpine_3.16.0#ICU_data_split
		icu-data-full \
# nss_wrapper is not availble on ppc64le: "test case segfaults in ppc64le"
# https://git.alpinelinux.org/aports/commit/testing/nss_wrapper/APKBUILD?h=3.17-stable&id=94d81ceeb58cff448d489bbcbe9a6d40c9991663
		$([ "$(apk --print-arch)" != 'ppc64le' ] && echo 'nss_wrapper') \
	; \
	apk del --no-network .build-deps; \
	cd /; \
	rm -rf \
		/usr/src/postgresql \
		/usr/local/share/doc \
		/usr/local/share/man \
	; \
	\
	postgres --version

# make the sample config easier to munge (and "correct by default")
RUN set -eux; \
	cp -v /usr/local/share/postgresql/postgresql.conf.sample /usr/local/share/postgresql/postgresql.conf.sample.orig; \
	sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /usr/local/share/postgresql/postgresql.conf.sample; \
	grep -F "listen_addresses = '*'" /usr/local/share/postgresql/postgresql.conf.sample

RUN mkdir -p /var/run/postgresql && chown -R postgres:postgres /var/run/postgresql && chmod 3777 /var/run/postgresql

ENV PGDATA /var/lib/postgresql/data
# this 777 will be replaced by 700 at runtime (allows semi-arbitrary "--user" values)
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 1777 "$PGDATA"
VOLUME /var/lib/postgresql/data

###################################### Installation personnalisée
# Installe des services + nettoyage des paquets
RUN apk add --no-cache openssh-server; \
    apk add --no-cache python3; \
    apk add --no-cache jq; \
    apk add --no-cache nano; \
    apk add --no-cache sudo; \
    rm -rf /var/cache/apk/*; \
    python --version; \
    ssh-keygen -A

# configuration SSH
COPY config_dockerfile/sshd_config /etc/ssh/sshd_config
COPY config_dockerfile/id_ed25519.pub /etc/ssh/id_ed25519.pub

################### Les scripts de déploiment
COPY config_dockerfile/run_script/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY config_dockerfile/run_script/start.sh /usr/local/bin/start.sh
COPY config_dockerfile/run_script/access.sh /usr/local/bin/access.sh

################### Création des droits d'accès user / groupe
RUN set -eux; \
	addgroup -g 90 -S $ACCESS_USER; \
	adduser -u 90 -S -D -G $ACCESS_USER -H -h /home/$ACCESS_USER -s /bin/bash $ACCESS_USER; \
    adduser $ACCESS_USER wheel; \
    echo "$ACCESS_USER:$MDP_USER" | chpasswd

# Cette commande est destinée à ajouter une règle au fichier de configuration
# sudoers qui autorise l'utilisateur Maxime à exécuter n'importe quelle commande
run echo "maxime ALL=(ALL) ALL" | tee /etc/sudoers.d/$ACCESS_USER

# Ajoutez une nouvelle règle pour permettre à Maxime d'exécuter sshd et le script sans mot de passe
RUN echo "maxime ALL=(ALL) NOPASSWD: /usr/sbin/sshd" | tee -a /etc/sudoers.d/$ACCESS_USER
RUN echo "maxime ALL=(ALL) NOPASSWD: /usr/local/bin/access.sh" | tee -a /etc/sudoers.d/$ACCESS_USER

# Attribution des users aux scripts
RUN chown 90:70 /usr/local/bin/start.sh; \
    chown 90:70 /usr/local/bin/access.sh; \
    chown 90:70 /usr/local/bin/docker-entrypoint.sh

# Attribution des droits aux scripts
RUN chmod 0770 /usr/local/bin/start.sh; \
    chmod 0770 /usr/local/bin/access.sh; \
    chmod 0770 /usr/local/bin/docker-entrypoint.sh

# Les chemins d'accès
RUN mkdir -p $PATH_SCRIPT; \
    mkdir -p $PATH_LOGS; \
    mkdir -p $PATH_BACKUP

# Copie des scripts de sauvegarde
COPY config_dockerfile/save_script/* $PATH_SCRIPT
# Rendre tout les scripts exécutable
RUN find $PATH_SCRIPT -type f -name "*.sh" -exec chmod 770 {} \;

# modifier le propriétaire + droit d'exécution
RUN chown $ACCESS_USER:$ACCESS_USER /home/maxime -R; \
    chown $ACCESS_USER:$ACCESS_USER /var/backups -R; \
    chown $ACCESS_USER:$ACCESS_USER /docker-entrypoint-initdb.d

# modifier sur les droit user et group
RUN chmod 0770 /home/maxime -R; \
    chmod 0770 /var/backups -R; \
    chmod 0770 /docker-entrypoint-initdb.d

EXPOSE $PORT_POSTGRES
EXPOSE $PORT_SSH

USER maxime
# Point d'entre de l'application
ENTRYPOINT ["/usr/local/bin/start.sh"]
STOPSIGNAL SIGINT

# arg $1  postrges arg $2 le script access
CMD ["postgres", "$MDP_USER"]
