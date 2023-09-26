#!/bin/bash
# N'est pas utilisé pour le moment
# Les variables ne cible pas le chemin de dossier interne
# Il doit être re travailler avant d'être utilisé !!!!!

# Ce script permet de programmer via cron des tâches
# Les tâches sont le lancement de script de sauvegarde
# des bases de données kc_db pour keycloak et ghoverblog pour le blog

# Chemin vers le script à exécuter
SCRIPT_PATH_kc_db="/home/max/Documents/projet/teste/docker-keycloak-postgres/db-save_kc.py"
SCRIPT_PATH_ghoverblog="/home/max/Documents/projet/teste/docker-keycloak-postgres/db-save_blog.py"

# Définition de la tâche cron pour minuit
CRON_EXPRESSION="0 0 * * *"

# Test tout les 5 minutes tout les : hour , day of month , month, day of week
#CRON_EXPRESSION="*/5 * * * *"

# commande en python
COMMAND_kc="/usr/bin/python3 $SCRIPT_PATH_kc_db"
COMMAND_blog="/usr/bin/python3 $SCRIPT_PATH_ghoverblog"

# Les commentaires
COMMANTAIRE_KC="Exécution du script de sauvegarde de BD : kc_db"
COMMANTAIRE_BLOG="Exécution du script de sauvegarde de BD : ghoverblog"

LogFile="/home/max/Documents/projet/teste/docker-keycloak-postgres/postgres_home/backups/task/logfile.log"

# Ajouter la tâche au fichier crontab
crontab -l
(
  crontab -l
  echo "# $COMMANTAIRE_KC"
  echo "$CRON_EXPRESSION $COMMAND_kc >> $LogFile 2>&1"
) | crontab -
(
  crontab -l
  echo "# $COMMANTAIRE_BLOG"
  echo "$CRON_EXPRESSION $COMMAND_blog >> $LogFile 2>&1"
) | crontab -
