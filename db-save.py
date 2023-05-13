import subprocess
import datetime
import os

# Configuration des paramètres de la base de données
DB_HOST = "localhost"
DB_PORT = "5400"
DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_NAME = "kc_db"

# Configuration des paramètres de la sauvegarde
BACKUP_DIR = "./postgres_home/backups"
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"

# Génération du nom de fichier pour la sauvegarde
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
backup_filename = f"{DB_NAME}_backup_{timestamp}.sql"

# Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
result = subprocess.run(f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -c > {BACKUP_DIR}/{backup_filename}", shell=True)


# Affichage d'un message de confirmation
print(f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès.")
