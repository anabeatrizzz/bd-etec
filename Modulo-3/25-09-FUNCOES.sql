-- Funções retornam valor, procedures não.

-- Mudando delimitador para não causar confusão com os pontos e vírgulas
-- dentro de BEGIN.
DELIMITER $$;
-- Comando para criação de função, nome da função, parâmetros dentro
-- dos parênteses.
CREATE FUNCTION Somar(valor1 int, valor2 int)
-- Tipo de dado que a função retorna.
RETURNS INT
-- Começo da função.
BEGIN
  -- O que a função faz.
  RETURN valor1 + valor2;
-- Fim da função.
END $$

-- Chamando a função
SELECT Somar(2, 2) AS RESULTADO;

-- SELECT Coluna1, Funcao(Coluna1, 10) FROM Tabela1