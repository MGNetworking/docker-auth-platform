#!/bin/bash

# Script pour arrêter et supprimer les stacks de développement
# PRESERVE les volumes pour éviter la perte de données

set -e

echo "Arrêt des stacks de développement..."

# Charger les variables depuis le fichier .env
if [ -f "environments/dev/.env" ]; then
    echo "Chargement des variables depuis environments/dev/.env"
    set -a
    source environments/dev/.env
    set +a
    echo "Variables chargées: PG_STACK_NAME=$PG_STACK_NAME, KC_STACK_NAME=$KC_STACK_NAME"
else
    echo "Erreur: Fichier environments/dev/.env introuvable !"
    echo "Les variables PG_STACK_NAME et KC_STACK_NAME sont requises"
    exit 1
fi

# Vérifier que les variables sont définies
if [ -z "$PG_STACK_NAME" ] || [ -z "$KC_STACK_NAME" ]; then
    echo "Erreur: Variables PG_STACK_NAME ou KC_STACK_NAME non définies dans .env"
    exit 1
fi

echo "Vérification des stacks actives..."
docker stack ls

# Fonction pour arrêter une stack
stop_stack() {
    local stack_name=$1
    if docker stack ls --format "{{.Name}}" | grep -q "^${stack_name}$"; then
        echo "Arrêt de la stack: $stack_name"
        docker stack rm "$stack_name"
        return 0
    else
        echo "Stack $stack_name non trouvée"
        return 1
    fi
}

# Arrêter Keycloak en premier (dépendant de PostgreSQL)
echo "Étape 1/2: Arrêt de Keycloak..."
stop_stack "$KC_STACK_NAME"

# Attendre un peu pour que l'arrêt soit propre
if [ $? -eq 0 ]; then
    echo "Attente de l'arrêt complet de Keycloak..."
    sleep 10
fi

# Arrêter PostgreSQL
echo "Étape 2/2: Arrêt de PostgreSQL..."
stop_stack "$PG_STACK_NAME"

if [ $? -eq 0 ]; then
    echo "Attente de l'arrêt complet de PostgreSQL..."
    sleep 10
fi

# Vérification finale
echo "Vérification de l'état final..."
echo "=== Stacks restantes ==="
docker stack ls

echo "=== Services restants ==="
docker service ls | grep -E "(keycloak|postgres)" || echo "Aucun service keycloak/postgres trouvé"

echo "=== Containers restants ==="
docker ps | grep -E "(keycloak|postgres)" || echo "Aucun container keycloak/postgres trouvé"

echo "=== Volumes préservés ==="
docker volume ls | grep -E "(PG_DATA|KEYCLOAK_DATA)" || echo "Aucun volume trouvé"

echo ""
echo "Arrêt terminé!"
echo "NOTE: Les volumes de données ont été PRESERVES"
echo "NOTE: Le réseau 'company_network' a été conservé"
echo ""
echo "Pour redémarrer:"
echo "  ./deploy.sh dev"
echo ""
echo "Pour supprimer aussi les volumes (ATTENTION - perte de données):"
echo "  docker volume rm PG_DATA_DEV KEYCLOAK_DATA_DEV"