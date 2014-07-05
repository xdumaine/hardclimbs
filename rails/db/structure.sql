--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    name character varying(255),
    country character varying(255),
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    climbs_count integer DEFAULT 0,
    ascents_count integer DEFAULT 0
);


--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: ascents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ascents (
    id integer NOT NULL,
    date date,
    climb_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    climber_id integer,
    slug character varying(255),
    grade_id integer,
    ascent_number integer,
    medias_count integer DEFAULT 0,
    date_end date,
    notes text
);


--
-- Name: ascents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ascents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ascents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ascents_id_seq OWNED BY ascents.id;


--
-- Name: ascents_medias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ascents_medias (
    media_id integer,
    ascent_id integer
);


--
-- Name: climbers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE climbers (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    sex character varying(255),
    dob date,
    height integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255),
    climbs_count integer DEFAULT 0,
    ascents_count integer DEFAULT 0
);


--
-- Name: climbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climbers_id_seq OWNED BY climbers.id;


--
-- Name: climbs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE climbs (
    id integer NOT NULL,
    name character varying(255),
    style_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255),
    still_hard boolean DEFAULT true,
    area_id integer,
    climbers_count integer DEFAULT 0,
    ascents_count integer DEFAULT 0,
    medias_count integer DEFAULT 0,
    grade_id integer,
    notes text
);


--
-- Name: climbs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE climbs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: climbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE climbs_id_seq OWNED BY climbs.id;


--
-- Name: climbs_medias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE climbs_medias (
    media_id integer,
    climb_id integer
);


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying(255) NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(40),
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: grades; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grades (
    id integer NOT NULL,
    name character varying(255),
    rank integer,
    style_id integer,
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ascents_count integer DEFAULT 0,
    climbs_count integer DEFAULT 0
);


--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grades_id_seq OWNED BY grades.id;


--
-- Name: media_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE media_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: media_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE media_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE media_types_id_seq OWNED BY media_types.id;


--
-- Name: medias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE medias (
    id integer NOT NULL,
    url character varying(255),
    description character varying(255),
    media_type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pull_quote text
);


--
-- Name: medias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE medias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: medias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE medias_id_seq OWNED BY medias.id;


--
-- Name: pg_search_documents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pg_search_documents (
    id integer NOT NULL,
    content text,
    searchable_id integer,
    searchable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pg_search_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pg_search_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pg_search_documents_id_seq OWNED BY pg_search_documents.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: styles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE styles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: styles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE styles_id_seq OWNED BY styles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ascents ALTER COLUMN id SET DEFAULT nextval('ascents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climbers ALTER COLUMN id SET DEFAULT nextval('climbers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY climbs ALTER COLUMN id SET DEFAULT nextval('climbs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grades ALTER COLUMN id SET DEFAULT nextval('grades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY media_types ALTER COLUMN id SET DEFAULT nextval('media_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY medias ALTER COLUMN id SET DEFAULT nextval('medias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pg_search_documents ALTER COLUMN id SET DEFAULT nextval('pg_search_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY styles ALTER COLUMN id SET DEFAULT nextval('styles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: ascents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ascents
    ADD CONSTRAINT ascents_pkey PRIMARY KEY (id);


--
-- Name: climbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY climbers
    ADD CONSTRAINT climbers_pkey PRIMARY KEY (id);


--
-- Name: climbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY climbs
    ADD CONSTRAINT climbs_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: media_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY media_types
    ADD CONSTRAINT media_types_pkey PRIMARY KEY (id);


--
-- Name: medias_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medias
    ADD CONSTRAINT medias_pkey PRIMARY KEY (id);


--
-- Name: pg_search_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pg_search_documents
    ADD CONSTRAINT pg_search_documents_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: styles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY styles
    ADD CONSTRAINT styles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_areas_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_areas_on_slug ON areas USING btree (slug);


--
-- Name: index_ascents_medias_on_ascent_id_and_media_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ascents_medias_on_ascent_id_and_media_id ON ascents_medias USING btree (ascent_id, media_id);


--
-- Name: index_ascents_medias_on_media_id_and_ascent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ascents_medias_on_media_id_and_ascent_id ON ascents_medias USING btree (media_id, ascent_id);


--
-- Name: index_ascents_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_ascents_on_slug ON ascents USING btree (slug);


--
-- Name: index_climbers_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_climbers_on_slug ON climbers USING btree (slug);


--
-- Name: index_climbs_medias_on_climb_id_and_media_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_climbs_medias_on_climb_id_and_media_id ON climbs_medias USING btree (climb_id, media_id);


--
-- Name: index_climbs_medias_on_media_id_and_climb_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_climbs_medias_on_media_id_and_climb_id ON climbs_medias USING btree (media_id, climb_id);


--
-- Name: index_climbs_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_climbs_on_slug ON climbs USING btree (slug);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_grades_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_grades_on_slug ON grades USING btree (slug);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130108234732');

INSERT INTO schema_migrations (version) VALUES ('20130108235446');

INSERT INTO schema_migrations (version) VALUES ('20130108235548');

INSERT INTO schema_migrations (version) VALUES ('20130109015218');

INSERT INTO schema_migrations (version) VALUES ('20130111010257');

INSERT INTO schema_migrations (version) VALUES ('20130111010834');

INSERT INTO schema_migrations (version) VALUES ('20130111011220');

INSERT INTO schema_migrations (version) VALUES ('20130111011248');

INSERT INTO schema_migrations (version) VALUES ('20130111011308');

INSERT INTO schema_migrations (version) VALUES ('20130111014044');

INSERT INTO schema_migrations (version) VALUES ('20130111014329');

INSERT INTO schema_migrations (version) VALUES ('20130111020245');

INSERT INTO schema_migrations (version) VALUES ('20130111020401');

INSERT INTO schema_migrations (version) VALUES ('20130111021039');

INSERT INTO schema_migrations (version) VALUES ('20130111021234');

INSERT INTO schema_migrations (version) VALUES ('20130111021703');

INSERT INTO schema_migrations (version) VALUES ('20130112184907');

INSERT INTO schema_migrations (version) VALUES ('20130112195529');

INSERT INTO schema_migrations (version) VALUES ('20130112195708');

INSERT INTO schema_migrations (version) VALUES ('20130112200802');

INSERT INTO schema_migrations (version) VALUES ('20130112201425');

INSERT INTO schema_migrations (version) VALUES ('20130115013243');

INSERT INTO schema_migrations (version) VALUES ('20130115013729');

INSERT INTO schema_migrations (version) VALUES ('20130115015046');

INSERT INTO schema_migrations (version) VALUES ('20130115015211');

INSERT INTO schema_migrations (version) VALUES ('20130115230031');

INSERT INTO schema_migrations (version) VALUES ('20130115232431');

INSERT INTO schema_migrations (version) VALUES ('20130117231254');

INSERT INTO schema_migrations (version) VALUES ('20130117231353');

INSERT INTO schema_migrations (version) VALUES ('20130119211616');

INSERT INTO schema_migrations (version) VALUES ('20130119214538');

INSERT INTO schema_migrations (version) VALUES ('20130119214628');

INSERT INTO schema_migrations (version) VALUES ('20130125225813');

INSERT INTO schema_migrations (version) VALUES ('20130202143419');

INSERT INTO schema_migrations (version) VALUES ('20130216163009');

INSERT INTO schema_migrations (version) VALUES ('20130216165229');

INSERT INTO schema_migrations (version) VALUES ('20130216165236');

INSERT INTO schema_migrations (version) VALUES ('20130216165732');

INSERT INTO schema_migrations (version) VALUES ('20130317025600');

INSERT INTO schema_migrations (version) VALUES ('20130317032832');

INSERT INTO schema_migrations (version) VALUES ('20130419143645');

INSERT INTO schema_migrations (version) VALUES ('20130419180836');

INSERT INTO schema_migrations (version) VALUES ('20130419181328');

INSERT INTO schema_migrations (version) VALUES ('20130419181557');

INSERT INTO schema_migrations (version) VALUES ('20130516161542');

INSERT INTO schema_migrations (version) VALUES ('20130530125415');

INSERT INTO schema_migrations (version) VALUES ('20130530125440');