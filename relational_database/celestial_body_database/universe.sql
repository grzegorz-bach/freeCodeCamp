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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    messier_catalog_number character varying(5),
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    diameter_in_km numeric(5,1)
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
    description text,
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT false,
    distance_from_earth numeric(6,2),
    order_from_sun integer NOT NULL,
    star_id integer,
    number_of_moons integer
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
    description text,
    galaxy_id integer,
    star_type_id integer
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', NULL, 'M31', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', NULL, 'M31', 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', NULL, 'M33', 1);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', NULL, 'M87', 2);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', NULL, 'M104', 1);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', NULL, 'LMC', 3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Irregural', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3, 3474.8);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 4, 22.2);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 4, 12.4);
INSERT INTO public.moon VALUES (4, 'Io', NULL, 5, 3643.2);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 5, 3121.6);
INSERT INTO public.moon VALUES (6, 'Ganymede', NULL, 5, 5268.2);
INSERT INTO public.moon VALUES (7, 'Calisto', NULL, 5, 4821.6);
INSERT INTO public.moon VALUES (8, 'Titan', NULL, 6, 5149.4);
INSERT INTO public.moon VALUES (9, 'Enceladus', NULL, 6, 504.2);
INSERT INTO public.moon VALUES (10, 'Mimas', NULL, 6, 396.4);
INSERT INTO public.moon VALUES (11, 'Triton', NULL, 8, 2706.8);
INSERT INTO public.moon VALUES (12, 'Charon', NULL, 9, 1212.0);
INSERT INTO public.moon VALUES (13, 'Luna', NULL, 1, 3474.8);
INSERT INTO public.moon VALUES (14, 'Rhea', NULL, 6, 1527.6);
INSERT INTO public.moon VALUES (15, 'Dione', NULL, 6, 1122.8);
INSERT INTO public.moon VALUES (16, 'Tethys', NULL, 6, 1066.8);
INSERT INTO public.moon VALUES (17, 'Lapetus', NULL, 6, 1471.6);
INSERT INTO public.moon VALUES (18, 'Hyperion', NULL, 6, 362.2);
INSERT INTO public.moon VALUES (19, 'Miranda', NULL, 7, 471.6);
INSERT INTO public.moon VALUES (20, 'Ariel', NULL, 7, 1157.8);
INSERT INTO public.moon VALUES (21, 'Umbriel', NULL, 7, 1170.4);
INSERT INTO public.moon VALUES (22, 'Titania', NULL, 7, 1578.4);
INSERT INTO public.moon VALUES (23, 'Oberon', NULL, 7, 1523.2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, false, false, 216.30, 1, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, false, false, 259.71, 2, 1, 0);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, false, false, 399.58, 4, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, false, false, 965.52, 5, 1, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, false, false, 1652.48, 6, 1, 82);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, false, false, 3154.91, 7, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, false, false, 4685.02, 8, 1, 14);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, false, false, 7523.53, 10, 1, 5);
INSERT INTO public.planet VALUES (10, 'Ceres', NULL, false, false, NULL, 9, 1, 0);
INSERT INTO public.planet VALUES (11, 'Haumea', NULL, false, false, NULL, 11, 1, 2);
INSERT INTO public.planet VALUES (12, 'Makemake', NULL, false, false, NULL, 12, 1, 1);
INSERT INTO public.planet VALUES (13, 'Eris', NULL, false, false, NULL, 13, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, false, false, 0.00, 3, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', NULL, 1, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', NULL, 1, 1);
INSERT INTO public.star VALUES (4, 'Sirius (Alpha Canis Majoris)', NULL, 1, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', NULL, 1, 1);
INSERT INTO public.star VALUES (6, 'Betelgeuse (Alpha Orionis)', NULL, 1, 2);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Main Sequence', 'Main sequence stars are the most common type of stars in the universe. They undergo nuclear fusion in their cores, converting hydrogen into helium, which releases energy that makes them shine. Main sequence stars come in various sizes and temperatures, ranging from small, cool red dwarfs to large, hot blue giants');
INSERT INTO public.star_type VALUES (2, 'Red Giants and Supergiants', 'Red giants and supergiants are stars that have exhausted their core hydrogen fuel and expanded in size. They are typically cooler than main sequence stars but much larger in size. Red giants and supergiants are often found in later stages of stellar evolution before they undergo supernova explosions or collapse into compact objects like white dwarfs or neutron stars');
INSERT INTO public.star_type VALUES (3, 'White Dwarfs', 'White dwarfs are the remnants of low to medium mass stars after they have exhausted their nuclear fuel and shed their outer layers. They are extremely dense and hot, but relatively small in size compared to their progenitor stars. White dwarfs gradually cool over billions of years');
INSERT INTO public.star_type VALUES (4, 'Neutron Stars', 'Neutron stars are incredibly dense stellar remnants formed from the collapsed cores of massive stars after a supernova explosion. They consist mostly of neutrons and have extremely strong magnetic fields. Neutron stars can spin rapidly and emit beams of radiation, making them observable as pulsars');
INSERT INTO public.star_type VALUES (5, 'Black Holes', 'Black holes are regions of spacetime where gravity is so strong that nothing, not even light, can escape from them. They form when massive stars collapse under their own gravity during a supernova explosion. Black holes come in various sizes, from stellar-mass black holes to supermassive black holes that exist at the centers of galaxies');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 5, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_ukey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_ukey UNIQUE (galaxy_type_id);


--
-- Name: galaxy galaxy_ukey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_ukey UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_ukey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_ukey UNIQUE (moon_id);


--
-- Name: planet planet_order_from_sun_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_order_from_sun_key UNIQUE (order_from_sun);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_ukey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_ukey UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type star_type_star_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_star_type_id_key UNIQUE (star_type_id);


--
-- Name: star start_ukey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT start_ukey UNIQUE (star_id);


--
-- Name: galaxy galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

