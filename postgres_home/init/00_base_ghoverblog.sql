/*==============================================================*/
/* Script de restauration de base de données Keycloak => kc_db  */
/* Mise a jour: 24/05/2023                                      */
/*==============================================================*/

-- Création de la base de données kc_db
CREATE DATABASE ghoverblog
  WITH OWNER = max_admin
      ENCODING = 'UTF8';

-- Connection a base de données ghoverblog
\c ghoverblog

-- Restauration de la sauvegarde SQL
-- Ce fichier contient un Backup du schema ms_article au format SQL
\i /docker-entrypoint-initdb.d/ms_article_backup