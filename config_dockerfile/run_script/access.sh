#!/bin/bash
# Script permet la modification de repertoire interne au conteneur déployer
# Il est nécèssaire à la création de dossier historique de sauvegarde
# des bases schema de base de données.

echo "Modification des droits d'accès ..."

path_backups="/var/backups"

time=0
until nc -z -w 1 postgres 5432; do
  echo "En attente du service postgres depuis $time seconde(s) ..."
  time=$(expr $time + 1)  # Incrémentation de la variable de temps
  sleep 1
done

echo "Modification du propriétaires de dossier /var/backups "
sudo chown maxime:maxime "$path_backups" -R
sudo chmod +x "$path_backups" -R
echo $(ls -al "$path_backups")

if [ "$(stat -c '%U:%G' "$path_backups")" = "maxime:maxime" ]; then
    echo "Le propriétaire du path /var/backups à eté modifiés avec succès."
else
    echo "Échec de la modification du propriétaire sur le Path  /var/backups"
fi
