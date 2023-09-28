import json
import datetime
import os
import logging
from Dossier import Dossier
from SaveDb import SaveDb

"""
Ce programme est utilisé pour la création de dossier selon une structure de dossier 
prédéfinit. Il permet donc de créer les dossiers d'archive de schema de bases de données 
via le fichier externe Json.

Pour active le mode dev , il suffit de modifier la variable mode a False
Ne pas oublier de la remettre a True pour le mode Prod
"""
# False mode dev / True mode prod
mode = True
path_dev = f"/Informatique/Projet/Blog/docker/docker-keycloak-postgres/postgres_home/backups"
path_log_dev = f"/Informatique/Projet/Blog/docker/docker-keycloak-postgres/postgres_home/home/logs"

liste_access: list = []
liste_db: list = []

json_file: str = "/home/maxime/script/DB_config.json"  # Spécifiez le chemin vers votre fichier JSON
DATE_FORMAT = "%Y-%m-%d_%H-%M-%S"  # Format de nom de fichier de sauvegarde
path_log = "/home/maxime/logs"  # le chemin d'accès au log
file_log = "data.log"  # le fichier de logs


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
                for index in range(len(db)):
                    liste_db.append(db[index])

                access = data.get("databases").get("access")
                for index in range(len(access)):
                    liste_access.append(access[index])

            else:
                logger.warning("Le fichier JSON est vide.")

    except FileNotFoundError:
        logger.exception(f"Le fichier JSON '{js}' n'existe pas.")
    except json.JSONDecodeError as e:
        logger.exception(f"Erreur lors de la lecture du fichier JSON : {e}")


def log():
    """
    Initialisation du logger
    """
    # Fait le choix du type variable en fonction du mode de développement
    path: str = ""
    if mode:
        path = path_log
    else:
        path = path_log_dev

    # création des répertoires de logs
    if not os.path.exists(path):
        os.makedirs(path)

    # création du fichier de log
    logs_file = f"{path}/{file_log}"
    if not os.path.exists(f"{logs_file}"):
        open(logs_file, "w").close()

    # Configuration du logger
    logging.basicConfig(filename=logs_file, filemode='a', level=logging.INFO,
                        format='%(asctime)s - %(levelname)s - %(message)s')


# point d'entre script
if __name__ == "__main__":
    # Initialisation des logs
    log()
    logger = logging.getLogger("main.py")

    logger.info("*" * 20)
    logger.info("Debut programme")

    logger.info("Deserialization du fichier json")
    get_data(f"{json_file}")

    file = Dossier(path_dev=path_dev, mode_actif=mode)
    save = SaveDb()

    logger.info("Création des dossiers pour chaque bases de données et pour chaque schemas ")
    for i in range(len(liste_db)):
        for j in range(len(liste_db[i]["LISTE_SCHEMA"])):
            logger.info(f'Le nom de la DB {liste_db[i]["DB_NAME"]} '
                        f'et le nom du schema {liste_db[i]["LISTE_SCHEMA"][j]["SCHEMA"]}')

            liste_db[i]["LISTE_SCHEMA"][j]["PATH_HISTORY"] = (
                file.mkdir_history(db_name=liste_db[i]["DB_NAME"], db_schema=liste_db[i]["LISTE_SCHEMA"][j]["SCHEMA"]))

            # Sauvegarde des schemas de BD
            save.pg_dump(db_name=liste_db[i]["DB_NAME"],
                         db_schema=liste_db[i]["LISTE_SCHEMA"][j]["SCHEMA"],
                         db_user=liste_access[0]["DB_USER"],
                         path_history=liste_db[i]["LISTE_SCHEMA"][j]["PATH_HISTORY"],
                         path_init=liste_db[i]["LISTE_SCHEMA"][j]["POSTGRES_INIT"])

    logger.info("Fin du programme ")
    logger.info("*" * 20)
