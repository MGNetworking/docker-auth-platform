#!/bin/bash

# Ce script est utilisé à la création d'un conteneur base sur sont images
# Il lance en interne le service ssh permettent la communication avec l'extérieur
# Il lance le script access.sh permettent de modifier les repertoires nécessaire
# a la sauvegarde de base de données.
# Et enfin, le script docker-entrypoint.sh qui déploys le service de base
# de données PostgreSQL

set -e  # Activer "exit on error"
password=$2

echo "Lancement de ssh ..."
echo "$password" | sudo  /usr/sbin/sshd -D &

echo "Lancement du script access.sh ..."
echo "$password" | sudo /usr/local/bin/access.sh &

echo "Lancement de postgres avec l'argument : $1 ..."
/usr/local/bin/docker-entrypoint.sh $1

echo "Fin du script"