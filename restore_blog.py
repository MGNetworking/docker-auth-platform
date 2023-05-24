import os
import subprocess
import psycopg2
import tarfile

from datetime import datetime

# Chemin du répertoire contenant les sauvegardes
backup_dir = os.path.join(os.getcwd(), "postgres_home", "backups")

# Format de nom de fichier de sauvegarde
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"
db_name = "kc_db"
password = "NzOgZsn29PewtEyQECEE"


print("Recherche du fichier de restauration" )

# Récupérer le fichier de sauvegarde le plus récent
files = os.listdir(backup_dir)
files = [f for f in files if f.endswith(".tar.gz")]
files.sort(key=lambda x: os.path.getmtime(os.path.join(backup_dir, x)), reverse=True)

if not files:
    print("Aucun fichier de sauvegarde trouvé.")
    exit()

latest_backup = files[0]
backup_path = os.path.join(backup_dir, latest_backup)

print("Fichier compresser restauration trouvé : " + latest_backup)

# Extraire l'archive
extract_dir = os.path.join(backup_dir, "extracted")
os.makedirs(extract_dir, exist_ok=True)

print("Extraction du fichier en cours ...")

try:
    with tarfile.open(backup_path, "r:gz") as tar:
        tar.extractall(extract_dir)
    print("Archive extraite avec succès.")

    # création de la commande de restaurer la base de données
    command = [
        "docker", "exec", "-i", "postgres-db", "pg_restore",
        "--dbname=" + db_name, "--username=" + db_name,
        "--no-owner", "--no-privileges", "--clean", "--if-exists", "--no-acl"
    ]

    # vérification de l'archive
    dump_files = os.listdir(extract_dir)
    dump_files = [f for f in dump_files if f.endswith(".dump")]
    if not dump_files:
        print("Aucun fichier de sauvegarde trouvé dans l'archive.")
        exit()

    dump_file = os.path.join(extract_dir, dump_files[0])

    print("Fichier de dump de restauration : " + dump_files[0])

    print("Restauration de la base de données en cours...")
    subprocess.run(command, input=open(dump_file, 'rb').read(), check=True)
    print("Restauration terminée avec succès.")

    # Vérification de la restauration
    conn = psycopg2.connect(dbname="kc_db", user="kc_db", password="NzOgZsn29PewtEyQECEE", host="localhost", port="5400")
    cursor = conn.cursor()
    print("Vérification en cours ..." )
    cursor.execute("SELECT count(*) FROM pg_tables WHERE schemaname='public';")
    table_count = cursor.fetchone()[0]
    conn.close()

    if table_count > 0:
        print("La base de données restaurée contient ses " + str(table_count) + " tables.")
    else:
        print("La base de données restaurée est vide.")

except subprocess.CalledProcessError as e:
    print("Erreur lors de la restauration de la base de données.")
    print("Code d'erreur :", str(e.returncode))
    print("Message d'erreur :")
    print(e.stderr.decode())  # Afficher le message d'erreur complet de la sortie standard d'erreur (stderr)
except Exception as e:
    print("Une exception s'est produite lors de la restauration de la base de données :", str(e))
