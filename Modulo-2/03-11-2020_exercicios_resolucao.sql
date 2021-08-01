-- 1) LISTAR SOMENTE OS PAÍSES QUE ESTÃO NO CARIBE
select * from country
where 
region = 'Caribbean';

-- 2) LISTAR TODOS OS PAÍSES DA AMÉRICA CUJA INDEPENDÊNCIA
-- TENHA ACONTECIDO ANTES DE 1800
select * from country
where
continent like '%america%' and
indepyear < 1800;

-- 3) LISTAR O CÓDIGO DO PAÍS E O IDIOMA DOS PAÍSES QUE
-- TEM O IDIOMA ESPANHOL COMO OFICIAL
select * from countrylanguage
where
language = 'spanish' and
isofficial = 't';

-- 4) LISTAR O CÓDIGO DO PAÍS E O IDIOMA DOS PAÍSES QUE POSSUEM
-- O INGLÊS COMO IDIOMA NÃO OFICIAL
select * from countrylanguage
where
language = 'english' and
isofficial = 'f';

-- 5) LISTAR TODOS OS PAÍSES QUE POSSUEM POPULAÇÃO SUPERIOR
-- A 200 MILHÕES DE HABITANTES
select * from country
where
population > 150000000;

-- 6) LISTAR TODOS OS PAÍSES QUE POSSUEM O REGIME PARLAMENTARISTA
-- E QUE NÃO ESTÃO NA EUROPA
select * from country
where 
GovernmentForm like '%parl%' and
Continent != 'europe';