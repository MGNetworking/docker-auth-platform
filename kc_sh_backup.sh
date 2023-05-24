#!/bin/bash

# Configuration des paramètres de la base de données
DB_HOST="localhost"
DB_PORT="5400"
DB_USER="max_admin"
DB_PASSWORD="NzOgZsn29PewtEyQECEE"
DB_NAME="kc_db"
DB_SCHEMA="kc_sh"

# Chemin dans le conteneur
BACKUP_DIR="/docker-entrypoint-initdb.d"
DATE_FORMAT="%Y-%m-%d_%H-%M-%S"

# Génération du nom de fichier pour la sauvegarde
TIMESTAMP=$(date +"$DATE_FORMAT")
# la création du fichier en .sql.bak permettra de ne pas être lu directement par postgres.
BACKUP_FILENAME="$DB_SCHEMA""_backup.sql.bak"

# Variable pour la sortie d'erreur
error=""

# Sauvegarde de tout les schémas et leurs objets
#BACKUP_COMMAND="docker exec -t postgres-db pg_dump -U $DB_USER -d $DB_NAME -F p -f $BACKUP_DIR/$BACKUP_FILENAME"

# Sauvegarde du shémas cible kc_sh et de tout ces objets
BACKUP_COMMAND="docker exec -t postgres-db pg_dump -U $DB_USER -d $DB_NAME -n $DB_SCHEMA -F p -f $BACKUP_DIR/$BACKUP_FILENAME"

echo "Lancement de la sauvegarde ..."

# Exécution de la commande avec récupération de la sortie d'erreur
error=$(eval "$BACKUP_COMMAND" 2>&1)

if [ $? -eq 0 ]; then
    # La commande s'est exécutée avec succès
    echo "La sauvegarde de la base de données $DB_NAME a été créée avec succès."
else
    # Une erreur s'est produite lors de la sauvegarde
    echo "Erreur lors de la sauvegarde de la base de données $DB_NAME."
    echo "Détails de l'erreur :"
    echo "$error"
fi
