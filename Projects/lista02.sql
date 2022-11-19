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
INSERT INTO clientes VALUES (1, 'Silvio Santos'),
							(2, 'Xuxa'),
							(3, 'Ratinho'),
							(4, 'Teobaldo'),
							(5, 'Bob Esponja');

-- Inserindo os dados na tabela Tipos
INSERT INTO tipos VALUES(1, 'Drama'),
						(2, 'Acao'),
						(3, 'Terror'),
						(4, 'Ficcao'),
						(5, 'Documentario');

-- Inserindo os dados na tabela Fitas
INSERT INTO fitas VALUES(1, 'Titanic', 1),
						(2, 'Kill Bill', 2),
						(3, 'O Massacre da serra eletrica', 3),
						(4, 'Os outros', 3),
						(5, 'O Grande Dragao Branco', 2);

-- Inserindo os dados na tabela Locacoes
INSERT INTO locacoes VALUES(1, 2, 5, 1),
							(3, 1, 5, 3),
							(2, 3, 4, 2),
							(4, 1, 3, 2),
							(5, 3, 2, 1),
							(6, 3, 5, 3),
							(7, 2, 4, 3),
							(8, 2, 3, 1),
							(9, 1, 1, 1),
							(10, 2, 5, 2);

-- Apresentando as tabelas
SELECT * FROM clientes;
SELECT * FROM tipos;
SELECT * FROM fitas;
SELECT * FROM locacoes;

-- a) Selecione todos os clientes que têm a letra ‘a’ no nome
SELECT *
	FROM clientes
	WHERE nome LIKE '%a%'

-- b) Selecione todas as locações com valor entre 3 e 5 por ordem de valor
SELECT cod_locacao AS [Codigo locacao], valor AS [Valor locacao]
	FROM locacoes
	WHERE valor BETWEEN 3 AND 5
	ORDER BY valor ASC;

-- c) Selecione todas as fitas locadas para o cliente número 3 e cujo valor foi menor ou igual a 4
SELECT fk_cod_fita AS [Codigo fita], fk_cod_cliente AS [Codigo cliente]
	FROM locacoes
	WHERE fk_cod_cliente = 3 AND valor <= 4;

-- d) Selecione a quantidade de fitas locadas agrupadas pelo código da fita
SELECT fk_cod_fita AS [Codigo fita], COUNT(*) AS [Total de fitas]
	FROM locacoes
	GROUP BY fk_cod_fita;

-- e) Selecione a soma do valor das fitas locadas agrupadas pelo código da fita
SELECT fk_cod_fita AS [Codigo fita], SUM(valor) AS [Soma de fitas]
	FROM locacoes
	GROUP BY fk_cod_fita;

-- f) Selecione o valor médio gasto em fitas agrupados por cliente
SELECT fk_cod_cliente AS [Codigo cliente], AVG(valor) AS [Valor medio]
	FROM locacoes
	GROUP BY fk_cod_cliente;

-- g) Descubra o maior valor de locação por fita
SELECT fk_cod_fita AS [Codigo fita], MAX(valor) AS [Maior valor]
	FROM locacoes
	GROUP BY fk_cod_fita;

-- h) Descubra o menor valor de locação por cliente
SELECT fk_cod_cliente AS [Codigo cliente], MIN(valor) AS [Menor valor]
	FROM locacoes
	GROUP BY fk_cod_cliente;

-- i) Selecione o nome da fita e a descrição do tipo de todas as fitas
SELECT fitas.descricao AS [Nome], tipos.descricao AS [Tipo]
	FROM fitas
		INNER JOIN tipos
				on fitas.fk_cod_tipo = tipos.cod_tipo;

-- j) Selecione o nome, o código da fita e a descrição do tipo de todas as fitas cujo tipo seja = 3
SELECT fitas.descricao AS [Nome], cod_fita AS [Codigo], tipos.descricao AS [Descricao tipo]
	FROM fitas, tipos
	WHERE cod_tipo = 3 
		AND fk_cod_tipo = 3;

-- k) Selecione o código da locação, o valor e nome dos clientes para todas as locações
SELECT cod_locacao AS [Codigo locacao], valor AS [Valor], clientes.nome AS [Nome cliente]
	FROM locacoes
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente;

-- l) Selecione o código da locação, o valor, o código e o nome dos clientes para todas as locações cujo valor seja maior que 3
SELECT cod_locacao AS [Codigo locacao], valor AS [Valor], clientes.cod_cliente AS [Codigo cliente], clientes.nome AS [Nome cliente]
	FROM locacoes 
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
	WHERE valor > 3;

-- m) Selecione todas as colunas de locações e o nome do cliente cujo valor esteja entre 3 e 5 e o nome do cliente contenha a letra ‘o’
SELECT *
	FROM locacoes 
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
	WHERE valor BETWEEN 3 AND 5 
		AND clientes.nome LIKE '%o%';

-- n) Selecione o Código da locação, o Nome da Fita e o Nome do cliente de todas as locações
SELECT cod_locacao AS [Codigo locacao], fitas.descricao AS [Nome fita], clientes.nome AS [Nome cliente]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente;

-- o) Selecione o Código da locação, o Nome da Fita e o Nome do cliente de todas as locações cujo código da fita seja diferente de 2 por ordem crescente de nome do cliente
SELECT cod_locacao AS [Codigo locacao], fitas.descricao AS [Nome fita], clientes.nome AS [Nome cliente]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
	WHERE locacoes.fk_cod_fita != 2
	ORDER BY clientes.nome;

-- p) Selecione o Nome da Fita, o Tipo da Fita, o Valor da locação e o Nome do cliente de todas as locações por ordem de nome da fita decrescente 
SELECT cod_locacao AS [Codigo locacao], fitas.descricao AS [Nome fita], tipos.descricao AS [Tipo fita], valor AS [Valor], clientes.nome AS [Nome cliente]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente 
		INNER JOIN tipos 
				on fitas.cod_fita = tipos.cod_tipo
	ORDER BY fitas.descricao DESC;

-- q) Selecione todas as fitas do tipo ação
SELECT * 
	FROM fitas 
	WHERE fk_cod_tipo = 2;

-- r) Selecione todas as fitas alugadas pelo Silvio Santos, exibindo o nome da fita, a descrição do tipo e o valor, ordenadas pelo valor de locação, em ordem decrescente.
SELECT clientes.nome AS [Nome cliente], fitas.descricao AS [Nome fita], tipos.descricao AS [Tipo fita], valor AS [Valor]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita 
		INNER JOIN tipos 
				on fitas.cod_fita = tipos.cod_tipo 
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
		WHERE fk_cod_cliente = 1
		ORDER BY [valor] DESC;

-- s) Agrupe as locações pelo tipo, exibindo a descrição do tipo e o total de fitas alugadas.
SELECT tipos.descricao AS [Descricao tipo], COUNT(*) AS [Total de fitas]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita 
		INNER JOIN tipos 
				on fitas.fk_cod_tipo = tipos.cod_tipo
	GROUP BY tipos.descricao;

-- t) Agrupe as locações pelo cliente, exibindo o nome do cliente e a soma das fitas alugadas por ele.
SELECT clientes.nome AS [Nome cliente], COUNT(*) AS [Total fitas alugadas por cliente]
	FROM locacoes 
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
	GROUP BY clientes.nome;

-- u) Agrupe as fitas, exibindo o Nome da fita e o valor (soma) que já foi locado até o momento.
SELECT fitas.descricao AS [Nome fita], COUNT(locacoes.fk_cod_fita) AS [Soma locacoes da fita]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita
	GROUP BY fitas.descricao;

-- v) Selecione apenas os tipos de fitas que tem ao menos uma fita correspondente
SELECT DISTINCT cod_tipo AS [Codigo tipo]
	FROM tipos
		LEFT JOIN fitas
				on tipos.cod_tipo = fitas.fk_cod_tipo
	WHERE fitas.fk_cod_tipo IS NOT NULL;

-- w) Selecione todos os tipos de fitas e as fitas, mesmo os tipos de fitas sem fitas relacionadas.
SELECT tipos.descricao AS [Tipo fita], fitas.descricao AS [Nome fita]
	FROM tipos
		FULL OUTER JOIN fitas 
					on tipos.cod_tipo = fitas.fk_cod_tipo;

-- x) Selecione todos os clientes e suas locações, mesmo que não haja locações para um cliente.
SELECT clientes.nome AS [Nome cliente], cod_locacao [Codigo locacao por cliente]
	FROM clientes
		FULL OUTER JOIN locacoes
					on locacoes.fk_cod_cliente = clientes.cod_cliente;

-- y) Selecione todos os clientes e locações, mesmo que não haja valores correspondentes entre as tabelas.
SELECT *
	FROM clientes
		LEFT JOIN locacoes
				on clientes.cod_cliente = locacoes.fk_cod_cliente;

-- 5) Selecione o nome do cliente, o nome da fita e o nome do tipo apenas dos clientes que já efetuaram ao menos 1 locação. Ordenados pelos 3 campos solicitados.
SELECT clientes.nome AS [Nome cliente], fitas.descricao AS [Nome fita], tipos.descricao AS [Tipo fita]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
		INNER JOIN tipos 
				on fitas.fk_cod_tipo = tipos.cod_tipo
	ORDER BY clientes.nome;

-- 6) Selecione todos os clientes que já efetuaram ao menos 2 locações.
SELECT clientes.nome AS [Nome cliente], COUNT(*) AS [Total fitas alugadas por cliente]
	FROM locacoes 
		INNER JOIN clientes 
				on locacoes.fk_cod_cliente = clientes.cod_cliente
	GROUP BY clientes.nome
	HAVING COUNT(*) >= 2;

-- 7) Selecione a descrição do tipo apenas daqueles que já tiveram ao menos 4 locações.
SELECT tipos.descricao AS [Tipo fita], COUNT(locacoes.fk_cod_fita) AS [Soma locacoes da fita]
	FROM locacoes 
		INNER JOIN fitas 
				on locacoes.fk_cod_fita = fitas.cod_fita
		INNER JOIN tipos
				on fitas.fk_cod_tipo = tipos.cod_tipo
	GROUP BY tipos.descricao
	HAVING COUNT(locacoes.fk_cod_fita) >= 4;

-- 8) Selecione apenas os clientes que nunca alugaram.
SELECT clientes.nome AS [Nome cliente]
	FROM clientes
		LEFT OUTER JOIN locacoes
					on clientes.cod_cliente = locacoes.fk_cod_cliente
	WHERE cod_locacao IS NULL;

-- 9) Selecione os tipos que não possuem fitas cadastradas.
SELECT tipos.descricao AS [Tipo fita]
	FROM tipos
		INNER JOIN fitas
				on tipos.cod_tipo = fitas.cod_fita
		LEFT OUTER JOIN locacoes
					on fitas.cod_fita = locacoes.fk_cod_fita
	WHERE fk_cod_fita IS NULL;

-- 10) Selecione apenas o nome dos clientes que já efetuaram mais de 12,00 em locações.
SELECT clientes.nome AS [Nome cliente], SUM(locacoes.valor) AS [Soma valor]
	FROM clientes
		INNER JOIN locacoes
				on clientes.cod_cliente = locacoes.fk_cod_cliente
	GROUP BY clientes.nome
	HAVING SUM(locacoes.valor) = 12;