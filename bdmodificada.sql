--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-03-13 10:55:22

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
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 24897)
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    identificador integer NOT NULL,
    idpersona integer,
    legajo integer NOT NULL
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24895)
-- Name: alumno_identificador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_identificador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_identificador_seq OWNER TO postgres;

--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 213
-- Name: alumno_identificador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_identificador_seq OWNED BY public.alumno.identificador;


--
-- TOC entry 218 (class 1259 OID 24927)
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    identificador integer NOT NULL,
    nombre character varying(40) NOT NULL,
    descripcion character varying(250),
    fechadesde date NOT NULL,
    fechahasta date
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24925)
-- Name: carrera_identificador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_identificador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_identificador_seq OWNER TO postgres;

--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrera_identificador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_identificador_seq OWNED BY public.carrera.identificador;


--
-- TOC entry 220 (class 1259 OID 24935)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    identificador integer NOT NULL,
    idcarrera integer,
    nombre character varying(40) NOT NULL,
    descripcion character varying(250),
    cupomaximo smallint NOT NULL,
    anio smallint NOT NULL,
    iddocente integer
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24933)
-- Name: curso_identificador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_identificador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curso_identificador_seq OWNER TO postgres;

--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 219
-- Name: curso_identificador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_identificador_seq OWNED BY public.curso.identificador;


--
-- TOC entry 216 (class 1259 OID 24912)
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente (
    identificador integer NOT NULL,
    idpersona integer,
    legajo integer NOT NULL
);


ALTER TABLE public.docente OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24910)
-- Name: docente_identificador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.docente_identificador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.docente_identificador_seq OWNER TO postgres;

--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 215
-- Name: docente_identificador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.docente_identificador_seq OWNED BY public.docente.identificador;


--
-- TOC entry 221 (class 1259 OID 24953)
-- Name: inscripciones_carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones_carrera (
    idalumno integer,
    idcarrera integer,
    fechainscripcion date NOT NULL
);


ALTER TABLE public.inscripciones_carrera OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24966)
-- Name: inscripciones_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones_curso (
    idalumno integer,
    idcurso integer,
    fechainscripcion date NOT NULL,
    nota integer DEFAULT 0
);


ALTER TABLE public.inscripciones_curso OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24889)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    identificador integer NOT NULL,
    tipodoc character(5) NOT NULL,
    documento bigint NOT NULL,
    nombre character varying(40) NOT NULL,
    apellido character varying(40) NOT NULL,
    fechanac date NOT NULL
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24887)
-- Name: persona_identificador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_identificador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_identificador_seq OWNER TO postgres;

--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 211
-- Name: persona_identificador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_identificador_seq OWNED BY public.persona.identificador;


--
-- TOC entry 210 (class 1259 OID 16526)
-- Name: persona_secuencia; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_secuencia
    START WITH 6
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_secuencia OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16524)
-- Name: persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16509)
-- Name: sec; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sec
    START WITH 6
    INCREMENT BY 1
    MINVALUE 6
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16517)
-- Name: sec_persona; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sec_persona
    START WITH 6
    INCREMENT BY 1
    MINVALUE 6
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_persona OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16513)
-- Name: secuencia; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.secuencia
    START WITH 98735
    INCREMENT BY 1
    MINVALUE 98735
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secuencia OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16522)
-- Name: table_name_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_name_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_name_id_seq OWNER TO postgres;

--
-- TOC entry 2735 (class 2604 OID 24900)
-- Name: alumno identificador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN identificador SET DEFAULT nextval('public.alumno_identificador_seq'::regclass);


--
-- TOC entry 2737 (class 2604 OID 24930)
-- Name: carrera identificador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN identificador SET DEFAULT nextval('public.carrera_identificador_seq'::regclass);


--
-- TOC entry 2738 (class 2604 OID 24938)
-- Name: curso identificador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN identificador SET DEFAULT nextval('public.curso_identificador_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 24915)
-- Name: docente identificador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente ALTER COLUMN identificador SET DEFAULT nextval('public.docente_identificador_seq'::regclass);


--
-- TOC entry 2734 (class 2604 OID 24892)
-- Name: persona identificador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN identificador SET DEFAULT nextval('public.persona_identificador_seq'::regclass);


--
-- TOC entry 2899 (class 0 OID 24897)
-- Dependencies: 214
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno (identificador, idpersona, legajo) FROM stdin;
1	3	98734
2	4	9213
3	1	35839
4	5	36299
5	2	11009
13	19	98736
9	15	98735
14	20	98737
\.


--
-- TOC entry 2903 (class 0 OID 24927)
-- Dependencies: 218
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrera (identificador, nombre, descripcion, fechadesde, fechahasta) FROM stdin;
1	Ingenieria en sistema de información	Carrera a fines a programación y desarrollo de software en general	1960-01-01	\N
2	Ingenieria civil	Carrera a fines a construcción, planificación y desarrollo de obras de desarrollo urbano	1980-01-01	\N
\.


--
-- TOC entry 2905 (class 0 OID 24935)
-- Dependencies: 220
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (identificador, idcarrera, nombre, descripcion, cupomaximo, anio, iddocente) FROM stdin;
4	1	Base de datos-SQL	Curso sobre tipos de base de datos y consultas sql	10	2018	1
2	1	Diseño de sistemas	Curso sobre diseño de componentes de sistemas de software	3	2018	2
1	1	Análisis matemático	Curso sobre el desarrollo avanzado de matemáticas	5	2018	3
3	1	Java	Curso sobre el lenguaje de programación JAVA	4	2018	4
5	2	Fisica básica	Curso sobre fundamentos base de física	5	2018	5
6	2	Dibujo	Curso sobre dibujo de planos	10	2018	6
\.


--
-- TOC entry 2901 (class 0 OID 24912)
-- Dependencies: 216
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente (identificador, idpersona, legajo) FROM stdin;
1	6	4001
2	7	4002
3	8	4003
4	9	4004
5	10	4005
6	11	4006
\.


--
-- TOC entry 2906 (class 0 OID 24953)
-- Dependencies: 221
-- Data for Name: inscripciones_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones_carrera (idalumno, idcarrera, fechainscripcion) FROM stdin;
1	1	2000-01-01
2	1	2003-01-01
3	1	2004-01-01
4	1	2001-01-01
5	2	2000-01-01
4	2	2000-01-01
14	1	2020-03-13
\.


--
-- TOC entry 2907 (class 0 OID 24966)
-- Dependencies: 222
-- Data for Name: inscripciones_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones_curso (idalumno, idcurso, fechainscripcion, nota) FROM stdin;
1	1	2002-01-01	0
1	2	2006-01-01	0
1	3	2002-01-01	0
2	1	2004-01-01	0
2	3	2002-01-01	0
2	4	2004-01-01	0
3	1	2010-01-01	0
3	3	2010-01-01	0
4	1	2010-01-01	0
4	3	2010-01-01	0
5	3	2010-01-01	0
5	4	2011-01-01	0
4	4	2011-01-01	4
4	2	2020-03-12	0
4	5	2020-03-12	0
4	3	2020-03-13	0
9	3	2020-03-13	0
13	3	2020-03-13	0
3	3	2020-03-13	0
4	4	2020-03-13	0
\.


--
-- TOC entry 2897 (class 0 OID 24889)
-- Dependencies: 212
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (identificador, tipodoc, documento, nombre, apellido, fechanac) FROM stdin;
1	DNI  	31565839	Florencia	Maneiro	1985-06-28
2	DNI  	31000123	Patricia	Brumatti	1985-01-13
3	DNI  	20945422	Diego	Menendez	1982-04-10
4	DNI  	30999281	Franzo	Perez	1986-02-05
5	DNI  	24112872	Leandro	Garcia	1988-01-03
6	DNI  	21564839	Adrian	Meca	1976-04-12
7	DNI  	21563839	Florencia	Darrigo	1974-06-01
8	DNI  	31565849	Matias	Montanari	1992-06-28
9	DNI  	19565839	Lorena	Candia	1971-02-06
10	DNI  	23165849	Federico	Pinedo	1980-08-24
11	DNI  	25465839	David	Ruiz	1988-12-24
19	dni  	35152603	Estefania	Pardo	1990-04-01
15	dni  	37336261	Elias	Bucci	1993-07-18
20	dni  	14123123	Antonella	Pardo	1970-04-12
\.


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 213
-- Name: alumno_identificador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumno_identificador_seq', 14, true);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 217
-- Name: carrera_identificador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_identificador_seq', 2, true);


--
-- TOC entry 2921 (class 0 OID 0)
-- Dependencies: 219
-- Name: curso_identificador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_identificador_seq', 7, true);


--
-- TOC entry 2922 (class 0 OID 0)
-- Dependencies: 215
-- Name: docente_identificador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.docente_identificador_seq', 6, true);


--
-- TOC entry 2923 (class 0 OID 0)
-- Dependencies: 211
-- Name: persona_identificador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_identificador_seq', 20, true);


--
-- TOC entry 2924 (class 0 OID 0)
-- Dependencies: 210
-- Name: persona_secuencia; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_secuencia', 48, true);


--
-- TOC entry 2925 (class 0 OID 0)
-- Dependencies: 209
-- Name: persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_seq', 1, false);


--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 205
-- Name: sec; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sec', 6, true);


--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 207
-- Name: sec_persona; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sec_persona', 6, true);


--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 206
-- Name: secuencia; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secuencia', 98735, true);


--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 208
-- Name: table_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_name_id_seq', 1, false);


--
-- TOC entry 2743 (class 2606 OID 24904)
-- Name: alumno alumno_idpersona_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_idpersona_key UNIQUE (idpersona);


--
-- TOC entry 2745 (class 2606 OID 24902)
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2751 (class 2606 OID 24932)
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2753 (class 2606 OID 24942)
-- Name: curso curso_iddocente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_iddocente_key UNIQUE (iddocente);


--
-- TOC entry 2755 (class 2606 OID 24940)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2747 (class 2606 OID 24919)
-- Name: docente docente_idpersona_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_idpersona_key UNIQUE (idpersona);


--
-- TOC entry 2749 (class 2606 OID 24917)
-- Name: docente docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2741 (class 2606 OID 24894)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2756 (class 2606 OID 24905)
-- Name: alumno alumno_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.persona(identificador);


--
-- TOC entry 2758 (class 2606 OID 24943)
-- Name: curso curso_idcarrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_idcarrera_fkey FOREIGN KEY (idcarrera) REFERENCES public.carrera(identificador);


--
-- TOC entry 2759 (class 2606 OID 24948)
-- Name: curso curso_iddocente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_iddocente_fkey FOREIGN KEY (iddocente) REFERENCES public.persona(identificador);


--
-- TOC entry 2757 (class 2606 OID 24920)
-- Name: docente docente_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.persona(identificador);


--
-- TOC entry 2760 (class 2606 OID 24956)
-- Name: inscripciones_carrera inscripciones_carrera_idalumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_carrera
    ADD CONSTRAINT inscripciones_carrera_idalumno_fkey FOREIGN KEY (idalumno) REFERENCES public.alumno(identificador);


--
-- TOC entry 2761 (class 2606 OID 24961)
-- Name: inscripciones_carrera inscripciones_carrera_idcarrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_carrera
    ADD CONSTRAINT inscripciones_carrera_idcarrera_fkey FOREIGN KEY (idcarrera) REFERENCES public.carrera(identificador);


--
-- TOC entry 2762 (class 2606 OID 24970)
-- Name: inscripciones_curso inscripciones_curso_idalumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_curso
    ADD CONSTRAINT inscripciones_curso_idalumno_fkey FOREIGN KEY (idalumno) REFERENCES public.alumno(identificador);


--
-- TOC entry 2763 (class 2606 OID 24975)
-- Name: inscripciones_curso inscripciones_curso_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_curso
    ADD CONSTRAINT inscripciones_curso_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(identificador);


-- Completed on 2020-03-13 10:55:27

--
-- PostgreSQL database dump complete
--

