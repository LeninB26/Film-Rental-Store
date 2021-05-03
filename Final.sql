USE sakila;
#Active and Non Active Customer
SELECT * FROM customer; 

#Total movies in of each rating
SELECT rating, count(rating) AS total_no_of_movies FROM film
GROUP BY 1;

#Total movies in each category
SELECT COUNT(f.film_id) AS total_no_of_films, c.name FROM film_category f
JOIN category c ON f.category_id = c.category_id
GROUP BY c.name;

#Category movie rented the most
SELECT c.name, count(i.film_id) AS no_of_times_rented FROM category c
JOIN film_category f ON c.category_id = f.category_id
JOIN inventory i ON f.film_id = i.film_id 
JOIN rental r ON i.inventory_id = r.inventory_id
 GROUP by c.name 
ORDER BY 2 DESC;

# Store with more revenue
SELECT s.store_id, SUM(p.amount) AS total FROM payment p
JOIN store s ON s.manager_staff_id = p.staff_id
GROUP BY store_id;

#Movie of each rating in each stores
SELECT f.rating, COUNT(f.film_id) AS no_of_films, s.store_id FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
GROUP BY 1,3
ORDER BY 3 DESC;

#Top 20 most rented customer
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_amount FROM customer c 
JOIN payment p ON c.customer_id = p.customer_id
WHERE c.customer_id = p.customer_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 20;

#Rating movie rented the most
SELECT f.rating, count(i.film_id) AS no_of_times_rented FROM film f
JOIN inventory i ON f.film_id = i.film_id 
JOIN rental r ON i.inventory_id = r.inventory_id
 GROUP by f.rating
ORDER BY 2 DESC;

#Revenue per month
SELECT LEFT(payment_date,7) AS "Month", SUM(amount) AS "Revenue Per Month"
FROM payment
GROUP BY 1;

#No_of films_of_each_rating
SELECT rating, COUNT(film_id) AS no_of_films FROM film
GROUP BY rating
ORDER BY 2 DESC;



