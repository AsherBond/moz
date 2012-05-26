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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE albums (
    id integer NOT NULL,
    title character varying(255),
    year integer,
    label character varying(255),
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    artwork_file_name character varying(255),
    artwork_content_type character varying(255),
    artwork_file_size integer,
    artwork_updated_at timestamp without time zone,
    slug character varying(255)
);


--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE albums_id_seq OWNED BY albums.id;


--
-- Name: playlists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE playlists (
    id integer NOT NULL,
    user_id integer,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE playlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE playlists_id_seq OWNED BY playlists.id;


--
-- Name: ptracks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ptracks (
    id integer NOT NULL,
    playlist_id integer,
    song_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ptracks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ptracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ptracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ptracks_id_seq OWNED BY ptracks.id;


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
-- Name: songs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE songs (
    id integer NOT NULL,
    title character varying(255),
    lyric character varying(255),
    album_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    artwork_file_name character varying(255),
    artwork_content_type character varying(255),
    artwork_file_size integer,
    artwork_updated_at timestamp without time zone,
    file_file_name character varying(255),
    file_content_type character varying(255),
    file_file_size integer,
    file_updated_at timestamp without time zone,
    slug character varying(255)
);


--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE songs_id_seq OWNED BY songs.id;


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
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    about text,
    website character varying(255),
    paid boolean DEFAULT false,
    city character varying(255),
    state character varying(255),
    country character varying(255),
    zip character varying(255),
    artist_name character varying(255),
    username character varying(255) NOT NULL,
    public_email character varying(255),
    body_background_color character varying(255),
    body_background_repeat character varying(255),
    body_background_position character varying(255),
    body_background_attachment character varying(255),
    main_artist_name_color character varying(255),
    main_artist_info_color character varying(255),
    main_artist_location_color character varying(255),
    main_background_color character varying(255),
    main_background_repeat character varying(255),
    main_background_position character varying(255),
    main_background_attachment character varying(255),
    news_header_color character varying(255),
    news_text_color character varying(255),
    news_link_color character varying(255),
    news_link_hover_color character varying(255),
    news_background_color character varying(255),
    news_background_repeat character varying(255),
    news_background_position character varying(255),
    news_background_attachment character varying(255),
    about_header_color character varying(255),
    about_text_color character varying(255),
    about_link_color character varying(255),
    about_link_hover_color character varying(255),
    about_background_color character varying(255),
    about_background_repeat character varying(255),
    about_background_position character varying(255),
    about_background_attachment character varying(255),
    comments_header_color character varying(255),
    comments_text_color character varying(255),
    comments_link_color character varying(255),
    comments_link_hover_color character varying(255),
    comments_background_color character varying(255),
    comments_background_repeat character varying(255),
    comments_background_position character varying(255),
    comments_background_attachment character varying(255),
    thumbnails_background_color character varying(255),
    thumbnails_background_hover_color character varying(255),
    thumbnails_border_color character varying(255),
    thumbnails_border_hover_color character varying(255),
    tables_border_color character varying(255),
    tables_header_color character varying(255),
    tables_header_background_color character varying(255),
    tables_row_text_color character varying(255),
    tables_row_background_color character varying(255),
    tables_row_background_hover_color character varying(255),
    nav_current_text_color character varying(255),
    nav_current_background_color character varying(255),
    nav_text_color character varying(255),
    nav_text_hover_color character varying(255),
    nav_background_color character varying(255),
    nav_background_hover_color character varying(255),
    body_background_image_file_name character varying(255),
    body_background_image_content_type character varying(255),
    body_background_image_file_size integer,
    body_background_image_updated_at timestamp without time zone,
    main_background_image_file_name character varying(255),
    main_background_image_content_type character varying(255),
    main_background_image_file_size integer,
    main_background_image_updated_at timestamp without time zone,
    news_background_image_file_name character varying(255),
    news_background_image_content_type character varying(255),
    news_background_image_file_size integer,
    news_background_image_updated_at timestamp without time zone,
    about_background_image_file_name character varying(255),
    about_background_image_content_type character varying(255),
    about_background_image_file_size integer,
    about_background_image_updated_at timestamp without time zone,
    comments_background_image_file_name character varying(255),
    comments_background_image_content_type character varying(255),
    comments_background_image_file_size integer,
    comments_background_image_updated_at timestamp without time zone,
    profile_image_file_name character varying(255),
    profile_image_content_type character varying(255),
    profile_image_file_size integer,
    profile_image_updated_at timestamp without time zone,
    tables_link_color character varying(255),
    tables_link_hover_color character varying(255),
    thumbnails_link_color character varying(255),
    thumbnails_link_hover_color character varying(255),
    slug character varying(255),
    thumbnails_text_color character varying(255)
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
-- Name: videos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE videos (
    id integer NOT NULL,
    title character varying(255),
    year integer,
    about text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    file_file_name character varying(255),
    file_content_type character varying(255),
    file_file_size integer,
    file_updated_at timestamp without time zone,
    slug character varying(255)
);


--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE videos_id_seq OWNED BY videos.id;


--
-- Name: youtubes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE youtubes (
    id integer NOT NULL,
    user_id integer,
    title character varying(255),
    about text,
    youtube_url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: youtubes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE youtubes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: youtubes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE youtubes_id_seq OWNED BY youtubes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY albums ALTER COLUMN id SET DEFAULT nextval('albums_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY playlists ALTER COLUMN id SET DEFAULT nextval('playlists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ptracks ALTER COLUMN id SET DEFAULT nextval('ptracks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY songs ALTER COLUMN id SET DEFAULT nextval('songs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY videos ALTER COLUMN id SET DEFAULT nextval('videos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY youtubes ALTER COLUMN id SET DEFAULT nextval('youtubes_id_seq'::regclass);


--
-- Name: albums_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: ptracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ptracks
    ADD CONSTRAINT ptracks_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: songs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: youtubes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY youtubes
    ADD CONSTRAINT youtubes_pkey PRIMARY KEY (id);


--
-- Name: index_albums_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_albums_on_slug ON albums USING btree (slug);


--
-- Name: index_albums_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_albums_on_user_id ON albums USING btree (user_id);


--
-- Name: index_playlists_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_playlists_on_user_id ON playlists USING btree (user_id);


--
-- Name: index_ptracks_on_playlist_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_ptracks_on_playlist_id ON ptracks USING btree (playlist_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_songs_on_album_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_songs_on_album_id ON songs USING btree (album_id);


--
-- Name: index_songs_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_songs_on_slug ON songs USING btree (slug);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_slug ON users USING btree (slug);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: index_videos_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_videos_on_slug ON videos USING btree (slug);


--
-- Name: index_videos_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_videos_on_user_id ON videos USING btree (user_id);


--
-- Name: index_youtubes_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_youtubes_on_user_id ON youtubes USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20120524100000');

INSERT INTO schema_migrations (version) VALUES ('20120524100137');

INSERT INTO schema_migrations (version) VALUES ('20120524101651');

INSERT INTO schema_migrations (version) VALUES ('20120524105208');

INSERT INTO schema_migrations (version) VALUES ('20120524105236');

INSERT INTO schema_migrations (version) VALUES ('20120524105301');

INSERT INTO schema_migrations (version) VALUES ('20120524105312');

INSERT INTO schema_migrations (version) VALUES ('20120524105322');

INSERT INTO schema_migrations (version) VALUES ('20120524105354');

INSERT INTO schema_migrations (version) VALUES ('20120524113436');

INSERT INTO schema_migrations (version) VALUES ('20120524235424');

INSERT INTO schema_migrations (version) VALUES ('20120524235528');

INSERT INTO schema_migrations (version) VALUES ('20120525001001');

INSERT INTO schema_migrations (version) VALUES ('20120525001010');

INSERT INTO schema_migrations (version) VALUES ('20120525001019');

INSERT INTO schema_migrations (version) VALUES ('20120525001053');

INSERT INTO schema_migrations (version) VALUES ('20120525001532');

INSERT INTO schema_migrations (version) VALUES ('20120525183251');

INSERT INTO schema_migrations (version) VALUES ('20120525185000');

INSERT INTO schema_migrations (version) VALUES ('20120525190618');

INSERT INTO schema_migrations (version) VALUES ('20120526001023');

INSERT INTO schema_migrations (version) VALUES ('20120526023225');