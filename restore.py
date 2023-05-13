import os

DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_HOST = "localhost"
DB_PORT = "5400"
DB_NAME = "kc_db"
BACKUP_DIR = "${PWD}/postgres_home/backups"
backup_filename = "kc_db_backup_2023-05-13_13-19-16.sql"

# construction de la commande de restauration
restore_cmd = f"pg_restore --dbname=postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME} \"{os.path.join(BACKUP_DIR, backup_filename)}\""
print(restore_cmd)

# exécution de la commande de restauration dans le conteneur Docker
os.system(f"docker exec -it postgres-db bash -c '{restore_cmd}'")
