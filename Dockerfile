# Utilisez l'image PostgreSQL comme point de départ
FROM postgres:alpine

# Créez un utilisateur SSH
RUN adduser -D -s /bin/ash sshuser

# Créez l'utilisateur "maxime"
RUN adduser -D -s /bin/ash maxime

# Installez OpenSSH
RUN apk update && apk add openssh


# Définissez le mot de passe pour l'utilisateur SSH
RUN echo "maxime:fkfJocJBg6A6BI8rFwXh" | chpasswd

# Exécutez SSH en arrière-plan
CMD ["/usr/sbin/sshd", "-D"]
