#!/bin/bash

# Script de déploiement pour l'environnement de développement

set -e  # Arrêter le script si une commande échoue

echo "Déploiement de l'infrastructure de développement"

# Variables
NETWORK_SCRIPT="./script/create-network.sh"
ENV_FILE=".env"

# Vérifier que le fichier .env existe
if [ ! -f "$ENV_FILE" ]; then
    echo "Fichier $ENV_FILE introuvable !"
    echo "Vous devez créer le fichier avec vos variables d'environnement"
    exit 1
fi

# Charger les variables d'environnement
echo "Chargement des variables d'environnement depuis $ENV_FILE"
# Les variables exportées (set -a) sont transmises aux processus enfants
set -a  # Export automatique des variables
source $ENV_FILE
set +a  # Désactivation de l'auto-export

# Vérification des variables critiques
if [ -z "$USER_BD" ] || [ -z "$PSW_DB" ]; then
    echo "Variables USER_BD ou PSW_DB manquantes dans $ENV_FILE"
    exit 1
fi

if [ -z "$PG_STACK_NAME" ] || [ -z "$KC_STACK_NAME" ]; then
    echo "Variables PG_STACK_NAME ou KC_STACK_NAME manquantes dans $ENV_FILE"
    exit 1
fi

# Étape 1 : Créer le réseau overlay
echo "Étape 1/3 : Création du réseau"
if [ -f "$NETWORK_SCRIPT" ]; then
    chmod +x $NETWORK_SCRIPT
    $NETWORK_SCRIPT
else
    echo "Script $NETWORK_SCRIPT introuvable !"
    exit 1
fi

echo ""

# Étape 2 : Déployer PostgreSQL
echo "Étape 2/3 : Déploiement de PostgreSQL"
if [ -f "postgresql-swarm.yml" ]; then

    # Cette commande HÉRITE des variables du shell parent
    docker stack deploy -c postgresql-swarm.yml $PG_STACK_NAME

    echo "Attente du démarrage de PostgreSQL..."
    sleep 10

    # Vérifier que PostgreSQL est prêt
    timeout 60s bash -c '
        until docker service logs ${PG_STACK_NAME}_postgres-shared 2>&1 | grep -q "ready to accept connections"; do
            echo "   PostgreSQL en cours de démarrage..."
            sleep 5
        done
    '

    if [ $? -eq 0 ]; then
        echo "PostgreSQL opérationnel"
    else
        echo "Timeout - PostgreSQL ne démarre pas"
        exit 1
    fi
else
    echo "Fichier postgresql-swarm.yml introuvable !"
    exit 1
fi

echo ""

# Étape 3 : Déployer Keycloak
echo "Étape 3/3 : Déploiement de Keycloak"
if [ -f "keycloak-swarm.yml" ]; then

    # Cette commande HÉRITE des variables du shell parent
    docker stack deploy -c keycloak-swarm.yml $KC_STACK_NAME

    echo "Attente du démarrage de Keycloak..."
    sleep 15

    # Vérifier que Keycloak est prêt
    timeout 120s bash -c '
        until curl -f http://localhost:8999/health >/dev/null 2>&1; do
            echo "   Keycloak en cours de démarrage..."
            sleep 10
        done
    '

    if [ $? -eq 0 ]; then
        echo "Keycloak opérationnel"
    else
        echo "Keycloak prend plus de temps que prévu à démarrer"
        echo "Vérifiez les logs avec : docker service logs keycloak-stack_keycloak"
    fi
else
    echo "Fichier keycloak-swarm.yml introuvable !"
    exit 1
fi

echo ""
echo "Déploiement terminé !"
echo ""
echo "Services disponibles :"
echo "   Keycloak : http://localhost:8999"
echo "   PostgreSQL : localhost:5499"
echo ""
echo "Commandes utiles :"
echo "   docker stack ls"
echo "   docker service ls"
echo "   docker service logs postgres-stack_postgres-shared"
echo "   docker service logs keycloak-stack_keycloak"
echo ""
echo "Pour les logs :"
echo "   docker service logs ${PG_STACK_NAME}_postgres-shared"
echo "   docker service logs ${KC_STACK_NAME}_keycloak"
echo "Pour arrêter :"
echo "   docker stack rm $KC_STACK_NAME"
echo "   docker stack rm $PG_STACK_NAME"