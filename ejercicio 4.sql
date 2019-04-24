USE sakila;

-- 1 Get the amount of cities per country in the database. Sort them by country, country_id.

SELECT co.country, co.country_id, COUNT(*)
	FROM city c INNER JOIN  country co 
	WHERE c.country_id = co.country_id
	GROUP BY co.country, co.country_id;
	
-- 2 Get the amount of cities per country in the database. 
-- Show only the countries with more than 10 cities, 
-- order from the highest amount of cities to the lowest.

SELECT co.country, co.country_id, COUNT(*)
	FROM city c INNER JOIN  country co 
	WHERE c.country_id = co.country_id
	GROUP BY co.country, co.country_id
	HAVING COUNT(*) > 10 
	ORDER BY COUNT(*) DESC;

-- 3 Genere un informe con el nombre (nombre, apellido) del cliente, la dirección, el total de películas alquiladas
--  y el dinero total gastado en el alquiler de películas. 
-- Muestra a los que gastaron más dinero primero.

SELECT CONCAT(c.first_name,' ', c.last_name) AS 'nombre',
	(SELECT a.address FROM address a WHERE c.address_id = a.address_id) AS 'direccion',
	(SELECT COUNT(r.rental_id) FROM rental r WHERE r.customer_id = c.customer_id GROUP BY c.first_name) AS 'peliculas_a',
	(SELECT SUM(p.amount) FROM payment p WHERE p.customer_id = c.customer_id) AS 'dinero_gastado'
	FROM customer c
	ORDER BY dinero_gastado DESC;

-- 4 ¿Qué categorías de películas tienen la mayor duración de la película (comparando el promedio)?
-- Ordenar por promedio en orden descendente.

SELECT c.name, AVG(`length`) AS 'promedio'
FROM film f INNER JOIN film_category fc INNER JOIN category c
ON f.film_id = fc.film_id AND fc.category_id = c.category_id
GROUP BY c.name
HAVING AVG(`length`) > (SELECT AVG(`length`) FROM film)
ORDER BY promedio DESC;
	
-- 5 Mostrar ventanas por peliculas

SELECT f.rating, SUM(p.amount) AS 'ventas'
FROM film f INNER JOIN inventory i INNER JOIN rental r INNER JOIN payment p
ON f.film_id = i.film_id AND i.inventory_id = r.inventory_id AND r.rental_id = p.rental_id
GROUP BY f.rating



