#!/bin/bash
# Restore schema depuis backups/manual/schema/
# Procédure: drop schema cascade + recreate + restore (dans la DB ciblée)
# ATTENTION: destructif pour le schema ciblé.

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

: "${PG_STACK_NAME:?PG_STACK_NAME manquant}"

SERVICE="${PG_STACK_NAME}_postgres-shared"
BACKUP_DIR_HOST="$PROJECT_ROOT/postgres_home/backups/manual/schema"

usage() {
  cat <<EOF
Usage: ./postgres_home/scripts/restore-manual-schema.sh <db_name> <schema_name> <backup_file.sql.gz>

Exemple:
  ./postgres_home/scripts/restore-manual-schema.sh kc_db public SCHEMA-2025-12-21_14-05-00-kc_db__public.sql.gz
EOF
}

DB_NAME="${1:-}"
SCHEMA_NAME="${2:-}"
BACKUP_FILE="${3:-}"
[ -n "$DB_NAME" ] && [ -n "$SCHEMA_NAME" ] && [ -n "$BACKUP_FILE" ] || { usage; exit 2; }

BACKUP_PATH_HOST="$BACKUP_DIR_HOST/$BACKUP_FILE"
[ -f "$BACKUP_PATH_HOST" ] || { echo "ERREUR: backup introuvable: $BACKUP_PATH_HOST"; exit 1; }

CID="$(docker ps --filter "name=${SERVICE}" -q | head -n1)"
[ -n "$CID" ] || { echo "ERREUR: conteneur Postgres introuvable (service=$SERVICE)"; exit 1; }

echo "=== RESTORE SCHEMA (MANUAL) ==="
echo "DB      : $DB_NAME"
echo "Schema  : $SCHEMA_NAME"
echo "Backup  : $BACKUP_PATH_HOST"
echo ""

read -r -p "Tapez EXACTEMENT 'RESTORE-SCHEMA' pour continuer: " confirm
[ "$confirm" = "RESTORE-SCHEMA" ] || { echo "Annulé."; exit 1; }

echo "DROP/CREATE schema..."
docker exec "$CID" sh -c "
  export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\";
  psql -U postgres -d \"${DB_NAME}\" -v ON_ERROR_STOP=1 -c \"DROP SCHEMA IF EXISTS \\\"${SCHEMA_NAME}\\\" CASCADE;\"
  psql -U postgres -d \"${DB_NAME}\" -v ON_ERROR_STOP=1 -c \"CREATE SCHEMA \\\"${SCHEMA_NAME}\\\";\"
"

echo "RESTORE schema..."
gzip -dc "$BACKUP_PATH_HOST" | docker exec -i "$CID" sh -c "
  export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\";
  psql -U postgres -d \"${DB_NAME}\" -v ON_ERROR_STOP=1
"

echo "OK: restore schema terminé."
