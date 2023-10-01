#!/bin/bash

set -e  # Activer "exit on error"
password=$2

echo "Lancement de ssh ..."
/usr/sbin/sshd -D &

echo "Lancement du script access.sh ..."
echo "$password" | sudo /usr/local/bin/access.sh &

echo "Lancement de postgres avec l'argument : $1 ..."
/usr/local/bin/docker-entrypoint.sh $1

echo "Fin du script"