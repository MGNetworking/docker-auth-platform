#!/bin/bash

# Script de déploiement d'infrastructure
# Déploie l'infrastructure seulement si elle n'existe pas ou est incomplète

set -e

BASE_DIR="/volume1/docker/keycloak-infrastructure"
ENV_FILE="$BASE_DIR/environments/nas/.env"
CHECK_SCRIPT="$BASE_DIR/infrastructure/check-infra.sh"
IP_LOCAL_SERVER="192.168.1.56"

echo "=== DÉPLOIEMENT D'INFRASTRUCTURE ==="

# Vérifier qu'on est dans le bon répertoire
if [ ! -f "$ENV_FILE" ]; then
    echo "ERREUR: Fichier .env introuvable dans $ENV_FILE"
    echo "Assurez-vous d'être dans le bon répertoire ou que les fichiers ont été transférés"
    exit 1
fi

# Se placer dans le répertoire de base
cd "$BASE_DIR"

# Charger les variables d'environnement
echo "Chargement des variables depuis $ENV_FILE"
cd environments/nas
set -a
source .env
set +a
cd "$BASE_DIR"

# Vérifier les variables critiques
if [ -z "$PG_STACK_NAME" ] || [ -z "$KC_STACK_NAME" ] || [ -z "$REDIS_STACK_NAME" ]; then
    echo "ERREUR: Variables PG_STACK_NAME, KC_STACK_NAME ou REDIS_STACK_NAME non définies"
    exit 1
fi

echo "Configuration chargée:"
echo "  PG_STACK_NAME: $PG_STACK_NAME"
echo "  KC_STACK_NAME: $KC_STACK_NAME"
echo "  REDIS_STACK_NAME: $REDIS_STACK_NAME"
echo "  DB_USER: $DB_USER"
echo "  KEYCLOAK_HOSTNAME: $HOSTNAME_PROD"

# Étape 1: Vérifier l'état actuel
echo ""
echo "=== VÉRIFICATION DE L'INFRASTRUCTURE EXISTANTE ==="

if [ -f "$CHECK_SCRIPT" ]; then
    chmod +x "$CHECK_SCRIPT"
    if $CHECK_SCRIPT; then
        echo ""
        echo "Infrastructure déjà complète et opérationnelle."
        echo "Aucun déploiement nécessaire."
        exit 0
    else
        echo ""
        echo "Infrastructure incomplète détectée. Déploiement requis."
    fi
else
    echo "Script de vérification introuvable, déploiement forcé."
fi

# Étape 2: Initialisation Docker Swarm
echo ""
echo "=== INITIALISATION DOCKER SWARM ==="

if ! docker info | grep -q "Swarm: active"; then
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

# Étape 3: Création du réseau overlay
echo ""
echo "=== CRÉATION DU RÉSEAU OVERLAY ==="

if ! docker network ls | grep -q "company_network"; then
    echo "Création du réseau overlay company_network..."
    docker network create --driver overlay --attachable company_network

    if [ $? -eq 0 ]; then
        echo "Réseau overlay créé avec succès"
    else
        echo "Erreur lors de la création du réseau"
        exit 1
    fi
else
    echo "Réseau company_network déjà existant"
fi

# Étape 4: Déploiement Redis
echo ""
echo "=== DÉPLOIEMENT REDIS ==="

if ! docker stack ls --format "{{.Name}}" | grep -q "^${REDIS_STACK_NAME}$"; then
    echo "Déploiement de la stack Redis ($REDIS_STACK_NAME)..."
    docker stack deploy -c environments/nas/redis-swarm.yml "$REDIS_STACK_NAME"

    echo "Attente du démarrage de Redis..."
    sleep 10

    # Vérifier que Redis démarre correctement - CORRECTION ICI
    REDIS_READY=false
    for i in {1..12}; do
        # Test si le service Redis est en cours d'exécution
        if docker service ps "${REDIS_STACK_NAME}_redis-shared" --format "{{.CurrentState}}" | grep -q "Running"; then
            echo "Redis opérationnel (tentative $i/12)"
            REDIS_READY=true
            break
        fi
        echo "Redis en cours de démarrage... (tentative $i/12)"
        sleep 5
    done

    if [ "$REDIS_READY" = false ]; then
        echo "ERREUR: Redis ne démarre pas après 1 minute"
        echo "Logs Redis:"
        docker service logs "${REDIS_STACK_NAME}_redis-shared" --tail 20
        exit 1
    fi
else
    echo "Stack Redis déjà déployée"

    # Vérifier qu'elle fonctionne toujours - CORRECTION ICI
    if docker service ps "${REDIS_STACK_NAME}_redis-shared" --format "{{.CurrentState}}" | grep -q "Running"; then
        echo "Redis existant et opérationnel"
    else
        echo "Redis existant mais peut-être en cours de redémarrage"
    fi
fi

# Étape 5: Déploiement PostgreSQL
echo ""
echo "=== DÉPLOIEMENT POSTGRESQL ==="

if ! docker stack ls --format "{{.Name}}" | grep -q "^${PG_STACK_NAME}$"; then
    echo "Déploiement de la stack PostgreSQL ($PG_STACK_NAME)..."
    docker stack deploy -c environments/nas/postgresql-swarm.yml "$PG_STACK_NAME"

    echo "Attente du démarrage de PostgreSQL..."
    sleep 20

    # Vérifier que PostgreSQL démarre correctement
    POSTGRES_READY=false
    for i in {1..18}; do
        if docker service logs "${PG_STACK_NAME}_postgres-shared" 2>&1 | grep -q "ready to accept connections"; then
            echo "PostgreSQL opérationnel (tentative $i/18)"
            POSTGRES_READY=true
            break
        fi
        echo "PostgreSQL en cours de démarrage... (tentative $i/18)"
        sleep 10
    done

    if [ "$POSTGRES_READY" = false ]; then
        echo "ERREUR: PostgreSQL ne démarre pas après 3 minutes"
        echo "Logs PostgreSQL:"
        docker service logs "${PG_STACK_NAME}_postgres-shared" --tail 20
        exit 1
    fi
else
    echo "Stack PostgreSQL déjà déployée"

    # Vérifier qu'elle fonctionne toujours
    if docker service logs "${PG_STACK_NAME}_postgres-shared" 2>&1 | tail -5 | grep -q "ready to accept connections"; then
        echo "PostgreSQL existant et opérationnel"
    else
        echo "PostgreSQL existant mais peut-être en cours de redémarrage"
    fi
fi

# Étape 6: Déploiement Keycloak
echo ""
echo "=== DÉPLOIEMENT KEYCLOAK ==="

if ! docker stack ls --format "{{.Name}}" | grep -q "^${KC_STACK_NAME}$"; then
    echo "Déploiement de la stack Keycloak ($KC_STACK_NAME)..."
    docker stack deploy -c environments/nas/keycloak-swarm.yml "$KC_STACK_NAME"

    echo "Attente du démarrage de Keycloak..."
    sleep 30

    # Vérifier que Keycloak démarre correctement
    KEYCLOAK_READY=false
    for i in {1..20}; do
        if curl -f "http://${IP_LOCAL_SERVER}:${KEYCLOAK_PORT}/realms/master" >/dev/null 2>&1; then
            echo "Keycloak opérationnel (tentative $i/20)"
            KEYCLOAK_READY=true
            break
        fi
        echo "Keycloak en cours de démarrage... (tentative $i/20)"
        sleep 15
    done

    if [ "$KEYCLOAK_READY" = false ]; then
        echo "Keycloak prend plus de temps que prévu à démarrer"
        echo "Logs Keycloak:"
        docker service logs "${KC_STACK_NAME}_keycloak" --tail 20
        echo "Le déploiement continue, mais vérifiez manuellement plus tard"
    fi
else
    echo "Stack Keycloak déjà déployée"

    # Vérifier qu'elle fonctionne toujours
    if curl -f "http://192.168.1.56:${KEYCLOAK_PORT}/realms/master" >/dev/null 2>&1; then
        echo "Keycloak existant et opérationnel"
    else
        echo "Keycloak existant mais non accessible"
    fi
fi

# Étape 7: Vérification finale
echo ""
echo "=== VÉRIFICATION FINALE ==="

echo "Stacks déployées:"
docker stack ls

echo ""
echo "Services actifs:"
docker service ls

echo ""
echo "Tests de connectivité:"

# Test Redis - CORRECTION MAJEURE ICI
if docker service ps "${REDIS_STACK_NAME}_redis-shared" --format "{{.CurrentState}}" | grep -q "Running"; then
    echo "Redis: Service running"
    # Test connexion si redis-cli disponible et mot de passe défini
    if command -v redis-cli >/dev/null 2>&1 && [ -n "${REDIS_PASSWORD}" ]; then
        if timeout 5 redis-cli -h ${IP_LOCAL_SERVER} -p "${REDIS_PORT_EXTERNAL:-6379}" -a "${REDIS_PASSWORD}" ping 2>/dev/null | grep -q "PONG"; then
            echo "Redis: Connexion OK"
        else
            echo "Redis: Service running mais connexion échouée"
        fi
    else
        echo "Redis: Service running (test connexion non disponible)"
    fi
else
    echo "Redis: Service non running"
fi

# Test PostgreSQL
if docker exec $(docker ps -q -f name=postgres-shared) pg_isready -U "$DB_USER" -d "$DB_NAME" >/dev/null 2>&1; then
    echo "PostgreSQL: Connexion OK"
else
    echo "PostgreSQL: Problème de connexion"
fi

# Test Keycloak local
if curl -f "http://${IP_LOCAL_SERVER}:${KEYCLOAK_PORT}/realms/master" >/dev/null 2>&1; then
    echo "Keycloak (local): Accessible"
else
    echo "Keycloak (local): Non accessible"
fi

# Test Keycloak externe (si disponible)
if curl -f "https://${KEYCLOAK_HOSTNAME}/realms/master" >/dev/null 2>&1; then
    echo "Keycloak (externe): Accessible via https://${KEYCLOAK_HOSTNAME}"
else
    echo "Keycloak (externe): Non accessible (normal si proxy non configuré)"
fi

echo ""
echo "=== DÉPLOIEMENT D'INFRASTRUCTURE TERMINÉ ==="
echo ""
echo "Infrastructure disponible:"
echo "  Redis: ${IP_LOCAL_SERVER}:${REDIS_PORT_EXTERNAL:-6379}"
echo "  PostgreSQL: ${IP_LOCAL_SERVER}:${DB_PORT_EXTERNAL}"
echo "  Keycloak Admin: http://${IP_LOCAL_SERVER}:${KEYCLOAK_PORT}"
echo "  Keycloak Public: https://${KEYCLOAK_HOSTNAME}"
echo ""
echo "L'infrastructure est prête pour les déploiements d'applications."