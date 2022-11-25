-- UNION, CAST, CONVERT DML

UNION
-- Combina os resultados de duas ou mais consultas em um único resultado

SELECT funcionarios.func_id AS [Codigo], funcionarios.func_nome AS [Nome]
    FROM funcionarios
    WHERE funcionarios.func_nome LIKE 'A%'
        UNION
            SELECT setores.setor_id, setores.setor_nome
                FROM setores;

CAST e CONVERT
-- Converte uma expressão de um tipo de dados para outro

-- CAST ('expression' AS 'data_type' [(length)]) --> 'lenght' = comprimento do dado
-- CONVERT ('data_type' [(length)], expression [,style]) --> 'style' = especifica como deve converter

SELECT AVG(funcionarios.func_salario)
    FROM funcionarios;

SELECT CAST(AVG(funcionarios.func_salario) AS DECIMAL(9, 2)) -- DECIMAL(precision, scale)
    FROM funcionarios;

SELECT CONVERT(DECIMAL(9, 2), AVG(funcionarios.func_salario))
    FROM funcionarios;

SELECT funcionarios.func_dataNasc
    FROM funcionarios;

SELECT CAST(funcionarios.func_dataNasc AS VARCHAR(4))
    FROM funcionarios;

SELECT CONVERT(VARCHAR, funcionarios.func_dataNasc, 104)
    FROM funcionarios;
