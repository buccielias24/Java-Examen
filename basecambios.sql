--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-03-11 13:52:22

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
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 16456)
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    identificador integer NOT NULL,
    idpersona integer,
    legajo integer NOT NULL
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16530)
-- Name: alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_seq OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 217
-- Name: alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumno.identificador;


--
-- TOC entry 218 (class 1259 OID 16532)
-- Name: alumno_legajo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_legajo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_legajo_seq OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 218
-- Name: alumno_legajo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_legajo_seq OWNED BY public.alumno.legajo;


--
-- TOC entry 207 (class 1259 OID 16468)
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
-- TOC entry 208 (class 1259 OID 16473)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    identificador integer NOT NULL,
    idcarrera integer,
    nombre character varying(40) NOT NULL,
    descripcion character varying(250),
    cupomaximo smallint NOT NULL,
    anio smallint NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16483)
-- Name: inscripciones_carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones_carrera (
    idalumno integer NOT NULL,
    idcarrera integer NOT NULL,
    fechainscripcion date NOT NULL
);


ALTER TABLE public.inscripciones_carrera OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16496)
-- Name: inscripciones_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones_curso (
    idalumno integer NOT NULL,
    idcurso integer NOT NULL,
    fechainscripcion date NOT NULL,
    nota integer,
    estado character varying[]
);


ALTER TABLE public.inscripciones_curso OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16526)
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
-- TOC entry 205 (class 1259 OID 16451)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    identificador integer DEFAULT nextval('public.persona_secuencia'::regclass) NOT NULL,
    tipodoc character(5) NOT NULL,
    documento bigint NOT NULL,
    nombre character varying(40) NOT NULL,
    apellido character varying(40) NOT NULL,
    fechanac date NOT NULL,
    direccion character varying(200)
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16524)
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
-- TOC entry 211 (class 1259 OID 16509)
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
-- TOC entry 213 (class 1259 OID 16517)
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
-- TOC entry 212 (class 1259 OID 16513)
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
-- TOC entry 214 (class 1259 OID 16522)
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
-- TOC entry 2730 (class 2604 OID 16534)
-- Name: alumno identificador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN identificador SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
-- TOC entry 2731 (class 2604 OID 16535)
-- Name: alumno legajo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN legajo SET DEFAULT nextval('public.alumno_legajo_seq'::regclass);


--
-- TOC entry 2735 (class 2606 OID 16462)
-- Name: alumno alumno_idpersona_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_idpersona_key UNIQUE (idpersona);


--
-- TOC entry 2737 (class 2606 OID 16460)
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2739 (class 2606 OID 16472)
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2741 (class 2606 OID 16477)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2743 (class 2606 OID 16542)
-- Name: inscripciones_carrera inscripciones_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_carrera
    ADD CONSTRAINT inscripciones_carrera_pkey PRIMARY KEY (idalumno, idcarrera, fechainscripcion);


--
-- TOC entry 2745 (class 2606 OID 16549)
-- Name: inscripciones_curso inscripciones_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_curso
    ADD CONSTRAINT inscripciones_curso_pkey PRIMARY KEY (idalumno, idcurso, fechainscripcion);


--
-- TOC entry 2733 (class 2606 OID 16455)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (identificador);


--
-- TOC entry 2746 (class 2606 OID 16463)
-- Name: alumno alumno_idpersona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.persona(identificador);


--
-- TOC entry 2747 (class 2606 OID 16478)
-- Name: curso curso_idcarrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_idcarrera_fkey FOREIGN KEY (idcarrera) REFERENCES public.carrera(identificador);


--
-- TOC entry 2748 (class 2606 OID 16486)
-- Name: inscripciones_carrera inscripciones_carrera_idalumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_carrera
    ADD CONSTRAINT inscripciones_carrera_idalumno_fkey FOREIGN KEY (idalumno) REFERENCES public.alumno(identificador);


--
-- TOC entry 2749 (class 2606 OID 16491)
-- Name: inscripciones_carrera inscripciones_carrera_idcarrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_carrera
    ADD CONSTRAINT inscripciones_carrera_idcarrera_fkey FOREIGN KEY (idcarrera) REFERENCES public.carrera(identificador);


--
-- TOC entry 2750 (class 2606 OID 16499)
-- Name: inscripciones_curso inscripciones_curso_idalumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_curso
    ADD CONSTRAINT inscripciones_curso_idalumno_fkey FOREIGN KEY (idalumno) REFERENCES public.alumno(identificador);


--
-- TOC entry 2751 (class 2606 OID 16504)
-- Name: inscripciones_curso inscripciones_curso_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones_curso
    ADD CONSTRAINT inscripciones_curso_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(identificador);


-- Completed on 2020-03-11 13:52:23

--
-- PostgreSQL database dump complete
--

