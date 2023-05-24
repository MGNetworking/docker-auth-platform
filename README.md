# Keycloak / PostgresSQL

* [Information projet](#Information projet)
* [Vérification](#Vérification)
  * [Lancement](#Lancement)
  * [Sauvegarde](#Sauvegarde)
  * [Restauration](#Restauration)
* [Accès_PostgreSQL](#Accès_PostgreSQL)
* [Accès_Keycloak](#Accès_Keycloak)
* [Documentation](#Documentation)

## Information projet

Avant tout quelque étape sont a exécuter avant le lancement du projet. 
Les étapes à suivre sont sont décrite dans la parti [Vérification](#Vérification). 

__Le docker compose__  
Ce docker compose permet de lancer le conteneur de docker postgreSQL avant Keycloak
dans le but de les associer. En fait Keycloak a besoin d'une base de données pour fonctionner.
Dans le cas ou keycloak n'aurait pas de base de données externe pour savegarde ses donnés, Keycloak
utiliserai une base de données volatile qui lui permetterait de fontionner mais pas de sauvegarde son
focntionnement une fois éteind.

Ce docker compose a était créer pour garantir que keyloak et une base de données fix.
Le nom de la DB de keycloak est `kc_db`.


__Les Scripts__
1. Le Script `init.sh`   
Il Permet, avant le lancement des services, de créer les volumes est leur arboressances
puis modifie les propriétaires et les leur droits d'accès au volumes.
Après toutes ces modification, il lance le docker compose en mode détaché puis lance la 
commande de log.


2. Le script `down.sh`  
Ce script permet d'arréter et de supprimer les conteneurs. Il supprime le volumes data de postgres 
qui garanti la persistance de la base de données.


3. Le script `kc_sh_backup.sh`   
Ce script permet de d'exécuter une sauvegarde du schémas et de ces objets `kc_sh` et de placé
cette sauvegarde dans le répertoire `/docker-entrypoint-initdb.d`.Ce répertoire permette d'exécuter
une serie de script, dans l'ordre alphabétique au démarrage du conteneur `postgres-db`



4. Le script `db-save_kc.py`



5. Le docker compose   
Au lancement, il commence par créer le conteneur `postgres-db` puis va dans le repertoire 
`/docker-entrypoint-initdb.d` pour exécuter tout les scripts possèdent l'extension `.sql` 
dans l'ordre alphabétique. Les autres fichier sont ignorer.


## Vérification

Voici la liste des étapes a réalisé: 
* Check du service docker 
* Check des conteneur docker en cours d'exécution
* Modification de l'accès au script `init.sh`

Puis lancement du scrpt `init.sh`

Check du service docker. Plusieurs commande permet de vérifier l'état du service.

```shell
sudo service docker status
```
Check des services docker en cours d'exécution
```shell
docker ps
```

### Lancement

Pour lancer l'exécution de ce projet , vous devez modifier les droits d'exécution du fichier `init.sh`.
Ce fichier est le script de lancement du projet .
Dans le cas de la 1er installation, le script permettra de créer les volumes `keycloak_home` et `postgres_home` avec les droits utilisateur 
de la session avant le lancement.

Voici la commande à exécuter pour rendre ce fichier exécutable :

```shell
sudo chmod +x init.sh
sudo chmod +x down.sh
sudo chmod +x kc_sh_backup.sh
```

* ### Sauvegarde
* 
Lancement du script de sauvegarde de la base de données `kc_db`
```shell
python3 db-save_kc.py 
```

### Restauration

Lancement du script de restauration de la base de données `kc_db`
```shell
python3 restore_kc.py 
```

## Accès_PostgreSQL

Accèder au serveur de base de données qui contient les bases de données suivant :
* `kc-db` la base de données de keycloak le nom du schemas et `public`.
* `ghoverblog` la base de données du site le nom du schémas et `ms_article`.

Le password de connection : `NzOgZsn29PewtEyQECEE`  

L'accèder à la base de données postgres dans le conteneur `postgres-db`

```shell
docker exec -ti postgres-db bash
```

Puis dans le contneur postgres-db ce connecter a la CLI `psql` avec l'utilisateur `kc_db`

```shell
psql -h [hôte] -p [port] -U [utilisateur] -d [base_de_données]
psql -U kc_db
```

Pour la restauration de la base de données. La base de données `kc_db` devra au prèalable 
être suppprimer totalement puis une instance devra être recréer avec le même nom => `kc_db`.

Pour cela l'utilisateur de la session en court devra lancer la commande suivant : 
```shell
python3 restore_blog.py
```

Quelque commande via CLI :
```ps
\l
\d
```

## Accès_Keycloak 

l'accès ADMIN `maxime`  
Le passeword ADMIN `IgGr488nzTMjkTo6WUPB`

### Documentation

1. Keycloak

* Information sur [keycloak](#https://hub.docker.com/r/jboss/keycloak) le gestionnaire d'authentification
* Les variables d'environment de base, voir le [docker hub](https://hub.docker.com/r/jboss/keycloak)
* Le dépôt Red hat de l'image basé sur
  Quarkus [RED HAT Quay.io](https://quay.io/repository/keycloak/keycloak/manifest/sha256:cee8a0b343993b699a3d3eeb90e0b1eca2fa19285a413200af9785db8b00dcd7)

2. PostgreSQL

* Tutoriel sur [postgres](#https://www.postgresqltutorial.com/)
* La documenation de ce projet , voir le [docker hub](https://hub.docker.com/_/postgres)
* La version de ce
  projet [postgres:15.2-bullseye](https://hub.docker.com/layers/library/postgres/15.2-bullseye/images/sha256-6b91d38a9c596fa4e6a1276f6f81810882d9f292a09f9cf2647c6a554c8b6d00?context=explore)