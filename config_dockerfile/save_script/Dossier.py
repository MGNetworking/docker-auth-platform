import datetime
import logging
import os
import sys


class Dossier:
    # Définir le logger en tant que variable de classe
    logger = logging.getLogger(__name__)

    def __init__(self, path_dev: str, mode_actif: bool):
        self.path_dev = path_dev  # le chemin d'accès au dossier
        self.mode_actif = mode_actif  # mode dev = False et mode prod = True

    def mkdir_history(self, db_name: str, db_schema: str):
        """
        Initialise les repertoires d'accueil des fichiers historique de sauvegarde
        :param db_name: Le nom de la base de données
        :param db_schema: Le nom du schéma
        :return: Le chemin vers le dossier historique du mois courant.
        """

        Dossier.logger.info("Obtention du mois et de l'année en cours")
        now = datetime.datetime.now()
        current_year = now.year
        current_month = now.month

        Dossier.logger.info("Créer des repertoires historique")
        Dossier.logger.info(f"pour la schema {db_name} sur la base de données {db_schema}")

        if self.mode_actif:
            path_hist = f"/var/backups/{db_name}/{db_schema}/year_{current_year}/month_{current_month}"
        else:
            path_hist = f"{self.path_dev}/{db_name}/{db_schema}/year_{current_year}/month_{current_month}"

        Dossier.logger.info(f"path_hist => {path_hist} ")

        try:
            if not os.path.exists(path_hist):
                os.makedirs(path_hist)
        except OSError as e:
            Dossier.logger.exception(f"Vous n'avez pas les droits sur le dossier : {path_hist} ")
            sys.exit(1)

        return path_hist
