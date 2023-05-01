#!/bin/bash

# Création des dossier /jenkins_home avec les permissions appropriées
mkdir keycloak_home
mkdir postgres_home

# Démarrage du conteneur Jenkins avec Docker Compose
docker compose up -d

# voir les logs
docker compose logs -f