-- Exercise 1

createdb animals

-- Exercise 2

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age integer,
  species varchar(15)
);

-- Exercise 3

INSERT INTO birds (name, age, species) VALUES ('Charlie', 3, 'Finch');
INSERT INTO birds (name, age, species) VALUES ('Allie', 5, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Jennifer', 3, 'Magpie');
INSERT INTO birds (name, age, species) VALUES ('Jamie', 4, 'Owl');
INSERT INTO birds (name, age, species) VALUES ('Roy', 8, 'Crow');

-- Exercise 4

SELECT * FROM  birds;

-- Exercise 5

SELECT * FROM birds WHERE age < 5;

-- Exercise 6

UPDATE birds SET species = 'Raven' WHERE species = 'Crow';

-- Exercise 7

DELETE FROM birds WHERE age = 3 AND species = 'Finch';

-- Exercise 8

ALTER TABLE birds ADD CONSTRAINT check_age CHECK (age > 0);

INSERT INTO birds (name, age, species) VALUES ('Nitin', -2, 'Human');

-- Exercise 9

DROP TABLE birds;

-- Exercise 10

DROP DATABASE animals;

dropdb animalss
