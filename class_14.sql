-- 1Write a query that gets all the customers that live in Argentina. 
-- Show the first and last name in one column, the address and the city.
SELECT CONCAT (c.first_name, ' ', c.last_name)AS 'nombre',
CONCAT (cy.city, ' ', a.address)AS 'localidad',
co.country
FROM customer c INNER JOIN address a ON c.address_id = a.address_id
INNER JOIN city cy ON a.city_id = cy.city_id
INNER JOIN country co ON cy.country_id = co.country_id
WHERE co.country = 'Argentina';

-- 2 Write a query that shows the film title, language and rating. 
-- Rating shall be shown as the full text described here:
-- https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States. Hint: use case.
SELECT f.title, l.name,
CASE
	WHEN f.rating = 'G' THEN 'General Audiences'
	WHEN f.rating = 'PG' THEN 'Parental Guidance Suggested'
	WHEN f.rating = 'PG-13' THEN 'Parents Strongly Cautioned'
	WHEN f.rating = 'R' THEN 'Restricted'
	WHEN f.rating = 'NC-17' THEN 'Adults Only'
	ELSE f.rating 
END AS 'descripcion'
FROM film f INNER JOIN `language` l ON f.language_id = l.language_id;

-- 3 Write a search query that shows all the films (title and release year) an actor was part of. 
-- Assume the actor comes from a text box introduced by hand from a web page. 
-- Make sure to "adjust" the input text to try to find the films as effectively as you think is possible.
SELECT f.title, f.release_year, 
CONCAT(a.first_name, ' ', a.last_name)AS 'name'
FROM film f INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE CONCAT(a.first_name, ' ', a.last_name) LIKE TRIM(UPPER(' PeNElOPe gUInESs'))

-- 4
-- Find all the rentals done in the months of May and June. Show the film title, customer name and if it was returned or not. 
-- There should be returned column with two possible values 'Yes' and 'No'.
SELECT r.rental_date, f.title, c.first_name,
CASE 
	WHEN r.return_date IS NULL THEN 'No'
	ELSE 'Yes'
END AS 'Return-Date'
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE MONTH(r.rental_date) BETWEEN 5 AND 6









