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