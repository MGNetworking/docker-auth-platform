import logging
import subprocess
import datetime


class SaveDb:
    # Définir le logger en tant que variable de classe
    logger = logging.getLogger(__name__)

    def __init__(self):
        pass

    def pg_dump(self, db_user: str, db_name: str, db_schema: str, path_history: str, path_init: str):
        """
        Cette methode permet d'exécuter 2 type de sauvegarde :
        Une sauvegarde au format binaire compressé spécifique à PostgreSQL.
        Une sauvegarde au format SQL
        :param db_schema: le nom du schema de base de données.
        :param path_init: Le chemin vers le dossier de postgres : docker-entrypoint-initdb.d
        :param path_history: Le chemin vers le dossier de sauvegarde historique
        :param db_user: Le nom de la base de données
        :param db_name: Le nom de l'utilisateur
        :return:
        """

        SaveDb.logger.info("Obtention du mois et de l'année en cours")
        now = datetime.datetime.now()
        name_file_history = f'{db_schema}_{now.day}_{now.month}_{now.year}'

        # Sauvegarde au format d'archivage tar.gz (fichier binaire compressé)
        liste_cmd: list = [
            f"pg_dump -U {db_user} -d {db_name} -F t --clean -f {path_history}/{name_file_history}.tar.gz"]
        SaveDb.logger.info(f"Commande {liste_cmd[0]}")

        # Sauvegarde au format SQL
        liste_cmd.append(f"pg_dump -U {db_user} -d {db_name} -f {path_init}/{db_schema}_backup")
        SaveDb.logger.info(f"Commande {liste_cmd[1]}")

        try:
            for i in range(len(liste_cmd)):

                result = subprocess.run(liste_cmd[i], shell=True, check=True,
                                        stdout=subprocess.PIPE,
                                        stderr=subprocess.PIPE)

                standard_output1 = result.stdout.decode("utf-8")
                error_output1 = result.stderr.decode("utf-8")

                if error_output1:
                    SaveDb.logger.error("Une erreur a était générer pendant la création de la sauvegarde")
                    SaveDb.logger.error(error_output1)
                    SaveDb.logger.error(f"Commande en échec : {liste_cmd[i]}")
                else:
                    SaveDb.logger.info("Le dump était réaliser avec succès")
                    SaveDb.logger.info(f"Message : {standard_output1}")

        except subprocess.CalledProcessError as e:
            SaveDb.logger.exception(f"Une erreur s'est produite : {e}")
            SaveDb.logger.exception(f"Code de sortie : {e.returncode}")
