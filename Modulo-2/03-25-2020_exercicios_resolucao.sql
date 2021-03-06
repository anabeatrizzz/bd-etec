use world;

SHOW TABLES;

SELECT * FROM COUNTRY;
SELECT CODE, NAME FROM COUNTRY;

SELECT NAME, CONTINENT FROM COUNTRY 
WHERE CONTINENT = "ASIA";

SELECT NAME, CONTINENT FROM COUNTRY 
WHERE CONTINENT = "AMERICA";

SELECT NAME, CONTINENT FROM COUNTRY 
WHERE CONTINENT LIKE "%AMERICA%";

SELECT NAME, CONTINENT FROM COUNTRY 
WHERE NAME LIKE "%A";

SELECT NAME, INDEPYEAR FROM COUNTRY;

SELECT NAME, INDEPYEAR FROM COUNTRY
WHERE INDEPYEAR IS NULL;

SELECT * FROM CITY;
SELECT * FROM COUNTRYLANGUAGE;

SELECT
ID, NAME,
LANGUAGE
FROM 
CITY, COUNTRYLANGUAGE;

-- SEM USO DE ALIAS
SELECT 
ID, NAME,
LANGUAGE
FROM 
CITY, COUNTRYLANGUAGE
WHERE
CITY.COUNTRYCODE = COUNTRYLANGUAGE.COUNTRYCODE;
-- COM USO DE ALIAS
SELECT
ID, NAME AS 'CIDADE',
LANGUAGE AS 'IDIOMA', CL.COUNTRYCODE AS 'PAÍS'
FROM 
CITY AS CI, COUNTRYLANGUAGE AS CL
WHERE
CI.COUNTRYCODE = CL.COUNTRYCODE;

-- 7) MOSTRAR OS NOMES DAS CIDADES, NOMES DOS PAÍSES
-- E NOME DO CONTINENTE ONDE ESTÁ SITUADO
SELECT
CI.NAME AS CIDADE,
CO.NAME AS PAÍS,
CO.CONTINENT AS CONTINENTE
FROM 
CITY AS CI, COUNTRY AS CO
WHERE
CI.COUNTRYCODE = CO.CODE;

SELECT
CI.NAME AS CIDADE,
CO.NAME AS PAÍS,
CONTINENT AS CONTINENTE
FROM 
CITY AS CI, COUNTRY AS CO
WHERE
COUNTRYCODE = CODE;

-- 8) MOSTRAR OS NOMES DE TODAS AS CIDADES, NOME DO PAÍS E O IDIOMA
SELECT 
CI.NAME CIDADE,
CO.NAME PAÍS,
CL.LANGUAGE
FROM 
CITY CI, COUNTRY CO, COUNTRYLANGUAGE CL
WHERE
CI.COUNTRYCODE = CODE AND
CL.COUNTRYCODE = CODE;

-- EXECUTAR OS EXERCÍCIOS

-- 9) MOSTRAR O NOME DO PAÍS, DISTRITO E POPULAÇÃO
-- 10) EXIBIR OS NOMES DE TODOS OS PAÍSES QUE POSSUEM O ESPANHOL
-- COMO IDIOMA OFICIAL
-- 11) EXIBIR O NOME DO CONTINENTE, REGIÃO E IDIOMA DE TODOS OS PAÍSES
-- QUE TEM O HOLANDÊS (DEUTCH) COMO IDIOMA NÃO-OFICIAL

-- FUNÇÕES DE AGREGAÇÃO

/*
  COUNT - RETORNA A QUANTIDADE DE LINHAS (REGISTROS) EM UMA TABELA,
  TAMBÉM PODE RETORNAR UMA QUANTIDADE AGRUPADA DE DADOS RELACIONADOS
  A UM TIPO DE DADO DE UM REGISTRO
*/

-- EXIBE O TOTAL DE PAÍSES CADASTRADOS
SELECT COUNT(*) FROM COUNTRY;

-- EXIBE O TOTAL DE PAÍSES CADASTRADOS, AGRUPADOS POR CONTNENTE
SELECT CONTINENT, COUNT(*) FROM COUNTRY GROUP BY CONTINENT;

-- SUM - SOMATÓRIA = SOMA VALORES

-- EXIBIR A SOMATÓRIA DA POPULAÇÃO CADASTRADA
SELECT SUM(POPULATION) FROM COUNTRY;

-- EXIBIR A SOMATÓRIA DA POPULAÇÃO CADASTRADA, AGRUPADA POR CONTINENTE
SELECT CONTINENT, SUM(POPULATION) FROM COUNTRY GROUP BY CONTINENT;