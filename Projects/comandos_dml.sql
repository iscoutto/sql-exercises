-- Comandos DML

SELECT
-- Retorna uma tabela com os requisitos solicitados

ALIAS
-- Nome para a coluna retornada da pesquisa

SELECT func_id AS [Código do funcionário]
    FROM funcionarios;

WHERE
-- Condição de restrição ao retorno dos registros

SELECT func_salario * 1.10 AS [Novo salário]
    FROM funcionarios
    WHERE func_salario >= 5000;

BETWEEN
-- Intervalos de valores numéricos

SELECT func_salario * 1.10 AS [Novo salário]
    FROM funcionarios
    WHERE func_salario 
        BETWEEN 330 AND 550;

LIKE
-- Aplicados para valores de texto
-- % comparação de incia/ termina com ou contém 
-- _ define a posição do caractere a ser desconsiderado

SELECT func_nome
    FROM funcionarios
    WHERE func_nome 
        LIKE 'a%'; -- incia com 'a'

SELECT func_nome
    FROM funcionarios
    WHERE func_nome
        LIKE 'Brun_'; -- termina com qualquer caractere

IN
-- Valores fixos aceitos em uma pesquisa

SELECT *
    FROM funcionarios
    WHERE func_id IN (1, 5, 9);

DISTINCT
-- Elimina valores recorrentes da tabela de resposta

SELECT DISTINCT setor_id
    FROM funcionarios;

TOP
-- Restrição no número de registros da tabela de resposta

SELECT TOP 5 *
    FROM funcionarios
    ORDER BY func_salario DESC;

ORDER BY
-- Determina a ordem dos registros da tabela de resposta

SELECT *
    FROM setores
    ORDER BY setor_nome;

SELECT *
    FROM setores
    ORDER BY setor_nome ASC;

COUNT
-- Contagem de registros

SELECT COUNT(*)
    FROM funcionarios;

SELECT COUNT(setor_id)
    FROM funcionarios;

SELECT COUNT(DISTINCT setor_id)
    FROM funcionarios;

SUM
-- Somatória dos valores de um campo
SELECT SUM(func_salario) AS [Soma dos salários]
    FROM funcionarios;

AVG
-- Média dos valores de um campo
SELECT AVG(func_salario) AS [Média salarial]
    FROM funcionarios;

MIN, MAX
-- Valores minímo e máximo

SELECT 
    MIN(func_salario) AS [Menor salário]
    MAX(func_salario) AS [Maior salário]
    FROM funcionarios;

GROUP BY
-- Agrupa um conjunto de linhas 
-- SUM, MAX, MIN, COUNT
-- HAVING é usado com 'GROUP BY' para filtrar grupos no conjunto de resultados
-- Não utilizar 'SELECT *' já que depois precisará especificar no 'GROUP BY'

SELECT setor_id,
    COUNT(*) AS [Func. por setor]
    FROM funcionarios
    WHERE setor_id IS NOT NULL
    GROUP BY setor_id;

HAVING
-- Determina condições da mesma forma que 'WHERE'
-- Condição aplicada após agrupamento
-- 'WHERE' possui melhor performance

SELECT setor_id,
    COUNT(*) AS [Func. por setor]
    FROM funcionarios
    WHERE setor_id IS NOT NULL
    GROUP BY setor_id
    HAVING COUNT(*) > 4;
