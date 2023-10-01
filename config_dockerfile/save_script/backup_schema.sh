#!/bin/bash
### Fichier script de sauvegarde de base de données
# Le fichier SQL générer permet modifier l'ancien schéma pré existant
# Ces fichiers seront placer dans le dossier init de PostgreSQL

# tableau associatif
declare -A liste_schema

# Configuration des paramètres de la base de données
DB_USER=""
DB_PASSWORD=""
DB_NAME="kc_db"
DB_SCHEMA="kc_sh"
# path_log = "/home/maxime/logs/script.log"  # le chemin d'accès au log
PATH_INIT="/docker-entrypoint-initdb.d"

# Chemin dans le conteneur
BACKUP_DIR="/docker-entrypoint-initdb.d"
DATE_FORMAT="%Y-%m-%d_%H-%M-%S"

# la création du fichier en .sql.bak permettra de ne pas être lu directement par postgres.
BACKUP_FILENAME="$DB_SCHEMA""_backup.sql"

# Fonction pour ajouter des entrées au journal avec horodatage
log() {
  local timestamp
  timestamp=$(date "+%Y-%m-%d %H:%M:%S")
  echo "[$timestamp] $1" >> "$log_file"
}

file_JSON="/home/maxime/script/DB_config.json"

# Lire le fichier JSON
json_data=$(cat ${file_JSON})

# Utiliser jq pour parcourir la liste des bases de données
db_list=$(echo "$json_data" | jq -c '.databases.db[]')
access_list=$(echo "$json_data" | jq -c '.databases.access[]')

# Get data acces
while IFS= read -r schema_entry; do
  DB_USER=$(echo "$schema_entry" | jq -r '.DB_USER')
  DB_PASSWORD=$(echo "$schema_entry" | jq -r '.DB_PASSWORD')
done <<< "$access_list"

# pour chaque BD
while IFS= read -r schema_entry; do
  DB_NAME=$(echo "$schema_entry" | jq -r '.DB_NAME')
  pg_dump -U ${DB_USER} -d ${DB_NAME} -f "/docker-entrypoint-initdb.d"/${DB_SCHEMA}"_backup"
done <<< "$db_list"




