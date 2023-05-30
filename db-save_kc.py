# Ce script permet de créer une sauvegarde de la base de bonne kc_db
# Il créra un backup de la base de données avec clean

import subprocess
import datetime
import os
import logging

##########################################
# Gestion des variables
# Configuration des paramètres de la base de données
DB_HOST = "localhost"
DB_PORT = "5400"
DB_USER = "max_admin"
DB_PASSWORD = "NzOgZsn29PewtEyQECEE"
DB_NAME = "kc_db"
DB_SCHEMA = "kc_sh"

# chemin d'accès au fichier depuis l'intérieur du conteneur
BACKUP_DIR_SCHEMA = "/docker-entrypoint-initdb.d"
DATE_FORMAT = "%d-%m-%Y_%H-%M-%S"

##########################################
# Gestion du dossier pour le mois en cours

# Obtention du mois et de l'année en cours
maintenant = datetime.datetime.now()
annee_en_cours = maintenant.year
mois_en_cours = maintenant.month

# Création du chemin d'accès au fichier pour la création du bachup DB
# Créer en fonction du mois en cours, accès depuis extérieur du conteneur
DIR_BACKUP = f"./postgres_home/backups/kc_db/{mois_en_cours}_{annee_en_cours}"

# Créer en fonction du mois en cours, accès depuis intérieur du conteneur
DIR_BACKUP_CONTENEUR = f"/var/backups/kc_db/{mois_en_cours}_{annee_en_cours}"

# Création du répertoire des logs s'il n'existe pas
os.makedirs(DIR_BACKUP, exist_ok=True)

# Création de chemin du dossier pour les log
BACKUP_DB_LOG = f"{DIR_BACKUP}/logfile.log"

# Création du fichier de log vide s'il n'existe pas
log_file = os.path.join(DIR_BACKUP, "logfile.log")
if not os.path.exists(log_file):
	open(log_file, "w").close()

# Configuration du logger
logging.basicConfig(filename=BACKUP_DB_LOG, filemode='a', level=logging.INFO,
					format='%(asctime)s - %(levelname)s - %(message)s')

# Utilisation du logger pour les messages de log
logger = logging.getLogger()

logger.info(f"SAUVEGARDE DB : DEBUT #################")
print(f"SAUVEGARDE DB : DEBUT #################")
print(f"1er parti Backup Data Base {DB_NAME}")
logger.info(f"1er parti Backup Data Base {DB_NAME}")

# Vérification et création du dossier si nécessaire
if os.path.exists(DIR_BACKUP):
	print(f"1. Dossier : {DIR_BACKUP} est présent")
	logger.info(f"1. Dossier : {DIR_BACKUP} est présent")
else:
	os.makedirs(DIR_BACKUP)
	print(f"1. Dossier : {DIR_BACKUP} à été créé avec succès.")
	logger.info(f"1. Dossier : {DIR_BACKUP}  à été  créé avec succès.")

# Génération des nom de fichier pour les sauvegardes
timestamp = datetime.datetime.now().strftime(DATE_FORMAT)
backup_filename_DB = f"{DB_NAME}_backup_{timestamp}.dump"
compressed_filename_DB = f"{DB_NAME}_backup_{timestamp}.tar.gz"
backup_filename_SCHEMA = f"{DB_SCHEMA}_backup.sql.bak"

try:

	# Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
	backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -F c --clean -f {DIR_BACKUP_CONTENEUR}/{backup_filename_DB}"
	print(f"2. Lancement de la sauvegarde de la base de données {DB_NAME} avec processus de nettoyage des objets")
	logger.info(f"2. Lancement de la sauvegarde de la base de données {DB_NAME} avec processus de nettoyage des objets")
	result = subprocess.run(backup_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

	standard_output1 = result.stdout.decode("utf-8")
	error_output1 = result.stderr.decode("utf-8")
	if error_output1:
		print("Une erreur a était générer pendant la création du dump ")
		print(error_output1)
		logger.error("Une erreur a était générer pendant la création du dump ")
		logger.error(error_output1)
	else:
		print(f"Le dump était réaliser avec succès")
		logger.info("Le dump était réaliser avec succès")
		logger.info(f"PATH : {DIR_BACKUP}/{backup_filename_DB}")

	# Compression du fichier de sauvegarde depuis l'extérieur du conteneur
	compress_command = f"tar -czvf {DIR_BACKUP}/{compressed_filename_DB} -C {DIR_BACKUP} {backup_filename_DB}"
	print("3. Compression du fichier de sauvegarde (.tar.gz)")
	logger.info("3. Compression du fichier de sauvegarde (.tar.gz)")
	result = subprocess.run(compress_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

	error_output = result.stderr.decode("utf-8")
	standard_output = result.stdout.decode("utf-8")
	if error_output:
		print("Une erreur a était générer pendant la création de l'archive ")
		print(error_output)
		logger.error("Une erreur a était générer pendant la création de l'archive  ")
		logger.error(error_output)
	else:
		print("l'archive à été réaliser avec succès")
		logger.info("l'archive était réaliser avec succès")
		logger.info(f"PATH : {DIR_BACKUP}/{compressed_filename_DB}")

	# Suppression du fichier de sauvegarde non compressé
	print("4. Suppression du fichier de sauvegarde non compressé (.dump)")
	logger.info("4. Suppression du fichier de sauvegarde non compressé (.dump)")
	extracedFile = f"{DIR_BACKUP}/{backup_filename_DB}"

	# Vérification de la suppression
	if os.path.exists(extracedFile):
		os.remove(extracedFile)
		logger.info(f"le dossier : {extracedFile} ")
	else:
		logger.error(f"Dossier : {extracedFile} n'existe pas ")

	# Affichage d'un message de confirmation
	print(f"La sauvegarde de la base de données {DB_NAME} dans un fichier compressée a été créée avec succès")
	logger.info(f"La sauvegarde de la base de données {DB_NAME} dans un fichier compressée a été créée avec succès")

except subprocess.CalledProcessError as e:
	print(f"Une erreur s'est produite lors d'une commande  : {e}")
	print(f"Code de sortie : {e.returncode}")

	logger.error(f"Une erreur s'est produite lors d'une commande  : {e}")
	logger.error(f"Code de sortie : {e.returncode}")

try:

	logger.info("")
	print("")
	print(f"2eme parti Backup Schema : {DB_SCHEMA}")
	logger.info(f"2eme parti Backup Schema : {DB_SCHEMA}")

	# Commande de sauvegarde de la base de données avec Exécution de la commande de sauvegarde
	backup_command = f"docker exec -t postgres-db pg_dump -U {DB_USER} -d {DB_NAME} -n {DB_SCHEMA} -F p -f {BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}"
	print(f"1. Lancement de la sauvegarde du schema {DB_SCHEMA} dans la base de données kc_db")
	logger.info(f"1. Lancement de la sauvegarde du schema {DB_SCHEMA} dans la base de données kc_db")

	result = subprocess.run(backup_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# Affichage d'un message de confirmation
	print(f"La sauvegarde du schema {DB_SCHEMA} a été créée avec succès ")
	logger.info(f"La sauvegarde du schema {DB_SCHEMA} a été créée avec succès")

	error_output = result.stderr.decode("utf-8")
	standard_output = result.stdout.decode("utf-8")

	if error_output:
		print("Une erreur a était générer pendant la création du backup SQL")
		print(error_output)
		logger.error("Une erreur a était générer pendant la création du backup SQL")
		logger.error(error_output)
	else:
		print("Le backup SQL à été réaliser avec succès")
		logger.info(f"Le backup SQL à été réaliser avec succès PATH : {BACKUP_DIR_SCHEMA}/{backup_filename_SCHEMA}")

except subprocess.CalledProcessError as e:
	print(f"Message : {e}")
	logger.error(f"Message : {e}")

	if "No such file or directory" in str(e):
		print("Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant.")
		logger.error("Une erreur s'est produite lors de la sauvegarde : fichier de sortie inexistant.")

	else:
		print("Une autre erreur s'est produite lors de la sauvegarde.")
		logger.error("Une autre erreur s'est produite lors de la sauvegarde.")

logger.info(f"SAUVEGARDE DB :  {DB_SCHEMA} FIN #################")
print(f"SAUVEGARDE DB : {DB_SCHEMA} FIN #################")
