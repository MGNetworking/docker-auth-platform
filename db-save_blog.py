import subprocess
import datetime
import os

# Configuration des paramètres de la base de données
DB_HOST = "localhost"
DB_PORT = "5400"
DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_NAME = "ghoverblog"

# Configuration des paramètres de la sauvegarde
BACKUP_DIR_host = "./postgres_home/backups"
# Path dans le conteneur
BACKUP_DIR = "/var/backups"
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"

# Génération du nom de fichier pour la sauvegarde
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
backup_filename = f"{DB_NAME}_backup_{timestamp}.dump"
compressed_filename = f"{DB_NAME}_backup_{timestamp}.tar.gz"

# Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -F c --clean -f {BACKUP_DIR}/{backup_filename}"
print("Lancement de la sauvegarde ...")
subprocess.run(backup_command, shell=True)

# Compression du fichier de sauvegarde
print("Compression du fichier de sauvegarde")
compress_command = f"tar -czvf {BACKUP_DIR_host}/{compressed_filename} -C {BACKUP_DIR_host} {backup_filename}"
subprocess.run(compress_command, shell=True)

# Suppression du fichier de sauvegarde non compressé
print("Suppression du fichier de sauvegarde non compressé")
os.remove(f"{BACKUP_DIR_host}/{backup_filename}")

# Affichage d'un message de confirmation
print(f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès et compressée.")
