DELIMITER $$
-- Comando de criação de função, nome da função e parâmetros nos parênteses
CREATE FUNCTION exemploLoop(limite INT)
-- Tipo de dado que a função retorna
RETURNS INT
-- Começo da função
BEGIN
  -- Declarando variáveis com valores padrões
  DECLARE cont INT DEFAULT 0;
  DECLARE valor INT DEFAULT 0;
  -- Começo do laço de repetição LACO
  LACO: LOOP
    -- Indicando valores para as variáveis
    SET cont = cont + 1;
    SET valor = valor + 10;
    -- Se cont for maior igual a dez, então
    IF cont >= 10 THEN
      -- Saia do laço de repetição
      LEAVE LACO;
    -- Fim da condição IF
    END IF;
  -- Fim do laço de repetição LACO
  END LOOP LACO;
  -- Retorne a variável valor
  RETURN valor;
-- Fim da função
END $$
DELIMITER ;

SELECT exemploLoop(10)

DELIMITER $$
CREATE FUNCTION exemploWhile(limite INT)
RETURNS INT
-- Começo da função
BEGIN
  -- Declarando variáveis com valores padrões
  DECLARE cont INT DEFAULT 0;
  DECLARE valor INT DEFAULT 0;
  -- Enquanto cont for menor igual a limite, faça
  WHILE cont <= limite DO
    -- Indicando novos valores para as variáveis
    SET cont = cont + 1;
    SET valor = valor + 10;
  -- Fim do laço de repetição WHILE
  END WHILE;
  -- Retorne a variável valor
  RETURN valor;
-- Fim da função
END $$
DELIMITER ;

SELECT exemploWhile(20);