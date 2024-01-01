/*==============================================================*/
/* Script de restauration de base de données Keycloak => kc_db  */
/* Mise a jour: 24/05/2023                                      */
/*==============================================================*/

-- Création de la base de données kc_db
CREATE DATABASE kc_db
  WITH OWNER = max_admin
      ENCODING = 'UTF8';

-- Connection a base de données ghoverblog
\c kc_db

-- Restauration de la sauvegarde SQL
-- Ce fichier contient un Backup du schema kc_sh au format SQL
\i /docker-entrypoint-initdb.d/kc_sh_backup