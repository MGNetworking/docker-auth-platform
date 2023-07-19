# Keycloak / PostgresSQL

* [Information projet](#Information-projet)
* [Python](#Python)
* [Vérification](#Vérification)
    * [Lancement](#Lancement)
    * [Sauvegarde & Restauration](#Sauvegarde-et-Restauration)
* [PostgreSQL](#PostgreSQL)
* [Keycloak](#Keycloak)
* [Documentation](#Documentation)

## Information projet

Avant le lancement du projet, il y a quelque étape de [Vérification](#Vérification)
à effectuer.

**Les dossiers projets**  
Les dossiers `/keycloak_home/config` et `/keycloak_home/themes` sont des dossiers de
configuration de thème de connexion de site.

Le dossier `/postgres_home/init` contient les fichiers script de création de base de
données ainsi que des leurs data sous forme de fichier `sql.bak`

NB : Ces fichiers ont une importance centrale dans la gestion du projet, ils ne doivent jamais
être supprimés du projet.

**Le docker compose**  
Le `docker compose` permet la création des conteneurs `postgre-db` et `keycloak`.
Le conteneur `postgre-db` est lancé en 1er afin de garantir l'association avec le conteneur
`keycloak`, qui doit posséder une base de données fix.
Dans le cas où, il ne posséderait pas une base de données fix, il est prévu dans le mécanisme de
création `keycloak` d'utiliser une base de données mémoire, ce qui n'est recherché dans ce projet.

Au lancement du conteneur `postgres-db`, celui-ci lit les fichiers se trouve dans le repertoire
`/docker-entrypoint-initdb.d` pour exécuter tous les scripts possèdent l'extension `.sql`
dans l'ordre alphabétique. Les autres fichiers ne possédant pas cette extension seront ignorée.

__Les Scripts__

1. **Le Script `init.sh`**  
   Il Permet, avant le lancement des services, de créer les volumes et leurs arborescences
   puis modifie les propriétaires et leurs droits d'accès aux volumes.
   Après toutes ces modifications, il lance le docker compose en mode détaché ensuite lance la
   commande de log.


2. **Le script `down.sh`**  
   Ce script permet d'arrêter et de supprimer les conteneurs. Il supprime le volume data de postgres
   qui garantie la persistance de la base de données.


3. **Le script `kc_sh_backup.sh`**   
   Ce script permet d'exécuter une sauvegarde du schéma et de ces objets `kc_sh` et de placé
   cette sauvegarde dans le répertoire `/docker-entrypoint-initdb.d`. Ce répertoire permet d'exécuter
   une série de scripts, dans l'ordre alphabétique au démarrage du conteneur `postgres-db`


4. **Le script `db-save_kc.py` et `db-save_blog.py`**  
   Ces scripts font deux choses :
    * En 1er parti, créer un fichier au format `dump` puis, à partir de ce fichier, il créait une archive de
      celui-ci et supprime le fichier `dump` de base.
    * En 2ᵉ parti, il crée un fichier sql et le place dans le répertoire init.
      Le répertoire `init` contient les scripts de lancement pour la génération des bases de données.

   **Objectif :**  
   Le fichier d'archive `.tar.gz` est utilise pour restaurer la BD `kc_db` de manière complet
   en cours d'exécution du conteneur keycloak.
   Le fichier sql contient les données à jour pour un 1er lancement de conteneur.

   Cela permet de gérer deux cas de figure. La restauration rapide de BD via l'archive `.tar.gz`
   par l'intermédiaire du script nommé `restore_kc.py` ou la création d'un conteneur
   avec la base de données et le schéma actualisé.


5. **Le script `restore_kc.py` et `restore_blog.py`**  
   Le script `restore_kc.py` permet de restaurer la base de données `kc_db`  de manière complète et le
   script `restore_blog.py` permet de restaurer la base de données `ghoverblog` de manière complète
   A la fin de chaque script, une vérification de l'état du schéma cible est exécuté.


6. **Le Script `task_db.sh`**
   Ce script permet de créer la planification de deux tâches de sauvegarde
   des bases de données `kc_db` pour keycloak et `ghoverblog` pour le blog
   Ces tâches seront exécuter à minuit chaque jour sur le serveur.

L'édition d'une tâche dans cron :

```shell
crontab -e    # éditeur de text pour modification des tâches (éditeur par défaut)
```

Check sont status : `sudo service cron status`  
Check la liste des tâches : `crontab -l`  
Check les services crontab : `ps aux | grep cron`  
Check le process ID : `pgrep cron`  
Check son fichier de config `sudo nano /etc/crontab`  
Check la dernière ligne du fichier d'entrée `tail -f /var/log/syslog | grep "cron"`  
Voir les logs : `tail -f /var/log/syslog`  
Sa journalisation `journalctl -u cron.service`

## Python

### Déploiement du projet

Vous devez disposer des outils python suivant :

* Une version de python3 : Python 3.10
* Un package (paquet) spécifique pour installer l'outil de création d'environnements
  virtuels (venv) pour Python 3.10 : `python3.10-venv`.

Installation de python3 sur ubuntu

```shell
sudo apt install python3
```

Installation de l'outil de création d'environnement

```shell
sudo apt install python3.10-venv
```

Puis activer l'environnement virtuel :

```shell
source env/bin/activate
```

## Vérification

Voici la liste des étapes a réalisé :

* Check du service docker
* Check des conteneurs docker en cours d'exécution
* Modification des accès au script
    * Fichier de lancement des conteneur : `init.sh`
    * Fichier de suppression des conteneur : `down.sh`

Vérification des chemin absolus :

* Fichier de sauvegarde des base de données : `db-save_blog.py` et `db-save_kc.py`
    * Vérification des chemins pour la sauvegarde des bases de données et des fichier de log
* Fichier de programmation des tâches : `task_db.sh`
    * Vérification les chemin absolus pour ciblé les scripts et les log de celui-ci

Lancement du script `init.sh`

Check du service docker. Plusieurs commande permet de vérifier l'état du service.

```shell
sudo service docker status
```

Check des services docker en cours d'exécution

```shell
docker ps
```

### Lancement

Pour lancer l'exécution de ce projet, vous devez modifier les droits d'exécution du fichier `init.sh`.
Ce fichier est le script de lancement du projet.
Dans le cas de la 1ʳᵉ installation, le script permettra de créer les volumes `keycloak_home` et `postgres_home`
avec les droits utilisateurs de la session avant le lancement.

Voici la commande à exécuter pour rendre ce fichier exécutable :

```shell
sudo chmod +x init.sh                   # Lancement et création des conteneurs
sudo chmod +x down.sh                   # Arrêt et Suppression des conteneurs 
sudo chmod +x kc_sh_backup_RUNTIME.sh   # Backup Schema kc_sh pour le DEV
sudo chmod +x task_db.sh                # planification des taches Crontab
```

1. Lancer les conteneurs

```shell
./init.sh
```

2. Arrêter et supprimer les conteneurs

```shell
./down.sh
```

3. Lancer un Backup pour le schema `kc_sh` placer dans le répertoir init du conteneur `postgres-db`

```shell
./kc_sh_backup_RUNTIME.sh
```

4. Lancer de la programmation des tâches géré par le service `crontab`

```shell
./task_db.sh
```

NB : Les fichiers exécutés par `crontab` doivent posséder les chemins absolut vers
les repertoires de création des `backup` et des logs.
Vous devrez vérifier a chaque installation que les chemins absolut soit bien référencer.

### Sauvegarde-et-Restauration

Lancement du script de **Sauvegarde** de la base de données `kc_db`

```shell
python3 db-save_kc.py 
```

Lancement du script de **Sauvegarde** de la base de données `ghoverblog`

```shell
python3 db-save_blog.py 
```

Lancement du script de **Restauration** de la base de données `kc_db`

```shell
python3 restore_kc.py 
```

Lancement du script de restauration de la base de données `ghoverblog`

```shell
python3 restore_blog.py 
```

## PostgreSQL

Accéder au serveur de base de données qui contient les bases de données suivantes :

* `kc-db` la base de données de keycloak le nom du schéma et `kc_sh`.
* `ghoverblog` la base de données du site le nom du schéma et `ms_article`.

Le username : `max_admin`  
Le password de connection : `NzOgZsn29PewtEyQECEE`

L'accéder à la base de données postgres dans le conteneur `postgres-db`

```shell
docker exec -ti postgres-db bash
```

Puis dans le conteneur `postgres-db` accéder à la CLI `psql`

```shell
psql -U max_admin -d  kc_db
psql -U max_admin -d  ghoverblog
```

Petit appel des commandes d'accès CLI de postgres

```ps
psql -h [hôte] -p [port] -U [utilisateur] -d [base_de_données]
psql -h 192.168.1.30 -p 5400 -U max_admin -d ghoverblog
```

Quelque commande CLI postgreSQL :

* `\l` liste des utilisateurs est leur propriétaire
* `\q` quitté la CLI `psql` de postgres

## Keycloak

l'accès ADMIN `maxime`  
Le password ADMIN `IgGr488nzTMjkTo6WUPB`

### Documentation

1. Keycloak

* Information sur [keycloak](#https://hub.docker.com/r/jboss/keycloak) le gestionnaire d'authentification
* Les variables d'environments de base, voir le [docker hub](https://hub.docker.com/r/jboss/keycloak)
* Le dépôt Red hat de l'image basé sur
  Quarkus [RED HAT Quay.io](https://quay.io/repository/keycloak/keycloak/manifest/sha256:cee8a0b343993b699a3d3eeb90e0b1eca2fa19285a413200af9785db8b00dcd7)

2. PostgreSQL

* Tutoriel sur [postgres](#https://www.postgresqltutorial.com/)
* La documenation de ce projet , voir le [docker hub](https://hub.docker.com/_/postgres)
* La version de ce
  projet [postgres:15.2-bullseye](https://hub.docker.com/layers/library/postgres/15.2-bullseye/images/sha256-6b91d38a9c596fa4e6a1276f6f81810882d9f292a09f9cf2647c6a554c8b6d00?context=explore)

3. Other
    * Le planificateur de [tâches crontab](https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches) 