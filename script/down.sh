#!/bin/bash

env=("dev" "nas" )
echo "Lancement du programme, valeur d'entrée utilisateur : $1"
echo "Choisissez l'environnement de suppression :"

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

    if [ "$selection" == "nas" ]; then
      docker-compose -f docker-compose-"$selection".yml down  -v
    else
      docker compose -f docker-compose-"$selection".yml down  -v
    fi

    echo "la liste des volumes"
    docker volume ls

    echo "la liste des réseau"
    docker network ls

else
    echo "Le paramètre de programmation n'a pas été trouvé."
fi