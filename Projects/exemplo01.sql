DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS setores;

CREATE TABLE setores
(
    setor_id INT PRIMARY KEY NOT NULL,
    setor_nome VARCHAR(30)
);

CREATE TABLE funcionarios
(
    func_id INT PRIMARY KEY NOT NULL,
    func_nome VARCHAR(50),
    gerente_id INT,
    setor_id INT,
    func_salario REAL,
    func_dataNasc DATE,
    CONSTRAINT fk_gerente_id -- limit the type of data that can go into table
        FOREIGN KEY (gerente_id) REFERENCES funcionarios (func_id),
    CONSTRAINT fk_setor_id
        FOREIGN KEY (setor_id) REFERENCES setores (setor_id)
);

-- Inserindo registros na tabela setores
INSERT INTO setores 
                    VALUES (1,'Faturamento'),
                            (2,'Contabilidade'),
                            (3,'RH'),
                            (4,'Compras'),
                            (5,'Estoque'),
                            (6,'Farmacia'),
                            (7,'Recepcao'),
                            (8,'Desenvolvimento'),
                            (9,'Engenharia'),
                            (10,'CAD');

INSERT INTO funcionarios (func_ID, func_nome, gerente_id, setor_id, func_salario, func_dataNasc) 
                    VALUES (1,'Maria',NULL,1,5000.00,'1974-10-25 00:00:00.000'),
                            (2,'Ana',NULL,1,4780.00,'1971-07-05 00:00:00.000'),
                            (3,'Carla',NULL,1,7000.00,'1974-10-10 00:00:00.000'),
                            (4,'Antonio',1,1,1000.00,'1985-08-09 00:00:00.000'),
                            (5,'Nestor',1,1,700.00,'1949-11-05 00:00:00.000'),
                            (6,'Eduardo',1,2,300.00,'1991-08-05 00:00:00.000'),
                            (7,'Anderson',1,2,500.00,'1977-07-09 00:00:00.000'),
                            (8,'F�bio',1,2,350.00,'1989-05-06 00:00:00.000'),
                            (9,'Jo�o',1,2,980.00,'1981-02-03 00:00:00.000'),
                            (10,'Jos�',2,2,321.00,'1981-01-01 00:00:00.000'),
                            (11,'Ingrid',2,3,422.00,'1982-01-01 00:00:00.000'),
                            (12,'Bruno',2,3,890.00,'1963-05-25 00:00:00.000'),
                            (13,'Bruna',2,3,1021.00,'1977-12-03 00:00:00.000'),
                            (14,'Daniela',2,3,2050.0,'1984-11-01 00:00:00.000'),
                            (15,'Daniel',3,NULL,600.00,'1984-12-06 00:00:00.000'),
                            (16,'Valdir',3,NULL,900.00,'1984-07-09 00:00:00.000'),
                            (17,'Kleber',3,NULL,800.63,'1957-02-02 00:00:00.000');