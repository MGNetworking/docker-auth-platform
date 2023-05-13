import os

DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_HOST = "localhost"
DB_PORT = "5400"
DB_NAME = "kc_db"
BACKUP_DIR = "./postgres_home/backups"
backup_filename = "kc_db_backup_2023-05-13_10-40-25.sql"

# construction de la commande de restauration
restore_cmd = f"pg_restore --dbname=postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME} \"{os.path.join(BACKUP_DIR, backup_filename)}\""
print(restore_cmd)

teste= "pg_restore --dbname=postgresql://max_admin:NzOgZsn29PewtEyQECEE@localhost:5400/kc_db ./postgres_home/backups/kc_db_backup_2023-05-13_10-40-25.sql"
print(teste)
#os.system(f"docker exec -it postgres-db bash -c '{teste}'")

# exécution de la commande de restauration dans le conteneur Docker
os.system(f"docker exec -it postgres-db bash -c '{restore_cmd}'")
