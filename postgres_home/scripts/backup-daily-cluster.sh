#!/bin/bash
# Backup daily: cluster complet (toutes les DB) via pg_dumpall
# - 1 fichier / jour
# - purge automatique > 30 jours

set -euo pipefail

# -------------------------------------------------------------------
# Placement : se positionner à la racine du projet
# -------------------------------------------------------------------

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

# Tout stdout/stderr -> console + fichier (append)
exec > >(tee -a "$LOG_FILE") 2>&1

# En cas d'erreur, log + exit code
trap 'rc=$?; log ERROR "Échec (rc=$rc) à la ligne $LINENO"; exit $rc' ERR

log INFO "=== START BACKUP DAILY CLUSTER ==="
log INFO "Project root  : $PROJECT_ROOT"
log INFO "ENV_FILES     : $ENV_FILES"
log INFO "LOG_FILE      : $LOG_FILE"

SERVICE="${PG_STACK_NAME}_postgres-shared"
CONTAINER_ID="$(docker ps --filter "name=${SERVICE}" -q | head -n1)"
[ -n "$CONTAINER_ID" ] || { log ERROR "Conteneur Postgres introuvable (service=$SERVICE)"; exit 1; }

OUT_DIR="/var/backups/daily/cluster"
DATE="$(date +%Y-%m-%d)"
OUT_FILE="${OUT_DIR}/CLUSTER-${DATE}.sql.gz"

# Rétention
KEEP_DAYS="${PG_BACKUP_KEEP_DAYS:-30}"

log INFO "Service      : $SERVICE"
log INFO "Container    : $CONTAINER_ID"
log INFO "Output       : $OUT_FILE"
log INFO "Retention(d) : $KEEP_DAYS"

# 1 fichier/jour : si existe, on skip
if docker exec "$CONTAINER_ID" sh -c "[ -f '$OUT_FILE' ]"; then
  log INFO "SKIP: backup déjà présent pour aujourd'hui: $OUT_FILE"
else
  log INFO "RUN : pg_dumpall -> $OUT_FILE"
  docker exec "$CONTAINER_ID" sh -c "
    test -d '$OUT_DIR' || exit 3
    export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\"
    pg_dumpall | gzip -9 > '$OUT_FILE'
  "
  log INFO "OK  : backup créé"
fi

log INFO "PURGE: fichiers > ${KEEP_DAYS} jours"
docker exec "$CONTAINER_ID" sh -c "
  test -d '$OUT_DIR' || exit 3
  find '$OUT_DIR' -type f -name 'CLUSTER-*.sql.gz' -mtime +$KEEP_DAYS -print -delete
" || true

log INFO "=== END BACKUP DAILY CLUSTER ==="
log INFO "OK"
