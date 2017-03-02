-- Exercise 1

createdb workshop
psql workshop

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT NOW()
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer NOT NULL UNIQUE,
  device_id integer REFERENCES devices (id)
);

-- Exercise 2

INSERT INTO devices (name) VALUES
('Accelerometer'),
('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES
(12, 1),
(14, 1),
(16, 1),
(31, 2),
(33, 2),
(35, 2),
(37, 2),
(39, 2);

INSERT INTO parts (part_number) VALUES
(50),
(54),
(58);

-- Exercise 3

SELECT devices.name, parts.part_number FROM devices
INNER JOIN parts ON devices.id = parts.device_id;

-- Exercise 4

SELECT * FROM parts WHERE part_number::text LIKE '3%';

-- Exercise 5

SELECT devices.name, COUNT(parts.device_id) FROM devices
JOIN parts ON devices.id = parts.device_id GROUP BY devices.name;

-- Exercise 6

SELECT devices.name AS name, COUNT(parts.device_id)
FROM devices
JOIN parts ON devices.id = parts.device_id
GROUP BY devices.name ORDER BY devices.name;

-- Exercise 7

SELECT part_number, device_id FROM parts WHERE device_id IS NOT NULL;
SELECT part_number, device_id FROM parts WHERE device_id IS NUll;

-- Exercise 8

SELECT name as oldest_device FROM devices ORDER BY created_at LIMIT 1;

-- Exercise 9

UPDATE parts SET device_id = 1 WHERE part_number = 37 OR part_number = 39;

-- Exercise 10

DELETE FROM parts WHERE device_id = 1;
DELETE FROM devices WHERE name = 'Accelerometer';
