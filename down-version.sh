#!/bin/bash

# Ce programme permet de supprimer le conteneur en cours d'exécution via
# l'environnement sélectionner.

# Vérifie si le script est exécuté avec sudo
if [ "$EUID" -ne 0 ]; then
    echo "Ce script nécessite des privilèges d'administrateur. Veuillez entrer votre mot de passe."
    sudo "$0" "$@"  # Exécutez à nouveau le script avec sudo
    exit 1
fi

env=("nas")
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
    echo "*****************************"
    echo "Stop et Supprime les conteneurs postgres-db et keycloak"
    docker-compose -f docker-compose-"$selection".yml down

else
   echo "Votre choix de sélection n'est pas présent dans la liste"
fi