#!/bin/sh
echo "Modification des droits d'accès..."

until nc -z -w 1 mon-service 5432; do
  echo "En attente du service..."
  sleep 1
done

echo "Modification des droits d'accès en cours ... "
chown maxime:maxime /var/backups -R
echo "Droits d'accès modifiés avec succès."
