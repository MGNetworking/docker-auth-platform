# Keycloak / PostgresSQL

* [Information projet](#information-projet)
* [Lancement](#lancement)
* [Sauvegarde & Restauration](#sauvegarde-et-restauration)
* [Dockerfile](#dockerfile)
* [Les Scripts de sauvegarde](#les-scripts-de-sauvegarde)
* [Les services](#les-services)
    * [PostgreSQL](#postgresql)
    * [Keycloak](#keycloak)
* [Information](#information)

## Information projet

Le but de ce projet et de mettre en place un d'authentification complet avec
osn gestionnaire de base de données. Il possède des scripts permettent les deployment
des conteneurs, mais aussi la création d'images personalisé pour des besoins spécifique.

**Le docker compose**   
Il permet la création des conteneurs `postgre-db` et `keycloak`.
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

## Lancement

Pour lancer l'exécution de ce projet, vous devez modifier les droits d'exécution du fichier `run.sh`.
Ce fichier est le script de lancement du projet.
Le script permettra de créer les volumes `keycloak_home` et `postgres_home` avec les droits utilisateurs
a la création des services conteneurs.

1. **Le Script de lancement `run.sh`**  
   Ce script proposera une liste d'environnement. Ces environnements sont en relation avec les ``docker-compose``
   présent dans le projet.
   Dans 1er temps le `docker compose` lancera la construction des images contenue dans les `dockerfiles` cible.
   Puis, Le `docker compose` lancera la construction des conteneurs `postrges-db` et `keycloak`.
   La construction de ces images a un ordre de priorité. l'ordre de priorité prévu que le conteneur `postrges-db` puis
   se déployer avant `keycloak`.
   Dans les faits, le 2 conteneur son lancer, mais `keycloak` a besoin de localisé le serveur de base de données
   ce qui pour effet de coupé le deployment de `keycloak` pour que `postrges-db` puisse prendre le relay est déployé
   la base de données nécessaire keycloak.

En résumer le ``docker compose`` sera exécuter via le script `run.sh` prévu a cet effet, puis construira les images
dans le dockerfile et construira avec un ordre de priorité les conteneurs `postrges-db` et `keycloak`

```shell
./run.sh
```

2. **Le script de suppression des services `down.sh`**  
   Ce script proposera une liste d'environnement dans lequel vous devez sélectionner l'environnement sur lequel
   est déployé le projet.
   Il permet d'arrêter et de supprimer les services conteneuriser. Attention ce script ne supprime pas
   le dossier ``postgres/data`` qui le répertoire de données persistantes de `Postgres`.
   Il ne supprime pas non plus le ou les images créées via les dockerfiles.

```shell
./down.sh
```

### Sauvegarde et Restauration

Le 1er projet ``Python`` permet de :

**Créer le dossier de sauvegarde**  
en rapport avec la base de données cible. Ce dossier contiendra l'historique de la base
de données cible ce dossier se trouve dans : ``/var/backups/``  
Puis, après création du dossier d'accueil, une sauvegarde de chaque base de données et réalisé au format compressé
`tar.gz` pour être placé ensuite dans son dossier historique en correspondance.

**Crée une sauvegarde qui est réalisée avec option `--clean`**   
ce qui permet d'inclure des instructions ``SQL DROP TABLE ``et ``DROP SEQUENCE`` dans le fichier de sauvegarde généré.
Cela signifie que le fichier de sauvegarde contiendra des commandes SQL pour supprimer (DROP) les tables et les
séquences existantes avant de les recréer et d'y restaurer les données.  
Cette sauvegarde permet une réinitialisation complète de la structure de la base de données existante.
L'utilisation de l'option ``--clean`` n'affecte pas la sauvegarde des données. Les données sont toujours incluses
dans le fichier de sortie généré.

**Créer une autre sauvegarde sans option**  
qui sera au format sql puis place dans le ``/docker-entrypoint-initdb.d``. Elle sera sans extension ``.sql``
volontairement pour ne pas être interprété directement pas le service ``Postrges``.
Ce fichier devra être exécuté par un autre fichier qui sera responsable de son exécution au lancement. Le fichier
responsable de son lancement devra créer la base de données en correspondance ensuite, exécutera le fichier sans
extension.

Le 2er projet ``Bash`` permet de :  
faire exactement la méme chose que la création sans option citée précédemment

**L'ordre d'exécution du fichier ``/docker-entrypoint-initdb.d``**  
Le fonctionnement du service postgres possède un ordre de lancement des scripts de ce dossier.
En 1er, il exécute dans l'ordre alphabétique les fichiers placer dans ce dossier et n'exécute que les
fichiers portant l'extension `.sql`

````shell
# Dossier de sauvegarde PostgreSQL
/docker-entrypoint-initdb.d
# Dossier historique de sauvegarde des bases de données 
/var/backups
````

```shell
# Pour lancer le projet python
python /home/maxime/script/main.py
# Le projet backup_schema.sh
/home/maxime/script/backup_schema.sh
```

## Dockerfile

Le Dockerfile provient du
dépot [Github de Postgres](https://github.com/docker-library/postgres/blob/master/16/alpine3.18/Dockerfile)
Les modifications de ce dockerfile commence à la partie `Installation personnaliser`

Ce Dockerfile possède un dossier de configuration ``config_dockerfile`` lui permettent, au moment de sa
construction, d'utiliser certain fichier qui lui sont utile en phase de construction.

1. **Installation des composants Openssh-server nano et sudo**

````dockerfile
RUN apk add --no-cache openssh-server; \
    apk add --no-cache python3; \
    apk add --no-cache jq; \
    apk add --no-cache nano; \
    apk add --no-cache sudo; \
    rm -rf /var/cache/apk/*
````

**apk add --no-cache python3**  
Cette instruction installe Python 3 de la même manière que précédemment.

**apk add --no-cache jq**
Cette instruction installe le paquet jq, un outil de traitement de JSON en ligne de commande.

**apk add --no-cache nano**
Cette instruction installe le paquet nano, un éditeur de texte en ligne de commande.

**apk add --no-cache sudo**
Cette instruction installe le paquet sudo, qui permet aux utilisateurs d'exécuter des commandes en tant qu'autres
utilisateurs.

**rm -rf /var/cache/apk/x**  
Cette instruction supprime les fichiers de cache téléchargés par apk, ce qui peut aider à réduire la taille de l'image
Docker.

* rm : C'est la commande principale pour supprimer des fichiers et des répertoires sous Unix/Linux.
* -rf : Ce sont des options fournies à la commande rm :
    * -r (ou --recursive) : Indique à la commande rm de supprimer récursivement les répertoires et leur contenu.
      Cela signifie que si ``/var/cache/apk/`` contient des sous-répertoires ou des fichiers, ils seront également
      supprimés.
    * -f (ou --force) : Indique à la commande rm de supprimer les fichiers et les répertoires sans demander de
      confirmation.
      Cela est utile lorsqu'on veut supprimer un grand nombre de fichiers sans être interrompu par des messages de
      confirmation.
* /var/cache/apk/ : C'est le chemin complet du répertoire que l'on souhaite supprimer. Dans le contexte d'Alpine Linux,
  ce répertoire est utilisé pour stocker des fichiers temporaires liés à la gestion des paquets (packages).
  Cela peut inclure des fichiers d'index, des fichiers de cache, des fichiers de métadonnées, etc.

La raison de cette commande dans le script est de libérer de l'espace disque en supprimant les fichiers temporaires
stockés dans le répertoire ``/var/cache/apk/``

2. **Gestion des clefs de connexion**

````dockerfile
RUN ssh-keygen -A
COPY config_dockerfile/id_ed25519.pub /etc/ssh/id_ed25519.pub
COPY config_dockerfile/sshd_config /etc/ssh/sshd_config
````

Cette commande est utilisée pour générer les clés SSH par défaut sur un système Linux. Cette commande génère les clés
SSH nécessaires pour le bon fonctionnement du service OpenSSH-server en créant les paires de clés publiques
et privées associées.

**Dossier de stockage**   
Les clés SSH générées par la commande ``ssh-keygen -A`` sont généralement stockées dans
le répertoire par défaut de configuration d'OpenSSH qui est ``/etc/ssh/.``.

> Vous y trouverez 4 type de clef :
>- Clé public/privée RSA pour le chiffrement des communications
>- Clé public/privée dsa obsolète et moins sécurisée, déconseillée
>- Clé public/privée ecdsa utilisée pour les courbes elliptiques
>- Clé public/privée ed25519 plus moderne et sécurisée

La génération de clef dans ce répertoire est obligatoire dans le cas contraire le service ne pourra démarrer et
restera en échec. À note que la génération d'une seule clef est suffisant et que la commande ``ssh-keygen -A``
permet simplifie la construction de l'image.

La copie de la clef ``id_ed25519.pub``  
Une Clef public a été ajouter au projet nomme ``id_ed25519.pub``.
Pour rappel la clef privet est nécessaire pour se connecter au serveur puisque ce dernier posséde la clef public.
En effet, c'est le client, se connectent au serveur, qui doit apporter la preuve de son autorisation avec la clef
privet qui doit être present dans le dossier .ssh de son Os.

La copie du fichier ``sshd_config``
C'est un fichier de configuration de connexion ssh et sftp. Il contient donc les paramétres
permettent la gestion de la connexion distante.

**Les scripts d'exécution**

````dockerfile
COPY config_dockerfile/run_script/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY config_dockerfile/run_script/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
````

Le fichier ``docker-entrypoint.sh``   
Ce script permet de personnaliser le démarrage et la configuration de ``PostgreSQL`` dans le conteneur Docker
Il a été écrit par ``PostgreSQL`` et est présent dans
son [depot Github](https://github.com/docker-library/postgres/blob/master/15/alpine3.18/Dockerfile)

Le fichier ``start.sh``
Ce fichier est le script d'exécution des services ssh et PostgreSQL.
Il est lancé à la création du conteneur est au redémarrage de celui-ci.

**Les droits d'accès utilisateur**

````dockerfile
RUN adduser -D -h /home/maxime -s /bin/bash maxime
RUN adduser maxime wheel
RUN echo "maxime:fkfJocJBg6A6BI8rFwXh" | chpasswd
RUN echo "maxime ALL=(ALL) ALL" | tee /etc/sudoers.d/maxime
````

Pour pourvoir avoir un accès au service ssh, un utilisateur et créer avec son espace personnelle. ce qui permettra de
stocker les scripts de sauvegarde ainsi que les logs en correspondance.
On ajoute l'utilisateur au groupe wheel qui associé à la gestion des droits d'administration et de super utilisateur.
On affecte un mom de passe à cet utilisateur ce qui lui permettra en autre de ce connecter via ``ssh``.
Puis ont accord des droits cet utilisateur. Ces droits sont inscrit dans le fichier maxime dans le
dossier ``/etc/sudoers.d``

**Les repertoires des scripts et des logs**

````dockerfile
RUN mkdir -p /home/maxime/script/
RUN mkdir -p /home/maxime/logs/
RUN chown maxime:maxime /home/maxime -R
````

On crée les repertoires d'accueil ``/script`` et `/logs` puis on change le propriétaire de manière récursive du
repertoire ``/home/maxime``.



## Les Scripts de sauvegarde

Décrire les scripts python et bash
ne pas oublier de dire que les fichiers de sauvegarde dans le dossier init recept un ordre
d'exécution 00 / 01 et que seul le fichier avec l'extension .sql sont prise en compte
et que c'est pour cela que les fichiers de sorti xxxx_backup n'ont pas d'extension .sql

## TODO a voir

**Le Script `task_db.sh`**  
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

**L'environnement python**

L'environnement du projet concerne les librairies contenues dans les scripts. Ces librairies sont
registres dans un dossier nommé ``venv`` qui est le dossier en gestion de l'environnement du projet.

```dockerfile
# Pour créer un environnement vierge
python -m venv [name_venv]
# puis installer les dépendances contenu dans le projet 
pip install -r requirements.txt
```

Le fichier `requirements.txt` contient la liste des dépendances du projet.
Il est possible que cet environnement soit vide.

Activer l'environnement local :

```shell
# Sur windows
.\venv\Scripts\Activate.ps1
# Sur Linux
source ./venv/Scripts/Activate
# Pour la deactivation des environnements
deactivate
```

**La gestion de projet**

À chaque ajout d'une dépendance au projet, cette dépendance doit être déclarée
dans l'environnement local.

Pour cela, il faut dans un 1er temps, active l'environnement de python.
Sans quoi cette dépendance sera installer dans l'environnement global.

```shell
# Ajouter une dépendance dans l'environnement
pip install [dépendance]
# Mettre à jour la list des dépendances
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