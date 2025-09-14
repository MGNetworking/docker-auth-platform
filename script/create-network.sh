#!/bin/bash

# Script pour créer le réseau overlay partagé

NETWORK_NAME="company_network"

echo "Création du réseau overlay partagé..."

# Vérifier si Docker Swarm est initialisé
if ! docker info | grep -q "Swarm: active"; then
    echo "Docker Swarm n'est pas initialisé"
    echo "Initialisation de Docker Swarm..."

    LOCAL_IP=$(hostname -I | awk '{print $1}')
    docker swarm init --advertise-addr $LOCAL_IP

    if [ $? -eq 0 ]; then
        echo "Docker Swarm initialisé avec succès"
    else
        echo "Erreur lors de l'initialisation de Docker Swarm"
        exit 1
    fi
else
    echo "Docker Swarm déjà actif"
fi

# Vérifier si le réseau existe déjà
if docker network ls | grep -q "$NETWORK_NAME"; then
    echo "Le réseau '$NETWORK_NAME' existe déjà - aucune action nécessaire"

    # Vérifier que c'est bien un réseau overlay
    DRIVER=$(docker network inspect $NETWORK_NAME --format "{{.Driver}}" 2>/dev/null)
    if [ "$DRIVER" = "overlay" ]; then
        echo "Réseau overlay '$NETWORK_NAME' prêt à l'emploi"
        exit 0
    else
        echo "ATTENTION : Le réseau '$NETWORK_NAME' existe mais n'est pas de type overlay (type: $DRIVER)"
        echo "Vous devrez peut-être le supprimer manuellement et relancer le script"
        exit 1
    fi
else
    # Créer le réseau overlay
    echo "Création du réseau overlay '$NETWORK_NAME'..."
    docker network create \
        --driver overlay \
        --attachable \
        $NETWORK_NAME

    if [ $? -eq 0 ]; then
        echo "Réseau '$NETWORK_NAME' créé avec succès"
        docker network inspect $NETWORK_NAME --format "{{.Name}} - Driver: {{.Driver}} - Scope: {{.Scope}}"
    else
        echo "Erreur lors de la création du réseau"
        exit 1
    fi
fi

echo "Réseau overlay prêt pour les déploiements !"