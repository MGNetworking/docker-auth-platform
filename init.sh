#!/bin/bash

# Démarrage du conteneur Jenkins avec Docker Compose
docker compose up -d

# voir les logs
docker compose logs -f