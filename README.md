# HomeLab – Keycloak / PostgreSQL / Redis (Docker Swarm)

## Sommaire

- [Présentation](#présentation)
- [Philosophie générale](#philosophie-générale)
- [Architecture générale](#architecture-générale)
- [Rôle et responsabilités des composants](#rôle-et-responsabilités-des-composants)
- [Technologies](#technologies)
- [Structure du dépôt](#structure-du-dépôt)
- [Prérequis](#prérequis)
- [Gestion des secrets Docker](#gestion-des-secrets-docker)
- [Scripts](#scripts)
    - [ensure-infra.sh](#ensure-infrash)
    - [deploy-infra.sh](#deploy-infrash)
    - [restart-infra.sh](#restart-infrash)
- [Sauvegardes PostgreSQL](#sauvegardes-postgresql)
- [Restauration PostgreSQL](#restauration-postgresql)
- [Exposition Keycloak](#exposition-keycloak)
- [Notes pour recruteurs](#notes-pour-recruteurs)

---

## Présentation

Ce projet met à disposition un **environnement HomeLab professionnel** destiné à fournir un système d’authentification
SSO basé sur **Keycloak**, associé à une base de données relationnelle (**PostgreSQL**) et à une base de données en
mémoire (**Redis**).

L’objectif est de disposer d’un socle technique **réaliste, documenté et exploitable**, permettant :

- de tester des API dans des conditions proches de la production,
- d’exposer des services de manière sécurisée,
- de démontrer une maîtrise des problématiques d’infrastructure et d’exploitation.

---

## Philosophie générale

Ce dépôt est volontairement orienté **infrastructure et exploitation**, et non développement applicatif.

Les principes directeurs sont :

- aucune automatisation destructrice implicite,
- scripts explicites, traçables et auditables,
- séparation stricte entre :
    - infrastructure,
    - données,
    - secrets,
    - sauvegardes,
- compréhension fine des mécanismes sous-jacents (Docker, PostgreSQL, réseau).

---

## Architecture générale

- **Docker Swarm** (single-node NAS, extensible multi-nodes)
- **Traefik** (reverse-proxy interne)
- **Nginx NAS** (TLS en frontal)
- **Keycloak** (IAM)
- **PostgreSQL** (base partagée)
- **Redis** (cache / sessions)

Tous les services communiquent via des **réseaux overlay**.

---

## Rôle et responsabilités des composants

### PostgreSQL

Le conteneur PostgreSQL fournit un **serveur PostgreSQL complet**, initialisé avec :

- un **super-user** défini par `POSTGRES_USER`,
- un mot de passe fourni via `POSTGRES_PASSWORD_FILE` (Docker secret).

Ce super-user possède les **droits complets sur l’ensemble du cluster PostgreSQL**.

Important :

- PostgreSQL impose que **toute commande soit exécutée depuis une base existante**.
- Il est impossible d’agir directement « au niveau du serveur » sans être connecté à une base.
- Les bases `postgres` et `template1` servent de **bases techniques** permettant l’administration du cluster.
- Les droits sont portés par le **rôle (user)**, jamais par la base elle-même.

Cette distinction est essentielle pour comprendre les scripts de sauvegarde et de restauration.

### Keycloak

Keycloak est utilisé comme **serveur d’identité centralisé (IAM)** :

- gestion des utilisateurs,
- gestion des rôles et des permissions,
- fédération et authentification des applications.

Il repose sur **PostgreSQL** pour la persistance des données et sur **Redis** pour certaines fonctions de cache et de
gestion de sessions.

Lors de la **première initialisation**, un **compte administrateur initial** est créé automatiquement via les variables
d’environnement :

```yaml
KEYCLOAK_ADMIN: "admin"
KEYCLOAK_ADMIN_PASSWORD: "admin"
```

Ce compte permet l’accès initial à la console d’administration, mais doit être considéré comme temporaire.

Dans une logique de sécurité et de bonnes pratiques :

* un compte administrateur personnalisé est créé (noms explicites, mot de passe fort),
* les rôles et droits sont vérifiés,
* le compte administrateur initial est ensuite supprimé ou désactivé.

Cette démarche limite l’usage d’identifiants par défaut et aligne l’environnement sur des conditions proches de la
production.

### Redis

Redis est utilisé comme **composant auxiliaire** :

- cache,
- gestion de sessions,
- amélioration des performances.

Il n’est pas considéré comme source de vérité.

### Traefik & Nginx

- Traefik assure le routage interne HTTP.
- Nginx NAS gère la terminaison TLS et l’exposition externe.

---

## Technologies

- Keycloak 26.x
- PostgreSQL 17-alpine
- Redis 7-alpine
- Docker Swarm
- Bash (scripts idempotents)

---

## Structure du dépôt

```text
.
├── environments/
│   └── homeLab/
│       ├── .env
│       ├── config.env
│       ├── traefik-stack.yml
│       ├── redis-stack.yml
│       ├── postgresql-stack.yml
│       └── keycloak-stack.yml
├── postgres_home/
│   ├── backups/
│   ├── init/
│   └── scripts/
│       ├── backup-daily-cluster.sh
│       ├── backup-manual.sh
│       ├── restore-daily-cluster.sh
│       ├── restore-manual-db.sh
│       └── restore-manual-schema.sh
├── scripts/
│   ├── deploy-infra.sh
│   ├── ensure-backup-dirs.sh
│   ├── ensure-infra.sh
│   ├── reset-infra.sh
│   ├── restart-infra.sh 
│   └── wait-for-it.sh
├── secrets/
│   ├── secrets.manifest
│   └── check-secrets.sh
└── README.md
```

---

## Prérequis

- Docker installé et fonctionnel
- Docker Swarm initialisable
- Accès root / sudo (NAS Synology)
- Secrets Docker créés manuellement

---

## Gestion des secrets Docker

Les secrets sont **créés hors dépôt**.

Liste attendue :

- `pg_password`
- `redis_password`

Vérification :

```bash
./secrets/check-secrets.sh
```

---

## Scripts

Les scripts de ce dépôt constituent une chaîne d’exploitation complète permettant :

- l’initialisation de l’infrastructure Docker Swarm,
- le déploiement contrôlé des stacks,
- la reprise de service après redémarrage du NAS,
- la sauvegarde et la restauration explicites des données PostgreSQL.

L’ensemble est conçu pour être idempotent, traçable et exécutable manuellement, sans automatisme destructif implicite.

### deploy-infra.sh

Script principal de déploiement de l’infrastructure.
Il :

- appelle ensure-infra.sh,
- déploie Traefik, Redis, PostgreSQL puis Keycloak,
- attend la stabilisation des services.

Options :

- ``--force`` : redéploiement forcé,
- ``--no-wait`` : pas d’attente de stabilisation.

### ensure-backup-dirs.sh

Prépare l’arborescence des sauvegardes PostgreSQL côté hôte.

### ensure-infra.sh

Script de prérequis :

- attend Docker,
- initialise Swarm si nécessaire,
- crée les réseaux overlay,
- garantit un socle valide avant déploiement.

### reset-infra.sh

Script de réinitialisation contrôlée de l’infrastructure Docker Swarm.

Il permet :

- supprime les stacks ciblées,
- supprime les volumes ciblés,
- exécute optionnellement un nettoyage Docker global (docker system prune -a --volumes),
- demande une confirmation interactive par défaut.

Options :

- --yes : pas de confirmation interactive
- --no-prune : ne pas exécuter docker system prune -a --volumes
- --stacks "s1 s2 ..." : remplace la liste des stacks à supprimer
- --volumes "v1 v2 ..." : remplace la liste des volumes à supprimer
- -h, --help : affiche l’aide

### restart-infra.sh

Script post-reboot NAS :

- vérifie l’état de Docker et Swarm,
- relance uniquement les services nécessaires,
- journalise les actions.

### wait-for-it.sh

Script utilitaire de synchronisation, utilisé pour attendre la disponibilité effective des services.

---

## Scripts de backup PostgreSQL

Ensemble de scripts d’exploitation PostgreSQL, conçus pour fonctionner avec un stockage monté côté hôte (
`postgres_home/backups/`) et l’usage des secrets Docker (`pg_password`).

### backup-daily-cluster.sh

Backup quotidien **de l’ensemble des bases du cluster PostgreSQL** dans **un fichier unique**, sans inclure les rôles
globaux.

Le script :

- génère **un fichier par jour** au format `CLUSTER-YYYY-MM-DD.sql.gz`,
- regroupe **toutes les bases non template** du cluster dans un seul dump,
- inclut pour chaque base :
    - la terminaison des connexions actives,
    - le `DROP` et le `CREATE` de la base,
    - la restauration complète du schéma et des données,
- évite les doublons (si le fichier du jour existe, le script est *skippé*),
- purge automatiquement les fichiers au-delà d’une durée de rétention configurable.

Le dump est construit de manière à pouvoir être **rejoué intégralement** depuis une base d’administration PostgreSQL (
par défaut `postgres` ou `template1`), sans dépendance aux rôles globaux du cluster.

Paramètres :

- `PG_BACKUP_KEEP_DAYS` : durée de rétention des sauvegardes (défaut : 30 jours)
- `ADMIN_DB` : base PostgreSQL utilisée comme point d’exécution administratif (défaut : `postgres`)

### backup-manual.sh

Backup manuel interactif.
Il :

- propose un choix :
    - BD complète (schéma + données)
    - schema-only (un schéma d’une base)
- liste les bases/schémas et sélection par numéro 
- exécute le backup depuis le conteneur PostgreSQL actif
- génère des fichiers horodatés et compressés (.sql.gz)
- écrit des fichiers horodatés compressés (`.sql.gz`) dans :
    - `/var/backups/manual/BD/`
    - `/var/backups/manual/schema/`

### restore-daily-cluster.sh

Restauration complète **de l’ensemble des bases du cluster PostgreSQL** à partir d’un fichier unique
`CLUSTER-YYYY-MM-DD.sql.gz` généré par `backup-daily-cluster.sh`.

Le script :

- demande une **confirmation explicite** avant toute action destructrice,
- stoppe **de manière non destructive** la stack Keycloak (scale à 0),
- se connecte à une **base d’administration PostgreSQL** (`ADMIN_DB`) pour piloter la restauration,
- exécute le fichier de sauvegarde qui :
    - termine les connexions actives,
    - supprime et recrée chaque base concernée,
    - restaure intégralement schéma et données,
- relance ensuite la stack Keycloak.

La restauration est effectuée **sans manipulation des rôles globaux**, en s’appuyant sur le super-user
défini lors de l’initialisation du conteneur PostgreSQL.

Ce script permet une **reprise complète et maîtrisée de l’état des bases**, sans redéploiement
de l’infrastructure ni recréation des volumes.

Usage :

- `./postgres_home/scripts/restore-daily-cluster.sh <CLUSTER-YYYY-MM-DD.sql.gz>`

Paramètres :

- `ADMIN_DB` : base PostgreSQL utilisée comme point d’exécution administratif
  (défaut : `postgres`, peut être remplacée par `template1` si nécessaire)

### restore-manual-db.sh

Restauration **manuelle à chaud** d’une base PostgreSQL complète depuis `backups/manual/BD/`.

Il :

- demande une confirmation explicite avant exécution
- coupe les connexions actives à la base (les services connectés peuvent être impactés)
- supprime puis recrée la base ciblée (`DROP DATABASE` / `CREATE DATABASE`)
- restaure le dump compressé (`.sql.gz`) dans la base recréée
- n’arrête ni ne redémarre les services applicatifs (la gestion de leur cycle de vie est volontairement hors périmètre)
- déduit automatiquement le nom de la base depuis le nom du fichier et vérifie sa cohérence avec `DB_NAME`.

Usage :

- `./postgres_home/scripts/restore-manual-db.sh <backup_file.sql.gz>`

Exemple :

- `./postgres_home/scripts/restore-manual-db.sh DB-2025-12-21_14-05-00-kc_db.sql.gz`

### restore-manual-schema.sh

Restauration **destructive** d’un schéma PostgreSQL depuis `postgres_home/backups/manual/schema/`.

Le script :

- demande une confirmation explicite avant exécution
- **déduit automatiquement la base et le schéma depuis le nom du fichier**
- termine les connexions actives sur la base cible
- supprime le schéma (`DROP SCHEMA … CASCADE`)
- drop schema cascade + recreate
- restaure le dump compressé (le schéma est recréé par le dump)

Usage :

- `./postgres_home/scripts/restore-manual-schema.sh <backup_file.sql.gz>`

---

## Sauvegardes PostgreSQL

- **Daily** : cluster complet (`pg_dumpall`)
- **Manual** :
    - Base complète
    - Schema ciblé
- Aucune création dynamique de dossiers dans le conteneur
- Tout est monté côté hôte

---

## Restauration PostgreSQL

- Script dédié par type :
    - cluster
    - base
    - schema
- Restauration explicite et volontaire
- Aucun automatisme destructif

---

## Exposition Keycloak

- DNS interne via alias réseau (`dns-postgres`)
- Exposition HTTP via Traefik
- TLS géré par Nginx NAS
- Réplicas Keycloak = 2

---

## Positionnement technique du projet

Ce projet démontre :

- réflexion **infra avant outil**
- séparation claire :
    - infra
    - secrets
    - data
    - backups
- pratiques **professionnelles et réalistes**
- capacité à expliquer **pourquoi** chaque choix

Ce dépôt n’est pas un “hello-world”, mais une **base exploitable en production**.
