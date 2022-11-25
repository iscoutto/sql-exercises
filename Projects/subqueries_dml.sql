-- Subqueries

-- "consulta aninhada"
-- alternativa para junções
-- subconsulta dentro de parenteses!!
-- só pode retornar um registro e uma coluna

SELECT funcionarios.*,
    (
        SELECT gerentes.func_nome
            FROM funcionarios AS [Gerentes]
            WHERE gerentes.func_id = funcionarios.gerente_id
    ) AS [Nome gerentes]
    FROM funcionarios
    WHERE gerente_id IS NOT NULL;
-- Tabela funcionarios renomeada para 'Gerentes' 
-- Retorna o nome dos gerentes da tabela gerente como um inner join na tabela funcionarios

SELECT setores.*,
    (
        SELECT COUNT(*) 
            FROM funcionarios
            WHERE funcionarios.setor_id = setores.setor_id 
    ) AS [Total funcionarios]
    FROM setores;
-- Subconsulta que retorna a quantidade de funcionarios por setor
-- Retorna as tabelas de setores (setor_id, setor_nome) + nova coluna 'Total funcionarios' da subconsulta

-- EXEMPLOS de subconsultas restringindo o resultado com WHERE
SELECT setores.*,
    (
        SELECT COUNT(*)
            FROM funcionarios
            WHERE funcionarios.setor_id = setores.setor_id
    ) AS [Total funcionarios]
    FROM setores
    WHERE
        (
            SELECT COUNT(*)
            FROM funcionarios
            WHERE funcionarios.setor_id = setores.setor_id
        ) > 0; -- Restringe a consulta para valores > 0

SELECT setores.*,
    (
        SELECT COUNT(*)
            FROM funcionarios
            WHERE funcionarios.setor_id = setores.setor_id
    ) AS [Total funcionarios]
    FROM setores
    WHERE EXISTS -- TRUE se houver ao menos um registro
        (
            SELECT func_id
                FROM funcionarios
                WHERE funcionarios.setor_id = setores.setor_id
        );

-- EXEMPLOS de subconsultas com TOP, IN e NOT IN
SELECT *
    FROM setores
    WHERE setor_id IN 
        (
            SELECT funcionarios.setor_id
                FROM funcionarios
                WHERE funcionarios.setor_id = setores.setor_id
        );

SELECT *
    FROM setores
    WHERE setor_id IN
        (
            SELECT TOP 1 funcionarios.setor_id
                FROM funcionarios
                WHERE funcionarios.setor_id = setores.setor_id
        );
