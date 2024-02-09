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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(10),
    age_in_million_years numeric,
    distance_from_earth_in_ly integer,
    description text
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
    planet_id integer,
    diameter_km numeric,
    orbital_period_days numeric,
    distance_from_host_planet_km integer,
    name character varying(50) NOT NULL
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
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    planet_type character varying(50),
    number_of_moons integer NOT NULL,
    name character varying(30) NOT NULL
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20),
    planet_id integer
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    spectral_type character varying(10),
    avg_temperature_celsius integer,
    luminosity_watts_or_timesluminosityofsun_lsun character varying(20),
    name character varying NOT NULL
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13610, 26000, 'It is a large spiral galaxy that contains Earth’s solar system. It includes the multitude of stars whose light is seen as the Milky Way, the irregular luminous band that encircles the sky, defining the plane of the galactic disk. The Milky Way system contains hundreds of billions of stars and large amounts of interstellar gas and dust.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 'Spiral', 10010, 2480000, 'Also known as NGC 224, Andromeda Galaxy is a great spiral galaxy in the constellation Andromeda, the nearest large galaxy to the Milky Way, our home galaxy. The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur.');
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Elliptical', 3, 760000000, 'Cygnus A is a galaxy in the middle of a galaxy cluster that has such a jet shooting away from a supermassive black hole at its center. Data from NASA reveal this jet has bounced off a wall of hot gas, then punched a hole in a cloud of particles.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 160000, 'The Large Magellanic Cloud, a satellite galaxy of the Milky Way, floats in space, in a long and slow dance around our galaxy. Vast clouds of gas within it slowly collapse to form new stars. In turn, these light up the gas clouds in a riot of colors, visible in this image from the NASA/ESA Hubble Space Telescope.');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Irregular', 13000, 190000, 'The Small Magellanic Cloud (SMC) or Nubecula Minor is a dwarf galaxy near the Milky Way. The galaxy is located across the constellation of Tucana and part of Hydrus, appearing as a faint hazy patch resembling a detached piece of the Milky Way. The SMC has an average apparent diameter of about 4.2° and thus covers an area of about 14 square degrees.');
INSERT INTO public.galaxy VALUES (5, 'NGC 3169', 'Peculiar', 1000, 70000000, ' NGC 3169 is an interacting galaxy, a subtype of peculiar galaxies, located in the constellation of Sextans. It has a small bright nucleus and multiple dust lanes that appear in silhouette against the large central bulge. The spiral arm pattern is of the filamentary type.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 3474, 27.3, 384400, 'Moon/Luna');
INSERT INTO public.moon VALUES (2, 4, 22.2, 0.32, 9378, 'Phobos');
INSERT INTO public.moon VALUES (3, 4, 12.4, 1.26, 23460, 'Deimos');
INSERT INTO public.moon VALUES (4, 5, 3643, 1.8, 421800, 'Io');
INSERT INTO public.moon VALUES (5, 5, 3121, 3.6, 671034, 'Europe');
INSERT INTO public.moon VALUES (6, 5, 5268, 7.2, 1070412, 'Ganymede');
INSERT INTO public.moon VALUES (7, 5, 4820, 16.7, 1882709, 'Callisto');
INSERT INTO public.moon VALUES (8, 5, 168, 0.5, 181365, 'Amalthea');
INSERT INTO public.moon VALUES (9, 6, 5150, 15.9, 1222858, 'Titan');
INSERT INTO public.moon VALUES (10, 6, 504, 1.4, 238020, 'Enceladus');
INSERT INTO public.moon VALUES (11, 6, 396, 0.9, 185539, 'Mimas');
INSERT INTO public.moon VALUES (12, 6, 1471, 79.3, 3561300, 'Iapetus');
INSERT INTO public.moon VALUES (13, 6, 1527, 4.5, 527108, 'Rhea');
INSERT INTO public.moon VALUES (14, 7, 1578, 8.7, 436300, 'Titania');
INSERT INTO public.moon VALUES (15, 7, 1523, 13.5, 583500, 'Oberon');
INSERT INTO public.moon VALUES (16, 7, 1169, 4.1, 266000, 'Umbriel');
INSERT INTO public.moon VALUES (17, 7, 1157, 2.5, 191000, 'Ariel');
INSERT INTO public.moon VALUES (18, 7, 471, 1.4, 129900, 'Miranda');
INSERT INTO public.moon VALUES (19, 8, 2706, 5.9, 354800, 'Triton');
INSERT INTO public.moon VALUES (20, 8, 420, 1.1, 117600, 'Proteus');
INSERT INTO public.moon VALUES (21, 8, 170, 360.1, 5513400, 'Nereid');
INSERT INTO public.moon VALUES (22, 8, 194, 0.55, 73500, 'Larissa');
INSERT INTO public.moon VALUES (23, 8, 148, 0.33, 52500, 'Despina');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, false, true, 'Terrestrial', 0, 'Mercury');
INSERT INTO public.planet VALUES (2, 1, false, true, 'Terrestrial', 0, 'Venus');
INSERT INTO public.planet VALUES (3, 1, true, true, 'Terrestrial', 1, 'Earth');
INSERT INTO public.planet VALUES (4, 1, false, true, 'Terrestrial', 2, 'Mars');
INSERT INTO public.planet VALUES (5, 1, false, true, 'Gas Giant', 95, 'Jupiter');
INSERT INTO public.planet VALUES (6, 1, false, true, 'Gas Giant', 146, 'Saturn');
INSERT INTO public.planet VALUES (7, 1, false, true, 'Ice Giant', 27, 'Uranus');
INSERT INTO public.planet VALUES (8, 1, false, true, 'Ice Giant', 14, 'Neptune');
INSERT INTO public.planet VALUES (9, 9, false, true, 'Super-Earth Exoplanet', 0, 'Proxima Centauri b');
INSERT INTO public.planet VALUES (10, 9, false, true, 'Sub-Earth Exoplanet', 0, 'Proxima Centauri d');
INSERT INTO public.planet VALUES (11, 10, false, true, 'Terrestrial Super-Earth Exoplanet', 0, 'Lalande 21185 b');
INSERT INTO public.planet VALUES (12, 10, false, true, 'Terrestrial Super-Earth Exoplanet', 0, 'Lalande 21185 c');


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Cassini-Huygens', 'Orbiter', 6);
INSERT INTO public.spacecraft VALUES (2, 'InSight', 'Lander', 4);
INSERT INTO public.spacecraft VALUES (3, 'Mars Pathfinder', 'Lander', 4);
INSERT INTO public.spacecraft VALUES (4, 'Mars Polar Lander/Deep Space 2', 'Lander', 4);
INSERT INTO public.spacecraft VALUES (5, 'Phoenix', 'Lander', 4);
INSERT INTO public.spacecraft VALUES (6, 'Pioneer Venus 1', 'Orbiter-Probe', 2);
INSERT INTO public.spacecraft VALUES (7, 'Pioneer Venus 2', 'Orbiter-Probe', 2);
INSERT INTO public.spacecraft VALUES (8, 'Viking Project', 'Orbiter-Lander', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'G2V', 5500, '3.8x10^26', 'Sun');
INSERT INTO public.star VALUES (2, 1, 'M1-M2la', 3500, '100000 Lsun', 'Betelgeuse');
INSERT INTO public.star VALUES (3, 1, 'A1V', 9940, '25 Lsun', 'Sirius');
INSERT INTO public.star VALUES (4, 1, 'M1.5lab', 3500, '65000 Lsun', 'Antares');
INSERT INTO public.star VALUES (5, 2, 'B9III', 11000, 'Variable', 'M31_V1');
INSERT INTO public.star VALUES (6, 2, 'K5III', 3700, '1500 Lsun', 'M31_RG118');
INSERT INTO public.star VALUES (7, 2, 'O3V', 40000, '500000 Lsun', 'M31_BLUE');
INSERT INTO public.star VALUES (8, 2, 'M2III', 3400, '1000 Lsun', 'M31_RG122');
INSERT INTO public.star VALUES (9, 1, 'M5.5V', 3050, '0.0017 Lsun', 'Proxima Centauri');
INSERT INTO public.star VALUES (10, 1, 'M2V', 3200, '0.00045 Lsun', 'Lalande 21185');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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
-- Name: spacecraft spacecraft_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

