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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    name character varying(20) NOT NULL,
    size_in_km integer NOT NULL,
    star_id integer NOT NULL,
    asteroids_id integer NOT NULL
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    description character varying(60),
    age_in_millions_of_years integer,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    years_with_life integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth_in_light_yr numeric(10,2),
    description character varying(60),
    age_in_millions_of_years integer,
    years_with_life integer,
    type character varying(40),
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60) NOT NULL,
    has_life boolean,
    description text,
    is_spherical boolean,
    type character varying(40),
    planet_id integer NOT NULL,
    age_in_millions_of_years integer,
    years_with_life integer,
    star_id integer NOT NULL
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
    description character varying(60),
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    years_with_life integer,
    has_life boolean,
    galaxy_id integer NOT NULL
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
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES ('Ceres', 940, 1, 1);
INSERT INTO public.asteroids VALUES ('Vesta', 525, 1, 2);
INSERT INTO public.asteroids VALUES ('Pallas', 512, 1, 3);
INSERT INTO public.asteroids VALUES ('Hygiea', 431, 1, 4);
INSERT INTO public.asteroids VALUES ('Eros', 17, 1, 5);
INSERT INTO public.asteroids VALUES ('Rigil-Alpha 1', 50, 2, 6);
INSERT INTO public.asteroids VALUES ('Rigil-Alpha 2', 120, 2, 7);
INSERT INTO public.asteroids VALUES ('Dog Star Fragment', 5, 3, 8);
INSERT INTO public.asteroids VALUES ('Giant Debris A', 300, 4, 9);
INSERT INTO public.asteroids VALUES ('Giant Debris B', 450, 4, 10);
INSERT INTO public.asteroids VALUES ('Alpha-Andro 1', 12, 5, 11);
INSERT INTO public.asteroids VALUES ('Alpha-Andro 2', 88, 5, 12);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('A barred spiral galaxy containing our Solar System.', 13600, 'Milky Way', 1, 4500);
INSERT INTO public.galaxy VALUES ('The closest major galaxy to the Milky Way.', 10000, 'Andromeda', 2, 0);
INSERT INTO public.galaxy VALUES ('A spiral galaxy and the third-largest in the Local Group.', 12000, 'Triangulum', 3, 0);
INSERT INTO public.galaxy VALUES ('Famous for its bright nucleus and thick dust lane.', 9000, 'Sombrero', 4, 0);
INSERT INTO public.galaxy VALUES ('A classic spiral galaxy interacting with a smaller one.', 400, 'Whirlpool', 5, 0);
INSERT INTO public.galaxy VALUES ('Features a spectacular dark band of absorbing dust.', 13000, 'Black Eye', 6, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', false, true, 0.00, 'Earths only natural satellite.', 4510, 0, 'Terrestrial', 1, 1);
INSERT INTO public.moon VALUES ('Lilith', false, false, 0.01, 'A captured dark asteroid in high orbit.', 1000, 0, 'Asteroid', 2, 1);
INSERT INTO public.moon VALUES ('Phobos', false, false, 0.00, 'Small, irregular moon orbiting Mars.', 4500, 0, 'Asteroid', 3, 2);
INSERT INTO public.moon VALUES ('Deimos', false, false, 0.00, 'Smaller, outermost moon of Mars.', 4500, 0, 'Asteroid', 4, 2);
INSERT INTO public.moon VALUES ('Rigil Minor', false, true, 4.37, 'A rocky moon reflecting light from three suns.', 5000, 0, 'Rocky', 5, 3);
INSERT INTO public.moon VALUES ('Anubis', false, true, 8.60, 'Heavy volcanic activity caused by tidal heating.', 200, 0, 'Volcanic', 6, 4);
INSERT INTO public.moon VALUES ('Osiris', false, false, 8.60, 'A shard of crust blown off by a collision.', 150, 0, 'Fragment', 7, 4);
INSERT INTO public.moon VALUES ('Dusty', false, false, 640.00, 'A collection of debris held by weak gravity.', 5, 0, 'Debris', 8, 5);
INSERT INTO public.moon VALUES ('A-1', false, true, 2500000.00, 'Large icy moon with a thin oxygen atmosphere.', 150, 0, 'Icy', 9, 6);
INSERT INTO public.moon VALUES ('A-2', false, true, 2500000.00, 'Ocean moon with internal heating.', 150, 0, 'Icy', 10, 6);
INSERT INTO public.moon VALUES ('A-3', false, false, 2500000.00, 'Irregular potato-shaped moon.', 100, 0, 'Rocky', 11, 6);
INSERT INTO public.moon VALUES ('A-4', false, false, 2500000.00, 'Outer-rim moon with a retrograde orbit.', 100, 0, 'Rocky', 12, 6);
INSERT INTO public.moon VALUES ('Sub-Zero', true, true, 2500000.00, 'Home to extremophile bacteria in ice vents.', 1000, 10, 'Icy', 13, 7);
INSERT INTO public.moon VALUES ('Frost', false, true, 2500000.00, 'A small, bright, highly reflective moon.', 800, 0, 'Icy', 14, 7);
INSERT INTO public.moon VALUES ('Metal-Head', false, true, 3000000.00, 'Core is almost pure iron.', 80, 0, 'Metallic', 15, 8);
INSERT INTO public.moon VALUES ('Conductive', false, false, 3000000.00, 'Sparks with static electricity from the planet.', 50, 0, 'Irregular', 16, 8);
INSERT INTO public.moon VALUES ('Fire-Fly', false, false, 3000000.00, 'Covered in fresh lava flows.', 2, 0, 'Volcanic', 17, 9);
INSERT INTO public.moon VALUES ('Rim-Walker', false, true, 55000000.00, 'Orbits at a steep angle to the planets equator.', 6000, 0, 'Rocky', 18, 10);
INSERT INTO public.moon VALUES ('Dust-Mite', false, false, 55000000.00, 'Tiny moonlet hidden in a dust ring.', 4000, 0, 'Asteroid', 19, 10);
INSERT INTO public.moon VALUES ('Tidal', false, true, 23000000.00, 'Causes massive waves on the planet surface.', 400, 0, 'Rocky', 20, 11);
INSERT INTO public.moon VALUES ('Wave', false, true, 23000000.00, 'Small icy moon with smooth surface.', 350, 0, 'Icy', 21, 11);
INSERT INTO public.moon VALUES ('Current', false, true, 23000000.00, 'Inner moon that speeds through the magnetosphere.', 300, 0, 'Rocky', 22, 11);
INSERT INTO public.moon VALUES ('Surge', false, false, 23000000.00, 'Outer moon with an eccentric orbit.', 400, 0, 'Asteroid', 23, 11);
INSERT INTO public.moon VALUES ('Pupil', false, true, 17000000.00, 'A perfectly spherical black moon.', 2500, 0, 'Carbon', 24, 12);
INSERT INTO public.moon VALUES ('Cornea', false, true, 17000000.00, 'Translucent crystalline surface.', 2000, 0, 'Crystalline', 25, 12);
INSERT INTO public.moon VALUES ('Sclera', false, false, 17000000.00, 'Irregular grey moon.', 2500, 0, 'Rocky', 26, 12);
INSERT INTO public.moon VALUES ('Silhouette', false, true, 17000000.00, 'Almost invisible against the dark sky.', 2500, 0, 'Rocky', 27, 13);
INSERT INTO public.moon VALUES ('Umbra', false, true, 17000000.00, 'Eclipses the planet once every 4 hours.', 2500, 0, 'Rocky', 28, 13);
INSERT INTO public.moon VALUES ('Penumbra', false, true, 17000000.00, 'Orbits far out in the planets shadow.', 2500, 0, 'Icy', 29, 13);
INSERT INTO public.moon VALUES ('Eclipse', false, false, 17000000.00, 'A small moon with a sharp, jagged shape.', 2000, 0, 'Fragment', 30, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', true, 'Third planet from the Sun, mostly water.', true, 'Terrestrial', 1, 4543, 4000, 1);
INSERT INTO public.planet VALUES ('Mars', false, 'The Red Planet, home to Olympus Mons.', true, 'Terrestrial', 2, 4600, 0, 1);
INSERT INTO public.planet VALUES ('Rigil Kentaurus Bb', false, 'A rocky planet in a triple star system.', true, 'Terrestrial', 3, 5000, 0, 2);
INSERT INTO public.planet VALUES ('Dog Star Prime', false, 'Scorching desert world near a bright star.', true, 'Desert', 4, 200, 0, 3);
INSERT INTO public.planet VALUES ('Giant’s Pebble', false, 'Irregular planet being slowly pulled apart.', false, 'Rocky', 5, 8, 0, 4);
INSERT INTO public.planet VALUES ('Andromeda Prime', false, 'A massive gas giant with blue clouds.', true, 'Gas Giant', 6, 180, 0, 5);
INSERT INTO public.planet VALUES ('Mirach Outpost', true, 'Frozen world with subsurface bacterial life.', true, 'Ice World', 7, 1200, 10, 6);
INSERT INTO public.planet VALUES ('Triangulum Alpha', false, 'High gravity world with metallic rain.', true, 'Metallic', 8, 90, 0, 7);
INSERT INTO public.planet VALUES ('Wolf’s Den', false, 'A young, volcanic planet formed recently.', true, 'Volcanic', 9, 4, 0, 8);
INSERT INTO public.planet VALUES ('Hat Brim', false, 'Orbits on the edge of the galactic disk.', true, 'Rocky', 10, 7000, 0, 9);
INSERT INTO public.planet VALUES ('Vortex', false, 'Tidally locked planet facing a whirlpool.', true, 'Oceanic', 11, 400, 0, 10);
INSERT INTO public.planet VALUES ('Dark Iris', false, 'Dark, carbon-heavy planet.', true, 'Carbon', 12, 2500, 0, 11);
INSERT INTO public.planet VALUES ('Shadow', false, 'Small moon-sized planet orbiting the edge.', true, 'Frozen', 13, 2500, 0, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The yellow dwarf star at the center of our Solar System.', 'Sol', 4600, 4500, true, 1);
INSERT INTO public.star VALUES (2, 'A solar-type star and part of the closest star system.', 'Alpha Centauri A', 6000, 0, false, 1);
INSERT INTO public.star VALUES (3, 'The brightest star in Earths night sky.', 'Sirius', 242, 0, false, 1);
INSERT INTO public.star VALUES (4, 'A massive red supergiant nearing the end of its life.', 'Betelgeuse', 10, 0, false, 1);
INSERT INTO public.star VALUES (5, 'The brightest star in the constellation of Andromeda.', 'Alpheratz', 200, 0, false, 2);
INSERT INTO public.star VALUES (6, 'A cool, red giant star in the Andromeda galaxy.', 'Mirach', 1500, 0, false, 2);
INSERT INTO public.star VALUES (7, 'A variable star in the Triangulum galaxy.', 'M33-V1', 100, 0, false, 3);
INSERT INTO public.star VALUES (8, 'A massive Wolf-Rayet star with high luminosity.', 'WR 2', 5, 0, false, 3);
INSERT INTO public.star VALUES (9, 'A bright star located in the Sombrero galaxy nucleus.', 'Sombrero-Alpha', 8000, 0, false, 4);
INSERT INTO public.star VALUES (10, 'A distant variable star in the Whirlpool spiral.', 'M51-V1', 500, 0, false, 5);
INSERT INTO public.star VALUES (11, 'A bright star in the spectacular dark band region.', 'B.E. Luminous', 3000, 0, false, 6);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 12, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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
-- Name: asteroids asteroids_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

