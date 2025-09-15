#!/bin/bash

# Script de vérification de l'infrastructure existante
# Retourne 0 si infrastructure complète, 1 sinon

set -e

BASE_DIR="/volume1/docker/keycloak-infrastructure"
ENV_FILE="$BASE_DIR/environments/nas/.env"

echo "=== VÉRIFICATION DE L'INFRASTRUCTURE ==="

# Fonction pour vérifier si Docker Swarm est actif
check_swarm() {
    if docker info | grep -q "Swarm: active"; then
        echo "Docker Swarm actif"
        return 0
    else
        echo "Docker Swarm non initialisé"
        return 1
    fi
}

# Fonction pour vérifier le réseau overlay
check_network() {
    if docker network ls | grep -q "company_network"; then
        echo "Réseau company_network existe"
        return 0
    else
        echo "Réseau company_network manquant"
        return 1
    fi
}

# Fonction pour vérifier les stacks
check_stacks() {
    local pg_stack=""
    local kc_stack=""

    # Charger les noms des stacks depuis .env (obligatoire)
    if [ -f "$ENV_FILE" ]; then
        source "$ENV_FILE"
        pg_stack="$PG_STACK_NAME"
        kc_stack="$KC_STACK_NAME"

        if [ -z "$pg_stack" ] || [ -z "$kc_stack" ]; then
            echo "Variables PG_STACK_NAME ou KC_STACK_NAME non définies dans $ENV_FILE"
            return 1
        fi
    else
        echo "Fichier $ENV_FILE introuvable"
        echo "Le script ne peut pas fonctionner sans configuration"
        return 1
    fi

    # Vérifier PostgreSQL stack
    if docker stack ls --format "{{.Name}}" | grep -q "^${pg_stack}$"; then
        echo "Stack PostgreSQL ($pg_stack) existe"

        # Vérifier que le service fonctionne
        if docker service ls --format "{{.Name}}" | grep -q "${pg_stack}_postgres-shared"; then
            echo "Service PostgreSQL actif"

            # Test de connectivité PostgreSQL
            if docker service logs "${pg_stack}_postgres-shared" 2>&1 | tail -10 | grep -q "ready to accept connections"; then
                echo "PostgreSQL opérationnel"
                PG_STATUS=0
            else
                echo "PostgreSQL peut-être en cours de démarrage"
                PG_STATUS=1
            fi
        else
            echo "Service PostgreSQL manquant"
            PG_STATUS=1
        fi
    else
        echo "Stack PostgreSQL manquante"
        PG_STATUS=1
    fi

    # Vérifier Keycloak stack
    if docker stack ls --format "{{.Name}}" | grep -q "^${kc_stack}$"; then
        echo "Stack Keycloak ($kc_stack) existe"

        # Vérifier que le service fonctionne
        if docker service ls --format "{{.Name}}" | grep -q "${kc_stack}_keycloak"; then
            echo "Service Keycloak actif"

            # Test de connectivité Keycloak (si port disponible dans .env)
            if [ -n "$KEYCLOAK_PORT" ]; then
                if curl -f "http://localhost:${KEYCLOAK_PORT}/health" >/dev/null 2>&1; then
                    echo "Keycloak opérationnel"
                    KC_STATUS=0
                else
                    echo "Keycloak non accessible sur le port $KEYCLOAK_PORT"
                    KC_STATUS=1
                fi
            else
                echo "Port Keycloak non défini, impossible de tester la connectivité"
                KC_STATUS=1
            fi
        else
            echo "Service Keycloak manquant"
            KC_STATUS=1
        fi
    else
        echo "Stack Keycloak manquante"
        KC_STATUS=1
    fi

    if [ $PG_STATUS -eq 0 ] && [ $KC_STATUS -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# Fonction pour vérifier les volumes
check_volumes() {
    local volumes_ok=0

    if docker volume ls | grep -q "PG_DATA_NAS"; then
        echo "Volume PostgreSQL (PG_DATA_NAS) existe"
        volumes_ok=$((volumes_ok + 1))
    else
        echo "Volume PostgreSQL manquant"
    fi

    if docker volume ls | grep -q "KEYCLOAK_DATA_NAS"; then
        echo "Volume Keycloak (KEYCLOAK_DATA_NAS) existe"
        volumes_ok=$((volumes_ok + 1))
    else
        echo "Volume Keycloak manquant"
    fi

    if [ $volumes_ok -eq 2 ]; then
        return 0
    else
        return 1
    fi
}

# Exécution des vérifications
INFRA_STATUS=0

echo "1. Vérification Docker Swarm..."
check_swarm || INFRA_STATUS=1

echo ""
echo "2. Vérification réseau..."
check_network || INFRA_STATUS=1

echo ""
echo "3. Vérification des stacks..."
check_stacks || INFRA_STATUS=1

echo ""
echo "4. Vérification des volumes..."
check_volumes || INFRA_STATUS=1

echo ""
echo "=== RÉSUMÉ ==="

if [ $INFRA_STATUS -eq 0 ]; then
    echo "Infrastructure complète et opérationnelle"
    echo "Aucun déploiement d'infrastructure nécessaire"

    # Afficher quelques informations utiles
    echo ""
    echo "Informations infrastructure:"
    echo "- Stacks actives: $(docker stack ls --format '{{.Name}}' | tr '\n' ' ')"
    echo "- Services actifs: $(docker service ls --format '{{.Name}}' | wc -l)"
    echo "- Volumes: $(docker volume ls | grep -E '(PG_DATA|KEYCLOAK_DATA)' | wc -l)/2"

    exit 0
else
    echo "Infrastructure incomplète ou défaillante"
    echo "Déploiement d'infrastructure requis"

    echo ""
    echo "Actions suggérées:"
    if ! docker info | grep -q "Swarm: active"; then
        echo "- Initialiser Docker Swarm"
    fi
    if ! docker network ls | grep -q "company_network"; then
        echo "- Créer le réseau overlay"
    fi
    if ! docker stack ls | grep -q "postgres-nas-stack"; then
        echo "- Déployer la stack PostgreSQL"
    fi
    if ! docker stack ls | grep -q "keycloak-nas-stack"; then
        echo "- Déployer la stack Keycloak"
    fi

    exit 1
fi