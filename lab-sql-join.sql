use sakila;

# 1 List the number of films per category.

SELECT C.name, COUNT(F.film_id) AS num_films
FROM category AS C
JOIN film_category AS F
ON C.category_id = F.category_id
GROUP BY C.name;

# 2 Display the first and the last names, as well as the address, of each staff member.

SELECT S.staff_id, S.first_name, S.last_name, A.address
FROM staff S 
JOIN address A 
ON S.address_id = A.address_id;

# 3 Display the total amount rung up by each staff member in August 2005.

SELECT * FROM payment;

SELECT S.staff_id, SUM(P.amount) as total_amount
FROM staff S 
JOIN payment P 
ON S.staff_id = P.staff_id
GROUP BY P.staff_id; 

# 4 List all films and the number of actors who are listed for each film.

SELECT F.title, COUNT(A.actor_id) AS num_actors
FROM film F
JOIN film_actor A 
ON F.film_id = A.film_id
GROUP BY A.film_id;

# 5 Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

SELECT C.customer_id, C.first_name, C.last_name, SUM(P.amount) AS total_amount
FROM customer AS C
JOIN payment AS P
ON C.customer_id = P.customer_id
GROUP BY P.customer_id
ORDER BY C.last_name ASC;

