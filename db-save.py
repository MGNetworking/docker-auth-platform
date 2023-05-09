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
BACKUP_DIR = "./data-save"
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"

# Génération du nom de fichier pour la sauvegarde
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
filename = f"{DB_NAME}_backup_{timestamp}.sql"

# Commande de sauvegarde de la base de données
backup_command = f"pg_dump --dbname=postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME} > {os.path.join(BACKUP_DIR, filename)}"

# Exécution de la commande de sauvegarde
subprocess.call(backup_command, shell=True)

# Affichage d'un message de confirmation
print(f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès.")
