# Keycloak avec PostgreSQL - Gestion d'Authentification et d'Autorisation

* [Technologies utilisées](#technologies-utilisées)
    * [Keycloak](#keycloak)
    * [PostgreSQL](#postgresql)
* [Utilisation des scripts](#utilisation-des-scripts)
    * [Les Scripts](#les-scripts)

* [Information](#information)

Ce projet met en œuvre une solution de gestion des utilisateurs et des autorisations en utilisant **Keycloak**
conjointement avec **PostgreSQL**. Il s'agit d'une implémentation simple et efficace pour gérer l'authentification et
l'autorisation dans vos applications, en s'appuyant sur les standards **OpenID Connect** et **OAuth2**.

## Technologies utilisées

### Keycloak

Keycloak est une solution de gestion d'identité et d'accès (IAM) open-source. Dans ce projet, Keycloak est configuré
pour fonctionner avec le protocole **OpenID Connect** (OIDC) et **OAuth2**. Ces protocoles permettent :

- **OpenID Connect** : Assurer l'authentification sécurisée des utilisateurs.
- **OAuth2** : Gérer les autorisations d'accès aux ressources en fonction des rôles et des permissions.

Keycloak permet une intégration facile avec vos applications grâce à ses connecteurs et options de configuration.

### PostgreSQL

La base de données **PostgreSQL** est utilisée comme système de gestion des données pour Keycloak. Elle stocke de
manière fiable les informations essentielles, telles que :

- Les utilisateurs et leurs métadonnées.
- Les clients (applications).
- Les rôles et les permissions.

L'utilisation de PostgreSQL garantit une haute performance et une persistance fiable des données pour Keycloak.

---

## Structure des fichiers

Le projet contient les fichiers suivants :

### `ghoverblog-realm.json`
Ce fichier contient la configuration complète d'un **realm** nommé `ghoverblog`. Un **realm** dans Keycloak est un espace de gestion des utilisateurs, des clients (applications), des rôles et des paramètres d'authentification.

#### Utilité :
- Permet de réimporter rapidement une configuration prédéfinie pour un realm spécifique.
- Contient des informations telles que :
    - Les clients configurés (applications utilisant Keycloak).
    - Les rôles définis.
    - Les paramètres de connexion.

### `ghoverblog-user.json`
Ce fichier contient une liste d'utilisateurs préconfigurés avec leurs rôles, groupes et autres paramètres associés.

#### Utilité :
- Facilite la création d'un ensemble d'utilisateurs de test ou de production.
- Inclut des informations telles que :
    - Les identifiants utilisateur.
    - Les mots de passe (cryptés).
    - Les rôles attribués à chaque utilisateur.

Ces fichiers peuvent être importés directement dans Keycloak pour initialiser la configuration et les utilisateurs nécessaires à votre projet.

---

## Utilisation des scripts

Le projet fournit deux scripts simples pour gérer les containers Docker de Keycloak et PostgreSQL. Ces scripts
permettent de démarrer, arrêter et supprimer les volumes associés.

### Les Scripts

Ce script démarre l'infrastructure. Il initialise les containers Keycloak et PostgreSQL et s'assure que tout est prêt
pour une utilisation immédiate.

#### Commande :

Linux ou wsl

```shell
./script/run.sh
./script/down.sh
```

powershell

```powershell
./script/run.bat
./script/down.bat
```

---

### Information

1. Keycloak

* Information sur [keycloak](https://www.keycloak.org/) le gestionnaire d'authentification
* Les variables d'environnements de base, voir le [docker hub](https://hub.docker.com/r/keycloak/keycloak/tags)
* Le dépôt ``Red hat`` de l'image basé sur Quarkus [RED HAT Quay.io](https://quay.io/repository/keycloak/keycloak)

2. PostgreSQL

* Tutoriel sur [postgres](#https://www.postgresqltutorial.com/)
* La documentation de ce projet , voir le [docker hub](https://hub.docker.com/_/postgres)
* La version de ce
  projet [postgres:15.2-bullseye](https://hub.docker.com/layers/library/postgres/15.2-bullseye/images/sha256-6b91d38a9c596fa4e6a1276f6f81810882d9f292a09f9cf2647c6a554c8b6d00?context=explore)

3. Other
    * Le planificateur de [tâches crontab](https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches) 