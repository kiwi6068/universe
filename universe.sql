

CREATE DATABASE "universe";


\c universe;

CREATE TABLE "galaxy" (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    distance_light_years INT,
    diameter_light_years INT
);

CREATE TABLE "star" (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    temperature_kelvin NUMERIC,
    col_name BOOL,
    galaxy_id INT NOT NULL,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    distance_from_star FLOAT,
    note TEXT,
    has_alive BOOL,
    star_id INT NOT NULL,
    FOREIGN KEY (star_id) REFERENCES star(star_id)ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL,
    distance_from_planet FLOAT,
    planet_id INT NOT NULL,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE black_hole (
    black_hole_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    type VARCHAR(50) NOT NULL ,
    mass_kg NUMERIC,
    diameter_km NUMERIC
);




INSERT INTO galaxy (name, type, distance_light_years, diameter_light_years)
VALUES
    ('Milky Way', 'Spiral', 100000, 100000),
    ('Andromeda', 'Spiral', 200000, 120000),
    ('Triangulum', 'Spiral', 30000, 50000),
    ('Messier 87', 'Elliptical', 600000, 200000),
    ('Whirlpool', 'Spiral', 70000, 80000),
    ('Sombrero', 'Spiral', 80000, 90000);


INSERT INTO star (name, type, temperature_kelvin,col_name, galaxy_id)
VALUES
    ('Sun', 'G-type main-sequence', 5778,TRUE, 1),
    ('Sirius', 'A-type main-sequence', 9940,FALSE, 1),
    ('Alpha Centauri A', 'G-type main-sequence', 5790,TRUE, 2),
    ('Alpha Centauri B', 'K-type main-sequence', 5260,FALSE, 2),
    ('Betelgeuse', 'Red supergiant', 3500,TRUE, 3),
    ('Vega', 'A-type main-sequence', 9602,FALSE, 1);


INSERT INTO planet (name, type, distance_from_star, has_alive, star_id)
VALUES
    ('Mercury', 'Terrestrial', 0.39, FALSE, 1),
    ('Venus', 'Terrestrial', 0.72, FALSE,  1),
    ('Earth', 'Terrestrial', 1, TRUE,  1),
    ('Mars', 'Terrestrial', 1.52, FALSE, 1),
    ('Jupiter', 'Gas giant', 5.20, FALSE,  2),
    ('Saturn', 'Gas giant', 9.58, FALSE,  2),
    ('Uranus', 'Ice giant', 19.22, FALSE,  3),
    ('Neptune', 'Ice giant', 30.05, FALSE,  3),
    ('Pluto', 'Dwarf planet', 39.48, FALSE,  4),
    ('Kepler-186f', 'Exoplanet', 0.35, FALSE,  5),
    ('Proxima Centauri b', 'Exoplanet', 0.04, FALSE,  6),
    ('TRAPPIST-1d', 'Exoplanet', 0.02, FALSE,  6);


INSERT INTO moon (name, type, distance_from_planet, planet_id)
VALUES
    ('Luna', 'Natural satellite', 0.00257, 3),
    ('Phobos', 'Natural satellite', 0.0009377, 4),
    ('Deimos', 'Natural satellite', 0.0002346, 4),
    ('Io', 'Galilean moon', 0.002819, 5),
    ('Europa', 'Galilean moon', 0.004485, 5),
    ('Ganymede', 'Galilean moon', 0.007155, 5),
    ('Callisto', 'Galilean moon', 0.01257, 5),
    ('Titan', 'Saturnian moon', 0.008168, 6),
    ('Rhea', 'Titanian moon', 0.003523, 6),
    ('Iapetus', 'Titanian moon', 0.03504, 6),
    ('Miranda', 'Umbriel moon', 0.001297, 7),
    ('Ariel', 'Umbriel moon', 0.001909, 7),
    ('Umbriel', 'Umbriel moon', 0.00266, 7),
    ('Triton', 'Neptunian moon', 0.002371, 8),
    ('Charon', 'Plutonian moon', 0.001937, 9),
    ('Kepler-186f Moon', 'Exoplanet moon', 0.001, 10),
    ('Proxima Centauri b Moon', 'Exoplanet moon', 0.002, 11),
    ('TRAPPIST-1d Moon', 'Exoplanet moon', 0.003, 12),
    ('Moon 1', 'Unknown', 0.001, 3),
    ('Moon 2', 'Unknown', 0.002, 4);


INSERT INTO black_hole (name, type, mass_kg, diameter_km)
VALUES
    ('Sagittarius A*', 'Supermassive', 4.31e6, 44),
    ('Cygnus X-1', 'Stellar', 15, 10),
    ('Messier 87*', 'Supermassive', 6.5e9, 236),
    ('V404 Cygni', 'Stellar', 9, 10),
    ('NGC 1277', 'Supermassive', 17e9, 17),
    ('A0620-00', 'Stellar', 6.6, 10);


