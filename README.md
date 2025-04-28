# Keycloak avec PostgreSQL - Gestion d'Authentification et d'Autorisation

* [Technologies utilisées](#technologies-utilisées)
    * [Keycloak](#keycloak)
    * [PostgreSQL](#postgresql)
* [Scripts de Gestion](#scripts-de-gestion)
    * [Les Scripts Run / Down](#les-scripts-run--down)
    * [Script wait-for-it.sh](#script-wait-for-itsh)
    * [En cas de problème d'accès](#)
* [Backup postgreSQL](#backup-postgresql)
* [Gestion des realm role / user dans Keycloak](#gestion-des-realm-role--user-dans-keycloak)
* [Configuration des variables](#configuration-des-variables)
    * [Paramètres généraux](#paramètres-généraux)
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

## Scripts de Gestion

Le projet fournit deux scripts simples pour gérer les containers Docker de Keycloak et PostgreSQL. Ces scripts
permettent de démarrer, arrêter et supprimer les volumes associés.

### Les Scripts Run / Down

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

### Script wait-for-it.sh

Même avec un healthcheck, il peut y avoir des cas où PostgreSQL est en cours de démarrage mais n'est pas encore prêt.
L'utilisation d'un script comme wait-for-it.sh peut ajouter une couche supplémentaire de fiabilité.

Télécharger le Script wait-for-it.sh :

```shell
curl -o wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
chmod +x wait-for-it.sh
```

---

## En cas de problème d'accès

Si vous perdez à nouveau l'accès à votre compte administrateur Keycloak, vous pouvez le recréer facilement en utilisant
cette commande depuis le terminal du conteneur :

````shell
# Ce connecter au conteneur
 docker exec -ti  keycloak bash
````

````shell
# La commande de réinitialisation
/opt/keycloak/bin/kc.sh bootstrap-admin user
````

Cette commande vous demandera de saisir un nom d'utilisateur et un mot de passe, puis créera un utilisateur
administrateur temporaire avec les privilèges complets dans le realm master.

C'est la méthode officielle et la plus sûre pour récupérer l'accès administrateur, beaucoup plus propre que de manipuler
directement la base de données.

---

## Backup postgreSQL

Commande docker pour faire un backup de la base de données `kc_db` avec l'utilisateur `max_admin` vers le dossier
`./postgres_home/backups/` dans le fichier sql `backup-Test.sql`

```shell
docker exec postgres-kc pg_dump -U max_admin  kc_db > ./postgres_home/backups/backup-Test.sql
```

---

## Gestion des realm role / user dans Keycloak

Permet de faire un export des données du realm cible. Cette commande permet notamment d'exporter les utilisateurs est
leur rôle.

Commande pour keycloak en version supérieure à 17

```shell
/opt/keycloak/bin/kc.sh export --realm=ghoverblog --file=/opt/keycloak/data/import/ghoverblog-realm.json --users=same_file
```

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
# commande
docker cp keycloak:/tmp/[fichier de réception] ./[fichier cible]
# exemple
docker cp keycloak:/tmp/ghoverblog-realm.json ./ghoverblog-realm.json
docker cp keycloak:/tmp/ghoverblog-users-0.json ./ghoverblog-users-0.json
```

---

### configuration des variables

Ce fichier détaille les différentes variables utilisées dans une configuration Keycloak.

#### Paramètres généraux

- **KC_HOSTNAME** : `${HOSTNAME_PROD}`  
  Le domaine attendu pour Keycloak.

- **KC_HOSTNAME_STRICT** : `true`  
  Correspond à `--hostname-strict=true`. Keycloak vérifie que toutes les requêtes entrantes utilisent le nom d'hôte
  défini explicitement.

- **KC_SPI_HOSTNAME_URL** : `${KEYCLOAK_FRONTEND_URL_PROD}`  
  Correspond à `--spi-hostname-url`. Définit l'URL externe utilisée par Keycloak.

- **KC_COOKIE_SAME_SITE** : `None`  
  Configure la stratégie `SameSite` des cookies (None, Lax ou Strict).

- **KC_COOKIE_SECURE** : `true`  
  Indique que les cookies sécurisés sont gérés par un proxy comme Nginx.

- **KC_PROXY** : `edge`  
  Signale que Keycloak est derrière un proxy.

#### Logs

- **KC_LOG_CONSOLE_LEVEL** : `info`  
  Définit le niveau de journalisation de la console (info, debug, warn, error).

- **KC_LOG_CONSOLE_COLOR** : `true`  
  Active la coloration des logs dans la console.

#### Métriques et santé

- **KC_HEALTH_ENABLED** : `true`  
  Active les endpoints de santé pour le monitoring.

- **KC_METRICS_ENABLED** : `true`  
  Active les métriques pour la surveillance des performances.

#### Configuration de la base de données

- **KC_DB** : `postgres`  
  Définit le type de base de données utilisé (postgres, mysql, etc.).

- **KC_DB_URL** : `jdbc:postgresql://postgres:5432/kc_db`  
  URL de connexion pour la base de données PostgreSQL.

- **KC_DB_USERNAME** : `${USER_BD}`  
  Nom d’utilisateur pour la connexion à la base de données.

- **KC_DB_PASSWORD** : `${PSW_DB}`  
  Mot de passe pour la connexion à la base de données.

#### Utilisateur administrateur temporaire

- **KC_BOOTSTRAP_ADMIN_USERNAME** : `${KEYCLOAK_ADMIN}`  
  Nom d'utilisateur pour l'initialisation de l’administrateur.

- **KC_BOOTSTRAP_ADMIN_PASSWORD** : `${KEYCLOAK_ADMIN_PASSWORD}`  
  Mot de passe pour l'initialisation de l’administrateur.

#### Configuration de la JVM

- **JAVA_OPTS_APPEND** : `"-Dkeycloak.someOption=value -XX:MaxRAMPercentage=65"`  
  Ajoute des options à la JVM pour ajuster ses performances ou config

#### Tableau de comparaison Dev vs Prod

| **Paramètre**          | **Dev**                        | **Prod**                        |
|------------------------|--------------------------------|---------------------------------|
| `KC_HOSTNAME_STRICT`   | `false`                        | `true`                          |
| `KC_HOSTNAME`          | `${KEYCLOAK_FRONTEND_URL_DEV}` | `${KEYCLOAK_FRONTEND_URL_PROD}` |
| `KC_COOKIE_SECURE`     | `false`                        | `true`                          |
| `KC_PROXY`             | _(non défini)_                 | `edge`                          |
| `KC_LOG_CONSOLE_LEVEL` | `info`                         | `info`                          |
| `KC_HEALTH_ENABLED`    | `true`                         | `true`                          |
| `KC_METRICS_ENABLED`   | `true`                         | `true`                          |
| `JAVA_OPTS_APPEND`     | `"-XX:MaxRAMPercentage=65"`    | `"-XX:MaxRAMPercentage=75"`     |

#### Option configure la JVM

1. -XX:MaxRAMPercentage=75

Cette option configure la JVM pour limiter l'utilisation maximale de la mémoire à un pourcentage spécifique de la
mémoire physique disponible. Dans cet exemple, la JVM utilisera jusqu'à 75 % de la mémoire physique totale. Cette
approche est particulièrement utile dans des environnements conteneurisés, comme Docker, où la gestion de la mémoire est
cruciale.

Pour plus de détails, vous pouvez consulter la documentation officielle de la JVM concernant les options de gestion de
la mémoire.

2. -Dkeycloak.someOption=value

Cette syntaxe définit une propriété système pour la JVM, accessible via System.getProperty("keycloak.someOption") dans
le code Java. Dans le contexte de Keycloak, cela permet de configurer des paramètres spécifiques en définissant des
propriétés système. Par exemple, pour activer une fonctionnalité ou définir un comportement particulier, vous pouvez
utiliser cette méthode.

Pour plus d'information sur les variables pour la JVM voici une liste de site

- [Keycloak JVM Options](https://www.keycloak.org/keycloak-benchmark/kubernetes-guide/latest/running/jvm/jvm_options)
- [Eclipse OpenJ9](https://eclipse.dev/openj9/docs/xxinitialrampercentage/)
- [Best practices for JVM heap size configuration](https://www.alibabacloud.com/help/en/sae/serverless-app-engine-classic/use-cases/best-practices-for-jvm-heap-size-configuration)
- [Baeldung: Difference Between Xmx and MaxRAM JVM Parameters](https://www.baeldung.com/java-xmx-vs-maxram-jvm)
- [Baeldung: Guide to the Most Important JVM Parameters](https://www.baeldung.com/jvm-parameters)

---

## Structure des fichiers

Le projet contient les fichiers suivants :

### `ghoverblog-realm.json`

Ce fichier contient la configuration complète d'un **realm** nommé `ghoverblog`. Un **realm** dans Keycloak est un
espace de gestion des utilisateurs, des clients (applications), des rôles et des paramètres d'authentification.

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

Ces fichiers peuvent être importés directement dans Keycloak pour initialiser la configuration et les utilisateurs
nécessaires à votre projet.


---

### Gestion des Themes Keycloak

Exemple de structure

```plaintext
ghoverblog/
├── login/
│   ├── theme.properties
│   ├── templates/
│   │   ├── login.ftl
│   │   ├── register.ftl
│   │   └── (autres fichiers .ftl)
│   └── resources/
│       ├── css/
│       │   └── login.css
│       ├── img/
│       │   └── logo.png
├── account/
│   ├── theme.properties
│   ├── templates/
│   │   ├── account.ftl
│   │   └── (autres fichiers)
│   └── resources/
│       ├── css/
│       │   └── account.css
│       ├── img/
│       │   └── profile-picture.png
├── admin/
│   ├── theme.properties
│   ├── templates/
│   │   └── admin.ftl
│   └── resources/
│       ├── css/
│       └── js/
├── email/
│   ├── theme.properties
│   └── templates/
│       ├── email-verification.ftl
│       └── (autres fichiers d'email)
```

- `Structure et Logique des Thèmes`
  Un thème Keycloak est organisé en sous-dossiers spécifiques pour chaque domaine d’application. Keycloak détecte
  automatiquement ces domaines grâce à leur nom de dossier. Les noms de ces dossiers sont standardisés dans Keycloak :

`login` : Contient les templates et ressources pour les pages de connexion.
`account` : Pour le portail "Mon compte".
`admin` : Pour l'interface d'administration.
`email` : Pour les modèles d'email personnalisés.

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