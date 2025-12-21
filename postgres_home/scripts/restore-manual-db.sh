#!/bin/bash
# Restore DB complète depuis backups/manual/BD/
# Procédure: drop DB + create DB + restore
# ATTENTION: destructif pour la base ciblée.

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
[ -f "$BACKUP_PATH_HOST" ] || { echo "ERREUR: backup introuvable: $BACKUP_PATH_HOST"; exit 1; }

CID="$(docker ps --filter "name=${SERVICE}" -q | head -n1)"
[ -n "$CID" ] || { echo "ERREUR: conteneur Postgres introuvable (service=$SERVICE)"; exit 1; }

echo "=== RESTORE DB (MANUAL) ==="
echo "DB     : $DB_NAME"
echo "Backup : $BACKUP_PATH_HOST"
echo ""

read -r -p "Tapez EXACTEMENT 'RESTORE-DB' pour continuer: " confirm
[ "$confirm" = "RESTORE-DB" ] || { echo "Annulé."; exit 1; }

echo "DROP/CREATE DB..."
docker exec "$CID" sh -c "
  export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\";
  psql -U postgres -v ON_ERROR_STOP=1 -c \"SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='${DB_NAME}' AND pid <> pg_backend_pid();\" || true
  psql -U postgres -v ON_ERROR_STOP=1 -c \"DROP DATABASE IF EXISTS \\\"${DB_NAME}\\\";\"
  psql -U postgres -v ON_ERROR_STOP=1 -c \"CREATE DATABASE \\\"${DB_NAME}\\\";\"
"

echo "RESTORE DB..."
gzip -dc "$BACKUP_PATH_HOST" | docker exec -i "$CID" sh -c "
  export PGPASSWORD=\"\$(cat /run/secrets/pg_password)\";
  psql -U postgres -d \"${DB_NAME}\" -v ON_ERROR_STOP=1
"

echo "OK: restore DB terminé."
