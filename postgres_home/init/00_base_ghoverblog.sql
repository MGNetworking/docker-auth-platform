/*==============================================================*/
/* Script de restauration de base de données Keycloak => kc_db  */
/* Mise a jour: 24/05/2023                                      */
/*==============================================================*/

/* Création du rôle max_admin s'il n'existe pas déjà */
DO
$$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'max_admin') THEN
        CREATE ROLE max_admin WITH LOGIN PASSWORD 'your_password';
        GRANT ALL PRIVILEGES ON DATABASE ghoverblog TO max_admin;
    END IF;
END
$$;

-- Création de la base de données kc_db
CREATE DATABASE ghoverblog
  WITH OWNER = max_admin
      ENCODING = 'UTF8';

-- Connection a base de données ghoverblog
\c ghoverblog

-- Restauration de la sauvegarde SQL
-- Ce fichier contient un Backup du schema ms_article au format SQL
\i /docker-entrypoint-initdb.d/ms_article_backup.sql