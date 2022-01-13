**Question 1**
```sql
SELECT actor.*
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id 
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE  film.title = 'ACADEMY DINOSAUR'
GROUP BY actor.actor_id
```
***
**Question 2**
```sql
SELECT film.title, film.description, film.release_year, film.length, film.rating, COUNT(film.film_id) AS 'Number of actors'
FROM `film`
INNER JOIN film_actor ON film.film_id = film_actor.film_id 
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.rating = 'G'
GROUP BY film.film_id
```
***

**Question 3**
```sql
SELECT AVG(rental_rate) AS 'Trung bình cộng rental_rate'
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id 
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE  actor.first_name = 'CHRISTIAN'
AND actor.last_name = 'GABLE'
```
***
