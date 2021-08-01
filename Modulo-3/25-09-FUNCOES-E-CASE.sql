DELIMITER $$
CREATE FUNCTION descontoPorValorCase(valor DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
BEGIN
  DECLARE novoValor DECIMAL(10, 2)
  CASE
  WHEN valor < 100 THEN
    SET novoValor = valor - (valor * 0.3);
  WHEN valor <= 200 THEN
    SET novoValor = valor - (valor * 0.4);
  ELSE
    SET novoValor = valor - (valor * 0.5);
  END CASE;
  RETURN novoValor;
END $$
DELIMITER ;

-- SELECT Coluna1, descontoPorValorCase(Coluna1) FROM Tabela1