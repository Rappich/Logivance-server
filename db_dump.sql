--
-- PostgreSQL database dump
-- This data is for development and testing purposes only.
-- Importing this data into a production database is not recommended.
-- If you do so, make sure to change all default passwords and review the data for sensitive information.
--

\restrict OGl9heLiSo2TTIYE1ubeiDY37bXOMhg36WZpuW8v1d4YEfYAnbbuYSss9pZCKdJ

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: user
--
CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);

ALTER TABLE public.alembic_version OWNER TO "user";

--
-- Name: control_unit_data; Type: TABLE; Schema: public; Owner: user
--
CREATE TABLE public.control_unit_data (
    id uuid NOT NULL,
    sensor_unit_id uuid NOT NULL,
    control_unit_id uuid NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now() NOT NULL,
    humidity jsonb NOT NULL,
    temperature jsonb NOT NULL
);

ALTER TABLE public.control_unit_data OWNER TO "user";

--
-- Name: shipments; Type: TABLE; Schema: public; Owner: user
--
CREATE TABLE public.shipments (
    id uuid NOT NULL,
    shipment_number character varying(100) NOT NULL,
    sender_id uuid NOT NULL,
    receiver_id uuid NOT NULL,
    driver_id uuid,
    sensor_unit_id uuid,
    created_at timestamp without time zone DEFAULT NOW() NOT NULL
);

ALTER TABLE public.shipments OWNER TO "user";

--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--
CREATE TABLE public.users (
    id uuid NOT NULL,
    username character varying NOT NULL,
    hashed_password character varying NOT NULL,
    role character varying NOT NULL,
    created_at timestamp without time zone DEFAULT NOW() NOT NULL
);

ALTER TABLE public.users OWNER TO "user";

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: user
--
COPY public.alembic_version (version_num) FROM stdin;
287246b0adf9
\.

--
-- Data for Name: control_unit_data; Type: TABLE DATA; Schema: public; Owner: user
--
COPY public.control_unit_data (id, sensor_unit_id, control_unit_id, "timestamp", humidity, temperature) FROM stdin;
\.

--
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: user
--
COPY public.shipments (id, shipment_number, sender_id, receiver_id, driver_id, sensor_unit_id) FROM stdin;
\.

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--
COPY public.users (id, username, hashed_password, role) FROM stdin;
9b6d0755-21ef-4dec-afc2-9743d2737716	admin	$2b$12$YbqAZgnmO1NAaQ7dKcYSTOvBoxYrARom6IrCl7bhuKamETVFIgTb2	admin
4f5b3153-d957-41de-b0c5-20cfdce11756	customer1	$2b$12$0ziev1yHZYcJOMgfK/jwL.Jcm2xGosPEGEB4W1ZX1dWLXkbTY4RPy	customer
\.

--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: user
--
ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);

--
-- Name: control_unit_data control_unit_data_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--
ALTER TABLE ONLY public.control_unit_data
    ADD CONSTRAINT control_unit_data_pkey PRIMARY KEY (id);

--
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--
ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);

--
-- Name: shipments shipments_shipment_number_key; Type: CONSTRAINT; Schema: public; Owner: user
--
ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_shipment_number_key UNIQUE (shipment_number);

--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);

--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--
ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);

--
-- Foreign Keys for shipments
--
ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.users(id);

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);

\unrestrict OGl9heLiSo2TTIYE1ubeiDY37bXOMhg36WZpuW8v1d4YEfYAnbbuYSss9pZCKdJ
