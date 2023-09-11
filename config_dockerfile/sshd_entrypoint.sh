#!/bin/sh

echo "Lancement de ssh ..."
/usr/sbin/sshd -D &

echo "Lancement de postgres ..."
su postgres -c "/usr/local/bin/docker-entrypoint.sh postgres"
