#!/bin/bash
# Backup daily: cluster complet (toutes les DB) via pg_dumpall
# - 1 fichier / jour
# - purge automatique > 30 jours
# - aucun mkdir ici (préparé par ensure-backup-dirs.sh)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$PROJECT_ROOT"

ENV_FILE="$PROJECT_ROOT/environments/homeLab/.env"
[ -f "$ENV_FILE" ] || { echo "ERREUR: .env introuvable: $ENV_FILE"; exit 1; }

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

: "${PG_STACK_NAME:?PG_STACK_NAME manquant dans .env}"

SERVICE="${PG_STACK_NAME}_postgres-shared"
CONTAINER_ID="$(docker ps --filter "name=${SERVICE}" -q | head -n1)"
[ -n "$CONTAINER_ID" ] || { echo "ERREUR: conteneur Postgres introuvable (service=$SERVICE)"; exit 1; }

OUT_DIR="/var/backups/daily/cluster"
DATE="$(date +%Y-%m-%d)"
OUT_FILE="${OUT_DIR}/CLUSTER-${DATE}.sql.gz"

# Rétention
KEEP_DAYS="${PG_BACKUP_KEEP_DAYS:-30}"

echo "=== BACKUP DAILY CLUSTER ==="
echo "Service      : $SERVICE"
echo "Container    : $CONTAINER_ID"
echo "Output       : $OUT_FILE"
echo "Retention(d) : $KEEP_DAYS"
echo ""

# 1 fichier/jour : si existe, on skip
if docker exec "$CONTAINER_ID" sh -c "[ -f '$OUT_FILE' ]"; then
  echo "SKIP: backup déjà présent pour aujourd'hui: $OUT_FILE"
else
  echo "RUN : pg_dumpall -> $OUT_FILE"
  docker exec "$CONTAINER_ID" sh -c "
    test -d '$OUT_DIR' || exit 3
    export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\"
    pg_dumpall | gzip -9 > '$OUT_FILE'
  "
  echo "OK  : backup créé"
fi

echo ""
echo "PURGE: fichiers > ${KEEP_DAYS} jours"
docker exec "$CONTAINER_ID" sh -c "
  test -d '$OUT_DIR' || exit 3
  find '$OUT_DIR' -type f -name 'CLUSTER-*.sql.gz' -mtime +$KEEP_DAYS -print -delete
" || true

echo "OK"
