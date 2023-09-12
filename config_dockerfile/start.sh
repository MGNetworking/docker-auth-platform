#!/bin/sh

set -e  # Activer "exit on error"

echo "Lancement de ssh ..."
/usr/sbin/sshd -D &

echo "Lancement de postgres avec l'argument : $1"
su postgres -c "/usr/local/bin/docker-entrypoint.sh $1"

echo "Fin du script"