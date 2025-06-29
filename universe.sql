--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_in_years numeric(10,2) NOT NULL,
    last_perihelion date,
    is_periodic boolean NOT NULL,
    nucleus_diameter_in_km integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_billions_of_years numeric(4,2) NOT NULL,
    diameter_in_light_years integer NOT NULL,
    is_spiral boolean,
    has_supermassive_black_hole boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_in_days numeric(10,4) NOT NULL,
    is_tidally_locked boolean NOT NULL,
    has_ice boolean,
    diameter_in_km integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    orbital_period_in_days numeric(10,2) NOT NULL,
    has_atmosphere boolean,
    is_habitable boolean,
    mass_in_earths numeric(8,3),
    diameter_in_km integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10) NOT NULL,
    temperature_in_kelvin integer,
    is_variable boolean,
    luminosity numeric(10,2) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 75.32, '1986-02-09', true, 11);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533.00, '1997-04-01', true, 60);
INSERT INTO public.comet VALUES (3, 'NEOWISE', 6766.00, '2020-07-03', true, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13.61, 105700, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to Milky Way', 10.01, 152000, true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in Local Group', 6.00, 60000, true, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Famous for its supermassive black hole', 12.93, 240000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Resembles a Mexican hat', 13.25, 90000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting grand-design spiral galaxy', 13.00, 76000, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27.3200, true, true, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.3189, true, false, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.2624, true, false, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.7691, true, false, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.5512, true, true, 3121);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.1546, true, true, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.6890, true, true, 4820);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 0.9424, true, true, 396);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1.3702, true, true, 504);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1.8878, true, true, 1062);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 2.7369, true, true, 1123);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 4.5175, true, true, 1528);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 15.9454, true, true, 5149);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 79.3215, true, true, 1469);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 1.4135, true, true, 472);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 2.5204, true, true, 1158);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 4.1442, true, true, 1169);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 8.7059, true, true, 1577);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 13.4632, true, true, 1523);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 5.8769, true, true, 2706);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 87.97, false, false, 0.055, 4879);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 224.70, true, false, 0.815, 12104);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 365.25, true, true, 1.000, 12742);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 686.98, true, false, 0.107, 6779);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4332.59, true, false, 317.830, 139820);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 10759.22, true, false, 95.160, 116460);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 30688.50, true, false, 14.540, 50724);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 60182.00, true, false, 17.150, 49244);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6, 11.19, true, true, 1.270, 14800);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 6, 112.31, true, true, 2.360, 14500);
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 6, 12.93, true, false, 5.500, 18000);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 6, 3.52, true, false, 220.000, 171600);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, false, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 9940, false, 25.40);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'M1-2Ia-ab', 3500, true, 126000.00);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0Va', 9602, false, 40.12);
INSERT INTO public.star VALUES (5, 'Polaris', 1, 'F7Ib-II', 6015, true, 2200.00);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'G2V', 5790, false, 1.52);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

