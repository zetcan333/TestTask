--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2023-12-16 13:52:01

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16416)
-- Name: Cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cars" (
    car_id integer NOT NULL,
    model text NOT NULL,
    car_year integer,
    color character varying(15),
    reg_number character varying(6),
    status character varying(10),
    price_per_day numeric
);


ALTER TABLE public."Cars" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16411)
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    client_id integer NOT NULL,
    client_name character varying(20) NOT NULL,
    phone character varying(11) NOT NULL,
    license character varying(6) NOT NULL,
    is_blocked boolean NOT NULL
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16429)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    order_id integer NOT NULL,
    client_id integer NOT NULL,
    car_id integer NOT NULL,
    day_start date NOT NULL,
    day_end date NOT NULL,
    status character varying(10) NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 4853 (class 0 OID 16416)
-- Dependencies: 216
-- Data for Name: Cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cars" (car_id, model, car_year, color, reg_number, status, price_per_day) FROM stdin;
2	volkswagen amarok	2013	Синий	К442КУ	Свободна	4500
3	infiniti qx60	2019	Черный	У500КВ	Арендована	7000
1	volvo v60	2012	Красный	А622ММ	Свободна	3500
4	BMW x5	2022	Белый	С002ХВ	Арендована	7500
\.


--
-- TOC entry 4852 (class 0 OID 16411)
-- Dependencies: 215
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clients" (client_id, client_name, phone, license, is_blocked) FROM stdin;
5	Васильева Мария	89000294051	590654	f
3	Иванов Фёдор	89001503107	384940	f
2	Кудряшова Анастасия	89004380455	838505	f
1	Гусев Сергей	89008235485	778973	f
4	Давыдов Максим	89006454578	460653	f
\.


--
-- TOC entry 4854 (class 0 OID 16429)
-- Dependencies: 217
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" (order_id, client_id, car_id, day_start, day_end, status) FROM stdin;
7	5	3	2023-11-29	2023-12-03	бронь
5	3	2	2023-11-10	2023-11-15	закрыт
4	1	4	2023-10-20	2023-10-22	закрыт
2	1	1	2023-10-04	2023-10-07	закрыт
1	2	3	2023-10-02	2023-10-05	закрыт
8	1	4	2023-11-28	2023-12-03	бронь
3	4	4	2023-10-12	2023-10-14	отменен
6	4	4	2023-11-20	2023-11-22	отменен
\.


--
-- TOC entry 4706 (class 2606 OID 16461)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (order_id);


--
-- TOC entry 4702 (class 2606 OID 16420)
-- Name: Cars pk_car_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars"
    ADD CONSTRAINT pk_car_id PRIMARY KEY (car_id);


--
-- TOC entry 4696 (class 2606 OID 16415)
-- Name: Clients pk_client_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT pk_client_id PRIMARY KEY (client_id);


--
-- TOC entry 4698 (class 2606 OID 16424)
-- Name: Clients u_drivers_license; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT u_drivers_license UNIQUE (license);


--
-- TOC entry 4700 (class 2606 OID 16422)
-- Name: Clients u_phone_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT u_phone_number UNIQUE (phone);


--
-- TOC entry 4704 (class 2606 OID 16473)
-- Name: Cars u_registration_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars"
    ADD CONSTRAINT u_registration_number UNIQUE (reg_number);


--
-- TOC entry 4707 (class 2606 OID 16467)
-- Name: Orders fk_car_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES public."Cars"(car_id) NOT VALID;


--
-- TOC entry 4708 (class 2606 OID 16462)
-- Name: Orders fk_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES public."Clients"(client_id) NOT VALID;


-- Completed on 2023-12-16 13:52:01

--
-- PostgreSQL database dump complete
--

