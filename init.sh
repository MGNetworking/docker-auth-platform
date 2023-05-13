#!/bin/bash

# cration du dossier
mkdir -p postgres_home/backups

# changer le propriétaire et le groupe du dossier
sudo chown -R max:docker postgres_home/backups

# Accorde les permission en lecture / écriture / exécution
# uniquement à l'utilisateur propriétaire du dossier
sudo chmod -R 770 postgres_home/backups

# Démarrage du conteneur Jenkins avec Docker Compose
docker compose up -d

# voir les logs
docker compose logs -f