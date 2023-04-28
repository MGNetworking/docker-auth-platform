# Keycloak / PostgresSQL

* [Lancement](#Lancement)
* [Commandes](#Commandes)
* [Documentation](#Documentation)


### Lancement
Au 1er lancement
* Le docker compose, créera les répertoires avec l'utilisateur root, il faudra tous les modifiés
* Le schéma de base de données dans PostgresSQL, cela créera une erreur pour keycloak.
il faudra le créer et le relancer.

### Commandes 
Les repertoires à modifier

``` Bach 
sudo chown -R 1000:1000 /keycloak_home
sudo chown -R 1000:1000 /postgres_home
```

### Documentation
1. Keycloak
* Les variables d'environment de base, voir le [docker hub](https://hub.docker.com/r/jboss/keycloak)
* Le dépôt Red hat de l'image basé sur Quarkus [RED HAT Quay.io](https://quay.io/repository/keycloak/keycloak/manifest/sha256:cee8a0b343993b699a3d3eeb90e0b1eca2fa19285a413200af9785db8b00dcd7)

2. PostgreSQL 
* La documenation de ce projet , voir le [docker hub](https://hub.docker.com/_/postgres)
* La version de ce projet [postgres:15.2-bullseye](https://hub.docker.com/layers/library/postgres/15.2-bullseye/images/sha256-6b91d38a9c596fa4e6a1276f6f81810882d9f292a09f9cf2647c6a554c8b6d00?context=explore)