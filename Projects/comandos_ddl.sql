-- Comandos DDL

CREATE DATABASE
CREATE TABLE
-- Define e incializa um componente 

DROP 
-- Remove um componente

ALTER 
-- Altera a definição de um componente

INSERT
-- Insere um registro em uma tabela

DELETE
-- Remove um ou mais registros de uma tabela

UPDATE 
-- Altera um ou mais registros de uma tabela

SELECT
-- Retorna uma tabela de acordo com os requisitos solicitados

USE master -- usa o banco de dados principal do sql server 

IF DB_ID ('DBLocadora') IS NOT NULL -- verifica se o banco de dados já existe
    DROP DATABASE DBLocadora
CREATE DATABASE DBLocadora

CREATE TABLE Fitas
(
    codigo INT PRIMARY KEY,
    descricao VARCHAR(20),
    data_cadastro DATETIME,
    valor DECIMAL(10, 2) NOT NULL
)
