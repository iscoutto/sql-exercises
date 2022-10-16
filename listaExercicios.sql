USE ExerciciosBD;

-- Deletando uma tabela
DROP TABLE locacoes;
DROP TABLE fitas;
DROP TABLE tipos;
DROP TABLE clientes;

-- Criando as tabelas
CREATE TABLE clientes
(
	cod_cliente int PRIMARY KEY,
	nome varchar(50)
);

CREATE TABLE tipos
(
	cod_tipo int PRIMARY KEY,
	descricao varchar(50)
);

CREATE TABLE fitas
(
	cod_fita int PRIMARY KEY,
	descricao varchar(50),
	fk_cod_tipo int FOREIGN KEY REFERENCES tipos (cod_tipo)
);

CREATE TABLE locacoes
(
	cod_locacao int PRIMARY KEY,
	fk_cod_fita int FOREIGN KEY REFERENCES fitas (cod_fita),
	valor numeric,
	fk_cod_cliente int FOREIGN KEY REFERENCES clientes (cod_cliente)
);

-- Inserindo os dados na tabela Clientes
INSERT INTO clientes VALUES (1, 'Silvio Santos');
INSERT INTO clientes VALUES(2, 'Xuxa');
INSERT INTO clientes VALUES(3, 'Ratinho');
INSERT INTO clientes VALUES(4, 'Teobaldo');
INSERT INTO clientes VALUES(5, 'Bob Esponja');

-- Inserindo os dados na tabela Tipos
INSERT INTO tipos VALUES(1, 'Drama');
INSERT INTO tipos VALUES(2, 'Acao');
INSERT INTO tipos VALUES(3, 'Terror');
INSERT INTO tipos VALUES(4, 'Ficcao');
INSERT INTO tipos VALUES(5, 'Documentario');

-- Inserindo os dados na tabela Fitas
INSERT INTO fitas VALUES(1, 'Titanic', 1);
INSERT INTO fitas VALUES(2, 'Kill Bill', 2);
INSERT INTO fitas VALUES(3, 'O Massacre da serra eletrica', 3);
INSERT INTO fitas VALUES(4, 'Os outros', 3);
INSERT INTO fitas VALUES(5, 'O Grande Dragao Branco', 2);

-- Inserindo os dados na tabela Locacoes
INSERT INTO locacoes VALUES(1, 2, 5, 1);
INSERT INTO locacoes VALUES(2, 3, 4, 2);
INSERT INTO locacoes VALUES(3, 1, 5, 3);
INSERT INTO locacoes VALUES(4, 1, 3, 2);
INSERT INTO locacoes VALUES(5, 3, 2, 1);
INSERT INTO locacoes VALUES(6, 3, 5, 3);
INSERT INTO locacoes VALUES(7, 2, 4, 3);
INSERT INTO locacoes VALUES(8, 2, 3, 1);
INSERT INTO locacoes VALUES(9, 1, 1, 1);
INSERT INTO locacoes VALUES(10, 2, 5, 2);

-- Apresentando as tabelas
SELECT * FROM clientes;
SELECT * FROM tipos;
SELECT * FROM fitas;
SELECT * FROM locacoes;

-- a) Selecione todos os clientes que têm a letra ‘a’ no nome
SELECT * FROM clientes WHERE nome LIKE '%a%'

-- b) Selecione todas as locações com valor entre 3 e 5 por ordem de valor
SELECT valor FROM locacoes WHERE valor BETWEEN 3 AND 5 ORDER BY valor ASC;

-- c) Selecione todas as fitas locadas para o cliente no 3 e cujo valor foi menor ou igual a 4
SELECT fk_cod_fita FROM locacoes WHERE fk_cod_cliente = 3;

-- d) Selecione a quantidade de fitas locadas agrupadas pelo código da fita
SELECT fk_cod_fita, COUNT(*) AS [Total de fitas] FROM locacoes GROUP BY fk_cod_fita;

-- e) Selecione a soma do valor das fitas locadas agrupadas pelo código da fita
SELECT fk_cod_fita, SUM(valor) AS [Soma de fitas] FROM locacoes GROUP BY fk_cod_fita;

-- f) Selecione o valor médio gasto em fitas agrupados por cliente
SELECT fk_cod_cliente, AVG(valor) AS [Valor medio] FROM locacoes GROUP BY fk_cod_cliente;

-- g) Descubra o maior valor de locação por fita
SELECT fk_cod_fita, MAX(valor) AS [Maior valor] FROM locacoes GROUP BY fk_cod_fita;

-- h) Descubra o menor valor de locação por cliente
SELECT fk_cod_cliente, MIN(valor) AS [Menor valor] FROM locacoes GROUP BY fk_cod_cliente;

-- i) Selecione o nome da fita e a descrição do tipo de todas as fitas
SELECT fitas.descricao AS [Nome], tipos.descricao AS [Tipo] FROM fitas INNER JOIN tipos on fitas.fk_cod_tipo = tipos.cod_tipo;

-- j) Selecione o nome, o código da fita e a descrição do tipo de todas as fitas cujo tipo seja = 3
SELECT fitas.descricao AS [Nome], cod_fita AS [Codigo], tipos.descricao AS [Descricao tipo] FROM fitas, tipos WHERE cod_tipo = 3 AND fk_cod_tipo = 3;

-- k) Selecione o código da locação, o valor e nome dos clientes para todas as locações
SELECT cod_locacao AS [Codigo locacao], valor AS [Valor], clientes.nome AS [Nome cliente] FROM locacoes INNER JOIN clientes on locacoes.fk_cod_cliente = clientes.cod_cliente;

-- l) Selecione o código da locação, o valor, o código e o nome dos clientes para todas as locações cujo valor seja maior que 3
SELECT cod_locacao AS [Codigo locacao], valor AS [Valor], clientes.cod_cliente AS [Codigo cliente], clientes.nome AS [Nome cliente] FROM locacoes INNER JOIN clientes on locacoes.fk_cod_cliente = clientes.cod_cliente WHERE valor > 3;

-- m) Selecione todas as colunas de locações e o nome do cliente cujo valor esteja entre 3 e 5 e o nome do cliente contenha a letra ‘o’
SELECT * FROM locacoes INNER JOIN clientes on locacoes.fk_cod_cliente = clientes.cod_cliente WHERE valor BETWEEN 3 AND 5 AND clientes.nome LIKE '%o%';

-- n) Selecione o Código da locação, o Nome da Fita e o Nome do cliente de todas as locações
SELECT cod_locacao, fitas.descricao, clientes.nome FROM locacoes INNER JOIN fitas on locacoes.fk_cod_fita = fitas.cod_fita INNER JOIN clientes on locacoes.fk_cod_cliente = clientes.cod_cliente;

-- o) Selecione o Código da locação, o Nome da Fita e o Nome do cliente de todas as locações cujo código da fita seja diferente de 2 por ordem crescente de nome do cliente
SELECT cod_locacao, fitas.descricao, clientes.nome FROM locacoes INNER JOIN fitas on locacoes.fk_cod_fita = fitas.cod_fita INNER JOIN clientes on locacoes.fk_cod_cliente = clientes.cod_cliente WHERE locacoes.fk_cod_fita != 2 ORDER BY clientes.nome;

-- p) Selecione o Nome da Fita, o Tipo da Fita, o Valor da locação e o Nome do cliente de todas as locações por ordem de nome da fita decrescente 
SELECT cod_locacao, fitas.descricao AS [Nome fita], tipos.descricao AS [Tipo fita], valor AS [Valor], clientes.nome AS [Nome cliente] FROM locacoes INNER JOIN fitas on locacoes.fk_cod_fita = fitas.cod_fita INNER JOIN clientes on locacoes.fk_cod_cliente = clientes.cod_cliente INNER JOIN tipos on fitas.cod_fita = tipos.cod_tipo ORDER BY fitas.descricao;

-- q) Selecione todas as fitas do tipo ação
SELECT * FROM fitas WHERE fk_cod_tipo = 2;

-- r) Selecione todas as fitas alugadas pelo Silvio Santos, exibindo o nome da fita, a descrição do tipo e o valor, ordenadas pelo valor de locação, em ordem decrescente.
SELECT 