--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: project; Type: TABLE; Schema: public; Owner: evawiedmann
--

CREATE TABLE public.project (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.project OWNER TO evawiedmann;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: evawiedmann
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO evawiedmann;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evawiedmann
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: volunteers; Type: TABLE; Schema: public; Owner: evawiedmann
--

CREATE TABLE public.volunteers (
    id integer NOT NULL,
    name character varying,
    project_id integer
);


ALTER TABLE public.volunteers OWNER TO evawiedmann;

--
-- Name: volunteers_id_seq; Type: SEQUENCE; Schema: public; Owner: evawiedmann
--

CREATE SEQUENCE public.volunteers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteers_id_seq OWNER TO evawiedmann;

--
-- Name: volunteers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evawiedmann
--

ALTER SEQUENCE public.volunteers_id_seq OWNED BY public.volunteers.id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: evawiedmann
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: volunteers id; Type: DEFAULT; Schema: public; Owner: evawiedmann
--

ALTER TABLE ONLY public.volunteers ALTER COLUMN id SET DEFAULT nextval('public.volunteers_id_seq'::regclass);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: evawiedmann
--

COPY public.project (id, title) FROM stdin;
\.


--
-- Data for Name: volunteers; Type: TABLE DATA; Schema: public; Owner: evawiedmann
--

COPY public.volunteers (id, name, project_id) FROM stdin;
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evawiedmann
--

SELECT pg_catalog.setval('public.project_id_seq', 716, true);


--
-- Name: volunteers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evawiedmann
--

SELECT pg_catalog.setval('public.volunteers_id_seq', 449, true);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: evawiedmann
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: volunteers volunteers_pkey; Type: CONSTRAINT; Schema: public; Owner: evawiedmann
--

ALTER TABLE ONLY public.volunteers
    ADD CONSTRAINT volunteers_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

