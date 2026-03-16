--
-- PostgreSQL database dump
--

\restrict C8cNZsERG5DNjamLNUxC7jJJR2iCs5JXsDUhC6bVhuFK0yMk4L8C45KyF0tf1pj

-- Dumped from database version 17.8
-- Dumped by pg_dump version 17.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nombre_admin character varying(100) NOT NULL,
    correo character varying(100) NOT NULL,
    telefono character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_admin_seq OWNER TO postgres;

--
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- Name: asistencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asistencia (
    id_asistencia integer NOT NULL,
    id_usuario integer,
    fecha date,
    horas_extra integer DEFAULT 0,
    id_semana integer
);


ALTER TABLE public.asistencia OWNER TO postgres;

--
-- Name: asistencia_id_asistencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asistencia_id_asistencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asistencia_id_asistencia_seq OWNER TO postgres;

--
-- Name: asistencia_id_asistencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asistencia_id_asistencia_seq OWNED BY public.asistencia.id_asistencia;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empresa (
    id_empresa integer NOT NULL,
    nombre_empresa character varying(30) NOT NULL,
    colonia character varying(30) NOT NULL,
    calle character varying(30) NOT NULL,
    c_p character varying(30) NOT NULL,
    nombre_encargado character varying(50) NOT NULL,
    telefono_encargado character varying(20) NOT NULL,
    id_turno integer,
    id_transporte integer,
    pago_turno numeric(10,2) NOT NULL,
    hora_extra numeric(10,2) NOT NULL
);


ALTER TABLE public.empresa OWNER TO postgres;

--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.empresa_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empresa_id_empresa_seq OWNER TO postgres;

--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.empresa_id_empresa_seq OWNED BY public.empresa.id_empresa;


--
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_semana integer NOT NULL,
    monto numeric(5,2) NOT NULL,
    id_pago integer,
    fecha_pago date
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- Name: pago_id_semana_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_semana_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_semana_seq OWNER TO postgres;

--
-- Name: pago_id_semana_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_semana_seq OWNED BY public.pago.id_semana;


--
-- Name: semana_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semana_pago (
    id_semana integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    pagado boolean DEFAULT false
);


ALTER TABLE public.semana_pago OWNER TO postgres;

--
-- Name: semana_pago_id_semana_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semana_pago_id_semana_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semana_pago_id_semana_seq OWNER TO postgres;

--
-- Name: semana_pago_id_semana_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semana_pago_id_semana_seq OWNED BY public.semana_pago.id_semana;


--
-- Name: tipo_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_pago (
    id_pago integer NOT NULL,
    descripcion character varying(20) NOT NULL
);


ALTER TABLE public.tipo_pago OWNER TO postgres;

--
-- Name: tipo_pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_pago_id_pago_seq OWNER TO postgres;

--
-- Name: tipo_pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_pago_id_pago_seq OWNED BY public.tipo_pago.id_pago;


--
-- Name: tipo_turno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_turno (
    id_turno integer NOT NULL,
    nombre_turno character varying(20) NOT NULL
);


ALTER TABLE public.tipo_turno OWNER TO postgres;

--
-- Name: tipo_turno_id_turno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_turno_id_turno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipo_turno_id_turno_seq OWNER TO postgres;

--
-- Name: tipo_turno_id_turno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_turno_id_turno_seq OWNED BY public.tipo_turno.id_turno;


--
-- Name: transporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transporte (
    id_transporte integer NOT NULL,
    origen character varying(100) NOT NULL,
    destino character varying(100),
    nombre character varying(50) NOT NULL,
    camioneta character varying(30) NOT NULL,
    salario numeric NOT NULL,
    viajes_realizados integer NOT NULL,
    telefono character varying(30) NOT NULL,
    numero_cuenta character varying(30),
    id_pago integer,
    pago_realizado boolean DEFAULT false,
    fecha_pago date
);


ALTER TABLE public.transporte OWNER TO postgres;

--
-- Name: transporte_id_transporte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transporte_id_transporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transporte_id_transporte_seq OWNER TO postgres;

--
-- Name: transporte_id_transporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transporte_id_transporte_seq OWNED BY public.transporte.id_transporte;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(30) NOT NULL,
    ap_paterno character varying(30) NOT NULL,
    ap_materno character varying(30) NOT NULL,
    puesto character varying(50) NOT NULL,
    colonia character varying(30) NOT NULL,
    calle character varying(30) NOT NULL,
    codigo_postal character varying(30),
    telefono character varying(20) NOT NULL,
    numero_cuenta character varying(30),
    id_pago integer,
    id_empresa integer,
    pago_realizado boolean DEFAULT false,
    estatus boolean DEFAULT true
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- Name: asistencia id_asistencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia ALTER COLUMN id_asistencia SET DEFAULT nextval('public.asistencia_id_asistencia_seq'::regclass);


--
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa ALTER COLUMN id_empresa SET DEFAULT nextval('public.empresa_id_empresa_seq'::regclass);


--
-- Name: pago id_semana; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_semana SET DEFAULT nextval('public.pago_id_semana_seq'::regclass);


--
-- Name: semana_pago id_semana; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semana_pago ALTER COLUMN id_semana SET DEFAULT nextval('public.semana_pago_id_semana_seq'::regclass);


--
-- Name: tipo_pago id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_pago ALTER COLUMN id_pago SET DEFAULT nextval('public.tipo_pago_id_pago_seq'::regclass);


--
-- Name: tipo_turno id_turno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_turno ALTER COLUMN id_turno SET DEFAULT nextval('public.tipo_turno_id_turno_seq'::regclass);


--
-- Name: transporte id_transporte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporte ALTER COLUMN id_transporte SET DEFAULT nextval('public.transporte_id_transporte_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- Name: asistencia asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_pkey PRIMARY KEY (id_asistencia);


--
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_semana);


--
-- Name: semana_pago semana_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semana_pago
    ADD CONSTRAINT semana_pago_pkey PRIMARY KEY (id_semana);


--
-- Name: tipo_pago tipo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_pago
    ADD CONSTRAINT tipo_pago_pkey PRIMARY KEY (id_pago);


--
-- Name: tipo_turno tipo_turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_turno
    ADD CONSTRAINT tipo_turno_pkey PRIMARY KEY (id_turno);


--
-- Name: transporte transporte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT transporte_pkey PRIMARY KEY (id_transporte);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: asistencia asistencia_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE CASCADE;


--
-- Name: empresa empresa_id_transporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_id_transporte_fkey FOREIGN KEY (id_transporte) REFERENCES public.transporte(id_transporte);


--
-- Name: empresa empresa_id_turno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empresa
    ADD CONSTRAINT empresa_id_turno_fkey FOREIGN KEY (id_turno) REFERENCES public.tipo_turno(id_turno);


--
-- Name: asistencia fk_semana; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT fk_semana FOREIGN KEY (id_semana) REFERENCES public.semana_pago(id_semana);


--
-- Name: transporte fk_tipo_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT fk_tipo_pago FOREIGN KEY (id_pago) REFERENCES public.tipo_pago(id_pago);


--
-- Name: usuario fk_tipo_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_tipo_pago FOREIGN KEY (id_pago) REFERENCES public.tipo_pago(id_pago);


--
-- Name: pago pago_id_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES public.tipo_pago(id_pago);


--
-- Name: usuario usuario_id_empresa_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES public.empresa(id_empresa);


--
-- PostgreSQL database dump complete
--

\unrestrict C8cNZsERG5DNjamLNUxC7jJJR2iCs5JXsDUhC6bVhuFK0yMk4L8C45KyF0tf1pj

