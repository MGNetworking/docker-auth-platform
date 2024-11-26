#!/bin/bash

echo "suppression des conteneurs"
docker-compose -f docker-compose-prod.yml down  -v


echo "la liste des volumes"
docker volume ls


echo "la liste des réseau"
docker network ls