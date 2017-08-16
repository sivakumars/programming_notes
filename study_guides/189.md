189 Study Guide
=================

Notes created while preparing for Assessment 189. This assessment is designed to test knowledge of course 180 and will focus on Databases, SQL, PostgreSQL, and Sequel.

Introduction
------------

Human beings use their brains to remember things that happened in the past and make decisions for the future. But because their brains have limited capacity, humans record information on paper or a computer. This information is called **data**. When the amount of data grows large, it's often stored in a **database** so that a computer can be used to more quickly retrieve and analyze it.

Most data, like the content of a text message, is *unstructured*. A text message comes with additional *structured* data though. While the content of each text can vary wildly, each text has a sender's number, a recipient's number, and the date/time that the text was sent.

A **relational database** is a database that stores structured data in *tables* of columns and rows. Tables are also called relations or entities. Rows are also called records or tuples. Columns are also called attributes or fields.

| phone_number | name    |
|--------------|---------|
| 123-456-7890 | "Bob"   |
| 987-654-3210 | "Nitin" |
| 612-612-6120 | "Carlos"|

A relational database management system (RDBMS) is an application that enables interaction between a user and a database. Well-known DBMSs include MySQL, PostgreSQL, MongoDB, Microsoft SQL Server, Oracle, and IBM DB2. The term "database" is often used interchangeably with an RDBMS, and **SQL** (Structured Query Language) is the *special purpose language* used to interact with the RDBMS.

A database's structure is described in what's called a **schema**. In addition to specifying column names, the schema indicates what kind of data is allowed in a particular column. For example, the `name` column should only allow text. This restriction is called a column's **data type**. Another SQL feature called a **constraint** makes it possible to further restrict possible values of a column, for example, ensuring that all values in the `phone_number` column are unique or that all values in the `name` column are longer than 1. Lastly, while the schema describes the structure of the database, the **data** is the actual content that is placed within that structure, like "Bob" and "Nitin" in the example above.

SQL
---

SQL is really three languages in one, containing smaller sub-languages for data definition, data manipulation, and data control. The **data definition** sub-language allows a user to create and modify the database schema (e.g. CREATE, DROP, ALTER). The **data manipulation** sub-language allows a user to retrieve and modify data stored in a database (e.g. SELECT, INSERT, UPDATE, DELETE). The **data control** sub-language allows a user to control the rights and access roles of the users that interact with a database or table (e.g. GRANT).

Primary Keys
--------------

A **key** uniquely identifies a single row in a database table. A **natural key** is an attribute of the data that can be used to uniquely identify a row of data, for example, the `phone_number` column in the Contacts table. Since a natural key can often change, however, it's preferred to use a **surrogate key**, a key created solely for the purpose of identifying a row of data in a table.

A surrogate key is commonly configured as an *auto-incrementing integer* that increases by 1 for each new row. PostgreSQL contains a keyword, `serial`, that automatically configures a surrogate key column when creating a table. The two SQL statements below are equivalent.

```SQL
CREATE TABLE table_name (
  id serial
);

CREATE TABLE table_name (
  id integer NOT NULL DEFAULT nextval('table_name_id_seq')
);
```

As part of the `serial` configuration, a special table that stores a series of numbers is created called a **sequence**. This sequence is passed as an argument to the `nextval` function which is assigned as the `DEFAULT` value of the column. This ensures that the default value of the `id` column for every added row will be 1 greater than the value of the previous row.

The last step is to ensure that all values of the `id` column are unique and NOT NULL by adding a couple constraints to the column.

```SQL
CREATE TABLE table_name (
  id serial UNIQUE NOT NULL
);

CREATE TABLE table_name (
  id serial PRIMARY KEY
);
```

A **primary key** is a column that uniquely identifies a row in a table. While any number of columns can contain UNIQUE and NOT NULL constraint, a table is only allowed one primary key. To assign these two constraints and indicate the column is the primary key of the table, PostgreSQL provides a `PRIMARY KEY` keyword. It's an accepted convention in Web Development to create a **primary key** column named `id` for all database tables.

Index
-----

An **index** is a mechanism to speed up data retrieval by storing commonly accessed columns in a separate and ordered table-like structure. Each time a new row is inserted into an indexed column, the index is updated. So while indexes increase the speed of data retrieval, they can decrease the speed of data inserts and updates. And therefore indexes are best used in tables where reads are more common.

Database Relationships
-----------------------

Databases aim to reduce duplication by splitting a table into multiple tables. **Normalization** is the process of designing schema to eliminate data duplication and minimize the occurrence of update, insertion, and deletion anomalies.

#### Denormalised Table of Text Messages

| id | sender_phone | sender_name | receiver_phone | receiver_name | content      |
|----|--------------|-------------|:--------------:|---------------|--------------|
| 1  | 123-456-7890 | "Bob"       |  987-654-3210  | "Nitin"       | "Hello"      |
| 2  | 987-654-3210 | "Nitin"     |  123-456-7890  | "Bob"         | "Hey"        |
| 3  | 987-654-3210 | "Nitin"     |  123-456-7890  | "Bob"         | "What's Up?" |

#### Texts

| id | sender_id | receiver_id| content        |
|----|-----------|:----------:|----------------|
| 1  | 1         |  2         | "Hello"        |
| 2  | 2         |  1         | "Hey"          |
| 3  | 2         |  1         | "What's up?"   |
| 4  |           |  2         | "Who is this?" |

#### Contacts

| id | phone_number | name    |
|----|--------------|---------|
| 1  | 123-456-7890 | "Bob"   |
| 2  | 987-654-3210 | "Nitin" |
| 3  | 612-612-6120 | "Carlos"|

When related data is split into multiple tables, their relationships are preserved using  **foreign keys**. A **foreign key** is a column whose value is used to point to a specific row in another table using that table's primary key. This mapping creates a relationship between rows from two different tables. The `sender_id` and `receiver_id` columns of the Texts table contains values that point to specific rows in the Contacts table using the `id` column. In other words, `sender_id` and `receiver_id` are both foreign key columns of the Texts table.

A **foreign key constraint** establishes the relationship by mapping a foreign key column of one table to the primary key column of another table. In other words, a foreign key constraint ensures that all values in a foreign key column also exist in the primary key column of another table. There are two ways to create this constraint.

```SQL
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  contact_id integer REFERENCES contacts(id)
  name varchar(255)
);

ALTER TABLE table_NAME ADD CONSTRAINT table_name_contact_fkey FOREIGN KEY (contact_id) REFERENCES contacts(id);
```

There are three types of table relationships with three different implementations in relational databases:

- One-to-One --> PRIMARY KEY of 1st table is used as both FOREIGN KEY and PRIMARY KEY of 2nd table
- One-to-Many --> PRIMARY KEY of 1st table is used as FOREIGN KEY of 2nd table
- Many-to-Many --> 3rd cross-reference table (i.e. *join table*) uses a composite PRIMARY KEY — containing the PRIMARY KEYs of the two other tables — to store the relationship between those tables.

**Cardinality** is the number of objects on each side of the relationship. The cardinality can be  "one" or "many". The **modality** of a relationship indicates if the relationship is required (1) or optional (0). Cardinality and Modality are useful for defining the *business rules* that control an application.

SELECT
------

The most common SQL clause is the **SELECT**. It's often followed by a FROM clause to indicate which table to retrieve data from. And subsequently followed by a combination of WHERE, GROUP BY, HAVING, ORDER BY, LIMIT, and OFFSET clauses. These clauses determine how and how much of the data to return. Below are the general steps that a SELECT query follows when littered with these clauses.

1) Rows are collected into a virtual table
2) Rows are filtered using `WHERE` conditions. Any rows that don't satisfy the conditions are removed.
3) Rows are divided into appropriate groups based on `GROUP BY` columns.
4) Groups (of rows) are filtered using `HAVING` conditions.
5) Elements in the `SELECT` list are evaluated, including functions, and the results are labeled with the column name or function name unless otherwise specified by an `AS` clause.
6) The results are sorted as indicated by an `ORDER BY` clause.
7) The actual rows returned are determined using `LIMIT` or `OFFSET` clauses.

JOIN
-----

A **JOIN** is a SQL clause that returns rows from two different tables based on a common column between them. There are several slightly different types of JOINs.

An **INNER JOIN** returns the rows for which the common column had a matching value. For each row in the first table, if there is a row in the second table that matches the join condition for that row, then a new row combining values from both tables is created in a virtual table created by the JOIN.

`SELECT * FROM texts JOIN contacts ON sender_phone = phone_number;`

| id | sender_phone | receiver_phone | content      | id | name    | phone_number |
|----|--------------|:--------------:|--------------|----|---------|--------------|
| 1  | 123-456-7890 |  987-654-3210  | "Hello"      | 1  | "Bob"   | 123-456-7890 |
| 2  | 987-654-3210 |  123-456-7890  | "Hey"        | 2  | "Nitin" | 987-654-3210 |
| 3  | 987-654-3210 |  123-456-7890  | "What's up?" | 2  | "Nitin" | 987-654-3210 |

Note that the JOIN table only contains the 3 rows that matched.

A **LEFT OUTER JOIN** includes the results of an INNER JOIN plus the rows from the first table that didn't meet the join condition, placing NULL values in the second table's columns.

`SELECT * FROM contacts LEFT JOIN texts ON phone_number = sender_phone;`

| id | sender_phone | receiver_phone | content        | id | name    | phone_number |
|----|--------------|:--------------:|----------------|----|---------|--------------|
| 1  | 123-456-7890 |  987-654-3210  | "Hello"        | 1  | "Bob"   | 123-456-7890 |
| 2  | 987-654-3210 |  123-456-7890  | "Hey"          | 2  | "Nitin" | 123-456-7890 |
| 3  | 987-654-3210 |  123-456-7890  | "What's up?"   | 2  | "Nitin" | 123-456-7890 |
| 3  | 987-654-3210 |  111-111-1111  | "Who is this?" |    |         |              |

Note that the JOIN table contains 4 rows even though there was no matching `name` found for 111-111-1111.

A **LEFT OUTER JOIN** includes the results of an INNER JOIN plus the rows from the second table that didn't meet the join condition, placing NULL values in the first table's columns.

| id | sender_phone | receiver_phone | content      | id | name     | phone_number |
|----|--------------|:--------------:|--------------|----|----------|--------------|
| 1  | 123-456-7890 |  987-654-3210  | "Hello"      | 1  | "Bob"    | 123-456-7890 |
| 2  | 987-654-3210 |  123-456-7890  | "Hey"        | 2  | "Nitin"  | 987-654-3210 |
| 3  | 987-654-3210 |  123-456-7890  | "What's up?" | 2  | "Nitin"  | 987-654-3210 |
|    |              |                |              | 3  | "Carlos" | 612-612-6120 |

Note that the JOIN table again contains 4 rows even though there were no texts sent by "Carlos".

A **FULL OUTER JOIN** includes the results of an INNER JOIN plus the rows from both the first and second table that didn't meet the join condition, placing NULL values appropriately in the non-matching rows.

Subquery
----------

A subquery is a query nested inside a larger SQL query. Like JOIN, it's most often used to return data from multiple tables, although JOINs are preferred because they're generally faster than subqueries.

There are 3 different types of subqueries that are categorized based on what type of data the nested query returns.

**Scalar Subquery:** The nested query returns a single value (e.g. aggregation) that can then be used with a SQL operator in a WHERE clause, or in a SELECT's list of result columns.

**Subquery as a Virtual Table:** The nested query returns a virtual table that can be used in a FROM clause.

**Column Subquery:** The nested query returns an array of values that can be used with a FROM clause (as in a virtual table) or a combo WHERE/IN clause.

Aggregation
------------

An aggregation is a calculation that takes a column of values and returns a single value. Aggregations are often used with a GROUP BY statement to return multiple "single" values that correspond to a subset of the column. For example, instead of returning the number of the total text messages, you can return the number of text messages for each `sender_phone`.

Sequel
------

Sequel is a database interface library / toolkit / API / gem that allows SQL queries to be represented as Ruby objects. This type of representation is often called an **ORM**, object-relational mapping.

A Sequel::Database object represents a virtual connection to a database. A Sequel::Dataset object represents a SQL query, or more generally, an abstract set of rows resulting from the execution of a SQL query.

```ruby
require "sequel"

DB = Sequel.connect('postgres://localhost/db_name') # creates Sequel::Database object

results = DB[:table_name] # creates Sequel::Dataset object with "SELECT * FROM table_name"
```

A Dataset instance does not immediately run its query; it waits until the results of the query are actually needed. For example, an `UPDATE` or `INSERT` will run immediately but a `SELECT` query isn't run until the results are requested using an instance method such as `all`, `first`, or `count`.

As mentioned, a Dataset represents an abstract set of rows and each row is represented as a hash. Therefore, `results.all` will return an array of hashes and `results.first` will return a hash with the first row of results. In addition, Dataset implements the *Enumerable* module, so Ruby methods like `each` and `map` are all available.

SQL Queries in Sequel
---------------------

`CREATE TABLE table_name (col_name col_type options,...);`

```ruby
create_table(:table_name) do
  primary_key :id
  String :name, unique: true
  Integer :age, null: false, default: 0
  Numeric :cost, size: [4,2]
  Float :height
  Boolean :adult
  check{char_length(name) > 2}
end
```

`INSERT INTO table_name (col_name,...) VALUES (col_value,...);`

```ruby
DB[:table_name].insert(name: "Nitin", age: 30, height: 76.0, adult: true)
```

`SELECT col_names FROM table_name WHERE col_name = col_value ORDER BY col_name DESC;`

```ruby
DB[:table_name].select(:col_name,...).where(col_name: col_value).order(:col_name).reverse
DB[:table_name].select(:col_name,...).where(col_name: col_value).order(Sequel.desc(:col_name))
```

`SELECT * FROM table_name WHERE col_name LIKE '%string%';`

```ruby
DB[:table_name].where(Sequel.like(:col_name, '%string%'))
```

`UPDATE table_name SET col_name = col_value WHERE col_name = col_value;`

```ruby
DB[:table_name].update(col_name: col_value)
```

`DELETE FROM table_name WHERE col_name = col_value;`

```ruby
DB[:table_name].where(col_name: col_value).delete
```

`ALTER TABLE table_name ADD COLUMN col_name options;`

```ruby
DB.alter_table(:table_name) do
  add_column :cost, Numeric, null: false, size: [4,2]
end
```

`ALTER TABLE table_name DROP COLUMN col_name;`

```ruby
DB.alter_table(:table_name) do
  drop_column :cost
end
```

`ALTER TABLE table_name RENAME COLUMN col_name TO new_col_name;`

```ruby
alter_table(:table_name) do
  rename_column :col_name, :new_col_name
end
```

`ALTER TABLE table_name ALTER COLUMN col_name TYPE new_type;`

```ruby
alter_table(:table_name) do
  set_column_type :col_name, :String
end
```

`ALTER TABLE table_name ALTER COLUMN col_name SET NOT NULL DEFAULT 0;`

```ruby
alter_table(:table_name) do
  set_column_allow_null :col_name
  set_column_default :col_name, 0
end
```

`ALTER TABLE table_name ADD CHECK(col_name > 0);`

`ALTER TABLE table_name ADD CONSTRAINT constraint_name CHECK(length(col_name) > 2);`

```ruby
alter_table(:table_name) do
  add_constraint(:name_min_length){char_length(col_name) > 2}
end
```

`ALTER TABLE table_name DROP CONSTRAINT constraint_name;`

```ruby
alter_table(:table_name) do
  drop_constraint(:name_unique)
end
```

`ALTER TABLE table_name ADD UNIQUE(col_name);`

```ruby
alter_table(:table_name) do
  add_unique_constraint :name
end
```

`ALTER TABLE table_name RENAME TO new_table_name;`

```ruby
DB.rename_table(:table_name, :new_table_name)
```

`DROP TABLE table_name;`

```ruby
DB.drop_table(:table_name)
```

`CREATE SEQUENCE table_name_seq;`

`DROP SEQUENCE table_name_seq;`

`CREATE INDEX ON table_name (col_name);`

`DROP INDEX index_name`
