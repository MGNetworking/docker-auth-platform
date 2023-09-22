import json
import datetime
import os
import logging

"""
Ce programme est utilisé pour la création de dossier selon une structure de dossier 
prédéfinit. Il permet donc de créer les dossiers d'archive de schema de bases de données 
via le fichier externe Json.

Pour active le mode dev , il suffit de 
"""
mode = True  # False mode dev /True mode prod
path_dev = f"/Informatique/Projet/Blog/docker/docker-keycloak-postgres/python/"

liste_access: list = []
liste_db: list = []

# json_file: str = "/home/maxime/script/DB_config.json"  # Spécifiez le chemin vers votre fichier JSON
json_file: str = "DB_config.json"  # Spécifiez le chemin vers votre fichier JSON
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"  # Format de nom de fichier de sauvegarde
path_log = "/home/maxime/logs"  # le chemin d'accès au log
file_log = "logs_folder_creation.log"  # le fichier de logs


def get_data(js: str):
    """
    Cette fonction permet de mettre à jour les données provenant du fichier json.
    :param js:Type (str) : Le fichier Json de configuration.
    """

    try:
        # Ouvrez le fichier JSON en mode lecture
        with open(js, "r") as file:
            # Lisez le contenu du fichier
            json_content = file.read()

            # Vérifiez si le fichier est vide ou non
            if json_content:

                # Chargez le contenu JSON en tant que liste de dictionnaires Python
                data: dict = json.loads(json_content)

                db = data.get("databases").get("db")
                for i in range(len(db)):
                    liste_db.append(db[i])

                access = data.get("databases").get("access")
                for i in range(len(access)):
                    liste_access.append(access[i])

            else:
                logger.warning("Le fichier JSON est vide.")

    except FileNotFoundError:
        logger.exception(f"Le fichier JSON '{js}' n'existe pas.")
    except json.JSONDecodeError as e:
        logger.exception(f"Erreur lors de la lecture du fichier JSON : {e}")


def log(mode_actif: bool):
    """
    Initialisation du logger
    :param mode_actif: false mode dev et true mode prod
    """
    path: str = ""
    if mode_actif:
        path = path_log
    else:
        path = path_dev

    # création des répertoires de logs
    if not os.path.exists(path):
        os.makedirs(path)

    # création du fichier de log
    file = f"{path}/{file_log}"
    if not os.path.exists(f"{file}"):
        open(file, "w").close()

    # Configuration du logger
    logging.basicConfig(filename=file, filemode='a', level=logging.INFO,
                        format='%(asctime)s - %(levelname)s - %(message)s')


def mkdir_history(db_name: str, db_schema: str, mode_actif: bool):
    """
    Initialise les repertoires d'accueil des fichiers historique de sauvegarde
    :param mode_actif: false mode dev et true mode prod
    :param db_name: Le nom de la base de données
    :param db_schema: Le nom du schéma
    """

    logger.info("Obtention du mois et de l'année en cours")
    now = datetime.datetime.now()
    current_year = now.year
    current_month = now.month

    logger.info("Créer des repertoires historique")
    logger.info(f"pour la schema {db_name} sur la base de données {db_name}")

    if mode_actif:
        path_hist = f"/var/backups/{db_name}/{db_schema}/year_{current_year}/month_{current_month}"
    else:
        path_hist = f"{path_dev}/{db_name}/{db_schema}/year_{current_year}/month_{current_month}"

    logger.info(f"path_hist{path_hist} ")

    if not os.path.exists(path_hist):
        os.makedirs(path_hist)


# point d'entre script
if __name__ == "__main__":
    log(mode)
    logger = logging.getLogger("folder_creation.py")

    logger.info("*" * 20)
    logger.info("Debut programme")
    # print("Debut programme")

    # Deserialization du fichier json
    get_data(f"{json_file}")

    # création des dossiers pour chaque base schema de bases de données
    for i in range(len(liste_db)):
        # print(f"liste_db : {liste_db[i]}")
        mkdir_history(db_name=liste_db[i]["DB_NAME"], db_schema=liste_db[i]["DB_SCHEMA"], mode_actif=mode)

    logger.info("Fin du programme ")
    logger.info("*" * 20)
