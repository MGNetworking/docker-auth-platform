# Keycloak / PostgresSQL

* [Lancement](#Lancement)
* [Commandes](#Les commandes)


### Lancement
Au 1er lancement
* Le docker compose, créera les répertoires avec l'utilisateur root, il faudra tous les modifiés
* Le schéma de base de données dans PostgresSQL, cela créera une erreur pour keycloak.
il faudra le créer et le relancer.

### Les commandes 
Les repertoires à modifier
``` Bach 
sudo chown -R 1000:1000 /keycloak_home
sudo chown -R 1000:1000 /postgres_home
```

