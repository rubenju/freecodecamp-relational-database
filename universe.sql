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
    name character varying(50) NOT NULL,
    diameter_in_kpc numeric,
    description text,
    age_in_by integer
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
    name character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    planet_id integer,
    description text
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
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_planet_id integer NOT NULL,
    moon_id integer,
    planet_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter numeric NOT NULL,
    description text,
    star_id integer
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
    name character varying(50) NOT NULL,
    accessed_count integer NOT NULL,
    galaxy_id integer,
    is_active boolean NOT NULL
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
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 46.56, 'The Andromeda Galaxy is a barred spiral galaxy and is the closest major galaxy to the Milky Way, where the Solar System resides. It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224', 10);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 12.52, 'is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major', 13);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 29.09, 'The Sombrero Galaxy is a peculiar galaxy of unclear classification in the constellation borders of Virgo and Corvus, being about 9.55 megaparsecs from the Milky Way galaxy', 1);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 51.91, 'The Pinwheel Galaxy is a face-on spiral galaxy 21 million light-years away from Earth in the constellation Ursa Major', 1);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 44.23, 'The Cartwheel Galaxy is a lenticular ring galaxy about 500 million light-years away in the constellation Sculptor', 1);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 23.58, '
The Whirlpool Galaxy, also known as Messier 51a or NGC 5194, is an interacting grand-design spiral galaxy with a Seyfert 2 active galactic nucleus', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', true, 13, 'Earths Moon is the fifth largest of the 200+ moons orbiting planets in our solar system');
INSERT INTO public.moon VALUES (2, 'Phobos', true, 4, 'It orbits Mars three times a day, and is so close to the planets surface that in some locations on Mars it cannot always be seen');
INSERT INTO public.moon VALUES (3, 'Deimos', true, 4, 'is the smaller of Mars two moons. It orbits Mars whirls around Mars every 30 hours');
INSERT INTO public.moon VALUES (4, 'Io', true, 6, 'Io is the most volcanically active world in the solar system, with hundreds of volcanoes, some erupting lava fountains dozens of miles (or kilometers) high');
INSERT INTO public.moon VALUES (5, 'Europa', true, 6, 'Europa is thought to have an iron core, a rocky mantle and an ocean of salty water that may be one of the best places to look for life beyond Earth in our solar system');
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 6, 'Ganymede is the largest moon in our solar system and the only moon with its own magnetic field');
INSERT INTO public.moon VALUES (7, 'Callisto', true, 6, 'Callisto is the most heavily cratered object in our solar system');
INSERT INTO public.moon VALUES (8, 'Titania', true, 7, 'Titania is Uranus largest moon. Images taken by Voyager 2 almost 200 years after Titanias discovery revealed signs that the moon was geologically active');
INSERT INTO public.moon VALUES (9, 'Oberon', true, 7, 'Oberon is the second largest moon of Uranus');
INSERT INTO public.moon VALUES (10, 'Puck', true, 7, 'Puck is one of the small inner moons of Uranus. With a diameter of about 150 km (about 90 miles)');
INSERT INTO public.moon VALUES (11, 'Rosalind', true, 7, 'Rosalind is one of Uranus inner moons and has a radius of about 22 miles (36 kilometers)');
INSERT INTO public.moon VALUES (12, 'Mimas', true, 3, 'Mimas');
INSERT INTO public.moon VALUES (13, 'Enceladus', true, 3, 'Enceladus');
INSERT INTO public.moon VALUES (14, 'Tethys', true, 3, 'Tethys');
INSERT INTO public.moon VALUES (15, 'Proteus', true, 8, 'Proteus is one of the largest of Neptunes known moons');
INSERT INTO public.moon VALUES (16, 'Triton', true, 8, 'Like our own moon, Triton is locked in synchronous rotation with Neptune');
INSERT INTO public.moon VALUES (17, 'Larissa', true, 8, 'Larissa is another of the small moons found near Neptunes faint ring system in 1989');
INSERT INTO public.moon VALUES (18, 'Charon', true, 9, 'At half the size of Pluto, Charon is the largest of Plutos five moons and the largest known satellite relative to its parent body');
INSERT INTO public.moon VALUES (19, 'Hydra', true, 9, 'Hydra was named for the nine-headed serpent that Hercules fought in Greek and Roman mythology');
INSERT INTO public.moon VALUES (20, 'Kerberos', true, 9, 'Plutos tiny moon Kerberos appears to be smaller than scientists expected and has a highly-reflective surface');
INSERT INTO public.moon VALUES (21, 'Nix', true, 9, 'Nix is the inner of the two moons discovered orbiting Pluto in 2005');


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (1, 3, 2, NULL);
INSERT INTO public.moon_planet VALUES (2, 4, 3, NULL);
INSERT INTO public.moon_planet VALUES (3, 5, 4, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 4880, 'Mercury is the first planet from the Sun and the smallest planet in the Solar System. It is a terrestrial planet with a heavily cratered surface due to the planet having no geological activity and an extremely tenuous atmosphere (called an exosphere)', 2);
INSERT INTO public.planet VALUES (3, 'Saturn', 60.26, 'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth', 3);
INSERT INTO public.planet VALUES (4, 'Mars', 60.26, 'Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust', 4);
INSERT INTO public.planet VALUES (5, 'Venus', 6051, 'Venus is the second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System', 5);
INSERT INTO public.planet VALUES (6, 'Jupiter', 6991, 'Jupiter atau Musytari, terkadang secara tidak baku disebut sebagai Yupiter, adalah planet terdekat kelima dari Matahari setelah Merkurius, Venus, Bumi, dan Mars', 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 4858, 'Uranus adalah planet ketujuh dari Matahari. Uranus merupakan planet yang memiliki jari-jari terbesar ketiga sekaligus massa terbesar keempat di Tata Surya', 7);
INSERT INTO public.planet VALUES (8, 'Neptunus', 3893, 'Neptunus merupakan planet terjauh jika ditinjau dari Matahari', 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 1323, 'One of the worlds most known rock in space. While some may believe it is not a planet, we all know deep inside that Pluto is the best', 8);
INSERT INTO public.planet VALUES (10, 'Eris', 4943, 'Fun fact If you lived on Eris then you would be dead before it could even orbit the Sun! What a snail planet', 2);
INSERT INTO public.planet VALUES (11, 'Planet X', 2345, 'Not sure if it really exists... if we can see planets thousands of light years away, why cant we see one thats supposedly right in our own solar system?', 3);
INSERT INTO public.planet VALUES (12, '51 Pegasi', 1334, '51 Pegasi B was the first exoplanet discovered orbiting a main sequence star, which is what our sun is. It is also tied with 2 other planets to be the windiest planet discovered. Its larger than Jupiter', 4);
INSERT INTO public.planet VALUES (13, 'Earth', 12742, 'We take Earth for granted. Its the only place (that we currently know of) in the universe that can support us and were on the road to ruining it. Before we think about colonizing other planets, we should focus on taking care of the one we already have', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 2, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 3, true);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 4, true);
INSERT INTO public.star VALUES (5, 'Red Dwarf', 1, 4, true);
INSERT INTO public.star VALUES (6, 'Arcturus', 1, 5, true);
INSERT INTO public.star VALUES (7, 'Vega', 1, 6, true);
INSERT INTO public.star VALUES (8, 'Antares', 1, 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: moon_planet pkey_moon_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT pkey_moon_planet PRIMARY KEY (moon_planet_id);


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
-- Name: moon_planet unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon_planet fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT fk_moon FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

