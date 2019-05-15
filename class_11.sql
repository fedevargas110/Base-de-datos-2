-- 1
SELECT title, i.film_id 
FROM film f LEFT JOIN inventory i
ON f.film_id = i.film_id
WHERE i.film_id IS NULL;

-- 2
SELECT title, i.inventory_id
FROM film f
INNER JOIN inventory i ON f.film_id = i.inventory_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.inventory_id IS NULL;

-- 3
SELECT c.first_name, c.last_name, s.store_id, f.title
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN store s ON c.store_id = s.store_id
WHERE r.return_date IS NOT NULL 
ORDER BY s.store_id, c.first_name, c.last_name;

-- 4
SELECT 
CONCAT(ci.city, ' ', co.country) AS "Location",
CONCAT(st.first_name, ' ', st.last_name) AS "Name",
SUM(p.amount) AS "Total" 
FROM payment p
INNER JOIN rental r ON p.rental_id = r.rental_id
INNER JOIN customer c ON r.customer_id = c.customer_id
INNER JOIN store s ON c.store_id = s.store_id
INNER JOIN staff st ON s.manager_staff_id = st.staff_id
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
GROUP BY s.store_id;

-- 5
SELECT a.actor_id, CONCAT(a.first_name, ' ',a.last_name)AS Name, COUNT(a.actor_id) AS Cantidad que aparece
FROM actor a 
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(a.actor_id) >= ALL (SELECT COUNT(a2.actor_id)
									FROM actor a2
									INNER JOIN film_actor fa2 ON a2.actor_id = fa2.actor_id
									GROUP BY a2.actor_id);
SELECT * FROM actor a INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
WHERE a.actor_id = 107;

											
									