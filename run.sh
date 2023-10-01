#!/bin/bash

env=("dev" "pre" "prod" "nas")
echo "Lancement du programme, valeur d'entrée utilisateur : $1"
echo "Choisissez l'environnement de deployment :"

affichage=""
for i in "${!env[@]}"; do
  affichage+="[$i] pour l'environnement ${env[$i]} \n"
done

# Affiche a l'utilisateur tout les environnement disponible
echo -e "$affichage"
read choix

trouver=false
selection=""
# recherche de l'environnement sélectionné
if [ -n "${env[$choix]}" ]; then
  echo "Le programme va être lancé sous l'environnement suivant : ${env[$choix]}"
  selection=${env[$choix]}
  trouver=true
fi

if $trouver; then
    echo "Le programme sera exécuté dans l'environnement suivant : $selection"
    
     Création des dossiers
    mkdir -p postgres_home/backups
    mkdir -p postgres_home/data

    # Changer le propriétaire et le groupe des dossiers
    sudo chown -R maxime:maxime postgres_home
    sudo chown -R maxime:maxime keycloak_home

    # Accorder les permissions en lecture / écriture / exécution
    sudo chmod -R 770 postgres_home
    sudo chmod -R 770 keycloak_home

    # Création de l'image et du conteneur avec reconstruction via --build
    docker-compose -f docker-compose-"$selection".yml up -d --build
    docker-compose -f docker-compose-"$selection".yml logs -f
else
    echo "Le paramètre de programmation n'a pas été trouvé."
fi
