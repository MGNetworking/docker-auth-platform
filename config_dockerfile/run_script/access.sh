#!/bin/bash
echo "Modification des droits d'accès..."

path_backups="/var/backups"
path_home="/home/maxime"
path_postgres_init="/docker-entrypoint-initdb.d"

time=0
until nc -z -w 1 postgres 5432; do
  echo "En attente du service postgres depuis $time seconde(s) ..."
  time=$(expr $time + 1)  # Incrémentation de la variable de temps
  sleep 1
done

echo "Modification du propriétaires de dossier /var/backups "
chown maxime:maxime "$path_backups" -R
chmod +x "$path_backups" -R
echo $(ls -al "$path_backups")

if [ "$(stat -c '%U:%G' "$path_backups")" = "maxime:maxime" ]; then
    echo "Le propriétaire du path /var/backups à eté modifiés avec succès."
else
    echo "Échec de la modification du propriétaire sur le Path  /var/backups"
fi

echo "Modification du propriétaire des dossier $path_postgres_init"
chown maxime:maxime "$path_postgres_init" -R
chmod +x "$path_postgres_init" -R
echo $(ls -al "$path_postgres_init")

if [ "$(stat -c '%U:%G' "$path_postgres_init")" = "maxime:maxime" ]; then
    echo "Le propriétaire du path $path_postgres_init à eté modifiés avec succès."
else
    echo "Échec de la modification du propriétaire sur le Path $path_postgres_init"
fi

echo "Modification du propriétaire des dossier $path_home"
chown maxime:maxime "$path_home" -R
chmod +x "$path_home" -R
echo $(ls -al "$path_home")

if [ "$(stat -c '%U:%G' "$path_home")" = "maxime:maxime" ]; then
    echo "Le propriétaire du path $path_home à eté modifiés avec succès."
else
    echo "Échec de la modification du propriétaire sur le Path $path_home"
fi