-- Exercise 1

createdb extrasolar
psql extrasolar

CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) NOT NULL,
  distance integer NOT NULL, s
  pectral_type char(1),
  companions integer NOT NULL
);

ALTER TABLE stars ADD CONSTRAINT unique_name UNIQUE(name);
ALTER TABLE stars ADD CONSTRAINT positive_distance CHECK(distance  > 0);
ALTER TABLE stars ADD CONSTRAINT non_negative_companions CHECK(companions >= 0);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1),
  mass integer
);

-- Exercise 2

ALTER TABLE planets ADD COLUMN star_id integer REFERENCES stars(id) NOT NULL;

-- Exercise 3

ALTER TABLE stars ALTER COLUMN name TYPE varchar(50);

-- Exercise 4

ALTER TABLE stars ALTER COLUMN distance TYPE numeric;

-- Exercise 5

ALTER TABLE stars ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M'));

ALTER TABLE stars ALTER COLUMN spectral_type SET NOT NULL;

-- Exercise 6

ALTER TABLE stars DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectral_options AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars ALTER COLUMN spectral_type TYPE spectral_options
USING spectral_type::spectral_options;

-- Exercise 7

ALTER TABLE planets ALTER COLUMN mass TYPE numeric;
ALTER TABLE planets ALTER COLUMN mass SET NOT NULL;
ALTER TABLE planets ADD CHECK (mass > 0.0);
ALTER TABLE planets ALTER COLUMN designation SET NOT NULL;

-- Exercise 8

ALTER TABLE planets ADD COLUMN semi_major_axis numeric NOT NULL;

-- Exercise 9

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id integer NOT NULL REFERENCES planets (id)
);

-- Exercise 10

\c nitin
DROP DATABASE extrasolar
