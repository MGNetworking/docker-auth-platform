#!/bin/bash

# Ce script permet de lancer l'exécution du docker compose et d'initialisé les repertoires.


# Vérifie si le script est exécuté avec sudo
if [ "$EUID" -ne 0 ]; then
    echo "Ce script nécessite des privilèges d'administrateur. Veuillez entrer votre mot de passe."
    sudo "$0" "$@"  # Exécutez à nouveau le script avec sudo
    exit 1
fi

env=("dev" "devops" "nas" "pre" "prod" )
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
if [[ "$choix" -ge 0 && "$choix" -lt "${#env[@]}" ]]; then
  echo "Le programme va être lancé sous l'environnement suivant : ${env[$choix]}"
  selection=${env[$choix]}
  trouver=true
fi

if $trouver; then
    echo "Le programme sera exécuté dans l'environnement suivant : $selection"
    
    # Création des dossiers
    sudo mkdir -p postgres_home/backups
    sudo mkdir -p postgres_home/data

    sudo chown 90:70 postgres_home/backups/ -R
    sudo chown 90:70 postgres_home/data/ -R
    sudo chown 90:70 postgres_home/init/ -R

    # Accorder les permissions en lecture / écriture / exécution
    # sudo chmod -R 0777 postgres_home/
    sudo chmod -R 0777 postgres_home/backups/
    sudo chmod -R 0777 postgres_home/init/

    if [ "$selection" == "nas" ]; then
        docker-compose -f docker-compose-"$selection".yml build --no-cache
        docker-compose -f docker-compose-"$selection".yml up -d
        docker-compose -f docker-compose-"$selection".yml logs -f
    else
      docker compose -f docker-compose-"$selection".yml build --no-cache
      docker compose -f docker-compose-"$selection".yml up -d
      docker compose -f docker-compose-"$selection".yml logs -f
    fi

else
    echo "Le paramètre de programmation n'a pas été trouvé."
fi
