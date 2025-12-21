#!/bin/bash
# Crée les dossiers de backups sur l'hôte (NAS), une seule fois.
# Objectif: éviter tout mkdir dans les scripts de backup exécutés via docker exec.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

BASE_DIR="$PROJECT_ROOT/postgres_home/backups"

DIRS=(
  "$BASE_DIR/daily/cluster"
  "$BASE_DIR/manual/BD"
  "$BASE_DIR/manual/schema"
)

echo "=== ENSURE BACKUP DIRS ==="
echo "PROJECT_ROOT: $PROJECT_ROOT"
echo "Base backups : $BASE_DIR"
echo ""

for d in "${DIRS[@]}"; do
  if [ -d "$d" ]; then
    echo "OK  : $d"
  else
    echo "CREATE: $d"
    mkdir -p "$d"
  fi
done

echo ""
echo "OK: dossiers de backups prêts."
