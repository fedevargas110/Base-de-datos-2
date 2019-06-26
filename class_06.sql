-- 1 List all the actors that share the last name. Show them in order
SELECT first_name, last_name 
  FROM actor a1
 WHERE EXISTS (SELECT a2.*
                 FROM actor a2
                WHERE a1.last_name = a2.last_name 
                  AND a1.actor_id <> a2.actor_id) 
                  ORDER BY first_name;
                 
-- 2 Find actors that don't work in any film
SELECT first_name 
	FROM actor
	WHERE EXISTS (SELECT *
					FROM film_actor
					WHERE film_actor.actor_id IS NULL);
				
-- 3 Find customers that rented only one film
SELECT c1.first_name, c1.last_name FROM customer c1
	WHERE  EXISTS(SELECT COUNT(r1.customer_id) FROM rental r1 GROUP BY customer_id
	HAVING COUNT(r1.customer_id) = 1);

-- 4 Find customers that rented more than one film
SELECT c1.first_name, c1.last_name FROM customer c1
	WHERE  EXISTS(SELECT COUNT(r1.customer_id) FROM rental r1 GROUP BY customer_id
	HAVING COUNT(r1.customer_id) > 1);

-- 5 List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'
SELECT first_name, last_name FROM actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor
						INNER JOIN film USING (film_id)
							WHERE film.title = 'BETRAYED REAR' OR film.title = 'CATCH AMISTAD');
						
-- 6 List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'
SELECT first_name, last_name FROM actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor
						INNER JOIN film USING (film_id)
							WHERE film.title = 'BETRAYED REAR' AND NOT film.title = 'CATCH AMISTAD');
						
-- 7 List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'
SELECT first_name, last_name FROM actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor
						INNER JOIN film USING (film_id)
							WHERE film.title = 'BETRAYED REAR') 
							AND actor_id IN
							(SELECT actor_id FROM film_actor
						INNER JOIN film USING (film_id)
							WHERE film.title = 'CATCH AMISTAD');
						
-- 8 List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'
SELECT first_name, last_name, actor_id FROM actor
	WHERE actor_id NOT IN (SELECT actor_id FROM film_actor
						INNER JOIN film USING (film_id)
							WHERE film.title = 'BETRAYED REAR' OR film.title = 'CATCH AMISTAD');