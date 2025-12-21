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
    - [Scripts de backup PostgreSQL](#scripts-de-backup-postgresql)
- [Droits d’exécution des scripts](#droits-dexécution-des-scripts)
- [Sauvegardes PostgreSQL](#sauvegardes-postgresql)
- [Restauration PostgreSQL](#restauration-postgresql)
- [Exposition Keycloak](#exposition-keycloak)
- [Notes pour recruteurs](#notes-pour-recruteurs)

---

## Présentation

Ce projet présente une **infrastructure HomeLab professionnelle** basée sur **Docker Swarm**, conçue pour exposer un *
*Keycloak** industriel avec **PostgreSQL** et **Redis**.

L’objectif est :

- démontrer une **maîtrise DevOps / infra**
- montrer une **architecture propre, idempotente et scriptée**
- proposer une base **réaliste et maintenable**

Ce dépôt est volontairement orienté **infrastructure** et non applicatif.

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
│       ├── traefik-stack.yml
│       ├── redis-stack.yml
│       ├── postgresql-stack.yml
│       └── keycloak-stack.yml
├── postgres_home/
│   ├── backups/
│   │   ├── daily/
│   │   └── manual/
│   ├── init/
│   └── scripts/
│       ├── ensure-backup-dirs.sh
│       ├── backup-daily-cluster.sh
│       ├── backup-manual.sh
│       ├── restore-daily-cluster.sh
│       ├── restore-manual-db.sh
│       └── restore-manual-schema.sh
├── script/
│   ├── ensure-infra.sh
│   ├── deploy-infra.sh
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

### ensure-infra.sh

- Attend Docker
- Initialise Swarm si nécessaire
- Crée les réseaux overlay déclarés dans `.env`
- Idempotent

### deploy-infra.sh

- Appelle `ensure-infra.sh`
- Déploie les stacks dans l’ordre :
    1. Traefik
    2. Redis
    3. PostgreSQL
    4. Keycloak
- Options :
    - `--force`
    - `--no-wait`

### restart-infra.sh

- Script post-reboot NAS
- Redémarrage contrôlé des services
- Logs persistants

### Scripts de backup PostgreSQL

- `ensure-backup-dirs.sh` : prépare l’arborescence
- `backup-daily-cluster.sh` : dump global quotidien + purge 30 jours
- `backup-manual.sh` : dump interactif (DB ou schema)

---

## Droits d’exécution des scripts

Après clonage du dépôt, **les scripts doivent être rendus exécutables** :

```bash
chmod +x script/*.sh
chmod +x postgres_home/scripts/*.sh
chmod +x secrets/*.sh
```

Recommandé :

```bash
find . -name "*.sh" -type f -exec chmod +x {} \;
```

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

## Notes pour recruteurs

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
