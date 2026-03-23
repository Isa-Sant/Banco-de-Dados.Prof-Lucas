-- ATIVIDADE: RELATORIO DE VENDAS E SABOR --
-- RELATORIO MOSTRASSE UMA COLUNA COM SABORES, A QUANTIDADE(L) VENDIDA DO ANO TODO DE 2016, ORDENADAS DA MAIOR PARA MENOR
-- E A REPRESENTAÇÃO DE VENDA DE CADA UM

/* Gerar um relatório com:
sabor, quantidade total vendida (litros) e % que cada sabor representa no total

SUM(INF.quantidade) → total por sabor
OVER() → pega total geral
divisão → calcula %
GROUP BY → separa os sabores

Pega o total desse sabor, divide pelo total geral, e transforma em porcentagem

*/

SELECT 
    2016 AS ANO,
    TP.sabor,
    SUM(INF.quantidade) AS QTD_LITROS,
    ROUND(  SUM(INF.quantidade) / SUM(SUM(INF.quantidade)) OVER() * 100, 2) AS PERCENTUAL
FROM itens_notas_fiscais INF
INNER JOIN notas_fiscais NF 
    ON NF.numero = INF.numero
INNER JOIN tabela_de_produtos TP
    ON TP.codigo_do_produto = INF.codigo_do_produto
WHERE YEAR(NF.data_venda) = 2016
GROUP BY TP.sabor
ORDER BY QTD_LITROS DESC;

