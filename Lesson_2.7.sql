USE sakila;

# 1: How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name AS category, COUNT(fc.film_id) AS amount_film
FROM film_category fc
JOIN category c
USING(category_id)
GROUP BY c.category_id;

# 2: Display the total amount rung up by each staff member in August of 2005.
SELECT CONCAT(s.first_name, ' ', s.last_name) AS staff, SUM(p.amount) AS total_rung
FROM payment p 
JOIN staff s 
USING(staff_id)
GROUP BY s.staff_id;

# 3: Which actor has appeared in the most films?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_appeared_most_film
FROM film_actor fa
JOIN actor a USING(actor_id)
GROUP BY fa.actor_id
ORDER BY COUNT(fa.actor_id) DESC
LIMIT 1;

# 4: Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(c.first_name, ' ', c.last_name) AS most_active_customer
FROM customer c 
JOIN rental r
USING(customer_id)
GROUP BY r.customer_id
ORDER BY COUNT(r.rental_id) DESC
LIMIT 1;

# 5: Display the first and last names, as well as the address, of each staff member.
SELECT * FROM address;

SELECT 
	CONCAT(s.first_name, ' ', s.last_name) AS name,
    a.address AS address
FROM staff s
LEFT JOIN address a
USING(address_id);

# 6: List each film and the number of actors who are listed for that film.
SELECT f.title AS film, COUNT(a.actor_id) AS number_of_actors
FROM film_actor a
LEFT JOIN film f
USING(film_id)
GROUP BY f.film_id;

# 7: Using the tables payment and customer and the JOIN command, list the total paid by each customer.
# List the customers alphabetically by last name.
SELECT CONCAT(c.last_name,', ' ,c.first_name) AS name, SUM(p.amount) AS total_paid
FROM customer c 
LEFT JOIN payment p
USING(customer_id)
GROUP BY c.customer_id
ORDER BY c.last_name;

# 8: List the titles of films per category.
SELECT c.name AS category, f.title as title
FROM film_category fc
JOIN film f USING(film_id)
JOIN category c USING(category_id);
