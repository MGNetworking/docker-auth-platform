#!/bin/bash
# Redémarrage contrôlé des services Docker Swarm après reboot Synology
# Objectif: "check & repair" : vérifier, attendre, relancer uniquement si nécessaire

set -euo pipefail

# =========================
# Placement : racine projet
# =========================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

# =========================
# Chargement .env
# =========================
ENV_FILE="$PROJECT_ROOT/environments/homeLab/.env"
[ -f "$ENV_FILE" ] || { echo "ERREUR: .env introuvable: $ENV_FILE"; exit 1; }

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

# =========================
# Paramètres (surcharge possible via .env)
# =========================
MAX_WAIT="${MAX_WAIT:-420}"
WAIT_INTERVAL="${WAIT_INTERVAL:-10}"

# =========================
# Configuration logs (via .env)
# Recommandé dans .env : LOG_DIR=/volume1/development/scripts/logs
# =========================
LOG_DIR="${LOG_DIR:-/tmp}"
LOG_FILE="${LOG_FILE:-$LOG_DIR/restart-infra.log}"
LOG_MAX_BYTES="${LOG_MAX_BYTES:-10485760}" # 10 MiB

mkdir -p "$LOG_DIR" || { echo "ERREUR: impossible de créer LOG_DIR=$LOG_DIR"; exit 1; }

rotate_log_if_needed() {
  # Rotation simple: restart.log -> restart.log.1 si > LOG_MAX_BYTES
  if [ -f "$LOG_FILE" ]; then
    # BusyBox stat peut varier; on tente GNU, sinon BusyBox
    local size
    size="$(stat -c%s "$LOG_FILE" 2>/dev/null || stat -f%z "$LOG_FILE" 2>/dev/null || echo 0)"
    if [ "$size" -ge "$LOG_MAX_BYTES" ] 2>/dev/null; then
      mv -f "$LOG_FILE" "${LOG_FILE}.1" >/dev/null 2>&1 || true
    fi
  fi
}

rotate_log_if_needed

# =========================
# Logging
# =========================
log_message() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $*" | tee -a "$LOG_FILE"
}

on_error() {
  local exit_code=$?
  log_message "ERREUR: commande échouée (exit=$exit_code) à la ligne $1: $2"
  exit "$exit_code"
}
trap 'on_error "$LINENO" "$BASH_COMMAND"' ERR

# =========================
# Variables attendues (.env)
# =========================
: "${PG_STACK_NAME:?PG_STACK_NAME manquant dans .env}"
: "${KC_STACK_NAME:?KC_STACK_NAME manquant dans .env}"
: "${REDIS_STACK_NAME:?REDIS_STACK_NAME manquant dans .env}"
: "${TRAEFIK_STACK_NAME:?TRAEFIK_STACK_NAME manquant dans .env}"
: "${TRAEFIK_PORT_INTERNAL:?TRAEFIK_PORT_INTERNAL manquant dans .env}"

# =========================
# Noms Swarm complets : stack_service
# (si vous changez vos noms de services dans les YAML, adaptez les suffixes)
# =========================
TRAEFIK_SERVICE="${TRAEFIK_STACK_NAME}_traefik"
POSTGRES_SERVICE="${PG_STACK_NAME}_postgres-shared"
REDIS_SERVICE="${REDIS_STACK_NAME}_redis-shared"
KEYCLOAK_SERVICE="${KC_STACK_NAME}_keycloak"

# Endpoint interne Traefik (Nginx -> Traefik)
TRAEFIK_LOCAL_URL="http://127.0.0.1:${TRAEFIK_PORT_INTERNAL}/"

# =========================
# Helpers
# =========================
service_exists() {
  docker service inspect "$1" >/dev/null 2>&1
}

wait_docker_ready() {
  log_message "Vérification de l'état de Docker (timeout=${MAX_WAIT}s)..."
  local elapsed=0
  while [ "$elapsed" -lt "$MAX_WAIT" ]; do
    if docker info >/dev/null 2>&1; then
      log_message "Docker est prêt après ${elapsed}s"
      return 0
    fi
    log_message "Docker pas encore prêt (${elapsed}s/${MAX_WAIT}s) -> attente..."
    sleep "$WAIT_INTERVAL"
    elapsed=$((elapsed + WAIT_INTERVAL))
  done
  log_message "ERREUR: Docker indisponible après ${MAX_WAIT}s"
  return 1
}

check_swarm_active() {
  log_message "Vérification de l'état de Docker Swarm..."
  local swarm_status
  swarm_status="$(docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null || true)"

  if [ "$swarm_status" != "active" ]; then
    log_message "ERREUR: Docker Swarm non actif (état: $swarm_status)"
    return 1
  fi
  log_message "Docker Swarm est actif"
  return 0
}

wait_service_replicas_stable() {
  local service="$1"
  local timeout="${2:-180}"
  local elapsed=0

  log_message "Attente stabilisation: $service (timeout=${timeout}s)"
  while [ "$elapsed" -lt "$timeout" ]; do
    local replicas
    replicas="$(docker service ls --filter "name=$service" --format "{{.Replicas}}" 2>/dev/null || true)"

    if [ -n "$replicas" ] && echo "$replicas" | grep -qE '^[0-9]+/[0-9]+$'; then
      local running="${replicas%/*}"
      local desired="${replicas#*/}"
      if [ "$desired" -gt 0 ] && [ "$running" -eq "$desired" ]; then
        log_message "Service stable: $service ($replicas)"
        return 0
      fi
    fi

    sleep 5
    elapsed=$((elapsed + 5))
  done

  log_message "ATTENTION: service $service non stable après ${timeout}s"
  return 1
}

force_update_service() {
  local service="$1"
  log_message "Force update: $service"
  if docker service update --force "$service" >/dev/null 2>&1; then
    log_message "Force update OK: $service"
    return 0
  fi
  log_message "ERREUR: échec du force update sur $service"
  return 1
}

check_traefik_http() {
  if command -v curl >/dev/null 2>&1; then
    local code
    code="$(curl -s -o /dev/null -w "%{http_code}" "$TRAEFIK_LOCAL_URL" || true)"
    if [ -n "$code" ] && [ "$code" != "000" ]; then
      log_message "Traefik répond sur ${TRAEFIK_PORT_INTERNAL} (HTTP $code)"
      return 0
    fi
    log_message "ATTENTION: Traefik ne répond pas sur ${TRAEFIK_PORT_INTERNAL} (HTTP=000)"
    return 1
  fi
  log_message "curl absent: test HTTP Traefik ignoré"
  return 0
}

# =========================
# Main
# =========================
log_message "=== Démarrage restart-docker-stacks ==="
log_message "LOG_FILE=$LOG_FILE"
log_message "Services ciblés:"
log_message "  Traefik   : $TRAEFIK_SERVICE"
log_message "  Redis     : $REDIS_SERVICE"
log_message "  PostgreSQL: $POSTGRES_SERVICE"
log_message "  Keycloak  : $KEYCLOAK_SERVICE"

wait_docker_ready
check_swarm_active

log_message "Stabilisation système (15s)..."
sleep 15

# 1) Traefik
if service_exists "$TRAEFIK_SERVICE"; then
  wait_service_replicas_stable "$TRAEFIK_SERVICE" 120 || force_update_service "$TRAEFIK_SERVICE"
  wait_service_replicas_stable "$TRAEFIK_SERVICE" 180 || true
  check_traefik_http || true
else
  log_message "INFO: service Traefik absent ($TRAEFIK_SERVICE)."
fi

# 2) Redis
if service_exists "$REDIS_SERVICE"; then
  if ! wait_service_replicas_stable "$REDIS_SERVICE" 180; then
    force_update_service "$REDIS_SERVICE" || true
    wait_service_replicas_stable "$REDIS_SERVICE" 240 || true
  else
    log_message "Redis déjà stable: pas de redémarrage forcé."
  fi
else
  log_message "INFO: service Redis absent ($REDIS_SERVICE)."
fi

# 3) PostgreSQL
if service_exists "$POSTGRES_SERVICE"; then
  if ! wait_service_replicas_stable "$POSTGRES_SERVICE" 180; then
    force_update_service "$POSTGRES_SERVICE" || exit 1
    wait_service_replicas_stable "$POSTGRES_SERVICE" 240 || true
  else
    log_message "PostgreSQL déjà stable: pas de redémarrage forcé."
  fi
else
  log_message "ERREUR: service PostgreSQL absent ($POSTGRES_SERVICE)."
  exit 1
fi

# 4) Keycloak
if service_exists "$KEYCLOAK_SERVICE"; then
  if ! wait_service_replicas_stable "$KEYCLOAK_SERVICE" 180; then
    force_update_service "$KEYCLOAK_SERVICE" || exit 1
    wait_service_replicas_stable "$KEYCLOAK_SERVICE" 240 || true
  else
    log_message "Keycloak déjà stable: pas de redémarrage forcé."
  fi
else
  log_message "ERREUR: service Keycloak absent ($KEYCLOAK_SERVICE)."
  exit 1
fi

# Résumé
log_message "Vérification finale des replicas:"
log_message "Traefik:   $(docker service ls --filter name="$TRAEFIK_SERVICE" --format "{{.Replicas}}" 2>/dev/null || echo 'N/A')"
log_message "Redis:     $(docker service ls --filter name="$REDIS_SERVICE" --format "{{.Replicas}}" 2>/dev/null || echo 'N/A')"
log_message "PostgreSQL:$(docker service ls --filter name="$POSTGRES_SERVICE" --format "{{.Replicas}}" 2>/dev/null || echo 'N/A')"
log_message "Keycloak:  $(docker service ls --filter name="$KEYCLOAK_SERVICE" --format "{{.Replicas}}" 2>/dev/null || echo 'N/A')"

log_message "=== Script terminé ==="
exit 0
