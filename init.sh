#!/bin/bash

# création du dossier
mkdir -p postgres_home/backups/ghoverblog
mkdir -p postgres_home/backups/kc_db
mkdir -p postgres_home/data

# changer le propriétaire et le groupe du dossier
sudo chown -R maxime:docker postgres_home
sudo chown -R maxime:docker keycloak_home

# Accorde les permissions en lecture / écriture / exécution
sudo chmod -R 770 postgres_home/backups
sudo chmod -R 770 postgres_home/data
sudo chmod -R 770 keycloak_home

# Démarrage du conteneur Jenkins avec Docker Compose
docker-compose up -d

# voir les logs
docker-compose logs -f