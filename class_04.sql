-- 1 show title, special_features of films that are 'PG-13'.
SELECT title, special_features
FROM film
WHERE rating = 'PG-13';

-- 2 Get a list of all the different films duration.
SELECT DISTINCT `length`
FROM film
ORDER BY `length` DESC;

-- 3 Show title, rental_rate and replacement_cost of films that have replacement_cost from 20.00 up to 24.00.
SELECT title, rental_rate, replacement_cost
FROM film 
WHERE replacement_cost BETWEEN 20.00 AND 24.00;

-- 4 Show title, category and rating of films that have 'Behind the Scenes'   as special_features.
SELECT title, name, rating, special_features
FROM film f INNER JOIN film_category fc INNER JOIN category c
WHERE f.film_id = fc.film_id AND fc.category_id = c.category_id
AND special_features LIKE '%Behind the Scenes%';

-- 5 Show first name and last name of actors that acted in 'ZOOLANDER FICTION'.
SELECT first_name, last_name 
FROM actor a INNER JOIN film_actor fa INNER JOIN film f
WHERE a.actor_id = fa.actor_id AND fa.film_id = f.film_id 
AND f.title = 'ZOOLANDER FICTION';

-- 6 Show the address, city and country of the store with id 1.
SELECT address, city, country
FROM store s INNER JOIN address a INNER JOIN city c INNER JOIN country co
WHERE s.address_id = a.address_id AND a.city_id = c.city_id AND c.country_id = co.country_id
AND s.store_id = 1;

-- 7 Show pair of film titles and rating of films that have the same rating.
SELECT t1.title, t2.title rating 
FROM film t1, film t2
WHERE t1.rating = t2.rating
AND t1.film_id <> t2.film_id;

-- 8 Get all the films that are available in store id 2 and 
-- the manager first/last name of this store (the manager will appear in all the rows).
SELECT title, st.first_name, st.last_name
FROM film f INNER JOIN inventory i INNER JOIN store s INNER JOIN staff st
WHERE i.store_id = s.store_id AND i.film_id = f.film_id AND st.store_id = s.store_id
AND s.store_id = 2;
