--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL,
    played_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 5, '2025-12-28 22:43:05.871683');
INSERT INTO public.games VALUES (2, 3, 13, '2025-12-28 22:44:31.586263');
INSERT INTO public.games VALUES (3, 20, 869, '2025-12-28 22:45:44.589205');
INSERT INTO public.games VALUES (4, 21, 922, '2025-12-28 22:45:44.987477');
INSERT INTO public.games VALUES (5, 20, 418, '2025-12-28 22:45:45.114518');
INSERT INTO public.games VALUES (6, 20, 571, '2025-12-28 22:45:45.251146');
INSERT INTO public.games VALUES (7, 20, 578, '2025-12-28 22:45:45.382061');
INSERT INTO public.games VALUES (8, 3, 10, '2025-12-28 22:47:49.523761');
INSERT INTO public.games VALUES (9, 22, 900, '2025-12-28 22:48:07.04314');
INSERT INTO public.games VALUES (10, 23, 554, '2025-12-28 22:48:07.400089');
INSERT INTO public.games VALUES (11, 22, 985, '2025-12-28 22:48:07.593763');
INSERT INTO public.games VALUES (12, 22, 824, '2025-12-28 22:48:07.756956');
INSERT INTO public.games VALUES (13, 22, 593, '2025-12-28 22:48:07.913227');
INSERT INTO public.games VALUES (14, 24, 498, '2025-12-28 22:51:52.067149');
INSERT INTO public.games VALUES (15, 25, 360, '2025-12-28 22:51:52.381268');
INSERT INTO public.games VALUES (16, 24, 729, '2025-12-28 22:51:52.561364');
INSERT INTO public.games VALUES (17, 24, 137, '2025-12-28 22:51:52.661882');
INSERT INTO public.games VALUES (18, 24, 852, '2025-12-28 22:51:52.84543');
INSERT INTO public.games VALUES (19, 26, 732, '2025-12-28 22:57:25.170845');
INSERT INTO public.games VALUES (20, 27, 808, '2025-12-28 22:57:25.471761');
INSERT INTO public.games VALUES (21, 26, 175, '2025-12-28 22:57:25.597674');
INSERT INTO public.games VALUES (22, 26, 763, '2025-12-28 22:57:25.773789');
INSERT INTO public.games VALUES (23, 26, 18, '2025-12-28 22:57:25.863086');
INSERT INTO public.games VALUES (24, 28, 625, '2025-12-28 22:58:50.210232');
INSERT INTO public.games VALUES (25, 29, 752, '2025-12-28 22:58:50.53919');
INSERT INTO public.games VALUES (26, 28, 89, '2025-12-28 22:58:50.637345');
INSERT INTO public.games VALUES (27, 28, 891, '2025-12-28 22:58:50.816112');
INSERT INTO public.games VALUES (28, 28, 168, '2025-12-28 22:58:50.927146');
INSERT INTO public.games VALUES (29, 30, 999, '2025-12-28 23:00:43.782275');
INSERT INTO public.games VALUES (30, 31, 14, '2025-12-28 23:00:44.072337');
INSERT INTO public.games VALUES (31, 30, 891, '2025-12-28 23:00:44.243301');
INSERT INTO public.games VALUES (32, 30, 575, '2025-12-28 23:00:44.40592');
INSERT INTO public.games VALUES (33, 30, 988, '2025-12-28 23:00:44.621954');
INSERT INTO public.games VALUES (34, 32, 565, '2025-12-28 23:00:52.410276');
INSERT INTO public.games VALUES (35, 33, 996, '2025-12-28 23:00:52.795041');
INSERT INTO public.games VALUES (36, 32, 654, '2025-12-28 23:00:52.940397');
INSERT INTO public.games VALUES (37, 32, 210, '2025-12-28 23:00:53.043415');
INSERT INTO public.games VALUES (38, 32, 188, '2025-12-28 23:00:53.142199');
INSERT INTO public.games VALUES (39, 34, 560, '2025-12-28 23:01:00.478555');
INSERT INTO public.games VALUES (40, 35, 588, '2025-12-28 23:01:00.832458');
INSERT INTO public.games VALUES (41, 34, 870, '2025-12-28 23:01:01.011981');
INSERT INTO public.games VALUES (42, 34, 932, '2025-12-28 23:01:01.199155');
INSERT INTO public.games VALUES (43, 34, 445, '2025-12-28 23:01:01.318764');
INSERT INTO public.games VALUES (44, 36, 49, '2025-12-28 23:07:27.866318');
INSERT INTO public.games VALUES (45, 37, 420, '2025-12-28 23:07:28.135375');
INSERT INTO public.games VALUES (46, 36, 525, '2025-12-28 23:07:28.270407');
INSERT INTO public.games VALUES (47, 36, 515, '2025-12-28 23:07:28.406577');
INSERT INTO public.games VALUES (48, 36, 692, '2025-12-28 23:07:28.557901');
INSERT INTO public.games VALUES (49, 38, 6, '2025-12-28 23:07:42.249462');
INSERT INTO public.games VALUES (50, 39, 110, '2025-12-28 23:07:42.52349');
INSERT INTO public.games VALUES (51, 38, 193, '2025-12-28 23:07:42.629886');
INSERT INTO public.games VALUES (52, 38, 172, '2025-12-28 23:07:42.73704');
INSERT INTO public.games VALUES (53, 38, 412, '2025-12-28 23:07:42.86085');
INSERT INTO public.games VALUES (54, 40, 251, '2025-12-28 23:08:16.197991');
INSERT INTO public.games VALUES (55, 41, 971, '2025-12-28 23:08:16.587591');
INSERT INTO public.games VALUES (56, 40, 673, '2025-12-28 23:08:16.736535');
INSERT INTO public.games VALUES (57, 40, 129, '2025-12-28 23:08:16.870914');
INSERT INTO public.games VALUES (58, 40, 556, '2025-12-28 23:08:17.024349');
INSERT INTO public.games VALUES (59, 3, 10, '2025-12-28 23:13:18.407982');
INSERT INTO public.games VALUES (60, 42, 247, '2025-12-28 23:17:24.651872');
INSERT INTO public.games VALUES (61, 43, 393, '2025-12-28 23:17:24.974721');
INSERT INTO public.games VALUES (62, 42, 593, '2025-12-28 23:17:25.125224');
INSERT INTO public.games VALUES (63, 42, 720, '2025-12-28 23:17:25.271144');
INSERT INTO public.games VALUES (64, 42, 717, '2025-12-28 23:17:25.423235');
INSERT INTO public.games VALUES (65, 44, 482, '2025-12-28 23:19:57.122692');
INSERT INTO public.games VALUES (66, 45, 100, '2025-12-28 23:19:57.420966');
INSERT INTO public.games VALUES (67, 44, 191, '2025-12-28 23:19:57.527886');
INSERT INTO public.games VALUES (68, 44, 779, '2025-12-28 23:19:57.686939');
INSERT INTO public.games VALUES (69, 44, 228, '2025-12-28 23:19:57.801057');
INSERT INTO public.games VALUES (70, 46, 681, '2025-12-28 23:20:12.594201');
INSERT INTO public.games VALUES (71, 47, 676, '2025-12-28 23:20:12.932487');
INSERT INTO public.games VALUES (72, 46, 123, '2025-12-28 23:20:13.032793');
INSERT INTO public.games VALUES (73, 46, 261, '2025-12-28 23:20:13.146831');
INSERT INTO public.games VALUES (74, 46, 747, '2025-12-28 23:20:13.311677');
INSERT INTO public.games VALUES (75, 48, 13, '2025-12-28 23:22:48.224054');
INSERT INTO public.games VALUES (76, 48, 879, '2025-12-28 23:22:48.415966');
INSERT INTO public.games VALUES (77, 49, 971, '2025-12-28 23:22:48.680697');
INSERT INTO public.games VALUES (78, 49, 28, '2025-12-28 23:22:48.826568');
INSERT INTO public.games VALUES (79, 48, 83, '2025-12-28 23:22:48.933334');
INSERT INTO public.games VALUES (80, 48, 919, '2025-12-28 23:22:49.10808');
INSERT INTO public.games VALUES (81, 48, 640, '2025-12-28 23:22:49.271183');
INSERT INTO public.games VALUES (82, 50, 973, '2025-12-28 23:24:27.278674');
INSERT INTO public.games VALUES (83, 50, 735, '2025-12-28 23:24:27.454968');
INSERT INTO public.games VALUES (84, 51, 867, '2025-12-28 23:24:27.7143');
INSERT INTO public.games VALUES (85, 51, 253, '2025-12-28 23:24:27.827578');
INSERT INTO public.games VALUES (86, 50, 132, '2025-12-28 23:24:27.931782');
INSERT INTO public.games VALUES (87, 50, 87, '2025-12-28 23:24:28.026976');
INSERT INTO public.games VALUES (88, 50, 944, '2025-12-28 23:24:28.196516');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1766977022906');
INSERT INTO public.users VALUES (2, 'user_1766977022905');
INSERT INTO public.users VALUES (3, 'chae');
INSERT INTO public.users VALUES (4, 'user_1766977225784');
INSERT INTO public.users VALUES (5, 'user_1766977225783');
INSERT INTO public.users VALUES (6, 'user_1766977243130');
INSERT INTO public.users VALUES (7, 'user_1766977243129');
INSERT INTO public.users VALUES (8, 'user_1766978933657');
INSERT INTO public.users VALUES (9, 'user_1766978933656');
INSERT INTO public.users VALUES (10, 'user_1766978983748');
INSERT INTO public.users VALUES (11, 'user_1766978983747');
INSERT INTO public.users VALUES (12, 'user_1766979004073');
INSERT INTO public.users VALUES (13, 'user_1766979004072');
INSERT INTO public.users VALUES (14, 'kayla');
INSERT INTO public.users VALUES (15, 'user_1766979094040');
INSERT INTO public.users VALUES (16, 'user_1766979094039');
INSERT INTO public.users VALUES (17, 'user_1766979412524');
INSERT INTO public.users VALUES (18, 'user_1766979412523');
INSERT INTO public.users VALUES (20, 'user_1766979944209');
INSERT INTO public.users VALUES (21, 'user_1766979944208');
INSERT INTO public.users VALUES (22, 'user_1766980086660');
INSERT INTO public.users VALUES (23, 'user_1766980086659');
INSERT INTO public.users VALUES (24, 'user_1766980311703');
INSERT INTO public.users VALUES (25, 'user_1766980311702');
INSERT INTO public.users VALUES (26, 'user_1766980644789');
INSERT INTO public.users VALUES (27, 'user_1766980644788');
INSERT INTO public.users VALUES (28, 'user_1766980729840');
INSERT INTO public.users VALUES (29, 'user_1766980729839');
INSERT INTO public.users VALUES (30, 'user_1766980843429');
INSERT INTO public.users VALUES (31, 'user_1766980843428');
INSERT INTO public.users VALUES (32, 'user_1766980852036');
INSERT INTO public.users VALUES (33, 'user_1766980852035');
INSERT INTO public.users VALUES (34, 'user_1766980860107');
INSERT INTO public.users VALUES (35, 'user_1766980860106');
INSERT INTO public.users VALUES (36, 'user_1766981247535');
INSERT INTO public.users VALUES (37, 'user_1766981247534');
INSERT INTO public.users VALUES (38, 'user_1766981261974');
INSERT INTO public.users VALUES (39, 'user_1766981261973');
INSERT INTO public.users VALUES (40, 'user_1766981295910');
INSERT INTO public.users VALUES (41, 'user_1766981295909');
INSERT INTO public.users VALUES (42, 'user_1766981844262');
INSERT INTO public.users VALUES (43, 'user_1766981844261');
INSERT INTO public.users VALUES (44, 'user_1766981996758');
INSERT INTO public.users VALUES (45, 'user_1766981996757');
INSERT INTO public.users VALUES (46, 'user_1766982012235');
INSERT INTO public.users VALUES (47, 'user_1766982012234');
INSERT INTO public.users VALUES (48, 'user_1766982168042');
INSERT INTO public.users VALUES (49, 'user_1766982168041');
INSERT INTO public.users VALUES (50, 'user_1766982266976');
INSERT INTO public.users VALUES (51, 'user_1766982266975');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 88, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 51, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

