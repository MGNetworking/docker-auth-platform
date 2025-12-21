#!/bin/bash
# Vérifie que les Docker secrets requis existent (ne crée rien)
# Option:
#   --list : affiche la liste des secrets Docker présents

set -euo pipefail

LIST="false"
for arg in "$@"; do
  case "$arg" in
    --list) LIST="true" ;;
    -h|--help)
      cat <<EOF
Usage: ./script/check-secrets.sh [--list]

--list : affiche les secrets Docker présents (docker secret ls)
EOF
      exit 0
      ;;
    *)
      echo "Option inconnue: $arg" >&2
      exit 2
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

ENV_DIR="$PROJECT_ROOT/secrets"
MANIFEST="$ENV_DIR/secrets.manifest"

[ -f "$MANIFEST" ] || { echo "ERREUR: secrets.manifest introuvable: $MANIFEST"; exit 1; }

docker info >/dev/null 2>&1 || { echo "ERREUR: Docker indisponible"; exit 1; }
if [ "$(docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null || true)" != "active" ]; then
  echo "ERREUR: Swarm non actif"
  exit 1
fi

echo "=== CHECK DOCKER SECRETS ==="
echo "Manifest: $MANIFEST"

if [ "$LIST" = "true" ]; then
  echo ""
  echo "=== Secrets Docker présents (docker secret ls) ==="
  docker secret ls --format '{{.Name}}' | sort || true
fi

missing=0

echo ""
echo "=== Vérification manifest -> Docker ==="

# On lit le manifest et on vérifie chaque secret
while IFS= read -r line; do
  name="$(echo "$line" | xargs)"
  [ -z "$name" ] && continue
  [[ "$name" == \#* ]] && continue

  if docker secret inspect "$name" >/dev/null 2>&1; then
    echo "OK      : $name"
  else
    echo "MISSING : $name"
    missing=1
  fi
done < "$MANIFEST"

if [ "$missing" -eq 0 ]; then
  echo ""
  echo "OK: tous les secrets requis sont présents."
  exit 0
fi

echo ""
echo "ERREUR: secrets manquants."
echo "Créez-les manuellement (exemple):"
echo "  printf '%s\\n' 'VOTRE_MDP' | docker secret create <nom_secret> -"
exit 1
