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
    star_id integer NOT NULL,
    orbital_period_in_years numeric(10,2) NOT NULL,
    diameter_in_km integer,
    is_periodic boolean DEFAULT true,
    last_observed date
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
    age_in_millions_of_years numeric(10,2),
    diameter_in_light_years integer NOT NULL,
    has_life boolean DEFAULT false,
    galaxy_type character varying(20)
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
    diameter_in_km integer NOT NULL,
    has_atmosphere boolean DEFAULT false,
    orbital_period_in_days numeric(10,2)
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
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    diameter_in_km integer,
    distance_from_star_in_au numeric(10,2) NOT NULL,
    planet_type character varying(20)
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
    temperature_in_kelvin integer NOT NULL,
    is_spherical boolean DEFAULT true,
    mass_in_solar_masses numeric(10,2),
    spectral_type character varying(10)
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

INSERT INTO public.comet VALUES (1, 'Halley', 1, 75.32, 11, true, '1986-02-09');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2533.00, 40, true, '1997-04-01');
INSERT INTO public.comet VALUES (3, '67P/Churyumov-Gerasimenko', 1, 6.44, 4, true, '2016-09-30');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600.00, 105700, true, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000.00, 220000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in Local Group', 5000.00, 60000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Famous elliptical galaxy', 13200.00, 240000, false, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Edge-on spiral galaxy', 13000.00, 90000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting grand-design spiral', 8000.00, 76000, false, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27.32);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 0.32);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 1.26);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, true, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121, true, 3.55);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5268, true, 7.15);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820, true, 16.69);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150, true, 15.95);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 1527, false, 4.52);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1468, false, 79.33);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 396, false, 0.94);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4, 504, true, 1.37);
INSERT INTO public.moon VALUES (13, 'Tethys', 4, 1062, false, 1.89);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 1123, false, 2.74);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4, 270, false, 21.28);
INSERT INTO public.moon VALUES (16, 'Phoebe', 4, 213, false, 550.48);
INSERT INTO public.moon VALUES (17, 'Miranda', 5, 471, false, 1.41);
INSERT INTO public.moon VALUES (18, 'Ariel', 5, 1157, false, 2.52);
INSERT INTO public.moon VALUES (19, 'Umbriel', 5, 1169, false, 4.14);
INSERT INTO public.moon VALUES (20, 'Titania', 5, 1576, false, 8.71);
INSERT INTO public.moon VALUES (21, 'Oberon', 5, 1522, false, 13.46);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 12742, 1.00, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 6779, 1.52, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, true, 139820, 5.20, 'Gas Giant');
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, true, 116460, 9.58, 'Gas Giant');
INSERT INTO public.planet VALUES (5, 'Venus', 1, false, true, 12104, 0.72, 'Terrestrial');
INSERT INTO public.planet VALUES (6, 'Mercury', 1, false, true, 4879, 0.39, 'Terrestrial');
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 3, false, true, 14000, 0.05, 'Terrestrial');
INSERT INTO public.planet VALUES (8, 'Kepler-442b', 5, true, true, 12000, 0.41, 'Super-Earth');
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 4, false, true, 140000, 0.05, 'Hot Jupiter');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 2, true, true, 7800, 0.03, 'Terrestrial');
INSERT INTO public.planet VALUES (11, 'Gliese 581 c', 6, false, true, 18000, 0.07, 'Super-Earth');
INSERT INTO public.planet VALUES (12, '55 Cancri e', 1, false, true, 24000, 0.02, 'Super-Earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, true, 1.00, 'G2V');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9940, true, 2.06, 'A1V');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5790, true, 1.10, 'G2V');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3500, true, 11.60, 'M2Iab');
INSERT INTO public.star VALUES (5, 'Vega', 1, 9602, true, 2.14, 'A0V');
INSERT INTO public.star VALUES (6, 'Polaris', 1, 6015, true, 4.50, 'F7Ib');


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

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


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
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

