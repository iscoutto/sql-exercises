-- Junções DML

INNER JOIN
-- O que há em comum entre as tabelas

SELECT funcionarios.*, setores.setor_nome
    FROM funcionarios
        INNER JOIN setores
                ON funcionarios.setor_id = setores.setor_id;
OUTER JOIN
-- Todos os registros das tabelas, mesmo que não haja valores em comum

FULL JOIN
-- Tudo o que há de igual entre as tabelas (left e right join juntos)

LEFT JOIN
-- Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita

RIGHT JOIN 
-- Retorna todos os registros da tabela direita e os registros correspondentes da tabela esquerda
