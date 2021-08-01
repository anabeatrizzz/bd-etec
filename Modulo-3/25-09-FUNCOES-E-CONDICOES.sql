-- Mudando delimitador para não causar confusão com os pontos
-- e vírgulas dentro de BEGIN.
DELIMITER $$

-- Comando de criação de função, nome da função,
-- parâmetros dentro dos parênteses.
CREATE FUNCTION descontoPorValor(valor DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
-- Começo da função.
BEGIN
  -- Comando de declaração de variável, nome da variável,
  -- tipo de dado da variável.
  DECLARE novoValor DECIMAL(10, 2)
  -- Primeira condição
  IF valor < 100 THEN
    -- Definindo novo valor para novoValor
    SET novoValor = valor - (valor * 0.3);
  -- Segunda condição
  ELSEIF valor <= 200 THEN
    SET novoValor = valor - (valor * 0.4);
  -- Ultima condição
  ELSE
    SET novoValor = valor - (valor * 0.5);
  -- Fim da condição
  END IF;
-- Fim da função
END $$

-- Mudando delimitador para ponto e vírgula
DELIMITER ;

-- SELECT Coluna1, descontoPorValor(Coluna1) FROM Tabela1;