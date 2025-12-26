#!/bin/bash
# reset-infra.sh
# Objectif: supprimer l'infra Swarm + volumes + nettoyage Docker, pour repartir de zéro.
# Usage:
#   ./reset-infra.sh
#   ./reset-infra.sh --yes            # exécute sans confirmation interactive
#   ./reset-infra.sh --stacks "a b"   # override stacks
#   ./reset-infra.sh --volumes "X Y"  # override volumes
#   ./reset-infra.sh --no-prune       # ne fait pas docker system prune

set -euo pipefail

YES="false"
DO_PRUNE="true"

STACKS_DEFAULT=("postgres-stack" "redis-stack" "traefik-stack" "keycloak-stack")
VOLUMES_DEFAULT=("PG_DATA" "KEYCLOAK_DATA" "REDIS_DATA")

STACKS=("${STACKS_DEFAULT[@]}")
VOLUMES=("${VOLUMES_DEFAULT[@]}")

usage() {
  cat <<EOF
Usage: $0 [options]

Options:
  --yes                 Pas de confirmation interactive
  --no-prune            Ne pas exécuter: docker system prune -a --volumes
  --stacks  "s1 s2 ..." Remplace la liste des stacks à supprimer
  --volumes "v1 v2 ..." Remplace la liste des volumes à supprimer
  -h, --help            Aide

Exemples:
  $0
  $0 --yes
  $0 --stacks "postgres-stack keycloak-stack" --volumes "PG_DATA KEYCLOAK_DATA"
EOF
}

while [ "${1:-}" != "" ]; do
  case "$1" in
    --yes) YES="true"; shift ;;
    --no-prune) DO_PRUNE="false"; shift ;;
    --stacks)
      shift
      [ -n "${1:-}" ] || { echo "ERREUR: --stacks attend une liste entre guillemets"; exit 2; }
      read -r -a STACKS <<< "$1"
      shift
      ;;
    --volumes)
      shift
      [ -n "${1:-}" ] || { echo "ERREUR: --volumes attend une liste entre guillemets"; exit 2; }
      read -r -a VOLUMES <<< "$1"
      shift
      ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Option inconnue: $1"; usage; exit 2 ;;
  esac
done

command -v docker >/dev/null 2>&1 || { echo "ERREUR: docker introuvable"; exit 1; }

echo "=== RESET INFRA (Swarm + volumes + prune) ==="
echo "Stacks  : ${STACKS[*]}"
echo "Volumes : ${VOLUMES[*]}"
echo "Prune   : $DO_PRUNE"
echo ""

echo "=== Vérifications AVANT ==="
echo "--- Stacks présentes (si Swarm) ---"
docker info --format '{{.Swarm.LocalNodeState}}' 2>/dev/null | grep -qi 'active' && docker stack ls || echo "INFO: Swarm non actif ou inaccessible."
echo ""
echo "--- Services ---"
docker service ls 2>/dev/null || true
echo ""
echo "--- Conteneurs utilisant les volumes ciblés ---"
for v in "${VOLUMES[@]}"; do
  echo ">> Volume: $v"
  docker ps -a --filter "volume=$v" --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}" || true
  echo ""
done
echo "--- Volumes existants (filtrés) ---"
docker volume ls --format '{{.Name}}' | grep -E "^($(IFS=\|; echo "${VOLUMES[*]}"))$" || echo "INFO: aucun des volumes listés n'existe."
echo ""

if [ "$YES" != "true" ]; then
  echo "CONFIRMATION requise."
  read -r -p "Tapez EXACTEMENT 'RESET-INFRA' pour continuer: " confirm
  [ "$confirm" = "RESET-INFRA" ] || { echo "Annulé."; exit 1; }
fi

echo ""
echo "=== Suppression des stacks ==="
# Supprime uniquement les stacks existantes, sans échouer si absente
for s in "${STACKS[@]}"; do
  if docker stack ls --format '{{.Name}}' 2>/dev/null | grep -qx "$s"; then
    echo "RM stack: $s"
    docker stack rm "$s" || true
  else
    echo "SKIP stack absente: $s"
  fi
done

# Attendre la disparition des services liés aux stacks (best effort)
echo ""
echo "=== Attente arrêt des services (best effort) ==="
sleep 5
for i in {1..24}; do
  remaining="$(docker service ls --format '{{.Name}}' 2>/dev/null | grep -E "^($(IFS=\|; echo "${STACKS[*]}"))_" || true)"
  if [ -z "$remaining" ]; then
    echo "OK: services des stacks supprimés."
    break
  fi
  echo "Services encore présents, attente... ($i/24)"
  sleep 5
done

echo ""
echo "=== Vérification conteneurs utilisant encore les volumes ciblés ==="
for v in "${VOLUMES[@]}"; do
  echo ">> Volume: $v"
  docker ps -a --filter "volume=$v" --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}" || true
done

echo ""
echo "=== Suppression des volumes ==="
for v in "${VOLUMES[@]}"; do
  if docker volume ls --format '{{.Name}}' | grep -qx "$v"; then
    echo "RM volume: $v"
    docker volume rm "$v" || {
      echo "ERREUR: impossible de supprimer le volume $v (conteneur encore attaché ?)."
      echo "Vérifiez avec: docker ps -a --filter volume=$v"
      exit 1
    }
  else
    echo "SKIP volume absent: $v"
  fi
done

if [ "$DO_PRUNE" = "true" ]; then
  echo ""
  echo "=== Nettoyage Docker (prune) ==="
  echo "Commande: docker system prune -a --volumes"
  docker system prune -a --volumes
else
  echo ""
  echo "=== Prune désactivé (--no-prune) ==="
fi

echo ""
echo "=== Vérifications APRES ==="
echo "--- Stacks ---"
docker stack ls 2>/dev/null || true
echo ""
echo "--- Volumes (filtrés) ---"
docker volume ls --format '{{.Name}}' | grep -E "^($(IFS=\|; echo "${VOLUMES[*]}"))$" || echo "OK: volumes ciblés absents."
echo ""
echo "--- Conteneurs encore liés aux volumes ciblés ---"
for v in "${VOLUMES[@]}"; do
  echo ">> Volume: $v"
  docker ps -a --filter "volume=$v" --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Image}}" || true
done

echo ""
echo "OK: reset infra terminé."
