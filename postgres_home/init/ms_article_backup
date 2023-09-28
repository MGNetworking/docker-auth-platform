--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ms_article; Type: SCHEMA; Schema: -; Owner: max_admin
--

CREATE SCHEMA ms_article;


ALTER SCHEMA ms_article OWNER TO max_admin;

--
-- Name: update_article(); Type: FUNCTION; Schema: ms_article; Owner: max_admin
--

CREATE FUNCTION ms_article.update_article() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION ms_article.update_article() OWNER TO max_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: article; Type: TABLE; Schema: ms_article; Owner: max_admin
--

CREATE TABLE ms_article.article (
    id_article integer NOT NULL,
    id_user character varying(250) NOT NULL,
    id_section integer NOT NULL,
    id_source integer,
    id_commentaire integer,
    id_note integer,
    titre character varying(100) NOT NULL,
    article text NOT NULL,
    date_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date_maj timestamp without time zone,
    vue integer DEFAULT 0 NOT NULL,
    visibiliter boolean NOT NULL,
    imgdescription character varying(250),
    description_art text NOT NULL
);


ALTER TABLE ms_article.article OWNER TO max_admin;

--
-- Name: article_id_article_seq; Type: SEQUENCE; Schema: ms_article; Owner: max_admin
--

CREATE SEQUENCE ms_article.article_id_article_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ms_article.article_id_article_seq OWNER TO max_admin;

--
-- Name: article_id_article_seq; Type: SEQUENCE OWNED BY; Schema: ms_article; Owner: max_admin
--

ALTER SEQUENCE ms_article.article_id_article_seq OWNED BY ms_article.article.id_article;


--
-- Name: domain; Type: TABLE; Schema: ms_article; Owner: max_admin
--

CREATE TABLE ms_article.domain (
    id_domain integer NOT NULL,
    description character varying(256) NOT NULL
);


ALTER TABLE ms_article.domain OWNER TO max_admin;

--
-- Name: domain_id_domain_seq; Type: SEQUENCE; Schema: ms_article; Owner: max_admin
--

CREATE SEQUENCE ms_article.domain_id_domain_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ms_article.domain_id_domain_seq OWNER TO max_admin;

--
-- Name: domain_id_domain_seq; Type: SEQUENCE OWNED BY; Schema: ms_article; Owner: max_admin
--

ALTER SEQUENCE ms_article.domain_id_domain_seq OWNED BY ms_article.domain.id_domain;


--
-- Name: section; Type: TABLE; Schema: ms_article; Owner: max_admin
--

CREATE TABLE ms_article.section (
    id_section integer NOT NULL,
    id_domain integer NOT NULL,
    description character varying(256) NOT NULL
);


ALTER TABLE ms_article.section OWNER TO max_admin;

--
-- Name: section_id_section_seq; Type: SEQUENCE; Schema: ms_article; Owner: max_admin
--

CREATE SEQUENCE ms_article.section_id_section_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ms_article.section_id_section_seq OWNER TO max_admin;

--
-- Name: section_id_section_seq; Type: SEQUENCE OWNED BY; Schema: ms_article; Owner: max_admin
--

ALTER SEQUENCE ms_article.section_id_section_seq OWNED BY ms_article.section.id_section;


--
-- Name: article id_article; Type: DEFAULT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.article ALTER COLUMN id_article SET DEFAULT nextval('ms_article.article_id_article_seq'::regclass);


--
-- Name: domain id_domain; Type: DEFAULT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.domain ALTER COLUMN id_domain SET DEFAULT nextval('ms_article.domain_id_domain_seq'::regclass);


--
-- Name: section id_section; Type: DEFAULT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.section ALTER COLUMN id_section SET DEFAULT nextval('ms_article.section_id_section_seq'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: ms_article; Owner: max_admin
--

COPY ms_article.article (id_article, id_user, id_section, id_source, id_commentaire, id_note, titre, article, date_creation, date_maj, vue, visibiliter, imgdescription, description_art) FROM stdin;
1	597c0993-a3a3-4e7a-be76-7c77627c3c15	1	\N	\N	\N	Titre teste	Article test	2023-05-27 14:26:01.479724	\N	0	t	\N	descritption article teste max
2	597c0993-a3a3-4e7a-be76-7c77627c3c15	1	\N	\N	\N	Titre teste	Article test	2023-05-27 14:26:01.479724	\N	0	t	\N	descritption article teste max
3	b2a542b8-466d-49dc-9a4b-87c7d77c228f	2	\N	\N	\N	Titre teste	Article test	2023-05-27 14:26:01.479724	\N	0	t	\N	descritption article teste user_test1
4	b2a542b8-466d-49dc-9a4b-87c7d77c228f	2	\N	\N	\N	Titre teste	Article test	2023-05-27 14:26:01.479724	\N	0	t	\N	descritption article teste user_test1
\.


--
-- Data for Name: domain; Type: TABLE DATA; Schema: ms_article; Owner: max_admin
--

COPY ms_article.domain (id_domain, description) FROM stdin;
1	INFORMATIQUE
2	Crypto
\.


--
-- Data for Name: section; Type: TABLE DATA; Schema: ms_article; Owner: max_admin
--

COPY ms_article.section (id_section, id_domain, description) FROM stdin;
1	1	Java
2	1	Spring Boot
3	1	JavaScript
4	1	Angular
5	1	Python
6	2	Bitcoin
\.


--
-- Name: article_id_article_seq; Type: SEQUENCE SET; Schema: ms_article; Owner: max_admin
--

SELECT pg_catalog.setval('ms_article.article_id_article_seq', 4, true);


--
-- Name: domain_id_domain_seq; Type: SEQUENCE SET; Schema: ms_article; Owner: max_admin
--

SELECT pg_catalog.setval('ms_article.domain_id_domain_seq', 2, true);


--
-- Name: section_id_section_seq; Type: SEQUENCE SET; Schema: ms_article; Owner: max_admin
--

SELECT pg_catalog.setval('ms_article.section_id_section_seq', 6, true);


--
-- Name: article pk_article; Type: CONSTRAINT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.article
    ADD CONSTRAINT pk_article PRIMARY KEY (id_section, id_article);


--
-- Name: domain pk_domain; Type: CONSTRAINT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.domain
    ADD CONSTRAINT pk_domain PRIMARY KEY (id_domain);


--
-- Name: section pk_section; Type: CONSTRAINT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.section
    ADD CONSTRAINT pk_section PRIMARY KEY (id_section);


--
-- Name: article update_article; Type: TRIGGER; Schema: ms_article; Owner: max_admin
--

CREATE TRIGGER update_article BEFORE INSERT OR UPDATE ON ms_article.article FOR EACH ROW EXECUTE FUNCTION ms_article.update_article();


--
-- Name: article fk_article_section; Type: FK CONSTRAINT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.article
    ADD CONSTRAINT fk_article_section FOREIGN KEY (id_section) REFERENCES ms_article.section(id_section) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: section fk_section_domain; Type: FK CONSTRAINT; Schema: ms_article; Owner: max_admin
--

ALTER TABLE ONLY ms_article.section
    ADD CONSTRAINT fk_section_domain FOREIGN KEY (id_domain) REFERENCES ms_article.domain(id_domain) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

