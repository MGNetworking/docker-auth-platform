# Ce script permet de créer une sauvegarde de la base de bonne ghoverblog
# Il créra un backup un drop de tout de toutes les tables via la mot clef : --clean

import subprocess
import datetime
import os

# Configuration des paramètres de la base de données
DB_HOST = "localhost"
DB_PORT = "5400"
DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_NAME = "ghoverblog"
DB_SCHEMA="ms_article"

# accès un fichier depuis extérieur du conteneur
BACKUP_DB = "./postgres_home/backups/ghoverblog"

# Path dans le conteneur
BACKUP_DIR_DB = "/var/backups/ghoverblog"
BACKUP_DIR_SCHEMA = "/docker-entrypoint-initdb.d"
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"

# Génération du nom de fichier pour la sauvegarde
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
backup_filename = f"{DB_NAME}_backup_{timestamp}.dump"
compressed_filename = f"{DB_NAME}_backup_{timestamp}.tar.gz"
backup_filename_SCHEMA = f"{DB_SCHEMA}_backup.sql.bak"

# Commande de sauvegarde de la base de données avec clean des anciennnes tables
backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -F c --clean -f {BACKUP_DIR_DB}/{backup_filename}"
print(f"1. Lancement de la sauvegarde de la base de données {DB_SCHEMA} avec processus de nettoyage des objets")
subprocess.run(backup_command, shell=True)

# Compression du fichier de sauvegarde
print("2. Compression du fichier de sauvegarde (.tar.gz)")
compress_command = f"tar -czvf {BACKUP_DB}/{compressed_filename} -C {BACKUP_DB} {backup_filename}"
subprocess.run(compress_command, shell=True)

# Suppression du fichier de sauvegarde non compressé
print("3. Suppression du fichier de sauvegarde non compressé")
os.remove(f"{BACKUP_DB}/{backup_filename}")

# Affichage d'un message de confirmation
print(f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès et compressée.")


# Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
# backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -n {DB_SCHEMA} -F p -f {BACKUP_SCHEMA}/{backup_filename_SCHEMA}"
backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -n {DB_SCHEMA} -F p -f {BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}"
print(f"4. Lancement de la sauvegarde du schema {DB_SCHEMA} dans la base de données kc_db")

try:
    subprocess.run(backup_command, shell=True, check=True)
    # Affichage d'un message de confirmation
    print(f"La sauvegarde du schema {DB_SCHEMA} a été créée avec succès ")

except subprocess.CalledProcessError as e:
    print("Message : "+str(e))

    if "No such file or directory" in str(e):
        print("Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant.")

    else:
        print("Une autre erreur s'est produite lors de la sauvegarde.")
