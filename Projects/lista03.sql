CREATE DATABASE [Lista04]
USE Lista04;

DROP TABLE IF EXISTS colaboradores;
DROP TABLE IF EXISTS reparticao;

CREATE TABLE reparticao (rep_cod INTEGER PRIMARY KEY NOT NULL,
						 rep_nome VARCHAR(80) NOT NULL,
						 rep_gerente INTEGER DEFAULT 0,
						 rep_localID INTEGER NOT NULL);

CREATE TABLE colaboradores (col_cod INTEGER PRIMARY KEY NOT NULL,
							prim_nome VARCHAR(30) NOT NULL,
							ultimo_nome VARCHAR(50) NOT NULL,
							email VARCHAR(20),
							num_tel VARCHAR(25),
							data_adm DATE,
							id_funcao VARCHAR(20),
							salario DECIMAL(10,2),
							comissao DECIMAL(3,2),
							gerente INTEGER,
							rep_cod INTEGER);

INSERT INTO reparticao (rep_cod, rep_nome, rep_gerente, rep_localID)
VALUES (10,'Administration','200','1700'),
(20,'Marketing','201','1800'),
(30,'Purchasing','114','1700'),
(40,'Human Resources','203','2400'),
(50,'Shipping','121','1500'),
(60,'IT','103','1400'),
(70,'Public Relations','204','2700'),
(80,'Sales','145','2500'),
(90,'Executive','100','1700'),
(100,'Finance','108','1700'),
(110,'Accounting','205','1700'),
(120,'Treasury','0','1700'),
(130,'Corporate Tax','0','1700'),
(140,'Control And Credit','0','1700'),
(150,'Shareholder Services','0','1700'),
(160,'Benefits','0','1700'),
(170,'Manufacturing','0','1700'),
(180,'Construction','0','1700'),
(190,'Contracting','0','1700'),
(200,'Operations','0','1700'),
(210,'IT Support','0','1700'),
(220,'NOC','0','1700'),
(230,'IT Helpdesk','0','1700'),
(240,'Government Sales','0','1700'),
(250,'Retail Sales','0','1700'),
(260,'Recruiting','0','1700'),
(270,'Payroll','0','1700');

INSERT INTO colaboradores (col_cod, prim_nome, ultimo_nome, email, num_tel, data_adm, id_funcao, salario, comissao, gerente, rep_cod)
VALUES (100,'Steven','King','SKING','5151234567',' 2003-06-17 ','AD_PRES', 24000.00 ,0.00,0,90),
(101,'Neena','Kochhar','NKOCHHAR','5151234568',' 2005-09-21 ','AD_VP', 17000.00 ,0.00,100,90),
(102,'Lex','De Haan','LDEHAAN','5151234569',' 2001-01-13 ','AD_VP', 17000.00 ,0.00,100,90),
(103,'Alexander','Hunold','AHUNOLD','5904234567',' 2006-01-03 ','IT_PROG',  9000.00 ,0.00,102,60),
(104,'Bruce','Ernst','BERNST','5904234568',' 2007-05-21 ','IT_PROG',  6000.00 ,0.00,103,60),
(105,'David','Austin','DAUSTIN','5904234569',' 2005-06-25 ','IT_PROG',  4800.00 ,0.00,103,60),
(106,'Valli','Pataballa','VPATABAL','5904234560',' 2006-02-05 ','IT_PROG',  4800.00 ,0.00,103,60),
(107,'Diana','Lorentz','DLORENTZ','5904235567',' 2007-02-07 ','IT_PROG',  4200.00 ,0.00,103,60),
(108,'Nancy','Greenberg','NGREENBE','5151244569',' 2002-08-17 ','FI_MGR', 12008.00 ,0.00,101,100),
(109,'Daniel','Faviet','DFAVIET','5151244169',' 2002-08-16 ','FI_ACCOUNT',  9000.00 ,0.00,108,100),
(110,'John','Chen','JCHEN','5151244269',' 2005-09-28 ','FI_ACCOUNT',  8200.00 ,0.00,108,100),
(111,'Ismael','Sciarra','ISCIARRA','5151244369',' 2005-09-30 ','FI_ACCOUNT',  7700.00 ,0.00,108,100),
(112,'Jose Manuel','Urman','JMURMAN','5151244469',' 2006-03-07 ','FI_ACCOUNT',  7800.00 ,0.00,108,100),
(113,'Luis','Popp','LPOPP','5151244567',' 2007-12-07 ','FI_ACCOUNT',  6900.00 ,0.00,108,100),
(114,'Den','Raphaely','DRAPHEAL','5151274561',' 2002-12-07 ','PU_MAN', 11000.00 ,0.00,100,30),
(115,'Alexander','Khoo','AKHOO','5151274562',' 2003-05-18 ','PU_CLERK',  3100.00 ,0.00,114,30),
(116,'Shelli','Baida','SBAIDA','5151274563',' 2005-12-24 ','PU_CLERK',  2900.00 ,0.00,114,30),
(117,'Sigal','Tobias','STOBIAS','5151274564',' 2005-07-24 ','PU_CLERK',  2800.00 ,0.00,114,30),
(118,'Guy','Himuro','GHIMURO','5151274565',' 2006-11-15 ','PU_CLERK',  2600.00 ,0.00,114,30),
(119,'Karen','Colmenares','KCOLMENA','5151274566',' 2007-08-10 ','PU_CLERK',  2500.00 ,0.00,114,30),
(120,'Matthew','Weiss','MWEISS','6501231234',' 2004-07-18 ','ST_MAN',  8000.00 ,0.00,100,50),
(121,'Adam','Fripp','AFRIPP','6501232234',' 2005-04-10 ','ST_MAN',  8200.00 ,0.00,100,50),
(122,'Payam','Kaufling','PKAUFLIN','6501233234',' 2003-05-01 ','ST_MAN',  7900.00 ,0.00,100,50),
(123,'Shanta','Vollman','SVOLLMAN','6501234234',' 2005-10-10 ','ST_MAN',  6500.00 ,0.00,100,50),
(124,'Kevin','Mourgos','KMOURGOS','6501235234',' 2007-11-16 ','ST_MAN',  5800.00 ,0.00,100,50),
(125,'Julia','Nayer','JNAYER','6501241214',' 2005-07-16 ','ST_CLERK',  3200.00 ,0.00,120,50),
(126,'Irene','Mikkilineni','IMIKKILI','6501241224',' 2006-09-28 ','ST_CLERK',  2700.00 ,0.00,120,50),
(127,'James','Landry','JLANDRY','6501241334',' 2007-01-14 ','ST_CLERK',  2400.00 ,0.00,120,50),
(128,'Steven','Markle','SMARKLE','6501241434',' 2008-03-08 ','ST_CLERK',  2200.00 ,0.00,120,50),
(129,'Laura','Bissot','LBISSOT','6501245234',' 2005-08-20 ','ST_CLERK',  3300.00 ,0.00,121,50),
(130,'Mozhe','Atkinson','MATKINSO','6501246234',' 2005-10-30 ','ST_CLERK',  2800.00 ,0.00,121,50),
(131,'James','Marlow','JAMRLOW','6501247234',' 2005-02-16 ','ST_CLERK',  2500.00 ,0.00,121,50),
(132,'TJ','Olson','TJOLSON','6501248234',' 2007-04-10 ','ST_CLERK',  2100.00 ,0.00,121,50),
(133,'Jason','Mallin','JMALLIN','6501271934',' 2004-06-14 ','ST_CLERK',  3300.00 ,0.00,122,50),
(134,'Michael','Rogers','MROGERS','6501271834',' 2006-08-26 ','ST_CLERK',  2900.00 ,0.00,122,50),
(135,'Ki','Gee','KGEE','6501271734',' 2007-12-12 ','ST_CLERK',  2400.00 ,0.00,122,50),
(136,'Hazel','Philtanker','HPHILTAN','6501271634',' 2008-02-06 ','ST_CLERK',  2200.00 ,0.00,122,50),
(137,'Renske','Ladwig','RLADWIG','6501211234',' 2003-07-14 ','ST_CLERK',  3600.00 ,0.00,123,50),
(138,'Stephen','Stiles','SSTILES','6501212034',' 2005-10-26 ','ST_CLERK',  3200.00 ,0.00,123,50),
(139,'John','Seo','JSEO','6501212019',' 2006-02-12 ','ST_CLERK',  2700.00 ,0.00,123,50),
(140,'Joshua','Patel','JPATEL','6501211834',' 2006-04-06 ','ST_CLERK',  2500.00 ,0.00,123,50),
(141,'Trenna','Rajs','TRAJS','6501218009',' 2003-10-17 ','ST_CLERK',  3500.00 ,0.00,124,50),
(142,'Curtis','Davies','CDAVIES','6501212994',' 2005-01-29 ','ST_CLERK',  3100.00 ,0.00,124,50),
(143,'Randall','Matos','RMATOS','6501212874',' 2006-03-15 ','ST_CLERK',  2600.00 ,0.00,124,50),
(144,'Peter','Vargas','PVARGAS','6501212004',' 2006-07-09 ','ST_CLERK',  2500.00 ,0.00,124,50),
(145,'John','Russell','JRUSSEL',' 011.44.1344.429268 ',' 2004-10-01 ','SA_MAN', 14000.00 ,0.40,100,80),
(146,'Karen','Partners','KPARTNER',' 011.44.1344.467268 ',' 2005-01-05 ','SA_MAN', 13500.00 ,0.30,100,80),
(147,'Alberto','Errazuriz','AERRAZUR',' 011.44.1344.429278 ',' 2005-03-10 ','SA_MAN', 12000.00 ,0.30,100,80),
(148,'Gerald','Cambrault','GCAMBRAU',' 011.44.1344.619268 ',' 2007-10-15 ','SA_MAN', 11000.00 ,0.30,100,80),
(149,'Eleni','Zlotkey','EZLOTKEY',' 011.44.1344.429018 ',' 2008-01-29 ','SA_MAN', 10500.00 ,0.20,100,80),
(150,'Peter','Tucker','PTUCKER',' 011.44.1344.129268 ',' 2005-01-30 ','SA_REP', 10000.00 ,0.30,145,80),
(151,'David','Bernstein','DBERNSTE',' 011.44.1344.345268 ',' 2005-03-24 ','SA_REP',  9500.00 ,0.25,145,80),
(152,'Peter','Hall','PHALL',' 011.44.1344.478968 ',' 2005-08-20 ','SA_REP',  9000.00 ,0.25,145,80),
(153,'Christopher','Olsen','COLSEN',' 011.44.1344.498718 ',' 2006-03-30 ','SA_REP',  8000.00 ,0.20,145,80),
(154,'Nanette','Cambrault','NCAMBRAU',' 011.44.1344.987668 ',' 2006-12-09 ','SA_REP',  7500.00 ,0.20,145,80),
(155,'Oliver','Tuvault','OTUVAULT',' 011.44.1344.486508 ',' 2007-11-23 ','SA_REP',  7000.00 ,0.15,145,80),
(156,'Janette','King','JKING',' 011.44.1345.429268 ',' 2004-01-30 ','SA_REP', 10000.00 ,0.35,146,80),
(157,'Patrick','Sully','PSULLY',' 011.44.1345.929268 ',' 2004-03-04 ','SA_REP',  9500.00 ,0.35,146,80),
(158,'Allan','McEwen','AMCEWEN',' 011.44.1345.829268 ',' 2004-08-01 ','SA_REP',  9000.00 ,0.35,146,80),
(159,'Lindsey','Smith','LSMITH',' 011.44.1345.729268 ',' 2005-03-10 ','SA_REP',  8000.00 ,0.30,146,80),
(160,'Louise','Doran','LDORAN',' 011.44.1345.629268 ',' 2005-12-15 ','SA_REP',  7500.00 ,0.30,146,80),
(161,'Sarath','Sewall','SSEWALL',' 011.44.1345.529268 ',' 2006-11-03 ','SA_REP',  7000.00 ,0.25,146,80),
(162,'Clara','Vishney','CVISHNEY',' 011.44.1346.129268 ',' 2005-11-11 ','SA_REP', 10500.00 ,0.25,147,80),
(163,'Danielle','Greene','DGREENE',' 011.44.1346.229268 ',' 2007-03-19 ','SA_REP',  9500.00 ,0.15,147,80),
(164,'Mattea','Marvins','MMARVINS',' 011.44.1346.329268 ',' 2008-01-24 ','SA_REP',  7200.00 ,0.10,147,80),
(165,'David','Lee','DLEE',' 011.44.1346.529268 ',' 2008-02-23 ','SA_REP',  6800.00 ,0.10,147,80),
(166,'Sundar','Ande','SANDE',' 011.44.1346.629268 ',' 2008-03-24 ','SA_REP',  6400.00 ,0.10,147,80),
(167,'Amit','Banda','ABANDA',' 011.44.1346.729268 ',' 2008-04-21 ','SA_REP',  6200.00 ,0.10,147,80),
(168,'Lisa','Ozer','LOZER',' 011.44.1343.929268 ',' 2005-03-11 ','SA_REP', 11500.00 ,0.25,148,80),
(169,'Harrison','Bloom','HBLOOM',' 011.44.1343.829268 ',' 2006-03-23 ','SA_REP', 10000.00 ,0.20,148,80),
(170,'Tayler','Fox','TFOX',' 011.44.1343.729268 ',' 2006-01-24 ','SA_REP',  9600.00 ,0.20,148,80),
(171,'William','Smith','WSMITH',' 011.44.1343.629268 ',' 2007-02-23 ','SA_REP',  7400.00 ,0.15,148,80),
(172,'Elizabeth','Bates','EBATES',' 011.44.1343.529268 ',' 2007-03-24 ','SA_REP',  7300.00 ,0.15,148,80),
(173,'Sundita','Kumar','SKUMAR',' 011.44.1343.329268 ',' 2008-04-21 ','SA_REP',  6100.00 ,0.10,148,80),
(174,'Ellen','Abel','EABEL',' 011.44.1644.429267 ',' 2004-05-11 ','SA_REP', 11000.00 ,0.30,149,80),
(175,'Alyssa','Hutton','AHUTTON',' 011.44.1644.429266 ',' 2005-03-19 ','SA_REP',  8800.00 ,0.25,149,80),
(176,'Jonathon','Taylor','JTAYLOR',' 011.44.1644.429265 ',' 2006-03-24 ','SA_REP',  8600.00 ,0.20,149,80),
(177,'Jack','Livingston','JLIVINGS',' 011.44.1644.429264 ',' 2006-04-23 ','SA_REP',  8400.00 ,0.20,149,80),
(178,'Kimberely','Grant','KGRANT',' 011.44.1644.429263 ',' 2007-05-24 ','SA_REP',  7000.00 ,0.15,149,0),
(179,'Charles','Johnson','CJOHNSON',' 011.44.1644.429262 ',' 2008-01-04 ','SA_REP',  6200.00 ,0.10,149,80),
(180,'Winston','Taylor','WTAYLOR','6505079876',' 2006-01-24 ','SH_CLERK',  3200.00 ,0.00,120,50),
(181,'Jean','Fleaur','JFLEAUR','6505079877',' 2006-02-23 ','SH_CLERK',  3100.00 ,0.00,120,50),
(182,'Martha','Sullivan','MSULLIVA','6505079878',' 2007-06-21 ','SH_CLERK',  2500.00 ,0.00,120,50),
(183,'Girard','Geoni','GGEONI','6505079879',' 2008-02-03 ','SH_CLERK',  2800.00 ,0.00,120,50),
(184,'Nandita','Sarchand','NSARCHAN','6505091876',' 2004-01-27 ','SH_CLERK',  4200.00 ,0.00,121,50),
(185,'Alexis','Bull','ABULL','6505092876',' 2005-02-20 ','SH_CLERK',  4100.00 ,0.00,121,50),
(186,'Julia','Dellinger','JDELLING','6505093876',' 2006-06-24 ','SH_CLERK',  3400.00 ,0.00,121,50),
(187,'Anthony','Cabrio','ACABRIO','6505094876',' 2007-02-07 ','SH_CLERK',  3000.00 ,0.00,121,50),
(188,'Kelly','Chung','KCHUNG','6505051876',' 2005-06-14 ','SH_CLERK',  3800.00 ,0.00,122,50),
(189,'Jennifer','Dilly','JDILLY','6505052876',' 2005-08-13 ','SH_CLERK',  3600.00 ,0.00,122,50),
(190,'Timothy','Gates','TGATES','6505053876',' 2006-07-11 ','SH_CLERK',  2900.00 ,0.00,122,50),
(191,'Randall','Perkins','RPERKINS','6505054876',' 2007-12-19 ','SH_CLERK',  2500.00 ,0.00,122,50),
(192,'Sarah','Bell','SBELL','6505011876',' 2004-02-04 ','SH_CLERK',  4000.00 ,0.00,123,50),
(193,'Britney','Everett','BEVERETT','6505012876',' 2005-03-03 ','SH_CLERK',  3900.00 ,0.00,123,50),
(194,'Samuel','McCain','SMCCAIN','6505013876',' 2006-07-01 ','SH_CLERK',  3200.00 ,0.00,123,50),
(195,'Vance','Jones','VJONES','6505014876',' 2007-03-17 ','SH_CLERK',  2800.00 ,0.00,123,50),
(196,'Alana','Walsh','AWALSH','6505079811',' 2006-04-24 ','SH_CLERK',  3100.00 ,0.00,124,50),
(197,'Kevin','Feeney','KFEENEY','6505079822',' 2006-05-23 ','SH_CLERK',  3000.00 ,0.00,124,50),
(198,'Donald','OConnell','DOCONNEL','6505079833',' 2007-06-21 ','SH_CLERK',  2600.00 ,0.00,124,50),
(199,'Douglas','Grant','DGRANT','6505079844',' 2008-01-13 ','SH_CLERK',  2600.00 ,0.00,124,50),
(200,'Jennifer','Whalen','JWHALEN','5151234444',' 2003-09-17 ','AD_ASST',  4400.00 ,0.00,101,10),
(201,'Michael','Hartstein','MHARTSTE','5151235555',' 2004-02-17 ','MK_MAN', 13000.00 ,0.00,100,20),
(202,'Pat','Fay','PFAY','6031236666',' 2005-08-17 ','MK_REP',  6000.00 ,0.00,201,20),
(203,'Susan','Mavris','SMAVRIS','5151237777',' 2002-06-07 ','HR_REP',  6500.00 ,0.00,101,40),
(204,'Hermann','Baer','HBAER','5151238888',' 2002-06-07 ','PR_REP', 10000.00 ,0.00,101,70),
(205,'Shelley','Higgins','SHIGGINS','5151238080',' 2002-06-07 ','AC_MGR', 12008.00 ,0.00,101,110),
(206,'William','Gietz','WGIETZ','5151238181',' 2002-06-07 ','AC_ACCOUNT',  8300.00 ,0.00,205,110);

-- a) Localizar os funcionários que recebem um salário maior do que o funcionário com ID 163. Retorne o nome e o sobrenome;
SELECT prim_nome AS [Nome], ultimo_nome AS [Sobrenome]
    FROM colaboradores
    WHERE salario >
        (
            SELECT salario
                FROM colaboradores
                WHERE col_cod = 163
        );

-- b) Descobrir quais funcionários têm o mesmo cargo que o funcionário cujo ID é 169. Retornar nome, sobrenome, ID da repartição e ID do cargo;
SELECT prim_nome AS [Nome], ultimo_nome AS [Sobrenome], rep_cod AS [ID área], id_funcao AS [ID Cargo]
	FROM colaboradores
	WHERE id_funcao =
		(
			SELECT id_funcao
				FROM colaboradores
				WHERE col_cod = 169
		);

-- c) Localizar os funcionários cujo salário corresponde ao menor salário de cada uma das repartições. Retornar nome, sobrenome e ID da repartição;
SELECT prim_nome AS [Nome], ultimo_nome AS [Sobrenome], rep_cod AS [ID área]
	FROM colaboradores
	WHERE salario IN
		(
			SELECT MIN(salario)
				FROM colaboradores
				GROUP BY rep_cod			
		);

-- d) Localizar os funcionários que ganham mais do que o salário médio. Retornar ID do funcionário, nome e sobrenome;
SELECT col_cod AS [ID funcionário], prim_nome AS [Nome], ultimo_nome AS [Sobrenome]
	FROM colaboradores
	WHERE salario >
		(
			SELECT AVG(salario)
				FROM colaboradores
		);

-- e) Localizar os funcionários que se reportam ao gerente cujo primeiro nome é 'Payam'. Retornar nome, sobrenome, ID do funcionário e salário;
SELECT prim_nome AS [Nome], ultimo_nome AS [Sobrenome], col_cod AS [ID funcionário], salario AS [Salario]
	FROM colaboradores
	WHERE gerente IN
		(
			SELECT col_cod
				FROM colaboradores
				WHERE prim_nome LIKE 'Payam%'
		);

-- f) Localizar todos os funcionários que trabalham na repartição financeira (Finance). Retornar ID da repartição, nome (primeiro), ID do trabalho e nome da repartição;
SELECT rep_cod AS [ID área], prim_nome AS [Nome], id_funcao AS [ID Função]
	FROM colaboradores
	WHERE rep_cod =
		(
			SELECT rep_cod
				FROM reparticao
				WHERE rep_nome LIKE 'Finance'
		);

-- g) Localizar o funcionário cujo salário é de $3.000 e o ID do gerente é 121. Retorne todos os campos;
SELECT *
	FROM
	(
		SELECT *
			FROM colaboradores
			WHERE gerente = 121
	) AS colaborador
	WHERE colaborador.salario = 3000;

-- h) Localizar os funcionários cujo ID corresponda a qualquer um dos números 134, 159 e 183. Retorne o primeiro nome e a data de admissão no formato “dd/mm/aaaa”;
SELECT prim_nome AS [Nome], CONVERT(VARCHAR, data_adm, 103) AS [Data de admissão]
	FROM colaboradores
	WHERE col_cod 
		IN (134, 159, 183);

-- i) Encontrar os funcionários que trabalham na mesma repartição que ‘Clara’. Exclua todos os registros em que o primeiro nome é ‘Clara’. Retornar nome, sobrenome e data de contratação;
SELECT prim_nome AS [Nome], ultimo_nome AS [Sobrenome], data_adm AS [Data de admissão]
	FROM colaboradores
	WHERE rep_cod = 
		(
			SELECT rep_cod
				FROM colaboradores
				WHERE prim_nome LIKE 'Clara'
		) AND prim_nome != 'Clara';

-- j) Encontrar os funcionários cujo salário é menor do que o valor do salário médio. Retornar o primeiro nome, último nome e data de admissão;
SELECT prim_nome AS [Nome], ultimo_nome AS [Sobrenome], data_adm AS [Data de admissão]
	FROM colaboradores
	WHERE salario < 
		(
			SELECT AVG(salario)
				FROM colaboradores
		) ORDER BY salario DESC;

-- k) Localizar os funcionários que não trabalham nas repartições onde os IDs dos gerentes estão entre 100 e 200 (os valores de início e fim estão incluídos). Retorne todos os campos dos funcionários;
SELECT *
	FROM colaboradores
	WHERE rep_cod NOT IN
		(
			SELECT rep_cod
				FROM reparticao
				WHERE rep_gerente BETWEEN 100 AND 200
		);

-- l) Localizar o(s) colaborador(es) que recebe(m) o segundo maior salário. Retorne todos os campos do(s) colaborador(es);
SELECT *
	FROM colaboradores
	WHERE col_cod IN 
		(
			SELECT col_cod
				FROM colaboradores
				WHERE salario =
					(
						SELECT MAX(salario)
							FROM colaboradores
							WHERE salario <
								(
									SELECT MAX(salario)
										FROM colaboradores
								)
					)
		);

-- m) Localizar os funcionários que ganham mais do que o salário médio e trabalham na mesma repartição que um funcionário cujo primeiro nome contém a letra 'J'. Retornar o ID do funcionário, primeiro nome e salário.
SELECT col_cod AS [ID funcionário], prim_nome AS [Nome], salario AS [Salario]
	FROM colaboradores
	WHERE salario >
		(
			SELECT AVG(salario)
				FROM colaboradores
		) AND rep_cod IN
			(
				SELECT rep_cod
					FROM colaboradores
					WHERE prim_nome LIKE '%J%'
			);