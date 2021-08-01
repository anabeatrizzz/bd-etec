-- Ana Beatriz A. de M. da Silva
/*
  Utilizando o INNER JOIN, elabores consultas à base de dados SAKILA
  que retornem as seguintes informações:
  1) O nome do cliente, o endereço, o nome da cidade e o país;
  2) Título do filme e categoria do filme;
  3) Nome do ator e título do filme em que atuou;
  4) Título do filme, categoria do filme e nome dos atores que atuaram
  no filme
  5) Filme, id da loja e valor de locação de cada filme
  6) Nome do cliente, título do filme, data da locação e valor pago
  na locação
*/
use sakila;

-- 1) O nome do cliente, o endereço, o nome da cidade e o país
SELECT first_name, last_name, address, city, country
FROM customer AS cus
INNER JOIN address AS ad
ON cus.address_id = ad.address_id
INNER JOIN city AS c
ON ad.city_id = c.city_id
INNER JOIN country AS co
ON c.country_id = co.country_id;

-- 2) Título do filme e categoria do filme
SELECT title, name
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON c.category_id = fc.category_id;

-- 3) Nome do ator e título do filme em que atuou
SELECT first_name, last_name, title
FROM actor AS ac
INNER JOIN film_actor as fa
ON ac.actor_id = fa.actor_id
INNER JOIN film as f
ON f.film_id = fa.film_id;

-- 4) Título do filme, categoria do filme e nome dos atores que atuaram
-- no filme
SELECT title, name, first_name, last_name
FROM film as f
INNER JOIN film_category as fc -- JUNTA COM FILM E CATEGORY
ON fc.film_id = f.film_id
INNER JOIN category as c
ON fc.category_id = c.category_id
INNER JOIN film_actor as fa -- JUNTA COM FILM E ACTOR
ON fa.film_id = f.film_id
INNER JOIN actor as a
ON fa.actor_id = a.actor_id;

-- 5) Filme, id da loja e valor de locação de cada filme
SELECT title, s.store_id, amount
FROM payment as p
INNER JOIN store as s
ON s.store_id = p.payment_id
INNER JOIN inventory as i
ON i.store_id = s.store_id
INNER JOIN film as f
ON f.film_id = i.film_id;

-- 6) Nome do cliente, título do filme, data da locação e valor pago
-- na locação
SELECT first_name, last_name, title, rental_date, amount
FROM customer as cus

INNER JOIN rental as r
ON r.customer_id = cus.customer_id

INNER JOIN inventory as i -- JUNTA COM FILM E RENTAL
ON i.inventory_id = r.inventory_id

INNER JOIN film as f
ON i.film_id = f.film_id

INNER JOIN payment as p
ON p.payment_id = r.rental_id; 