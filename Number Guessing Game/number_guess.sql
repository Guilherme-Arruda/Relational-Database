--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1685128320519', 2, 978);
INSERT INTO public.users VALUES (2, 'user_1685128320520', 5, 852);
INSERT INTO public.users VALUES (3, 'user_1685130426923', 2, 256);
INSERT INTO public.users VALUES (4, 'user_1685129498141', 2, 507);
INSERT INTO public.users VALUES (4, 'user_1685129498142', 5, 370);
INSERT INTO public.users VALUES (5, 'user_1685130426924', 5, 150);
INSERT INTO public.users VALUES (6, 'user_1685129519324', 2, 402);
INSERT INTO public.users VALUES (7, 'user_1685129519325', 5, 48);
INSERT INTO public.users VALUES (8, 'user_1685129594445', 2, 210);
INSERT INTO public.users VALUES (9, 'user_1685130453274', 2, 705);
INSERT INTO public.users VALUES (10, 'user_1685129594446', 5, 283);
INSERT INTO public.users VALUES (11, 'user_1685129802947', 2, 127);
INSERT INTO public.users VALUES (12, 'user_1685130453275', 5, 448);
INSERT INTO public.users VALUES (13, 'user_1685129802948', 5, 857);
INSERT INTO public.users VALUES (14, 'user_1685129812474', 2, 416);
INSERT INTO public.users VALUES (15, 'user_1685130466332', 2, 484);
INSERT INTO public.users VALUES (16, 'user_1685129812475', 5, 673);
INSERT INTO public.users VALUES (17, 'user_1685129856752', 2, 318);
INSERT INTO public.users VALUES (18, 'user_1685130466333', 5, 180);
INSERT INTO public.users VALUES (19, 'user_1685129856753', 5, 162);
INSERT INTO public.users VALUES (20, 'user_1685129864967', 2, 372);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

