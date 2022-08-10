-- Buscando todos os máximos valores  hitóricos do ouro
SELECT
	metal.Nome as 'Metal',
    cotacao.Data,
    cotacao.ValorKg as 'Valor'
FROM
	metal,
    cotacao
WHERE
	metal.Nome = 'Ouro'
    AND
    metal.Simbolo = cotacao.FK_Metal_Simbolo
	AND
	cotacao.ValorKg = (
						SELECT
							MAX(cotacao.ValorKg)
						FROM
							metal,
							cotacao
						WHERE
							metal.Nome = 'Ouro'
							AND
							metal.Simbolo = cotacao.FK_Metal_Simbolo
						);
-- Selecione a maior cotação histórica de cada METAL:
SELECT
	cotacao_metal.*,
    cotacao.Data
FROM    
        (SELECT
            metal.Nome as 'Metal',
            MAX(cotacao.ValorKg) as Valor
        FROM
            metal,
            cotacao
        WHERE
            metal.Simbolo = cotacao.FK_Metal_Simbolo
        GROUP BY metal.Nome) as cotacao_metal,
        cotacao
 WHERE
 	cotacao.ValorKg = cotacao_metal.Valor;