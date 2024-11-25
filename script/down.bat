REM docker
echo "suppression des conteneurs"
docker-compose -f docker-compose-dev.yml down -v

REM  la liste des volumes
echo "la liste des volumes"
docker volume ls

REM la liste des réseau
echo "la liste des réseau"
docker network ls