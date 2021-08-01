show tables;

select * from country limit 5;

select * from countrylanguage limit 5;

-- 1) Listar somente os paises que estao no caribe.
select Name, Region from country where Region = 'Caribbean';
--

-- 2) Listar todos os paises da america cuja independencia
-- tenha acontecido antes de 1800.
select Name, Continent, IndepYear from country where IndepYear < 1800;
--

-- 3) Listar colunas de codigo e idioma de paises de idioma espanhol
-- como oficial.
select
  CountryCode,
  Language,
  isOfficial
from countrylanguage
where Language = 'Spanish' and isOfficial = 'T';
--

-- 4) Listar colunas de codigo e idioma de paises que possuem o ingles
-- como idioma nao oficial.
select
  CountryCode,
  Language,
  isOfficial
from countrylanguage
where Language = 'English' and isOfficial = 'F';
--

-- 5) Listar todos os paises que possuem população superior
-- a 200 milhoes de habitantes.
select Name, Population from country where Population > 200000000;
--

-- Parlementary e Parliamentary
select distinct GovernmentForm from country order by GovernmentForm asc;

select distinct
  Name,
  Continent,
  GovernmentForm
from country where Continent != 'Europe' order by GovernmentForm asc;

-- 6) Listar todos os paises que possuem o regime parlamentarista
-- e que nao estao na europa.
select
  Name,
  Continent,
  GovernmentForm
from country
where Continent != 'Europe' and GovernmentForm like 'Parlementary%';