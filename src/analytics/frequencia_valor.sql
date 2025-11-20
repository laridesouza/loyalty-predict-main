SELECT IdCliente,
        count(DISTINCT substr(DtCriacao, 0, 11)) AS qtdeFrequencia,
        sum(CASE WHEN QtdePontos > 0 THEN QtdePontos ELSE 0 END) AS qtdePontosPos, 
        sum(abs(QtdePontos)) as qtdePontosAbs

FROM transacoes
WHERE DtCriacao < '2025-09-01'
AND DtCriacao > date('2025-09-01', '-28 day')

GROUP BY IdCliente

ORDER BY qtdeFrequencia DESC