/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  09/01/2023                               */
/* Mise a jour: 23/05/2023                                      */
/*==============================================================*/

-- Création de la base de données ghoverblog
CREATE DATABASE ghoverblog
  WITH OWNER = max_admin
       ENCODING = 'UTF8';

-- connexion à base de données ghoverblog
\c ghoverblog

-- creation du schema ms_article
CREATE schema MS_ARTICLE ;

/*==============================================================*/
/* Table : ARTICLE                                              */
/*==============================================================*/
create table
    MS_ARTICLE.ARTICLE (
        ID_ARTICLE SERIAL not null,
        ID_USER VARCHAR(250) not null,
        ID_SECTION INTEGER not null,
        ID_SOURCE INTEGER null,
        ID_COMMENTAIRE INTEGER null,
        ID_NOTE INTEGER null,
        TITRE VARCHAR(100) not null,
        ARTICLE TEXT not null,
        DATE_CREATION timestamp not null DEFAULT current_timestamp,
        DATE_MAJ timestamp null,
        VUE INTEGER not null DEFAULT 0,
        VISIBILITER BOOL not null,
        ImgDescription VARCHAR(250) null,
        DESCRIPTION_ART TEXT not null,

        CONSTRAINT PK_ARTICLE primary key (ID_SECTION, ID_ARTICLE)
    );

/*==============================================================*/
/* Table : DOMAIN                                               */
/*==============================================================*/
create table
    MS_ARTICLE.DOMAIN (
        ID_DOMAIN SERIAL not null,
        DESCRIPTION VARCHAR(256) not null,
        constraint PK_DOMAIN primary key (ID_DOMAIN)
    );

/*==============================================================*/
/* Table : SECTION                                              */
/*==============================================================*/
create table
    MS_ARTICLE.SECTION (
        ID_SECTION SERIAL not null,
        ID_DOMAIN INTEGER not null,
        DESCRIPTION VARCHAR(256) not null,
        constraint PK_SECTION primary key (ID_SECTION)
    );

/*==============================================================*/
/* Gestion des clef  primaire et etrangers                      */
/*==============================================================*/
alter table MS_ARTICLE.ARTICLE add constraint FK_ARTICLE_SECTION foreign key (ID_SECTION)
references MS_ARTICLE.SECTION (ID_SECTION) on delete restrict on update restrict;

alter table MS_ARTICLE.SECTION add constraint FK_SECTION_DOMAIN foreign key (ID_DOMAIN)
references MS_ARTICLE.DOMAIN (ID_DOMAIN) on delete restrict on update restrict;



/*==============================================================*/
/* Création des trigger                                         */
/*==============================================================*/

/** La fonction : update article  **/
CREATE or REPLACE FUNCTION ms_article.update_article() RETURNS trigger AS $update_article$
    BEGIN

		IF (TG_OP = 'INSERT') THEN
			RAISE INFO 'INSERT in schéma ms_article table article';
		ELSIF (TG_OP = 'UPDATE') THEN
			RAISE INFO 'UPDATE in schéma ms_article table article';

			-- mise à jour de la date
			OLD.date_maj := current_timestamp;
			RAISE INFO 'valeur date_dermodif : %', NEW.date_maj;

		END IF;

        RETURN NEW;
    END;
$update_article$ LANGUAGE plpgsql;

/** le déclencheur de la fonction : update article  **/
CREATE or REPLACE TRIGGER update_article BEFORE INSERT OR UPDATE ON  ms_article.article
    FOR EACH ROW
	EXECUTE PROCEDURE ms_article.update_article();



/*==============================================================*/
/* Partie insertion des données */
/*==============================================================*/

/*==============================================================*/
/* DOMAIN */
/*==============================================================*/
insert into
    ms_article.DOMAIN (DESCRIPTION)
values
    ('INFORMATIQUE'),
    ('Crypto');

/*==============================================================*/
/* SECTION */
/*==============================================================*/
insert into
    ms_article.SECTION (ID_DOMAIN, DESCRIPTION)
values
    (1, 'Java'),
    (1, 'Spring Boot'),
    (1, 'JavaScript'),
    (1, 'Angular'),
    (1, 'Python'),
    (2, 'Bitcoin');

/*==============================================================*/
/* article */
/*==============================================================*/
/* ADMIN id_user => 597c0993-a3a3-4e7a-be76-7c77627c3c15 */
/* USER id_user => b2a542b8-466d-49dc-9a4b-87c7d77c228f */

INSERT INTO
    ms_article.article (
        id_user,
        id_section,
        titre,
        article,
        description_art,
        visibiliter
    )
VALUES
    (
    '597c0993-a3a3-4e7a-be76-7c77627c3c15',
    (SELECT id_section from ms_article.section sec  where sec.description = 'Java'),
    'Titre teste',
    'Article test',
    'descritption article teste max',
     TRUE
    ),
    (
        '597c0993-a3a3-4e7a-be76-7c77627c3c15',
        (SELECT id_section from ms_article.section sec where sec.description = 'Java'),
        'Titre teste',
        'Article test',
        'descritption article teste max',
        TRUE
    ),
    (
        'b2a542b8-466d-49dc-9a4b-87c7d77c228f',
        (SELECT id_section from ms_article.section sec where sec.description like '%Spring%'),
        'Titre teste',
        'Article test',
        'descritption article teste user_test1',
        TRUE
    ),
    (
        'b2a542b8-466d-49dc-9a4b-87c7d77c228f',
        (SELECT id_section from ms_article.section sec where sec.description like '%Spring%'),
        'Titre teste',
        'Article test',
        'descritption article teste user_test1',
        TRUE
    );