# Keycloak / PostgresSQL

* [Information projet](#information-projet)
* [Lancement](#lancement)
* [Python](#python)
* [Sauvegarde & Restauration](#sauvegarde-et-restauration)
* [Les services](#les-services)
    * [PostgreSQL](#postgresql)
    * [Keycloak](#keycloak)
* [Information](#information)

## Information projet

Le but de ce projet et de mettre en place un d'authentification complet avec
osn gestionnaire de base de données. Il possède des scripts permettent les deployment
des conteneurs, mais aussi la création d'images personalisé pour des besoins spécifique.

**Le docker compose**  
Le `docker compose` permet la création des conteneurs `postgre-db` et `keycloak`.
Le conteneur `postgre-db` est lancé en 1er afin de garantir l'association avec le conteneur
`keycloak`, qui doit posséder une base de données fix.
Dans le cas où, il ne posséderait pas une base de données fix, il est prévu dans le mécanisme de
création `keycloak` d'utiliser une base de données mémoire, ce qui n'est pas recherché dans ce projet.

Au lancement du conteneur `postgres-db`, celui-ci lit les fichiers se trouve dans le repertoire
`/docker-entrypoint-initdb.d` pour exécuter tous les scripts possèdent l'extension `.sql`
dans l'ordre alphabétique. Les autres fichiers ne possédant pas cette extension seront ignorée.

Après l'initialisation du service de base de données `postgres-db` le service `keycloak` est exécuté.
Puis le service recherche une base de données associée, si aucune base de données n'est configuré,
une base de données mémoire `H2` et utilisé.
Dans le cadre de ce projet le service `postgres-db` est utilisé. Toutes les données de l'application
se trouvent donc en base de données.

__Les Scripts__

1. **Le Script `run.sh`**  
   Il Permet, de lancement les services `postrges-db` et `keycloak` via le docker compose en créant
   au préalable les volumes nécessaires au fonctionnement des projets.
   Après une series d'instruction, il lance le docker compose en mode détaché, puis lance les logs.


2. **Le script `down.sh`**  
   Ce script permet d'arrêter et de supprimer les services conteneuriser. Il ne touche à rien d'autre.


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
   Le fichier d'archive `.tar.gz` est utilisé pour restaurer la BD `kc_db` de manière complet
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

## Lancement

Pour lancer l'exécution de ce projet, vous devez modifier les droits d'exécution du fichier `run.sh`.
Ce fichier est le script de lancement du projet.
Le script permettra de créer les volumes `keycloak_home` et `postgres_home` avec les droits utilisateurs
a la création des services conteneurs.

Modification des droits d'exécution :

```shell
sudo chmod +x run.sh                    # Lancement et création des conteneurs
sudo chmod +x down.sh                   # Arrêt et Suppression des conteneurs 
sudo chmod +x kc_sh_backup_RUNTIME.sh   # Backup Schema kc_sh pour le DEV
sudo chmod +x task_db.sh                # planification des taches Crontab
```

1. Lancement du docker compose

```shell
./run.sh
```

2. Arrêter et supprimer les conteneurs

```shell
./down.sh
```

3. Lancer un Backup pour le schema `kc_sh` placer dans le répertoire init du conteneur `postgres-db`

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

### Sauvegarde et Restauration

Lancement du script de **Sauvegarde** de la base de données `kc_db`

```shell
python db-save_kc.py 
```

Lancement du script de **Sauvegarde** de la base de données `ghoverblog`

```shell
python db-save_blog.py 
```

Lancement du script de **Restauration** de la base de données `kc_db`

```shell
python restore_kc.py 
```

Lancement du script de restauration de la base de données `ghoverblog`

```shell
python restore_blog.py 
```

## Python

**La gestion de l'environnement python du projet**

Le fichier `requirements.txt` contient la liste des dépendances du projet.
Vous devez activer l'environnement `python` pour que les scripts puissent utiliser
les dépendances.

Verifier la version de python sur votre machine :

```shell
python --version
```

Dans le cas d'une 1re utilisation, vous devez créer votre environnement virtuel
en utiliser la commande suivante :

```shell
python -m venv [name_venv]
```

Puis installer les dépendances via le fichier `requirements.txt`

```shell
pip install -r requirements.txt
```

Puis basculé le terminal vers l'environnement  
Sur windows

```shell
.\venv\Scripts\Activate.ps1
```

Sur Linux

```shell
source ./venv/Scripts/Activate
```

Pour la deactivation des environnements, entre dans le terminal et dans tout le système

```shell
deactivate
```

**La gestion de projet**

À chaque ajout d'une dépendance au projet, cette dépendance doit être déclarée
dans l'environnement local.

Pour cela, il faut dans un 1er temps active l'environnement de python.
Sans quoi cette dépendance sera installer dans l'environnement global.
Puis l'ajoute des dépendances au projet.

```shell
pip install [dépendance]
```

Mettre à jour le fichier qui contient la list des dépendances

```shell
pip freeze > requirements.txt 
```
## Les services

Le service `postgres-db` est basé sur l'Os `Alpine Linux`.
Dans cette image est installé le service PostgreSQL ainsi que le service OpenSSH client.

Le service `keycloak` est basé sur une image `Quarkus` qui provient du
depot [RED HAT](https://quay.io/repository/keycloak/keycloak?tab=info)
Version legacy. [Quarkus](https://quarkus.io/about/) est un projet Open source

## PostgreSQL

Pour la base de données est accèssible en fonction de l'adresse Ip de l'host, mais un port
est de connexion est réservé.

Pour l'accès distant, un port de connexion ssh et sftp lui est réservé. Pour des questions de
sécurité, cet accès distance et réservé a un utilisateur unique ainsi qui doit posséder une clef
d'accès privet.

**Les dossiers postgres**

Le dossier `/postgres_home/init` contient les fichiers script de création de base de
données ainsi que des leurs data sous forme de fichier `sql.bak`

Le dossier `/postgres_home/data` contient la persistance de la base de données.
Le dossier `/postgres_home/backups` et le dossier de sauvegarde des bases de données.

**Accès externe**

* L'accéder à la base de données postgres dans le conteneur `postgres-db`  
  Le port de connexion : `5400`  
  Le username : `max_admin`    
  Le password de connection : `NzOgZsn29PewtEyQECEE`


* L'accès distance ssh et sftp
  Le port de connexion : `55`  
  Le username : `max_admin`    
  Le password de connection : ``MFVy9`d!74``

**Accès via docker**

Les services `postgre-db` contient nativement les bases de données suivantes :

* `kc-db` la base de données de keycloak le nom du schéma et `kc_sh`.
* `ghoverblog` la base de données du site le nom du schéma et `ms_article`.

Vous pouvez y accèdé directement via un client comme `PgAdmin` ou soit part l'Os host en utilisant
les commandes docker.

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

**Accès administrateur via le client**

l'accès ADMIN `maxime`  
Le password ADMIN `IgGr488nzTMjkTo6WUPB`

**Les dossiers keycloak**

Le dossier de configuration de l'application `/keycloak_home/config`. Il contient les fichiers
correspondant au domain protégé. Ces fichiers permettent l'import/export des domains cibles.

Le dossier `/keycloak_home/themes` permet la gestion thème des domains protègé.

NB : Les fichiers contenus dans ces dossiers ont une importance centrale dans la gestion
du projet et des domain protéger. À chaque modification de ces fichiers, une sauvegarde vers le gestionnaire de
projet doit être réalisé.

### Information

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