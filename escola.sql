-- drop table professor cascade constraint;
CREATE TABLE Professor(
codigo int PRIMARY KEY,
nome varchar(50),
titulacao varchar(80));

-- drop table disciplina cascade constraint;
CREATE TABLE Disciplina (
id int PRIMARY KEY,
nome varchar(50),
nhoras numeric(6,2)
);

-- drop table turma cascade constraint;
CREATE TABLE Turma (
codigo int PRIMARY KEY,
nivel varchar(3),
id int,
FOREIGN KEY(id) REFERENCES Disciplina (id)
);

-- drop table aluno cascade constraint;
CREATE TABLE Aluno (
matricula int PRIMARY KEY,
nome varchar(50),
sexo varchar(1),
codigo int,
FOREIGN KEY(codigo) REFERENCES Turma (codigo)
);

-- drop table ministra cascade constraint;
CREATE TABLE ministra (
numero int,
codigo int,
id int,
semestre varchar(8),
PRIMARY KEY(numero)
);

ALTER TABLE ministra 
ADD CONSTRAINT fk_disciplina
FOREIGN KEY(id) 
REFERENCES disciplina(id)
ON UPDATE CASCADE ON DELETE CASCADE;


----------- DADOS ---------------------

insert into professor(codigo, nome, titulacao)values(50,'Doroteia','Especialista');
insert into professor(codigo, nome, titulacao)values(51,'Maysa','Mestre');
insert into professor(codigo, nome, titulacao)values(52,'Procopio','Doutor');
insert into professor(codigo, nome, titulacao)values(53,'Wilma','Mestre');

insert into disciplina(id, nome, nhoras)values(1, 'Laboratorio de Banco de Dados', 80);
insert into disciplina(id, nome, nhoras)values(2, 'Programacao OO', 120);
insert into disciplina(id, nome, nhoras)values(3, 'Projeto de Banco de Dados', 80);
insert into disciplina(id, nome, nhoras)values(4, 'Projeto de Dados', 40);

insert into turma(codigo, nivel,id)values(20, 'I',2);
insert into turma(codigo, nivel,id)values(21, 'II',1);
insert into turma(codigo, nivel,id)values(22, 'III',1);
insert into turma(codigo, nivel,id)values(23, 'IV',3);
insert into turma(codigo, nivel,id)values(24, 'I',1);

insert into aluno(matricula, nome, sexo,codigo)values(10, 'Bety', 'F', 20);
insert into aluno(matricula, nome, sexo,codigo)values(11, 'Getulio', 'M',22);
insert into aluno(matricula, nome, sexo,codigo)values(12, 'Analis', 'F',22);
insert into aluno(matricula, nome, sexo,codigo)values(13, 'Terezinha', 'F',21);
insert into aluno(matricula, nome, sexo,codigo)values(14, 'Teodoro', 'M',23);

insert into ministra(numero, codigo, id, semestre)values(1000, 53, 3, '2021/2');
insert into ministra(numero, codigo, id, semestre)values(1001, 51, 1, '2021/2');
insert into ministra(numero, codigo, id, semestre)values(1002, 52, 1, '2020/1');
insert into ministra(numero, codigo, id, semestre)values(1003, 53, 2, '2020/1');
insert into ministra(numero, codigo, id, semestre)values(1004, 51, 3, '2021/1');
insert into ministra(numero, codigo, id, semestre)values(1005, 52, 2, '2021/1');
insert into ministra(numero, codigo, id, semestre)values(1006, 51, 4, '2022/1');
insert into ministra(numero, codigo, id, semestre)values(1021, 51, 4, '2021/1');


1 - Quantos alunos estão matriculados na turma do nível "III"

SELECT 	count(aluno.codigo), turma.nivel
FROM 	aluno INNER JOIN turma ON
		aluno.codigo = turma.codigo
WHERE turma.nivel = 'III'
GROUP BY turma.nivel


2- Nome e a matrícula dos alunos que estão fazendo a disciplina de Laboratorio de Banco de Dados. Em ordem alfabética por
nome de aluno

SELECT 	aluno.nome, aluno.matricula, disciplina.nome
FROM 	disciplina INNER JOIN turma ON
		disciplina.id = turma.id
		INNER JOIN aluno ON
		turma.codigo = aluno.codigo
WHERE 	disciplina.nome = 'Laboratorio de Banco de Dados'
ORDER BY aluno.nome


3- Listar os professores (nome e titulação) da disciplina de Laboratorio de Banco de Dados
 
SELECT 	professor.nome, professor.titulacao, disciplina.nome
FROM 	professor INNER JOIN ministra ON
		professor.codigo = ministra.codigo
		INNER JOIN disciplina ON
		ministra.id = disciplina.id
WHERE	disciplina.nome = 'Laboratorio de Banco de Dados'


4- Listar os professores e suas disciplinas ordenadas por semestre em ordem crescente

SELECT 	professor.nome, disciplina.nome, ministra.semestre
FROM 	professor INNER JOIN ministra ON
		professor.codigo = ministra.codigo
		INNER JOIN disciplina ON
		ministra.id = disciplina.id
ORDER BY ministra.semestre

OU ...

SELECT professor.nome, disciplina.nome, ministra.semestre
FROM professor, ministra, disciplina
WHERE professor.codigo = ministra.codigo and disciplina.id = ministra.id
ORDER BY 3
		
		
5- Somar o número de horas, que são ministradas pela professora Maysa, a cada semestre

SELECT 	professor.nome, disciplina.nhoras, ministra.semestre
FROM	professor INNER JOIN ministra ON
		professor.codigo = ministra.codigo
		INNER JOIN disciplina ON
		ministra.id = disciplina.id
WHERE   professor.nome = 'Maysa'


6- Listar o nome de alunos matriculados em cada disciplina, do semestre 2021

SELECT 	aluno.nome, disciplina.nome, ministra.semestre
FROM	aluno INNER JOIN turma ON
		aluno.codigo = turma.codigo
		INNER JOIN disciplina ON
		turma.id = disciplina.id
		INNER JOIN ministra ON
		disciplina.id = ministra.id
WHERE	ministra.semestre = '2021/1'

7- Listar o nome dos professores que ministram disciplinas, com o nhoras 
maior que a carga horária da disciplina de Projeto de Dados

SELECT 	professor.nome, disciplina.nhoras
FROM 	professor INNER JOIN ministra ON
		professor.codigo = ministra.codigo
		INNER JOIN disciplina ON
		ministra.id = disciplina.id
WHERE	disciplina.nhoras > (
							SELECT 	nhoras
							FROM	disciplina
							WHERE	disciplina.nome = 'Projeto de Dados'
							)
  
  
8- Faça uma consulta para listar o nome das disciplinas que 2 ou mais 
alunos matriculados

SELECT 	disciplina.nome, count(aluno.nome)
FROM	aluno INNER JOIN turma ON
		aluno.codigo = turma.codigo
		INNER JOIN disciplina ON
		turma.id = disciplina.id
HAVING	count(aluno.nome) >= 2
GROUP BY disciplina.nome

  
9- Faça uma consulta para listar o código das turmas que não possuem 
alunos

SELECT	turma.codigo, aluno.matricula
FROM	aluno FULL JOIN turma ON
		aluno.codigo = turma.codigo
		INNER JOIN disciplina ON
		turma.id = disciplina.id
WHERE	aluno.matricula IS NULL
  
10- Faça uma consulta para listar o número de alunos matriculados por 
semestre, em ordem decrescente de alunos

SELECT 	count(aluno.nome), ministra.semestre
FROM	ministra INNER JOIN turma ON
		ministra.id = turma.id
		INNER JOIN aluno ON
		turma.codigo = aluno.codigo
GROUP BY ministra.semestre
ORDER BY count(aluno.nome) desc

		