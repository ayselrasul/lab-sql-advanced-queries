-- Lab | SQL Advanced queries
-- In this lab, you will be using the Sakila database of movie rentals

-- Instructions
-- List each pair of actors that have worked together

 use sakila;

SELECT 
    CONCAT(ac.first_name, ' ', ac.last_name) AS actor_1,
    CONCAT(bc.first_name, ' ', bc.last_name) AS actor_2
FROM
    film_actor a
        JOIN
    film_actor b ON a.film_id = b.film_id
        AND a.actor_id > b.actor_id
        JOIN
    actor ac ON a.actor_id = ac.actor_id
        JOIN
    actor bc ON b.actor_id = bc.actor_id;



-- For each film, list actor that has acted in more films
  
SELECT 
    a.actor_id, COUNT(fa.film_id)
FROM
    actor a
        JOIN
    film_actor fa USING (actor_id)
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 1;
  
  
 with actors as ( 
		select a.actor_id,count(fa.film_id) as acted_count
  		  from actor a  
          join film_actor fa using(actor_id)
      group by a.actor_id
        having count(fa.film_id)>1 
  )
  
  select film_id,actor_id  
    from film_actor 
    join actor_acts a using (actor_id)
Order by film_id;
  