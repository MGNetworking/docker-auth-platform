# Utilisation de l'image PostgreSQL Alpine comme base
FROM postgres:alpine

# Installation des packages nécessaires
RUN apk update && \
    apk upgrade && \
    apk add openssh-server nano && \
    rm -rf /var/cache/apk/*

# création de clef HostKey
RUN ssh-keygen -A

COPY config_dockerfile/sshd_config /etc/ssh/sshd_config
COPY config_dockerfile/id_ed25519.pub /etc/ssh/id_ed25519.pub
COPY config_dockerfile/sshd_entrypoint.sh /usr/local/bin/sshd_entrypoint.sh

# rendre ce script exécutable
RUN chmod +x /usr/local/bin/sshd_entrypoint.sh

# Créez un utilisateur pour SFTP
RUN adduser -D -h /home/maxime -s /bin/bash maxime

# création d'un mdp pour le user maxime
RUN echo "maxime:fkfJocJBg6A6BI8rFwXh" | chpasswd

# Exposer le port 22 pour SSH et SFTP
EXPOSE 22

ENTRYPOINT  ["/usr/local/bin/sshd_entrypoint.sh"]