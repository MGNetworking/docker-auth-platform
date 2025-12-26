#!/bin/bash
# Restore cluster complet (pg_dumpall) depuis backups/daily/cluster/
# Mode recommandé: volume PostgreSQL neuf (supprime le volume PG_DATA)
# ATTENTION: destructif.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

# =========================
# Chargement des fichiers .env
# =========================

ENV_DIR="$PROJECT_ROOT/environments/homeLab"

shopt -s nullglob
ENV_FILES=(
  "$ENV_DIR/.env"
  "$ENV_DIR"/*.env
)
shopt -u nullglob

if [ "${#ENV_FILES[@]}" -eq 0 ]; then
  echo "Aucun fichier .env trouvé dans $ENV_DIR" >&2
  exit 1
fi

set -a
for CONF_FILE in "${ENV_FILES[@]}"; do
  source "$CONF_FILE"
done
set +a

: "${LOG_DIR:?LOG_DIR manquant dans config.env}"

# =========================
# Logging (hôte)
# =========================
SCRIPT_NAME="$(basename "$0" .sh)"
LOG_FILE="${LOG_DIR}/${SCRIPT_NAME}.log"

mkdir -p "$LOG_DIR"

log() {
  local level="$1"; shift
  echo "$(date '+%Y-%m-%d %H:%M:%S') [$level] $*"
}

# Tout stdout/stderr -> console + fichier (append)
exec > >(tee -a "$LOG_FILE") 2>&1

# En cas d'erreur, log + exit code
trap 'rc=$?; log ERROR "Échec (rc=$rc) à la ligne $LINENO"; exit $rc' ERR

log INFO "=== START RESTORE CLUSTER (DAILY) ==="
log INFO "Project root : $PROJECT_ROOT"
log INFO "Env dir      : $ENV_DIR"
log INFO "Env files    : ${ENV_FILES[*]}"
log INFO "Log file     : $LOG_FILE"

# =========================
# Variables attendues
# =========================
: "${PG_STACK_NAME:?PG_STACK_NAME manquant}"
: "${KC_STACK_NAME:?KC_STACK_NAME manquant}"
: "${POSTGRES_YML_PATH:=$PROJECT_ROOT/environments/homeLab/postgresql-stack.yml}"

# Volume Postgres (à adapter si besoin)
PG_VOLUME_NAME="${PG_VOLUME_NAME:-PG_DATA}"

SERVICE="${PG_STACK_NAME}_postgres-shared"
BACKUP_DIR_HOST="$PROJECT_ROOT/postgres_home/backups/daily/cluster"

usage() {
  cat <<EOF
Usage: ./postgres_home/scripts/restore-daily-cluster.sh <backup_file.sql.gz>

Exemple:
  ./postgres_home/scripts/restore-daily-cluster.sh CLUSTER-2025-12-21.sql.gz

ATTENTION (destructif):
- stoppe Keycloak (stack $KC_STACK_NAME)
- supprime la stack Postgres ($PG_STACK_NAME)
- supprime le volume $PG_VOLUME_NAME
- redéploie Postgres puis restaure le dump cluster complet
EOF
}

BACKUP_FILE="${1:-}"
[ -n "$BACKUP_FILE" ] || { usage; exit 2; }

BACKUP_PATH_HOST="$BACKUP_DIR_HOST/$BACKUP_FILE"
[ -f "$BACKUP_PATH_HOST" ] || { log ERROR "Backup introuvable: $BACKUP_PATH_HOST"; exit 1; }

stack_exists() { docker stack ls --format '{{.Name}}' | grep -q "^$1$"; }

stop_stack_if_exists() {
  local s="$1"
  if stack_exists "$s"; then
    log INFO "STOP stack: $s"
    docker stack rm "$s" >/dev/null || true
  else
    log INFO "INFO: stack absente: $s"
  fi
}

wait_postgres_ready() {
  local timeout="${1:-180}"
  local elapsed=0
  log INFO "Attente Postgres prêt (timeout=${timeout}s)..."
  while [ "$elapsed" -lt "$timeout" ]; do
    local cid
    cid="$(docker ps --filter "name=${SERVICE}" -q | head -n1)"
    if [ -n "$cid" ]; then
      if docker exec "$cid" sh -c 'pg_isready -U postgres >/dev/null 2>&1'; then
        log INFO "OK: Postgres répond (container=$cid)"
        echo "$cid"
        return 0
      fi
    fi
    sleep 5
    elapsed=$((elapsed + 5))
  done
  return 1
}

log INFO "Backup  : $BACKUP_PATH_HOST"
log INFO "Stack PG: $PG_STACK_NAME"
log INFO "Volume  : $PG_VOLUME_NAME"

echo ""
echo "CONFIRMATION requise."
read -r -p "Tapez EXACTEMENT 'RESTORE-CLUSTER' pour continuer: " confirm
[ "$confirm" = "RESTORE-CLUSTER" ] || { log INFO "Annulé par l'utilisateur."; exit 1; }

# 1) Stop dépendants (au minimum Keycloak)
stop_stack_if_exists "$KC_STACK_NAME"

# 2) Stop Postgres stack
stop_stack_if_exists "$PG_STACK_NAME"

# 3) Suppression volume (destructif)
if docker volume ls --format '{{.Name}}' | grep -q "^${PG_VOLUME_NAME}$"; then
  log INFO "SUPPRESSION volume: $PG_VOLUME_NAME"
  docker volume rm "$PG_VOLUME_NAME" >/dev/null
else
  log INFO "INFO: volume absent: $PG_VOLUME_NAME"
fi

# 4) Redeploy Postgres
log INFO "DEPLOY Postgres: $PG_STACK_NAME (yml=$POSTGRES_YML_PATH)"
docker stack deploy -c "$POSTGRES_YML_PATH" "$PG_STACK_NAME" >/dev/null

# 5) Wait ready
CID="$(wait_postgres_ready 240)" || { log ERROR "Postgres non prêt"; exit 1; }

# 6) Restore (stream gzip -> psql)
log INFO "RESTORE en cours (gzip -> psql)..."
gzip -dc "$BACKUP_PATH_HOST" | docker exec -i "$CID" sh -c '
  export PGPASSWORD="$(cat /run/secrets/pg_password)";
  psql -U postgres -v ON_ERROR_STOP=1
'

log INFO "OK: restore cluster terminé."
log INFO "INFO: vous pouvez maintenant redéployer les stacks applicatives (Keycloak, etc.)."
log INFO "=== END RESTORE CLUSTER (DAILY) ==="
