#!/bin/sh

set -e  # Activer "exit on error"

echo "Lancement de ssh ..."
/usr/sbin/sshd -D &

echo "Lancement de postgres avec l'argument : $1"
/usr/local/bin/docker-entrypoint.sh $1

echo "Lancement du script access.sh"
/usr/local/bin/access.sh

echo "Fin du script"