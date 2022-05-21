CREATE TABLE Departamento (
codigo INT PRIMARY KEY,
nome   VARCHAR(40) NOT NULL
);

CREATE TABLE Empregado (
numero    INT PRIMARY KEY,
nome      VARCHAR(40) NOT NULL,
sexo      VARCHAR(1) CHECK(UPPER(sexo) = 'M' or UPPER(sexo) = 'F'),
endereco  VARCHAR(80),
salario   NUMERIC(8,2),
dataNasc  DATE,
codigoDepto INT,
FOREIGN KEY(codigoDepto) REFERENCES Departamento (codigo)
);

CREATE TABLE PROJETO (
idProjeto   INT   PRIMARY KEY,
descricao   VARCHAR(40) NOT NULL,
dataInicio  DATE  default current_date,
duracaoPrevisao     INT   NOT NULL,   -- meses 
duracaoREAL         INT
);

CREATE TABLE Atividade (
codigo      INT PRIMARY KEY,
empregado   INT,
projeto     INT,
dataInicio  DATE  default current_date,
nhoras      NUMERIC(5,2)  NOT NULL check (nhoras <= 44),   -- meses 
FOREIGN KEY(empregado) REFERENCES Empregado(numero),
FOREIGN KEY(projeto) REFERENCES Projeto(idProjeto)
);

---------------------------------------------------------------------
insert into departamento(codigo,nome) values(1,'Informatica');
insert into departamento(codigo,nome) values(2,'Comercial');
insert into departamento(codigo,nome) values(3,'Recursos Humanos');
insert into departamento(codigo,nome) values(4,'Financeiro');
insert into departamento(codigo,nome) values(5,'Compras');

insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(100,'Procopio','M','Rua Bananeiras,21',1890.00,'12/03/1991',3);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(101,'Isabel','F','Av. Brasil s/n',2900.20,'26/02/1970',2);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(102,'Tereza','F','Av. 20 e abril',1110.00,'12/03/1972',1);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(103,'Manoela','F','Rua das meninas',3200.00,'12/10/1987',1);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(104,'Teodoro','M','Av. Brasil 855',1200.35,'29/10/1977',4);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(105,'Kadu','M','Rua XV, 66',1876.45,'16/05/1975',2);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc,codigoDepto) values(106,'Francisco','M','Rua das rosas, 878',2018.99,'10/10/1987',2);
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc) values(107,'Eva','F','Av. das Macegas 18',2000.00,'21/11/1999');
insert into Empregado(numero,nome,sexo,endereco,salario,dataNasc) values(108,'Beatriz','F','Rua do PCs',1500.00,'26/08/2001');

insert into projeto(idProjeto,descricao,datainicio,duracaoPrevisao,duracaoREAL)values(200,'Software de Gestao','10/02/2019',12,14);
insert into projeto(idProjeto,descricao,datainicio,duracaoPrevisao,duracaoREAL)values(201,'Projeto de InfraEstrutura','11/12/2019',15,18);
insert into projeto(idProjeto,descricao,datainicio,duracaoPrevisao,duracaoREAL)values(202,'Software de CRM','01/01/2021',6,5);
insert into projeto(idProjeto,descricao,duracaoPrevisao) values(203,'Venda Facil',3);
insert into projeto(idProjeto,descricao,duracaoPrevisao) values(204,'Site de e-commerce',6);

insert into atividade(codigo,empregado,projeto,datainicio,nhoras) values(900,101,201,'30/03/2019',20);
insert into atividade(codigo,empregado,projeto,datainicio,nhoras) values(901,100,203,'10/04/2020',44);
insert into atividade(codigo,empregado,projeto,datainicio,nhoras) values(902,101,201,'10/09/2021',14);
insert into atividade(codigo,empregado,projeto,datainicio,nhoras) values(903,107,200,'01/07/2021',12);
insert into atividade(codigo,empregado,projeto,datainicio,nhoras) values(904,106,204,'10/05/2021',28);
insert into atividade(codigo,empregado,projeto,nhoras) values(905,104,201,30);



	

	

	
  1- Faça uma consulta para listar o nome e o codigo de todos departamentos com codigo maior ou igual a 2.
	SELECT nome, codigo
	FROM Departamento
	WHERE codigo >= 2
	
  2- Faça uma consulta para listar o nome e o sexo de todos os empregados que recebem salario acima de R$ 1.500,00 
	SELECT nome, sexo
	FROM Empregado
	WHERE salario > 1.500
	
  3- Fa�a uma consulta para listar a descricao e mes de inicio de todos projetos. Liste ordenados pelo mes de inicio
  	SELECT descricao, dataInicio, extract(month from dataInicio) as mês
	FROM projeto
	ORDER BY mês
  
  4- Fa�a uma consulta para listar o nome dos empregados que sao do sexo Masculino (tratar letras maiusculas/minusculas)
  	SELECT nome
	FROM empregado
	WHERE sexo = 'M'
  
  5- Faça uma consulta para listar o nome dos empregados que recebem salario na faixa de R$ 1.000,00 a R$ 2.000,00
	SELECT nome
	FROM Empregado
	WHERE salario > 1000 and salario < 2000
	
  6- Fa�a uma consulta para listar o nome de todos departamentos com os codigos 102,104,105,107 e 108
  	SELECT nome
	FROM departamento
	--WHERE codigo = 102 or codigo = 104 or codigo = 105 or codigo = 107 or codigo = 108
	WHERE codigo in(102, 104, 105, 107,108)
	
  7- Fa�a uma consulta para listar o numero do empregados que estao alocados nos projetos. Sem repeticao de numeros
  	SELECT distinct empregado
	FROM atividade
	
  8- Fa�a uma consulta para listar o nome e salario de todos empregados, ordenados em ordem decrescente de salario 

  9- Fa�a uma consulta para listar o nome dos empregados que nasceram no mes de fevereiro

  10- Fa�a uma consulta para listar o nome dos empregados iniciam com a letra A
  	SELECT nome
	FROM empregado
	WHERE nome like 'A%'
	
  11- Fa�a uma consulta para listar o nome, endereco e data de nascimento dos empregados que nasceram nos dias 12 e 26
  	SELECT nome, endereco, dataNasc
	FROM empregado
	WHERE dataNasc = 12 and dataNasc = 26
	
  12- Fa�a uma consulta para encontrar mes de nascimento do empregado Procopio
  	SELECT nome, extract (month from dataNasc) as mes
	FROM empregado
	WHERE UPPER(nome) = 'PROCOPIO'

----------------------------------------------------------------
 **** JOINS ****
----------------------------------------------------------------
  13- Fa�a uma consulta para listar o nome do empregado e respectivo departamento(nome) que trabalha
  	SELECT 	nome.empregado, nome.departamento
	FROM 	empregado INNER JOIN departamento ON
		
  14- Fa�a uma consulta para listar o nome dos empregados que trabalham no departamento de informatica e recebem menos de R$ 2.000,00
  	SELECT 	Empregado.nome, Departamento.nome
	FROM   	Empregado INNER JOIN Departamento ON
			departamento.codigo = empregado.codigodepto
	WHERE  	Departamento.nome = 'Informatica' and empregado.salario < 2000
  
  15- Fa�a uma consulta para listar o nome, salario e sexo dos empregados que trabalham no departamento de Recursos Humanos e Financeiro
  
  16- Fa�a uma consulta para listar a descricao dos projetos e o numero de horas que cada Empregado esta alocado
  	SELECT 	projeto.descricao, empregado.numero, atividade.nhoras
	FROM 	projeto INNER JOIN atividade ON
			projeto.idProjeto = atividade.projeto INNER JOIN empregado ON
			empregado.numero = atividade.empregado
  
  17- Fa�a uma consulta para listar a descricao de todos departamentos e seus empregados, independente se possuem empregados
  	SELECT 	departamento.nome, empregado.nome
	FROM   	Empregado LEFT JOIN Departamento ON
			departamento.codigo = empregado.codigodepto
  
  18- Fa�a uma consulta para listar os departamentos que nao possuem empregados. Liste tambem os empregados que nao estao alocados em um departamento
  	SELECT	departamento.nome, empregado.nome
	FROM	departamento FULL JOIN empregado ON
			departamento.codigo = empregado.codigodepto
	WHERE 	empregado.codigodepto is NULL
  
  19- Fa�a uma consulta para listar os empregados e respectivos departamentos daqueles que nasceram no mes 10 (outubro)
  
  20- Fa�a uma consulta para listar o nome do empregado, descricao do departamento e a descricao e data de inicio do projeto que esta alocado. Liste ordenado pelo departamento.
  
  
  --- Exemplo de Função de agregação
 	SELECT 	max(salario), min(salario), avg(salario),
			count (*), sum(salario)
	FROM 	empregado
	
21 - Faça uma consulta para listar o número de projetos que ainda não foram concluídos
(ver tempo de duração)
	SELECT 	count(idprojeto)
	FROM	projeto
	WHERE 	duracaoReal is NULL

22 - Faça uma consulta para listar quantos empregados trabalham em cada setor. Liste
todos departamentos, independente se possuem empregados trabalhando
	SELECT 	departamento.nome, count(empregado.numero)
	FROM 	departamento LEFT JOIN empregado ON
			departamento.codigo = empregado.codigodepto
	group by departamento.nome

23 - Faça uma consulta para listar a média salarial de todos empregados do
Departamento de Informatica
	SELECT 	departamento.nome, to_char (avg(empregado.salario),'L99999.99')
	FROM 	departamento INNER JOIN empregado ON
			departamento.codigo = empregado.codigodepto
	WHERE 	departamento.nome = 'Informatica'
	group by departamento.nome

24 - Faça uma consulta para listar em quantos empregados estão trabalhando em cada
um dos projetos. Liste ordenado por projeto
	SELECT 	count(empregado.nome), projeto.idProjeto
	FROM 	empregado INNER JOIN projeto ON
			empregado.

25 - Faça uma consulta para listar em quantos projetos a empregada Isabel está
trabalhando

26 - Faça uma consulta para listar o número de empregados e a soma de horas de cada
um dos projetos. Liste ordenador pelo número de horas.

27 - Faça uma consulta para listar total de horas de trabalho de cada empregado. Liste
de todos empregados, ordenados de forma decrescente o pelo número de horas
	SELECT	empregado.nome, atividade.nhoras
	FROM 	empregado FULL JOIN atividade ON
			empregado.numero = atividade.empregado
	ORDER BY atividade.nhoras
	

28 - Faça uma consulta para listar a descrição de todos projetos, com mais de 40 horas
empenhados neles.

29 - Faça uma consulta para listar todos projetos com mais data de início em 2020 e
com mais de 2 funcionários

30- Faça uma visão para listar dos projetos a descrição, data início e duração de
previsão, da atividade o número de horas e do Empregado o nome e o salário.
Depois faça uma consulta nesta visão para listar a descrição do projeto, o mês de
início e nome do empegado. Liste apenas dos projetos que possuem a duração
real.
  
  