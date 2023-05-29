# Ce script permet de créer une sauvegarde de la base de bonne ghoverblog
# Il créra un backup un drop de tout de toutes les tables via la mot clef : --clean

import subprocess
import datetime
import os
import logging

# Configuration des paramètres de la base de données
DB_HOST = "localhost"
DB_PORT = "5400"
DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_NAME = "ghoverblog"
DB_SCHEMA="ms_article"

# Path dans le conteneur
BACKUP_DIR_SCHEMA = "/docker-entrypoint-initdb.d"
#DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"
DATE_FORMAT = "%d-%m-%Y_%H:%M:%S"

##########################################
# Gestion du dossier pour le mois en cours

# Obtention du mois et de l'année en cours
maintenant = datetime.datetime.now()
annee_en_cours = maintenant.year
mois_en_cours = maintenant.month

# Création du chemin d'accès au fichier pour la création du bachup DB
# Créer en fonction du mois en cours, accès depuis extérieur du conteneur
BACKUP_DB = f"./postgres_home/backups/ghoverblog/{mois_en_cours}_{annee_en_cours}"

# Créer en fonction du mois en cours, accès depuis intérieur du conteneur
BACKUP_DIR_DB = f"/var/backups/ghoverblog/{mois_en_cours}_{annee_en_cours}"

# Création du répertoire des logs s'il n'existe pas
os.makedirs(BACKUP_DB, exist_ok=True)

# Création de chemin du dossier pour les log
BACKUP_DB_LOG = f"{BACKUP_DB}/logfile.log"

# Création du fichier de log vide s'il n'existe pas
log_file = os.path.join(BACKUP_DB, "logfile.log")
if not os.path.exists(log_file):
    open(log_file, "w").close()


# Configuration du logger
logging.basicConfig(filename=BACKUP_DB_LOG , filemode='a', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Utilisation du logger pour les messages de log
logger = logging.getLogger()

logger.info(f"SAUVEGARDE DB : DEBUT #################")
print(f"SAUVEGARDE DB : DEBUT #################")
print(f"1er parti Backup Data Base {DB_NAME}")
logger.info(f"1er parti Bachup Data Base {DB_NAME}")


# Vérification et création du dossier si nécessaire
if not os.path.exists(BACKUP_DB):
    os.makedirs(BACKUP_DB)
    print(f"1. Dossier : {BACKUP_DB} à été créé avec succès.")
    logger.info(f"1. Dossier : {BACKUP_DB} à été créé avec succès.")

if os.path.exists(BACKUP_DB):
    print(f"1. Dossier : {BACKUP_DB} est présent")
    logger.info(f"1. Dossier : {BACKUP_DB} est présent")

# Génération du nom de fichier pour la sauvegarde
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
backup_filename = f"{DB_NAME}_backup_{timestamp}.dump"
compressed_filename = f"{DB_NAME}_backup_{timestamp}.tar.gz"
backup_filename_SCHEMA = f"{DB_SCHEMA}_backup.sql.bak"

# Commande de sauvegarde de la base de données avec clean des anciennnes tables
backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -F c --clean -f {BACKUP_DIR_DB}/{backup_filename}"
print(f"1. Lancement de la sauvegarde de la base de données {DB_SCHEMA} avec processus de nettoyage des objets")
logger.info(f"1. Lancement de la sauvegarde de la base de données {DB_SCHEMA} avec processus de nettoyage des objets")
subprocess.run(backup_command, shell=True)

# Compression du fichier de sauvegarde
print("2. Compression du fichier de sauvegarde (.tar.gz)")
logger.info("2. Compression du fichier de sauvegarde (.tar.gz)")
compress_command = f"tar -czvf {BACKUP_DB}/{compressed_filename} -C {BACKUP_DB} {backup_filename}"
subprocess.run(compress_command, shell=True)

# Suppression du fichier de sauvegarde non compressé
print("3. Suppression du fichier de sauvegarde non compressé")
logger.info("3. Suppression du fichier de sauvegarde non compressé")
os.remove(f"{BACKUP_DB}/{backup_filename}")

# Affichage d'un message de confirmation
print(f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès et compressée.")
logger.info(f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès et compressée.")


# Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
# backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -n {DB_SCHEMA} -F p -f {BACKUP_SCHEMA}/{backup_filename_SCHEMA}"
backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -n {DB_SCHEMA} -F p -f {BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}"
print(f"4. Lancement de la sauvegarde du schema {DB_SCHEMA} dans la base de données kc_db")
logger.info(f"4. Lancement de la sauvegarde du schema {DB_SCHEMA} dans la base de données kc_db")

try:
    subprocess.run(backup_command, shell=True, check=True)
    # Affichage d'un message de confirmation
    print(f"La sauvegarde du schema {DB_SCHEMA} a été créée avec succès ")
    logger.info(f"La sauvegarde du schema {DB_SCHEMA} a été créée avec succès ")

except subprocess.CalledProcessError as e:
    print("Message : "+str(e))
    logger.error(f"Message : {e}")

    if "No such file or directory" in str(e):
        print("Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant.")
        logger.error("Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant.")

    else:
        print("Une autre erreur s'est produite lors de la sauvegarde.")
        logger.error("Une autre erreur s'est produite lors de la sauvegarde.")


logger.info(f"SAUVEGARDE DB : FIN #################")
print(f"SAUVEGARDE DB : FIN #################")