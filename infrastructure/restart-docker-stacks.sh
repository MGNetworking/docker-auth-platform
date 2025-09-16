#!/bin/bash
# Ce script était créer pour le redémarrage du serveur Nas Synology

# Configuration
LOG_FILE="/volume1/development/scripts/logs/docker-stacks-restart.log"
MAX_WAIT=300  # 5 minutes maximum d'attente
WAIT_INTERVAL=10  # Vérification toutes les 10 secondes

# Fonction de logging
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "=== Démarrage du script de redémarrage des stacks Docker ==="

# Attendre que Docker soit prêt
log_message "Vérification de l'état de Docker..."
elapsed=0
while [ $elapsed -lt $MAX_WAIT ]; do
    if docker info >/dev/null 2>&1; then
        log_message "Docker est prêt après ${elapsed} secondes"
        break
    fi
    log_message "Docker pas encore prêt, attente... (${elapsed}s/${MAX_WAIT}s)"
    sleep $WAIT_INTERVAL
    elapsed=$((elapsed + WAIT_INTERVAL))
done

# Vérifier si Docker est toujours indisponible
if [ $elapsed -ge $MAX_WAIT ]; then
    log_message "ERREUR: Docker n'est pas disponible après ${MAX_WAIT} secondes"
    exit 1
fi

# Vérifier que Swarm est actif
log_message "Vérification de l'état de Docker Swarm..."
swarm_status=$(docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null)
if [ "$swarm_status" != "active" ]; then
    log_message "ERREUR: Docker Swarm n'est pas actif (état: $swarm_status)"
    exit 1
fi
log_message "Docker Swarm est actif"

# Attendre un peu plus pour que tous les services système soient prêts
log_message "Attente supplémentaire de 30 secondes pour stabilisation..."
sleep 30

# Redémarrer le service PostgreSQL
log_message "Redémarrage du service PostgreSQL..."
if docker service update --force postgres-stack_postgres-shared >/dev/null 2>&1; then
    log_message "Service PostgreSQL redémarré avec succès"
else
    log_message "ERREUR: Échec du redémarrage du service PostgreSQL"
    exit 1
fi

# Attendre que PostgreSQL soit prêt avant Keycloak
log_message "Attente de la stabilisation de PostgreSQL (20 secondes)..."
sleep 20

# Redémarrer le service Keycloak
log_message "Redémarrage du service Keycloak..."
if docker service update --force keycloak-stack_keycloak >/dev/null 2>&1; then
    log_message "Service Keycloak redémarré avec succès"
else
    log_message "ERREUR: Échec du redémarrage du service Keycloak"
    exit 1
fi

# Vérification finale
log_message "Vérification de l'état des services..."
sleep 10

postgres_replicas=$(docker service ls --filter name=postgres-stack_postgres-shared --format "{{.Replicas}}")
keycloak_replicas=$(docker service ls --filter name=keycloak-stack_keycloak --format "{{.Replicas}}")

log_message "État PostgreSQL: $postgres_replicas"
log_message "État Keycloak: $keycloak_replicas"

log_message "=== Script terminé avec succès ==="