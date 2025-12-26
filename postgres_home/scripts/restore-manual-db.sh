#!/bin/bash
# Restore DB complète depuis backups/manual/BD/
# Procédure: drop DB + create DB + restore
# ATTENTION: destructif pour la base ciblée.

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

: "${PG_STACK_NAME:?PG_STACK_NAME manquant dans .env}"
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

# stdout + stderr -> console + fichier
exec > >(tee -a "$LOG_FILE") 2>&1

# log en cas d'erreur
trap 'rc=$?; log ERROR "Échec (rc=$rc) à la ligne $LINENO"; exit $rc' ERR

log INFO "=== START RESTORE DB (MANUAL) ==="
log INFO "Project root : $PROJECT_ROOT"
log INFO "Env dir      : $ENV_DIR"
log INFO "Env files    : ${ENV_FILES[*]}"
log INFO "Log file     : $LOG_FILE"

SERVICE="${PG_STACK_NAME}_postgres-shared"
BACKUP_DIR_HOST="$PROJECT_ROOT/postgres_home/backups/manual/BD"

usage() {
  cat <<EOF
Usage: ./postgres_home/scripts/restore-manual-db.sh <db_name> <backup_file.sql.gz>

Exemple:
  ./postgres_home/scripts/restore-manual-db.sh kc_db DB-2025-12-21_14-05-00-kc_db.sql.gz
EOF
}

DB_NAME="${1:-}"
BACKUP_FILE="${2:-}"
[ -n "$DB_NAME" ] && [ -n "$BACKUP_FILE" ] || { usage; exit 2; }

BACKUP_PATH_HOST="$BACKUP_DIR_HOST/$BACKUP_FILE"
[ -f "$BACKUP_PATH_HOST" ] || { log ERROR "Backup introuvable: $BACKUP_PATH_HOST"; exit 1; }

CID="$(docker ps --filter "name=${SERVICE}" -q | head -n1)"
[ -n "$CID" ] || { log ERROR "Conteneur Postgres introuvable (service=$SERVICE)"; exit 1; }

log INFO "DB     : $DB_NAME"
log INFO "Backup : $BACKUP_PATH_HOST"
log INFO "Container : $CID"

echo ""
echo "CONFIRMATION requise."
read -r -p "Tapez EXACTEMENT 'RESTORE-DB' pour continuer: " confirm
[ "$confirm" = "RESTORE-DB" ] || { log INFO "Annulé par l'utilisateur."; exit 1; }

log INFO "DROP / CREATE DB..."

docker exec "$CID" sh -c "
  export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\";
  psql -U postgres -v ON_ERROR_STOP=1 -c \"SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='${DB_NAME}' AND pid <> pg_backend_pid();\" || true
  psql -U postgres -v ON_ERROR_STOP=1 -c \"DROP DATABASE IF EXISTS \\\"${DB_NAME}\\\";\"
  psql -U postgres -v ON_ERROR_STOP=1 -c \"CREATE DATABASE \\\"${DB_NAME}\\\";\"
"

log INFO "RESTORE DB en cours..."
gzip -dc "$BACKUP_PATH_HOST" | docker exec -i "$CID" sh -c "
  export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\";
  psql -U postgres -d \"${DB_NAME}\" -v ON_ERROR_STOP=1
"

log INFO "OK: restore DB terminé."
log INFO "=== END RESTORE DB (MANUAL) ==="
