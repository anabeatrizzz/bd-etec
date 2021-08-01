-- Mostrando tabelas
show tables;

-- Mostrando todos os dados da tabela country
select * from country;

-- Mostrando apenas cinco linhas da tabela country
select * from country limit 5;

-- Mostrando apenas duas colunas de country
select
  Code,
  Name
from country;

-- Selecionando registros da coluna IndepYear quando
-- sao maiores ou iguais a 1900
select IndepYear from country where IndepYear >= 1900;

-- Selecionando registros da coluna IndepYear quando
-- tem valores entre 1800 e 1899, ordernando pelos valores
-- de IndepYear de modo decrescente
select IndepYear from country where IndepYear
between 1800 and 1899 order by IndepYear asc;

-- Mostrando registros nulos da coluna IndepYear
select Name, IndepYear from country where IndepYear IS NULL;

-- Mostrando paises do continente da Asia
select Name, Continent from country where Continent = "Asia";

-- Mostrando paises dos continentes Asia e Europa
select Name, Continent from country where Continent = "Europe"
or Continent = "Asia";

-- Mostrar registros se tiver a sequencia America
-- %America -> registros com o final America
-- America% -> registros com o começo America
-- _A% --> Segunda letra A
select Name, Continent from country where Continent LIKE "%America%";

-- Registros onde o Name tem que ter letra A na segunda casa e na quarta
select Name, Continent from country where Continent LIKE "%America"
and Name like "_A_A%";