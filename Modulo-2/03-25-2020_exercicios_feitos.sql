show tables;

select * from country limit 5;

select * from city limit 5;

select * from country where Name = 'Brazil';

select * from countrylanguage where CountryCode = 'BRA';

select * from countrylanguage limit 5;

select Language, CountryCode from countrylanguage
where Language = 'Portuguese';

select Name, Language from country, countrylanguage
where Name = 'Brazil';

-- 7) MOSTRAR OS NOMES DAS CIDADES, NOMES DOS PAÍSES E NOME DO CONTINENTE
-- ONDE ESTÃO SITUADOS
select
  city.Name as Nome_Cidade,
  country.Name as Nome_Pais,
  Continent
from city, country where city.CountryCode = country.Code
order by Nome_Pais asc;

-- 8) MOSTRAR OS NOMES DE TODAS AS CIDADES, NOME DO PAÍS E O IDIOMA
select
  city.Name as Nome_Cidade,
  country.Name as Nome_Pais,
  cl.Language as Idioma,
  cl.IsOfficial
from city, country, countrylanguage as cl
where cl.CountryCode = country.Code and city.CountryCode = country.Code
and cl.IsOfficial = 'T';

-- 9) MOSTRAR O NOME DO PAÍS, DISTRITO E POPULAÇÃO
select
  country.Name as Nome_Pais,
  country.Population as Populacao,
  city.District as Distrito
from country, city where country.Code = city.CountryCode;
    
-- 10) EXIBIR OS NOMES DE TODOS OS PAÍSES QUE POSSUEM O ESPANHOL
-- COMO IDIOMA OFICIAL
select
  Name as Nome_Pais,
  Language as Idioma,
  IsOfficial
from country, countrylanguage as cl
where IsOfficial = 'T' and Language = 'Spanish'
and country.Code = cl.CountryCode;

-- 11) EXIBIR O NOME DO CONTINENTE, REGIÃO E IDIOMA DE TODOS OS PAÍSES
-- QUE TEM O HOLANDÊS (DUTCH) COMO IDIOMA NÃO-OFICIAL
select
  Name as Nome_Pais,
  Continent as Continente,
  Region as Regiao,
  Language as Idioma
from country, countrylanguage as cl
where country.Code = cl.CountryCode and IsOfficial = 'T'
and Language = 'Dutch';

-- Motivo do country.Code = cl.CountryCode
-- country e countrylanguage estao ligadas pelas colunas Code e CountryCode