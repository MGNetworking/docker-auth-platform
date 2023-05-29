import os
import subprocess
import psycopg2
import tarfile
import logging
import datetime
import shutil


# Format de nom de fichier de sauvegarde
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"
db_name = "kc_db"
db_schema = "kc_sh"
username = "max_admin"
password = "NzOgZsn29PewtEyQECEE"
port_Externe = "5400"


# Obtention du mois et de l'année en cours
maintenant = datetime.datetime.now()
annee_en_cours = maintenant.year
mois_en_cours = maintenant.month

# Chemin du répertoire contenant les sauvegardes
BACKUP_DB = f"backups/{db_name}/{mois_en_cours}_{annee_en_cours}"
backup_dir = os.path.join(os.getcwd(), "postgres_home", BACKUP_DB)

##### Gestion des logs
# Création de chemin du dossier pour les log
BACKUP_DB_LOG = f"{backup_dir}/logfile.log"

# Création du fichier de log vide s'il n'existe pas
log_file = os.path.join(backup_dir, "logfile.log")
if not os.path.exists(log_file):
    open(log_file, "w").close()

# Configuration du logger
logging.basicConfig(filename=BACKUP_DB_LOG , filemode='a', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Utilisation du logger pour les messages de log
logger = logging.getLogger()

print("1. Recherche du fichier de restauration le plus récent " )
logger.info("RESTAURATION : DEBUT #################")
logger.info(f"1. Recherche du fichier de restauration le plus récent pour la base de données {db_name} ")

# Récupérer le fichier de sauvegarde le plus récent
files = os.listdir(backup_dir)
files = [f for f in files if f.endswith(".tar.gz")]
files.sort(key=lambda x: os.path.getmtime(os.path.join(backup_dir, x)), reverse=True)

if not files:
    print("Erreur : Aucun fichier de sauvegarde trouvé. Fin du programme")
    logger.error(f"Erreur : Aucun fichier de sauvegarde trouvé. Fin du programme")
    exit()

latest_backup = files[0]
backup_path = os.path.join(backup_dir, latest_backup)

print("Fichier compresser restauration trouvé : " + latest_backup)
logger.info(f"Fichier compresser restauration trouvé : {latest_backup}")

# Extraire lde l'archive dans le fichier extracted
extract_dir = os.path.join(backup_dir, "extracted")
os.makedirs(extract_dir, exist_ok=True)

print("2. Extraction du fichier en cours ...")
logger.info("2. Extraction du fichier en cours ...")

try:
    with tarfile.open(backup_path, "r:gz") as tar:
        tar.extractall(extract_dir)
    print("L'archive à été extraite avec succès.")
    logger.info("L'archive à été extraite avec succès.")

    # création de la commande de restaurer la base de données
    command = [
        "docker", "exec", "-i", "postgres-db", "pg_restore",
        "--dbname=" + db_name, "--username=" + username,
        "--no-owner", "--no-privileges", "--clean", "--if-exists", "--no-acl"
    ]

    # vérification de l'archive
    dump_files = os.listdir(extract_dir)
    dump_files = [f for f in dump_files if f.endswith(".dump")]
    if not dump_files:
        print("Erreur : Aucun fichier de sauvegarde trouvé dans l'archive.")
        logger.error("Erreur : Aucun fichier de sauvegarde trouvé dans l'archive.")
        exit()

    dump_file = os.path.join(extract_dir, dump_files[0])
    print("Fichier de dump de restauration : " + dump_files[0])
    logger.info(f"Fichier de dump de restauration : {dump_files[0]}" )

    print("3. Restauration de la base de données en cours...")
    logger.info("3. Restauration de la base de données en cours...")
    subprocess.run(command, input=open(dump_file, 'rb').read(), check=True)
    print("4. Restauration terminée avec succès.")
    logger.info("4. Restauration terminée avec succès.")

    # suppression du dossier d'extraction
    print("5 Suppression du dossier d'extraction")
    logger.info("5. Suppression du dossier d'extraction")
    shutil.rmtree(f"{extract_dir}")
    logger.info("Dossier extracted supprimer ")

    # Vérification de la restauration
    conn = psycopg2.connect(dbname=db_name, user=username, password=password, host="localhost", port=port_Externe)
    cursor = conn.cursor()
    print("5. Vérification en cours ..." )
    logger.info("5. Vérification en cours ...")
    query = "SELECT count(*) FROM pg_tables WHERE schemaname = %s;"
    cursor.execute(query, (db_schema,))

    table_count = cursor.fetchone()[0]
    conn.close()

    if table_count > 0:
        print(f"La base de données {db_name} restaurée contient ses {table_count} tables.")
        logger.info(f"La base de données {db_name} restaurée contient ses {table_count} tables.")
    else:
        print(f"La base de données restaurée {table_count}table" )
        logger.info(f"La base de données restaurée {table_count} table")

except subprocess.CalledProcessError as e:
    print("Erreur lors de la restauration de la base de données.")
    print("Code d'erreur :", str(e.returncode))
    print("Message d'erreur :")
    print(e.stderr.decode())  # Afficher le message d'erreur complet de la sortie standard d'erreur (stderr)

    logger.error(f"Erreur lors de la restauration de la BD : {e.returncode}")
    logger.error(e.stderr.decode())
except Exception as e:
    print("Une exception s'est produite lors de la restauration de la base de données :", str(e))
    logger.error(f"Une exception s'est produite lors de la restauration de la base de données : {e}")


logger.info("RESTAURATION : FIN #################")