-- 1 Create two or three queries using address table in sakila db:

-- include postal_code in where (try with in/not it operator) 
-- eventually join the table with city/country tables.
-- measure execution time.
-- Then create an index for postal_code on address table.
-- measure execution time again and compare with the previous ones.
-- Explain the RESULT
-- 70000 80000

SELECT SQL_NO_CACHE *
	FROM address
	WHERE postal_code IN (SELECT postal_code FROM address WHERE postal_code BETWEEN 70000 AND 80000);
-- me tardo 21 ms

CREATE INDEX postal_code ON address(postal_code);
DROP INDEX postal_code ON address;
-- con el index me tardo 4 ms

-- 2 Run queries using actor table, searching for first and last name columns independently.
-- Explain the differences and why is that happening?

SELECT first_name FROM actor;
-- 0.00052475
SELECT last_name FROM actor;
-- 0.00053225 
-- Porque: last_name tarda mas porque tiene una key mul, eso dice que tiene un index de por si.

-- 3 Compare results finding text in the description on table film with LIKE and in the film_text using MATCH ... AGAINST. 
-- Explain the results.

SELECT description FROM film 
	WHERE description LIKE '%Astounding%';


CREATE FULLTEXT INDEX description ON film_text(description);

SELECT description FROM film_text
	WHERE MATCH(description) against('Astounding');

DROP INDEX description ON film_text;
-- La busqueda de datos grandes el index la acelaera.

