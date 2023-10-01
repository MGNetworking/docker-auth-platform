#!/bin/bash
echo "Modification des droits d'accès..."
path="/var/backups"
time=0
until nc -z -w 1 postgres 5432; do
  echo "En attente du service postgres depuis $time seconde(s) ..."
  time=$(expr $time + 1)  # Incrémentation de la variable de temps
  sleep 1
done

echo "Modification des droits d'accès pour l'utilisateur maxime "
chown maxime:maxime "$path" -R

if [ "$(stat -c '%U:%G' "$path")" = "maxime:maxime" ]; then
    echo "Les droits d'accès ont était modifiés avec succès."
else
    echo "Échec de la modification des droits"
fi

