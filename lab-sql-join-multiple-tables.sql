-- Write a query to display for each store its store ID, city, and country.

SELECT
    s.store_id,
    ci.city,
    co.country
FROM
    store s
JOIN
    address a ON s.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
JOIN
    country co ON ci.country_id = co.country_id;
    
    -- Write a query to display how much business, in dollars, each store brought in.
SELECT
    s.store_id,
    SUM(p.amount) AS total_sales
FROM
    store s
JOIN
    staff st ON s.manager_staff_id = st.staff_id
JOIN
    payment p ON st.staff_id = p.staff_id
GROUP BY
    s.store_id;

-- Display the total amount rung up by each staff member in August 2005.

SELECT
    c.name AS category_name,
    AVG(f.length) AS average_running_time
FROM
    film f
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name;

-- Which film categories are longest?
SELECT
    c.name AS category_name,
    AVG(f.length) AS average_length
FROM
    film f
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
GROUP BY
    c.name
ORDER BY
    average_length DESC;
-- Display the most frequently rented movies in descending order.

SELECT
    f.title AS film_title,
    COUNT(r.rental_id) AS rental_count
FROM
    film f
JOIN
    inventory i ON f.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY
    f.film_id, f.title
ORDER BY
    rental_count DESC;
    
-- List the top five genres in gross revenue in descending order.
   
SELECT
    c.name AS genre,
    SUM(p.amount) AS gross_revenue
FROM
    category c
JOIN
    film_category fc ON c.category_id = fc.category_id
JOIN
    inventory i ON fc.film_id = i.film_id
JOIN
    rental r ON i.inventory_id = r.inventory_id
JOIN
    payment p ON r.rental_id = p.rental_id
GROUP BY
    c.category_id
ORDER BY
    gross_revenue DESC
LIMIT 5;

    


