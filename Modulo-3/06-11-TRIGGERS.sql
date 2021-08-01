/*
	TRIGGERs são PROCEDUREs que são executadas quando algum
	comando DML acontece.
*/

DELIMITER $$
/*
	Comando de criação de TRIGGER, nome da TRIGGER,
	é executada depois de um INSERT
*/
CREATE TRIGGER trgItensVendidos AFTER INSERT
/* Em uma tabela específica */
ON Tabela
FOR EACH ROW
BEGIN
	/* O que será feito quando ocorrer o INSERT na tabela específica */
	UPDATE Tabela SET Coluna = novoValor WHERE Coluna = Valor;
END $$
DELIMITER ;