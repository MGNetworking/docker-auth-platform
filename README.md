# Keycloak avec PostgreSQL et Redis - Gestion d'Authentification et d'Autorisation

* [Technologies utilisées](#technologies-utilisées)
    * [Keycloak](#keycloak)
    * [PostgreSQL](#postgresql)
    * [Redis](#redis)
    * [Docker Swarm](#docker-swarm)
* [Scripts de Gestion](#scripts-de-gestion)
    * [Les Scripts de Déploiement](#les-scripts-de-déploiement)
    * [Scripts d'Infrastructure](#scripts-dinfrastructure)
    * [Script wait-for-it.sh](#script-wait-for-itsh)
    * [En cas de problème d'accès](#en-cas-de-problème-daccès)
* [Environnements](#environnements)
    * [Environnement de Développement](#environnement-de-développement)
    * [Environnement NAS/Production](#environnement-nasproduction)
* [Pipeline CI/CD](#pipeline-cicd)
* [Backup postgreSQL](#backup-postgresql)
* [Gestion des realm role / user dans Keycloak](#gestion-des-realm-role--user-dans-keycloak)
* [Configuration des variables](#configuration-des-variables)
    * [Paramètres généraux](#paramètres-généraux)
    * [Configuration Redis](#configuration-redis)
    * [Logs](#logs)
    * [Métriques et santé](#métriques-et-santé)
    * [Configuration de la base de données](#configuration-de-la-base-de-données)
    * [Utilisateur administrateur temporaire](#utilisateur-administrateur-temporaire)
    * [Configuration de la JVM](#configuration-de-la-jvm)
    * [Tableau de comparaison Dev vs Prod](#tableau-de-comparaison-dev-vs-prod)
    * [Option configure la JVM](#option-configure-la-jvm)
* [Structure des fichiers](#structure-des-fichiers)
* [Gestion des Themes Keycloak](#gestion-des-themes-keycloak)
* [Information](#information)

Ce projet met en œuvre une solution de gestion des utilisateurs et des autorisations en utilisant **Keycloak**
conjointement avec **PostgreSQL** et **Redis**. Il s'agit d'une implémentation déployée via **Docker Swarm** pour gérer
l'authentification et
l'autorisation dans vos applications, en s'appuyant sur les standards **OpenID Connect** et **OAuth2**.

## Technologies utilisées

### Keycloak

Keycloak est une solution de gestion d'identité et d'accès (IAM) open-source. Dans ce projet, Keycloak est configuré
pour fonctionner avec le protocole **OpenID Connect** (OIDC) et **OAuth2**. Ces protocoles permettent :

- **OpenID Connect** : Assurer l'authentification sécurisée des utilisateurs.
- **OAuth2** : Gérer les autorisations d'accès aux ressources en fonction des rôles et des permissions.

Keycloak permet une intégration facile avec vos applications grâce à ses connecteurs et options de configuration.

### PostgreSQL

PostgreSQL est utilisé comme base de données relationnelle pour stocker les informations d'authentification et d'
autorisation de Keycloak.

- **Version utilisée** : PostgreSQL 15
- **Rôle** : Stockage persistent des utilisateurs, rôles, permissions et configurations Keycloak
- **Configuration** : Optimisée pour les performances et la sécurité

### Redis

Redis est configuré comme un cache haute performance avec persistance optionnelle pour améliorer les performances de
l'application.

- **Version utilisée** : Redis 7-alpine
- **Rôle** : Cache en mémoire, stockage de sessions, files d'attente
- **Configuration** : Sécurisé avec authentification et limites mémoire

### Redis

Redis est configuré comme un cache haute performance avec persistance optionnelle pour améliorer les performances de
l'application.

- **Version utilisée** : Redis 7-alpine
- **Rôle** : Cache en mémoire, stockage de sessions, files d'attente
- **Configuration** : Sécurisé avec authentification et limites mémoire

### Docker Swarm

Docker Swarm est utilisé comme orchestrateur pour gérer le déploiement des services en haute disponibilité :

- **Mode cluster** : Permet la répartition des services sur plusieurs nœuds
- **Réseau overlay** : Communication sécurisée entre les services
- **Placement constraints** : Contrôle précis du déploiement des services
- **Auto-recovery** : Redémarrage automatique en cas de panne

## Scripts de Gestion

### Les Scripts de Déploiement

#### Environnement de développement

- **`script/deploy-dev.sh`** : Script principal de déploiement pour l'environnement de développement
    - Déploie Redis, PostgreSQL et Keycloak sur Docker Swarm
    - Configure le réseau overlay automatiquement
    - Vérifie la santé des services après déploiement

- **`script/stop-dev.sh`** : Arrête les stacks de développement sans supprimer les volumes
    - Préserve les données PostgreSQL et Redis
    - Permet un redémarrage rapide

#### Environnement NAS/Production

- **`infrastructure/deploy-nas.sh`** : Script de déploiement pour l'infrastructure de production
    - Vérifie l'état existant avant déploiement
    - Initialise Docker Swarm si nécessaire
    - Déploie l'infrastructure complète (Redis, PostgreSQL, Keycloak)

- **`infrastructure/check-infra.sh`** : Vérifie si l'infrastructure est complète et opérationnelle
    - Contrôle la présence des stacks
    - Teste la connectivité des services
    - Retourne un statut pour automatisation

### Scripts d'Infrastructure

- **`script/create-network.sh`** : Crée le réseau overlay Docker Swarm
    - Réseau `company_network` pour la communication inter-services
    - Mode overlay avec option attachable

### Script wait-for-it.sh

Le script `wait-for-it.sh` est utilisé dans Keycloak pour attendre que PostgreSQL soit prêt avant de démarrer :

```bash
./wait-for-it.sh postgres-shared:5432 -- /opt/keycloak/bin/kc.sh start
```

### En cas de problème d'accès

Si vous ne pouvez pas accéder à Keycloak, vérifiez :

1. **État des services** :

```bash
docker service ls
docker service logs <stack-name>_keycloak
```

2. **Connectivité réseau** :

```bash
docker network ls
docker network inspect company_network
```

3. **Santé des services** :

```bash
docker service ps <stack-name>_postgres-shared
docker service ps <stack-name>_redis-shared
```

## Environnements

### Environnement de Développement

Situé dans `environments/dev/` :

- **Configuration** : `.env` avec variables de développement
- **Services** : Redis, PostgreSQL, Keycloak
- **Réseau** : Bridge local pour développement rapide
- **Données** : Volumes locaux, backup facilité

### Environnement NAS/Production

Situé dans `environments/nas/` :

- **Configuration** : `.env` avec variables de production
- **Services** : Redis, PostgreSQL, Keycloak avec constraints de placement
- **Réseau** : Overlay pour distribution multi-nœuds
- **Données** : Volumes persistants avec sauvegarde automatisée

## Pipeline CI/CD

Le fichier `Jenkinsfile` automatise le déploiement sur l'environnement NAS :

- **Déclenchement** : Push sur branches spécifiques
- **Étapes** : Vérification, déploiement, tests de santé
- **Notifications** : Statut de déploiement
- **Rollback** : En cas d'échec de déploiement

## Backup postgreSQL

Pour sauvegarder PostgreSQL dans l'environnement Docker Swarm :

```bash
# Sauvegarde manuelle
docker exec $(docker ps -q -f "name=postgres-shared") pg_dumpall -U keycloak_user > backup_$(date +%Y%m%d).sql

# Restauration
docker exec -i $(docker ps -q -f "name=postgres-shared") psql -U keycloak_user -d keycloak < backup_file.sql
```

## Gestion des realm role / user dans Keycloak

Permet de faire un export des données du realm cible. Cette commande permet notamment d'exporter les utilisateurs est
leur rôle.

Commande pour keycloak en version supérieure à 17

```shell
/opt/keycloak/bin/kc.sh export --realm=ghoverblog --file=/opt/keycloak/data/import/ghoverblog-realm.json --users=same_file
```

Depuis docker (pour Docker Swarm)
Export des realm est les utilisateurs dans le même fichier.

````shell
# commande d'export pour Docker Swarm
docker exec -it $(docker ps -q -f "name=keycloak") /opt/keycloak/bin/kc.sh export --realm=ghoverblog --file=/opt/keycloak/data/ghoverblog-realm.json --users=same_file

# copier du fichier dans le conteneur vers l'extérieur
docker cp $(docker ps -q -f "name=keycloak"):/opt/keycloak/data/ghoverblog-realm.json ./ghoverblog-realm.json
````

Les fichiers seront copier depuis le dossier ou la commande à était lancé

Cette commande créera 2 fichiers :

* `ghoverblog-realm.json`
* `ghoverblog-users-0.json`

Faire un depuis un keycloak en version inférieur à 17

```bash
cd /opt/jboss/keycloak
bin/standalone.sh \
-Dkeycloak.migration.action=export \
-Dkeycloak.migration.provider=dir \
-Dkeycloak.migration.dir=/tmp \
-Dkeycloak.migration.realmName=ghoverblog -Djboss.socket.binding.port-offset=100
```

- `-Dkeycloak.migration.action=export`
  `export` : Spécifie que l'action à effectuer est une exportation. Cela signifie que Keycloak doit exporter les
  configurations des realms sous forme de fichiers JSON.


- `-Dkeycloak.migration.provider=dir`
  `dir` : Utilise un répertoire comme destination pour exporter les données ou comme source pour importer les fichiers.


- `-Dkeycloak.migration.dir=/tmp`
  `/tmp` : Répertoire temporaire sur le système avec lequel les fichiers exportés seront écrits. Vous pouvez changer
  cette valeur pour un autre emplacement.


- `-Dkeycloak.migration.realmName=ghoverblog`
    - Limite l'exportation à un seul realm, ici nommé `ghoverblog`.
    - Si cette option n'est pas spécifiée, Keycloak exportera tous les realms présents sur le serveur.

Ceux-ci vont créer une instance keycloak pour générer deux fichiers. Un fichier `ghoverblog-realm.json` et un fichier
`ghoverblog-users-0.json`
Après exécution de ces fichiers, vous pourrez supprimer l'instance créer dans le terminal avec la commande `CTRL + C`

Puis pour copier ces fichiers sur le disque local, exécuter la commande suivant :

```shell
# commande pour Docker Swarm
docker cp $(docker ps -q -f "name=keycloak"):/tmp/[fichier de réception] ./[fichier cible]
# exemple
docker cp $(docker ps -q -f "name=keycloak"):/tmp/ghoverblog-realm.json ./ghoverblog-realm.json
docker cp $(docker ps -q -f "name=keycloak"):/tmp/ghoverblog-users-0.json ./ghoverblog-users-0.json
```

## Configuration des variables

### Paramètres généraux

Les variables d'environnement principales pour chaque environnement :

```bash
# Stacks Docker Swarm
PG_STACK_NAME=postgres-stack
KC_STACK_NAME=keycloak-stack
REDIS_STACK_NAME=redis-stack

# Réseau
COMPANY_NETWORK=company_network
```

### Configuration Redis

Redis est configuré comme un cache haute performance avec persistance optionnelle. Voici les principales options de
configuration utilisées :

#### Paramètres de sécurité et performance

```yaml
command: >
  redis-server 
  --requirepass ${REDIS_PASSWORD} 
  --appendonly yes
  --maxmemory 1gb
  --maxmemory-policy allkeys-lru
```

#### Explication des paramètres

| Paramètre            | Valeur              | Description                                                                 |
|----------------------|---------------------|-----------------------------------------------------------------------------|
| `--requirepass`      | `${REDIS_PASSWORD}` | **Obligatoire** - Mot de passe pour sécuriser l'accès à Redis               |
| `--appendonly`       | `yes`               | Active la persistance AOF (Append Only File) pour la durabilité des données |
| `--maxmemory`        | `1gb`               | Limite la mémoire utilisée par Redis à 1 GB                                 |
| `--maxmemory-policy` | `allkeys-lru`       | Stratégie d'éviction : supprime les clés les moins récemment utilisées      |

#### Variables d'environnement Redis requises

```bash
# Configuration Redis
REDIS_PASSWORD=your_secure_redis_password
REDIS_PORT=6379
REDIS_STACK_NAME=redis-stack
```

#### Stratégies d'éviction disponibles

- **allkeys-lru** : Supprime les clés les moins récemment utilisées (recommandé pour un cache)
- **allkeys-lfu** : Supprime les clés les moins fréquemment utilisées
- **volatile-lru** : Supprime les clés avec TTL les moins récemment utilisées
- **volatile-lfu** : Supprime les clés avec TTL les moins fréquemment utilisées
- **noeviction** : Retourne une erreur quand la mémoire est pleine

#### Ressources allouées

```yaml
deploy:
  resources:
    limits:
      memory: 1200mb        # Limite Docker (marge de sécurité)
    reservations:
      memory: 256mb         # Mémoire minimum garantie
```

La limite Docker (1200MB) est légèrement supérieure à la limite Redis (1GB) pour permettre les métadonnées système et
éviter les erreurs OOM (Out of Memory).

#### Healthcheck Redis

Redis est configuré avec un healthcheck utilisant la commande `PING` :

```yaml
healthcheck:
  test: [ "CMD", "redis-cli", "-a", "${REDIS_PASSWORD}", "ping" ]
  interval: 10s
  timeout: 5s
  retries: 5
```

#### Cas d'usage recommandés

- **Cache de session** : Stockage rapide des sessions utilisateur
- **Cache applicatif** : Mise en cache des données fréquemment consultées
- **Files d'attente** : Traitement asynchrone des tâches
- **Compteurs** : Statistiques temps réel et métriques

### Logs

Configuration des logs pour chaque environnement :

```bash
# Niveau de log (dev: debug, prod: info)
KC_LOG_CONSOLE_LEVEL=info
```

### Métriques et santé

Configuration du monitoring :

```bash
KC_HEALTH_ENABLED=true      # Endpoints de santé
KC_METRICS_ENABLED=true     # Métriques Prometheus
```

### Configuration de la base de données

Variables PostgreSQL communes :

```bash
DB_USER=keycloak_user
DB_PASSWORD=your_secure_password
DB_NAME=kc_db
DB_PORT_EXTERNAL=5499       # Port d'accès externe
```

### Utilisateur administrateur temporaire

Compte admin initial de Keycloak :

```bash
KEYCLOAK_ADMIN=admin
KEYCLOAK_ADMIN_PASSWORD=admin_password
```

### Configuration de la JVM

Optimisation mémoire pour chaque environnement :

```bash
# Développement
JAVA_OPTS_APPEND="-XX:MaxRAMPercentage=50 -Dquarkus.log.console.output=colored"

# Production
JAVA_OPTS_APPEND="-XX:MaxRAMPercentage=75 -Dkeycloak.profile=production"
```

### Tableau de comparaison Dev vs Prod

| Paramètre    | Développement | Production/NAS             |
|--------------|---------------|----------------------------|
| Mémoire JVM  | 50% RAM       | 75% RAM                    |
| Log Level    | debug         | info                       |
| HTTPS Strict | false         | true                       |
| Placement    | Aucun         | node.hostname == BlackHole |
| Healthcheck  | Basique       | Complet avec retry         |

### Option configure la JVM

Options JVM recommandées par environnement :

- **MaxRAMPercentage** : Pourcentage de RAM allouée à la JVM
- **Profile** : `development` ou `production`
- **Log output** : Coloré pour dev, structuré pour prod

## Structure des fichiers

```
nas-infrastructur/
├── Jenkinsfile                           # Pipeline CI/CD pour déploiement automatisé
├── README.md                            # Documentation du projet
├── docker-compose-prod.yml              # Configuration Docker Compose pour production
├── environments/                        # Configuration par environnement
│   ├── dev/                            # Environnement de développement
│   │   ├── .env                        # Variables d'environnement dev
│   │   ├── keycloak-swarm.yml          # Configuration Keycloak dev
│   │   ├── postgresql-swarm.yml        # Configuration PostgreSQL dev
│   │   └── redis-swarm.yml             # Configuration Redis dev
│   └── nas/                            # Environnement NAS/Production
│       ├── .env                        # Variables d'environnement prod
│       ├── keycloak-swarm.yml          # Configuration Keycloak prod
│       ├── postgresql-swarm.yml        # Configuration PostgreSQL prod
│       └── redis-swarm.yml             # Configuration Redis prod
├── infrastructure/                      # Scripts d'infrastructure
│   ├── check-infra.sh                  # Vérification de l'infrastructure
│   └── deploy-nas.sh                   # Déploiement infrastructure NAS
├── keycloak_home/                      # Configuration et données Keycloak
│   └── config/                         # Fichiers de configuration
│       ├── ghoverblog-realm.json       # Configuration du realm
│       └── ghoverblog-users.json       # Utilisateurs de test
├── postgres_home/                      # Configuration et données PostgreSQL
│   ├── backups/                        # Sauvegardes de la base
│   │   └── backup-Test.sql             # Sauvegarde de test
│   └── init/                           # Scripts d'initialisation
│       ├── 00_base_ghoverblog.sql      # Structure de base
│       └── ms_article_backup.sql       # Données d'exemple
└── script/                             # Scripts utilitaires
    ├── create-network.sh               # Création réseau overlay
    ├── deploy-dev.sh                   # Déploiement environnement dev
    ├── stop-dev.sh                     # Arrêt environnement dev
    └── wait-for-it.sh                  # Attente de service
```

## Gestion des Themes Keycloak

Si vous voulez modifier l'apparence de Keycloak, vous pouvez créer ou utiliser des thèmes personnalisés.

### Structure des thèmes

Les thèmes Keycloak suivent une structure spécifique :

```
themes/
└── nom-du-theme/
    ├── login/           # Pages de connexion
    ├── account/         # Pages de gestion de compte
    └── admin/           # Interface d'administration
```

### Utilisation d'un thème

1. **Placer le thème** dans un volume monté : `/opt/keycloak/themes/`
2. **Configurer dans l'admin** : Realm Settings > Themes
3. **Appliquer** : Sélectionner le thème pour Login, Account, etc.

## Information

1. Keycloak

* Documentation
  officielle [Keycloak](https://www.keycloak.org/guides#getting-started](https://www.keycloak.org/guides#getting-started)
* La [documentation](https://www.keycloak.org/documentation) de ce projet
* La version de ce
  projet [keycloak:26.0](https://quay.io/repository/keycloak/keycloak?tab=tags&tag=26.0)

2. PostgreSQL

* Tutoriel sur [postgres](https://www.postgresqltutorial.com/)
* La documentation de ce projet, voir le [docker hub](https://hub.docker.com/_/postgres)
* La version de ce projet [postgres:17-alpine](https://hub.docker.com/_/postgres/tags?page=1&name=17-alpine)

3. Redis

* Documentation officielle [Redis](https://redis.io/documentation)
* Guide des commandes [Redis Commands](https://redis.io/commands)
* La version de ce projet [redis:7-alpine](https://hub.docker.com/_/redis/tags?page=1&name=7-alpine)

4. Docker Swarm

* Documentation officielle [Docker Swarm](https://docs.docker.com/engine/swarm/)
* Guide des [Docker Stack](https://docs.docker.com/engine/reference/commandline/stack/)

5. Other
    * Le planificateur de [tâches crontab](https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches)