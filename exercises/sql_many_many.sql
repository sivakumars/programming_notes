-- Exercise 1

createdb billing
psql billing

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL UNIQUE CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10,2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token)
VALUES
  ('Pat Johnson','XHGOAHEQ'),
  ('Nancy Monreal','JKWQPJKL'),
  ('Lynn Blake','KLZXWEEE'),
  ('Chen Ke-Hua','KWETYCVX'),
  ('Scott Lakso','UUEAPQPS'),
  ('Jim Pornot ','XKJEYAZA');

INSERT INTO services (description, price)
VALUES
  ('Unix Hosting', 5.95),
  ('DNS', 4.95),
  ('Whois Registration',  1.95),
  ('High Bandwidth', 15.00),
  ('Business Support', 250.00),
  ('Dedicated Hosting', 50.00),
  ('Bulk Email', 250.00),
  ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer REFERENCES customers (id) ON DELETE CASCADE,
  service_id integer REFERENCES services (id),
  UNIQUE (customer_id, service_id)
);

INSERT INTO customers_services (customer_id, service_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (3, 1),
  (3, 2),
  (3, 3),
  (3, 4),
  (3, 5),
  (4, 1),
  (4, 4),
  (5, 1),
  (5, 2),
  (5, 6),
  (6, 1),
  (6, 6),
  (6, 7);

-- Exercise 2

SELECT c.name, c.payment_token, count(cs.service_id)
FROM customers AS c
INNER JOIN customers_services AS cs
ON c.id = cs.customer_id
GROUP BY c.name, c.payment_token;

-- Exercise 3

SELECT customers.*
FROM customers
LEFT OUTER JOIN customers_services ON customers.id = customer_id
WHERE service_id IS NULL;

SELECT * FROM customers WHERE id NOT IN
  (SELECT customer_id FROM customers_services);

-- Exercise 4

SELECT description
FROM customers_services
RIGHT OUTER JOIN services ON service_id = services.id
WHERE customer_id IS NULL;

-- Exercise 5

SELECT customers.name, string_agg(services.description, ', ') AS services
FROM customers
LEFT OUTER JOIN customers_services ON customers.id = customer_id
LEFT OUTER JOIN services ON service_id = services.id
GROUP BY customers.id;

-- Exercise 6

SELECT description, count(customer_id)
FROM services
INNER JOIN customers_services ON services.id = service_id
INNER JOIN customers ON customer_id = customers.id
GROUP BY description
HAVING count(customer_id) >= 3;

-- Exercise 7

SELECT sum(price) as gross
FROM customers
INNER JOIN customers_services ON customers.id = customer_id
INNER JOIN services on service_id = services.id;

-- Exercise 8

INSERT INTO customers (name, payment_token)
VALUES
('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES
(7, 1),
(7, 2),
(7, 3);

-- Exercise 9

SELECT sum(price)
FROM customers
INNER JOIN customers_services ON customers.id = customer_id
INNER JOIN services on service_id = services.id
WHERE price > 100;

SELECT sum(price) FROM customers, services WHERE price > 100;

-- Exercise 10

DELETE FROM customers_services WHERE service_id = 7;
DELETE FROM services WHERE description = 'Bulk Email';

DELETE FROM customers WHERE name = 'Chen Ke-Hua';
