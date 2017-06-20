-- Exercise 1
createdb auction
psql -d auction < auction.sql

CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price DECIMAL(6,2) NOT NULL CHECK(initial_price BETWEEN 0.01 AND 1000.00),
  sales_price DECIMAL(6,2) CHECK(sales_price BETWEEN 0.01 AND 1000.00)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DElETE CASCADE,
  amount DECIMAL(6,2) NOT NULL CHECK(amount BETWEEN 0.01 AND 1000.00)
);

CREATE INDEX ON bids (bidder_id, item_id);

-- Exercise 2

SELECT name AS "Bid on Items" FROM items
WHERE id IN (SELECT DISTINCT item_id FROM bids);

-- Exercise 3

SELECT name AS "Not Bid On" FROM items
WHERE id NOT IN (SELECT DISTINCT item_id FROM bids);

-- Exercise 4

SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bidder_id = bidders.id);

SELECT DISTINCT name
FROM bidders
INNER JOIN bids ON bidders.id = bidder_id;

-- Exercise 5

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
WHERE 100.00 > ANY
  (SELECT amount FROM bids WHERE item_id = items.id);

-- Exercise 6

SELECT max(count)
FROM
(SELECT count(id) FROM bids GROUP BY bidder_id)
AS bid_counts;

-- Exercise 7

SELECT items.name, count(bids.item_id)
FROM items
LEFT OUTER JOIN bids ON items.id = bids.item_id
GROUP BY items.id;

SELECT name,
(SELECT count(id) FROM bids WHERE bids.item_id = items.id)
FROM items;

-- Exercise 8

SELECT id
FROM items
WHERE ROW(name, initial_price, sales_price) = ('Painting', 100.00, 250.00);

-- Exercise 9

EXPLAIN ANALYZE SELECT name FROM bidders
WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);

-- Exercise 10

EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;

EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
  GROUP BY bidder_id
  ORDER BY max_bid DESC
  LIMIT 1;
