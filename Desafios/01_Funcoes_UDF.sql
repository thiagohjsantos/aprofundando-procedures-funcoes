--Desafio: faturamento por bairro

CREATE FUNCTION FaturamentoNotaFiscalBairro(@BAIRRO VARCHAR(50))
RETURNS FLOAT
AS
BEGIN
	DECLARE @VALOR_TOTAL FLOAT;

	SELECT @VALOR_TOTAL = SUM(INF.QUANTIDADE * INF.[PRE�O])
	FROM [ITENS NOTAS FISCAIS] INF
	INNER JOIN [NOTAS FISCAIS] NF
	ON INF.NUMERO = NF.NUMERO
	INNER JOIN [TABELA DE CLIENTES] TC
	ON TC.CPF = NF.CPF
	WHERE TC.BAIRRO = @BAIRRO
	RETURN @VALOR_TOTAL
END;

SELECT dbo.FaturamentoNotaFiscalBairro('Jardins');