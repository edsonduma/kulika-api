--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19
-- Dumped by pg_dump version 10.19

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    loja character varying(255) NOT NULL,
    preco double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nome character varying(255) NOT NULL,
    tipo character varying(255) NOT NULL,
    senha character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
6	2014_10_12_000000_create_users_table	1
7	2014_10_12_100000_create_password_resets_table	1
8	2019_08_19_000000_create_failed_jobs_table	1
9	2019_12_14_000001_create_personal_access_tokens_table	1
10	2022_12_15_205314_create_produtos_table	1
11	2023_02_07_094335_alter_users_table	2
12	2023_02_07_094621_create_again_users_table	3
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome, loja, preco, created_at, updated_at) FROM stdin;
1	arroz	SHOPRITE	200	2022-12-15 21:33:32	2022-12-15 21:33:32
3	trigo	MAXI	150	2022-12-15 21:38:09	2022-12-15 21:38:09
4	massa	ALIMENTA ANGOLA	100	2022-12-15 21:38:56	2022-12-15 21:38:56
5	arroz	ALIMENTA ANGOLA	250	2022-12-15 21:39:14	2022-12-15 21:39:14
12	sumo compal	Alimenta Angola	700	2022-12-16 08:56:34	2022-12-16 08:56:34
13	sumo nutre	Alimenta Angola	500	2022-12-16 08:56:54	2022-12-16 08:56:54
14	arroz	Fresmart	150	2022-12-16 09:20:35	2022-12-16 09:20:35
17	sumo compal	kero	650	2022-12-16 09:43:31	2022-12-16 09:43:31
20	arroz	maxi	100	2022-12-16 10:28:36	2022-12-16 10:28:36
22	sumo compal	fresmart	500	2022-12-16 10:30:46	2022-12-16 10:30:46
23	sumo nutre	fresmart	450	2022-12-16 10:31:51	2022-12-16 10:31:51
24	trigo	fresmart	100	2022-12-16 10:33:03	2022-12-16 10:33:03
25	batata	kero	800	2022-12-16 10:33:30	2022-12-16 10:33:30
26	sumo nutre	kero	400	2022-12-16 10:34:39	2022-12-16 10:34:39
27	brinquedo	maxi	15000	2022-12-16 10:35:31	2022-12-16 10:35:31
28	massa	kibabo	100	2022-12-16 13:02:34	2022-12-16 13:02:34
30	arroz	deskontao	99	2022-12-16 13:06:43	2022-12-16 13:06:43
31	sumo nutre	angomart	350	2022-12-16 13:07:32	2022-12-16 13:07:32
35	bolacha smile	fresmart	500	2022-12-16 16:47:52	2022-12-16 16:47:52
36	bolacha smile	deskontao	400	2022-12-16 16:50:49	2022-12-16 16:50:49
38	batata	angomart	900	2022-12-16 17:18:25	2022-12-16 17:18:25
21	feijão	fresmart	400	2022-12-16 10:29:41	2022-12-16 10:29:41
16	maça	maxi	100	2022-12-16 09:40:38	2022-12-16 09:40:38
2	feijão	KERO	500	2022-12-15 21:36:47	2022-12-15 21:36:47
6	maça	KERO	123	2022-12-16 08:45:17	2022-12-16 08:45:17
33	água	deskontao	500	2022-12-16 13:12:11	2022-12-16 13:12:11
34	água	shoprite	400	2022-12-16 13:13:01	2022-12-16 13:13:01
37	feijão	alimenta angola	600	2022-12-16 17:16:49	2022-12-16 17:16:49
29	batata	kibabo	800	2022-12-16 13:03:21	2022-12-16 13:03:21
32	batata	deskontao	850	2022-12-16 13:08:07	2022-12-16 13:08:07
39	batata	fresmart	750	2022-12-17 10:29:11	2022-12-17 10:29:11
40	batata	alimenta angola	700	2022-12-17 10:31:38	2022-12-17 10:31:38
41	batata	kibabo	650	2022-12-17 10:34:08	2022-12-17 10:34:08
43	batata	kero	600	2022-12-17 11:45:18	2022-12-17 11:45:18
44	batata	shoprite	500	2022-12-17 13:00:50	2022-12-17 13:00:50
45	água	kero	350	2022-12-17 13:06:06	2022-12-17 13:06:06
46	sambapito	alimenta angola	100	2022-12-17 13:07:07	2022-12-17 13:07:07
47	laço	kero	50	2022-12-17 13:09:32	2022-12-17 13:09:32
48	escova de dentes	kero	200	2022-12-17 13:12:15	2022-12-17 13:12:15
49	pasta	fresmart	5000	2022-12-17 13:14:30	2022-12-17 13:14:30
50	uva	alimenta angola	500	2022-12-17 13:39:52	2022-12-17 13:39:52
51	banana	shoprite	300	2022-12-17 14:02:17	2022-12-17 14:02:17
52	banana	deskontao	250	2022-12-17 14:03:17	2022-12-17 14:03:17
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nome, tipo, senha, remember_token, created_at, updated_at) FROM stdin;
1	teste	Teste	123	\N	2023-02-07 10:18:29	2023-02-07 10:18:29
2	c4	cliente	rrrr	\N	2023-02-07 10:58:58	2023-02-07 10:58:58
3	admin	super_admin	admin	\N	2023-02-12 17:41:43	2023-02-12 17:41:43
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 52, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- PostgreSQL database dump complete
--

