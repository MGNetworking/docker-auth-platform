# HomeLab – Keycloak / PostgreSQL / Redis (Docker Swarm)

## Sommaire

- [Présentation](#présentation)
- [Architecture générale](#architecture-générale)
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

Ce projet met à disposition un environnement technique destiné à fournir un système d’authentification SSO basé sur
Keycloak, associé à une base de données relationnelle (PostgreSQL) et à une base de données en mémoire non
relationnelle (Redis).

Cet environnement permet de tester et d’exposer des API au public de manière sécurisée, dans des conditions proches de
la production, sans dépendre d’une infrastructure cloud externe.

La plateforme est déployée et exploitée via Docker Swarm, avec une attention particulière portée à :

- la sécurité (réseaux overlay, secrets, exposition contrôlée)
- la persistance des données
- les sauvegardes PostgreSQL

la reprise de service automatisée après redémarrage.

Ce dépôt est volontairement orienté infrastructure et exploitation, et sert de socle technique pour des projets applicatifs nécessitant une gestion d’identité centralisée.
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

* supprime les stacks ciblées,
* supprime les volumes ciblés,
* exécute optionnellement un nettoyage Docker global (docker system prune -a --volumes),
* demande une confirmation interactive par défaut.

Options :

* --yes : pas de confirmation interactive
* --no-prune : ne pas exécuter docker system prune -a --volumes
* --stacks "s1 s2 ..." : remplace la liste des stacks à supprimer
* --volumes "v1 v2 ..." : remplace la liste des volumes à supprimer
* -h, --help : affiche l’aide

### restart-infra.sh

Script post-reboot NAS :

- vérifie l’état de Docker et Swarm,
- relance uniquement les services nécessaires,
- journalise les actions.

### wait-for-it.sh

Script utilitaire de synchronisation, utilisé pour attendre la disponibilité effective des services.

---

## Scripts de backup PostgreSQL

Ensemble de scripts d’exploitation PostgreSQL, conçus pour fonctionner avec un stockage monté côté hôte (`postgres_home/backups/`) et l’usage des secrets Docker (`pg_password`).

### backup-daily-cluster.sh

Backup quotidien du cluster complet (toutes les bases) via `pg_dumpall`.
Il :

- génère **un fichier par jour** au format `CLUSTER-YYYY-MM-DD.sql.gz`,
- évite les doublons (si le fichier du jour existe, le script *skip*),
- purge automatiquement les fichiers au-delà d’une rétention configurable.

Paramètres :

- `PG_BACKUP_KEEP_DAYS` : durée de rétention (défaut 30 jours)

### backup-manual.sh

Backup manuel interactif.
Il :

- propose un choix :
  - BD complète (schéma + données)
  - schema-only (un schéma d’une base),
- liste les bases/schémas et sélection par numéro,
- écrit des fichiers horodatés compressés (`.sql.gz`) dans :
  - `/var/backups/manual/BD/`
  - `/var/backups/manual/schema/`

### restore-daily-cluster.sh

Restauration d’un dump cluster quotidien (format `pg_dumpall`) depuis `backups/daily/cluster/`.
Il :

- demande une confirmation explicite (`RESTORE-CLUSTER`),
- stoppe au minimum la stack Keycloak,
- supprime la stack PostgreSQL et le volume de données (restauration sur volume neuf),
- redéploie PostgreSQL puis restaure le dump.

Usage :

- `./postgres_home/scripts/restore-daily-cluster.sh <backup_file.sql.gz>`

### restore-manual-db.sh

Restauration d’une base complète depuis `backups/manual/BD/`.
Il :

- demande une confirmation explicite (`RESTORE-DB`),
- termine les connexions actives,
- drop + create de la base ciblée,
- restaure le dump compressé.

Usage :

- `./postgres_home/scripts/restore-manual-db.sh <db_name> <backup_file.sql.gz>`

### restore-manual-schema.sh

Restauration d’un schéma depuis `backups/manual/schema/`.
Il :

- demande une confirmation explicite (`RESTORE-SCHEMA`),
- drop schema cascade + recreate,
- restaure le dump compressé dans la base ciblée.

Usage :

- `./postgres_home/scripts/restore-manual-schema.sh <db_name> <schema_name> <backup_file.sql.gz>`


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
