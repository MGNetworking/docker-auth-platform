#!/bin/bash
# Ce programme permet de supprimer le docker compose en relation avec
# l'environnement sélectionner.

env=("dev" "pre" "prod" "nas")
echo "Voici la liste des conteneurs postgres-db ou keycloak en cours d'exécution"
docker ps | grep "postgres-db\|keycloak"

echo "Choisissez l'environnement a supprimer : "
affichage=""
for i in "${!env[@]}"; do
  affichage+="[$i] pour l'environnement postgres-ssh-${env[$i]} \n"
done

echo -e "$affichage"
read choix

# Recherche de l'environnement sélectionné par l'utilisateur
trouver=false
selection=""
if [ -n "${env[$choix]}" ]; then
  echo "Le programme va être supprimer : ${env[$choix]}"
  selection=${env[$choix]}
  trouver=true
fi

if $trouver; then
    echo "Environnement sélectionné : $selection"

    question=""
    echo "Voulez vous supprimer le dossier postgres_home/data"
    echo "de sauvegarde du conteneur cible Postgres? [o/n]"
    read question

    echo "Suppression des conteneur"
    docker-compose -f docker-compose-"$selection".yml down

    if [ $question == "o" ]; then
        echo "Suppression du dossier : postgres_home/data"
        rm -r postgres_home/data
    fi

    # Affichage des images et conteneur toujours actif
    echo "La liste des processus toujours en cours d'exécution"
    docker ps | grep "postgres-db\|keycloak"

    echo "La liste des images Postgres et keycloak"
    docker images | grep "postgres-\|keycloak"

    echo "Voulez vous supprimer le dossier postgres_home/data"
    echo "de sauvegarde du conteneur cible Postgres? [o/n]"
    if [ $question == "o" ]; then
        echo "Suppression du dossier : postgres_home/data"
        rm -r postgres_home/data
    fi

else
   echo "Votre choix de sélection n'est pas présent dans la liste"
fi