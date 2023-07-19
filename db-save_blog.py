# Ce script permet de créer une sauvegarde de la base de bonne ghoverblog
# Il créra un backup un drop de tout de toutes les tables via la mot clef : --clean

import subprocess
import datetime
import os
import logging
import sys

##########################################
# Gestion des variables
# Configuration des paramètres de la base de données
DB_HOST = "localhost"
DB_PORT = "5400"
DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_NAME = "ghoverblog"
DB_SCHEMA = "ms_article"

# chemin d'accès au fichier depuis l'intérieur du conteneur
BACKUP_DIR_SCHEMA = "/docker-entrypoint-initdb.d"
# DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"
DATE_FORMAT = "%d-%m-%Y_%H:%M:%S"

##########################################
# Gestion du dossier pour le mois en cours

# Obtention du mois et de l'année en cours
maintenant = datetime.datetime.now()
annee_en_cours = maintenant.year
mois_en_cours = maintenant.month

# Obtenez le chemin absolu du dossier actuel du script (basé sur script lui même)
dossier_actuel = os.path.dirname(os.path.abspath(__file__))

# Construisez le chemin relatif du fichier que vous souhaitez accéder
BACKUP_DB = os.path.join(dossier_actuel, 'backups/ghoverblog', f"{mois_en_cours}_{annee_en_cours}")

# Création du chemin d'accès au fichier pour la création du bachup DB
# Créer en fonction du mois en cours, accès depuis extérieur du conteneur
# BACKUP_DB = f"/home/max/Documents/projet/teste/docker-keycloak-postgres/postgres_home/backups/ghoverblog/{mois_en_cours}_{annee_en_cours}"

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
logging.basicConfig(filename=BACKUP_DB_LOG, filemode='a', level=logging.INFO,
                    format='%(asctime)s - %(levelname)s - %(message)s')

# Utilisation du logger pour les messages de log
logger = logging.getLogger()

message = f"SAUVEGARDE DB : DEBUT #################"
logger.info(message)
print(message)

message = f"1er parti Backup Data Base {DB_NAME}"
print(message)
logger.info(message)

# Vérification et création du dossier si nécessaire
if os.path.exists(BACKUP_DB):
    message = f"1. Dossier : {BACKUP_DB} est présent"
    print(message)
    logger.info(message)
else:
    os.makedirs(BACKUP_DB)
    message = f"1. Dossier : {BACKUP_DB} à été créé avec succès."
    print(message)
    logger.info(message)

# Génération du nom de fichier pour la sauvegarde
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
backup_filename_DB = f"{DB_NAME}_backup_{timestamp}.dump"
compressed_filename_DB = f"{DB_NAME}_backup_{timestamp}.tar.gz"
backup_filename_SCHEMA = f"{DB_SCHEMA}_backup.sql.bak"

try:
    # Commande de sauvegarde de la base de données avec clean des anciennnes tables
    backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -F c --clean -f {BACKUP_DIR_DB}/{backup_filename_DB}"
    message = f"2. Lancement de la sauvegarde de la base de données {DB_SCHEMA} avec processus de nettoyage des objets"
    print(message)
    logger.info(message)
    result = subprocess.run(backup_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    standard_output = result.stdout.decode("utf-8")
    error_output = result.stderr.decode("utf-8")
    if error_output:
        message = "Une erreur a était générer pendant la création du dump "
        print(message)
        print(error_output)
        logger.error(message)
        logger.error(error_output)
    else:
        message = f"Le dump était réaliser avec succès"
        print(message)
        logger.info(message)
        logger.info(f"PATH : {BACKUP_DB}/{backup_filename_DB}")

    # Compression du fichier de sauvegarde
    compress_command = f"tar -czvf {BACKUP_DB}/{compressed_filename_DB} -C {BACKUP_DB} {backup_filename_DB}"
    message = "3. Compression du fichier de sauvegarde (.tar.gz)"
    print(message)
    logger.info(message)
    result = subprocess.run(compress_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    error_output = result.stderr.decode("utf-8")
    standard_output = result.stdout.decode("utf-8")
    if error_output:
        message = "Une erreur a était générer pendant la création de l'archive "
        print(message)
        print(error_output)
        logger.error(message)
        logger.error(error_output)
    else:
        message = "l'archive à été réaliser avec succès"
        print(message)
        logger.info(message)
        logger.info(f"PATH : {BACKUP_DB}/{compressed_filename_DB}")

    # Suppression du fichier de sauvegarde non compressé
    message = "4. Suppression du fichier de sauvegarde non compressé"
    print(message)
    logger.info(message)
    extracedFile = f"{BACKUP_DB}/{backup_filename_DB}"

    # Vérification de la suppression
    if os.path.exists(extracedFile):
        os.remove(extracedFile)
        logger.info(f"le dossier : {extracedFile} ")
    else:
        logger.error(f"Dossier : {extracedFile} n'existe pas ")

    # Affichage d'un message de confirmation
    message = f"La sauvegarde de la base de données {DB_NAME} a été créée avec succès et compressée."
    print(message)
    logger.info(message)


except subprocess.CalledProcessError as e:
    print(f"Message : {e}")
    logger.error(f"Message : {e}")

    if "No such file or directory" in str(e):
        message = "Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant."
        print(message)
        logger.error(message)
        # Quittez le programme avec un code de sortie non nul (1)
        sys.exit(1)

    else:
        message = "Une autre erreur s'est produite lors de la sauvegarde."
        print(message)
        logger.error(message)
        # Quittez le programme avec un code de sortie non nul (1)
        sys.exit(1)

try:

    logger.info("")
    print("")
    message = f"2eme parti Backup Schema : {DB_SCHEMA}"
    print(message)
    logger.info(message)

    # Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
    backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -n {DB_SCHEMA} -F p -f {BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}"
    message = f"4. Lancement de la sauvegarde du schema {DB_SCHEMA} dans la base de données kc_db"
    print(message)
    logger.info(message)

    # Suppression du fichier de sauvegarde existant (s'il existe)
    if os.path.exists(f"{BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}"):
        os.remove(f"{BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}")

    result = subprocess.run(backup_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    # Affichage d'un message de confirmation
    message = f"La sauvegarde du schema {DB_SCHEMA} a été créée avec succès "
    print(message)
    logger.info(message)

    error_output = result.stderr.decode("utf-8")
    standard_output = result.stdout.decode("utf-8")

    if error_output:
        message = "Une erreur a était générer pendant la création du backup SQL"
        print(message)
        print(error_output)
        logger.error(message)
        logger.error(error_output)
    else:
        message = f"Le backup SQL à été réaliser avec succès PATH : {BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}"
        print(message)
        logger.info(message)

except subprocess.CalledProcessError as e:
    print(f"Message : {e}")
    logger.error(f"Message : {e}")

    if "No such file or directory" in str(e):
        message = "Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant."
        print(message)
        logger.error(message)

    else:
        message = "Une autre erreur s'est produite lors de la sauvegarde."
        print(message)
        logger.error(message)

message = f"SAUVEGARDE DB :  {DB_SCHEMA} FIN #################"
logger.info(message)
print(message)
