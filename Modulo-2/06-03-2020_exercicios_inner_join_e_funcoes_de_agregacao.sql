-- Ana Beatriz A. de M. da Silva

USE sakila;

-- 7) Contar quantos filmes tem cadastrados na base de dados
SELECT COUNT(film_id) AS CONTAGEM_FILMES FROM film;

-- 8) Contar quantos clientes tem cadastrados na base de dados
SELECT COUNT(customer_id) AS CONTAGEM_CLIENTES FROM customer;

-- 9) Contar quantas locações foram registradas na base de dados
SELECT COUNT(rental_id) AS CONTAGEM_LOCACOES FROM rental;

-- 10) Contar quantas lojas tem cadastradas na base de dados
SELECT COUNT(store_id) AS CONTAGEM_LOJAS FROM store;

-- 11) Somar o valor total das locações
SELECT SUM(amount) AS SOMA_LOCACOES FROM payment;

-- 12) Mostrar a quantidade de filmes existentes em cada loja
SELECT DISTINCT s.store_id, title, COUNT(title) AS CONTAGEM_FILMES
FROM store AS s
INNER JOIN inventory AS i
ON i.store_id = s.store_id
INNER JOIN film AS f
ON i.film_id = f.film_id
GROUP BY store_id, title;

-- 13) Mostrar a quantidade de filmes existente em cada categoria
SELECT name, COUNT(name) AS CONTAGEM_CATEGORIA
FROM film AS f
INNER JOIN film_category AS fc
ON f.film_id = fc.film_id
INNER JOIN category AS c
ON c.category_id = fc.category_id
GROUP BY name;

-- 14) Mostrar a quantidade de atores que trabalharam em cada filme
SELECT title, COUNT(first_name) AS CONTAGEM_ATORES
FROM actor AS ac
INNER JOIN film_actor as fa
ON ac.actor_id = fa.actor_id
INNER JOIN film as f
ON f.film_id = fa.film_id
GROUP BY first_name;

-- 15) Mostrar a quantidade de filmes que cada ator trabalhou
SELECT first_name, last_name, COUNT(title) AS CONTAGEM_FILMES
FROM actor AS ac
INNER JOIN film_actor as fa
ON ac.actor_id = fa.actor_id
INNER JOIN film as f
ON f.film_id = fa.film_id
GROUP BY title;

-- 16) Mostrar o valor total arrecadado com as locações de cada filme
SELECT DISTINCT title, amount, SUM(amount) AS SOMA_LOCACOES
FROM payment as p
INNER JOIN store as s
ON s.store_id = p.payment_id
INNER JOIN inventory as i
ON i.store_id = s.store_id
INNER JOIN film as f
ON f.film_id = i.film_id
GROUP BY title;

-- 17) Mostrar o filme que mais deu lucro
SELECT title, amount, SUM(amount) AS MAIS_LUCRO
FROM rental AS r
INNER JOIN payment AS p
ON p.rental_id = r.rental_id
INNER JOIN inventory AS i
ON i.inventory_id = r.inventory_id
INNER JOIN film AS f
ON i.film_id = f.film_id
GROUP BY title
ORDER BY MAIS_LUCRO DESC
LIMIT 1;

-- 18) Mostrar os filmes que menos deram lucro
SELECT title, COUNT(title) AS QT_ALUGADA
FROM rental AS r
INNER JOIN inventory AS i
ON r.inventory_id = i.inventory_id
INNER JOIN film AS f
ON i.film_id = f.film_id
GROUP BY title
ORDER BY QT_ALUGADA ASC
LIMIT 10;

-- 19) Mostrar o filme que mais deu lucro em cada loja
SELECT DISTINCT title, s.store_id, amount, SUM(amount) AS MAIS_LUCRO
FROM payment as p
INNER JOIN store as s
ON s.store_id = p.payment_id
INNER JOIN inventory as i
ON i.store_id = s.store_id
INNER JOIN film as f
ON f.film_id = i.film_id
GROUP BY s.store_id;

-- 20) Mostrar o cliente que mais gastou
SELECT DISTINCT first_name, last_name, amount, SUM(amount) AS GASTO
FROM customer AS cus
INNER JOIN store AS s
ON s.store_id = cus.store_id
INNER JOIN payment AS p
ON p.customer_id = cus.customer_id
GROUP BY first_name
ORDER BY GASTO DESC
LIMIT 1;

-- 21) Mostrar o cliente que mais gastou em cada loja
SELECT DISTINCT first_name, last_name, s.store_id, amount, SUM(amount)
AS GASTO
FROM customer AS cus
INNER JOIN store AS s
ON s.store_id = cus.store_id
INNER JOIN payment AS p
ON p.customer_id = cus.customer_id
GROUP BY cus.first_name
ORDER BY GASTO DESC;

-- 22) Mostrar a quantidade de locações do filme que foi mais alugado
SELECT title, COUNT(title) AS QT_ALUGADA
FROM rental AS r
INNER JOIN inventory AS i
ON r.inventory_id = i.inventory_id
INNER JOIN film AS f
ON i.film_id = f.film_id
GROUP BY title
ORDER BY QT_ALUGADA DESC
LIMIT 1;

-- 23) Mostrar a quantidade de locações do filme que foi mais alugado
-- em cada loja
SELECT title, s.store_id, COUNT(title) AS QT_ALUGADA
FROM rental AS r

INNER JOIN inventory AS i
ON r.inventory_id = i.inventory_id

INNER JOIN store AS s
ON s.store_id = i.store_id

INNER JOIN film AS f
ON i.film_id = f.film_id

GROUP BY s.store_id
ORDER BY QT_ALUGADA DESC; -- VOU ESPERAR A CORREÇÃO

-- 24) Mostrar o lucro de cada loja
SELECT cus.store_id, amount, SUM(amount) AS LUCRO_CADA_LOJA
FROM customer AS cus
INNER JOIN payment AS p
ON p.customer_id = cus.customer_id
GROUP BY cus.store_id;

SELECT * FROM inventory;
SELECT * FROM rental;