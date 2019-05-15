-- 2
SELECT co.country, c.city, a.address, a.district, a.postal_code FROM address a, country co, city c
WHERE a.city_id = c.city_id AND c.country_id = co.country_id
AND co.country LIKE '%a' AND c.city LIKE 'E%'
ORDER BY  co.country, c.city;

-- 3
SELECT c.name, f.title, len.name, f.rental_rate
FROM category c, film_category fc, film f, `language` len
WHERE c.category_id = fc.category_id AND fc.film_id = f.film_id AND f.language_id = len.language_id
AND c.name IN ('Comedy', 'Children', 'Animation') AND f.rental_rate < 3
ORDER BY c.name, f.rental_rate, f.title;


