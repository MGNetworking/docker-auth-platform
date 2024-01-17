# construction des images puis création des conteneur Docker en mode détaché et enregistrement des logs

# l'option --build remplace l'ancienne images
docker-compose -f docker-compose-dev.yml up -d --build

# voir les logs
docker-compose -f docker-compose-dev.yml logs -f

