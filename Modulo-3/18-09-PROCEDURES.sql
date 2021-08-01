-- PROCEDURES é o nome que se dá para as funções do SQL

-- O delimitador $$ indica onde a função termina.
-- Temos que mudar para não causar confusão com os pontos e vírgulas
-- dentro de BEGIN
DELIMITER $$

-- Comando para indicar a criação da função, nome da função,
-- parâmetros dentro dos parênteses
CREATE PROCEDURE inserirAluno(NOME VARCHAR(50), IDADE INT,
	ENDERECO VARCHAR(100))
-- Comando indicando o começo da função
BEGIN
	-- O que a função fará
	INSERT INTO TB_ALUNOS(NM_ALUNO, NR_IDADE, DS_ENDERECO)
	VALUES (NOME, IDADE, ENDERECO);
-- Comando indicando o fim da função
END $$
-- Indicando que o delimitador é o ponto e vírgula
DELIMITER ;

-- Chamando a função com os argumentos
CALL inserirAluno('Ana', 18, 'Rua dos bobos');

DELIMITER $$
CREATE PROCEDURE insertAndSelect(NOME VARCHAR(50), IDADE INT,
	ENDERECO VARCHAR(100))
BEGIN
	-- O que a função fará
	INSERT INTO TB_ALUNOS(NM_ALUNO, NR_IDADE, DS_ENDERECO)
	VALUES (NOME, IDADE, ENDERECO);
	SELECT * FROM TB