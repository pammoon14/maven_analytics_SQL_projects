-- Maven Analytics Mid Course Project


USE mavenmovies;


/* Q1: We will need a list of all staff members, including their first and last names, email addresses, 
and the store identification number where they work. */
SELECT 	first_name,
        last_name,
        email,
        store_id
FROM staff;


-- Q2: We will need separate counts of inventory items held at each of your two stores.
SELECT 	
		COUNT(inventory_id) AS inventory_count,
		store_id
FROM inventory
GROUP BY store_id;


-- Q3: We wil need a count of active customers for each of your stores. Separately.		
SELECT	
		COUNT(CASE WHEN active = 1 THEN customer_id ELSE NULL END) AS active_customer,
        store_id
FROM customer
GROUP BY store_id;


/* Q4: In order to assess the liability of a data breach, we will need you to provide
	a count of all customer email addresses stored in the database. */
SELECT	
		COUNT(email) AS email_count
FROM customer;


/* Q5:	We are interested in how diverse your film offering is as a means of understanding how likely 
you are to keep customers engaged in the future. Please provide a count of unique film titles 
you have in inventory at each store and then provide a count of the unique categories of films you provide. 
*/
SELECT 	COUNT(DISTINCT film_id) AS unique_film_count,
		store_id
FROM inventory
GROUP BY store_id;


SELECT 	COUNT(DISTINCT name) AS unique_category
FROM category



/*Q6: We would like to understand the replacement cost of your films. 
Please provide the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry. ``	
*/
SELECT
		MIN(replacement_cost) AS lease_expensive_to_replace,
        MAX(replacement_cost) AS most_expensive_to_replace,
        AVG(replacement_cost) AS AVG_to_replace
FROM film;


/* Q7: We are interested in having you put payment monitoring systems and maximum payment 
processing restrictions in place in order to minimize the future risk of fraud by your staff. 
Please provide the average payment you process, as well as the maximum payment you have processed.
*/
SELECT
	AVG(amount) AS average_payment, 
    MAX(amount) AS max_payment
FROM payment;

/* Q8: We would like to better understand what your customer base looks like. 
Please provide a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/
SELECT 
	customer_id, 
    COUNT(rental_id) AS number_of_rentals
FROM rental
GROUP BY 
	customer_id
ORDER BY 
	COUNT(rental_id) DESC;


