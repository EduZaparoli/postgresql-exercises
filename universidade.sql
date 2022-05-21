--Criando a base de dados da Universidade
CREATE TABLE aluno (
  matricula INT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL,
  telefone VARCHAR(20) 	 
);

CREATE TABLE campus(
	id INT PRIMARY KEY,
	descricao VARCHAR(300) NOT NULL,
	endereco VARCHAR(40) NOT NULL
);

CREATE TABLE curso(
	codigo INT PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	nhoras INTEGER,
	idCampus INT,
	FOREIGN KEY(idCampus) REFERENCES Campus(codigo)
);

CREATE TABLE diploma(
	id INT NOT NULL,
	descricao VARCHAR(300) NOT NULL,
	ato VARCHAR(20) UNIQUE,
	idCurso INT
);

	ALTER TABLE Diploma ADD Constraint pk_diploma PRIMARY KEY (id);
	ALTER TABLE Diploma ADD Constraint fk_curso FOREIGN KEY (idCurso) REFERENCES Curso(codigo)

CREATE TABLE alunoCurso(
	aluno INT,
	curso INT,
	dataInicio DATE default (current_date),
	FOREIGN KEY (aluno) REFERENCES Aluno(matricula),
	FOREIGN KEY (curso) REFERENCES Curso(codigo),
	PRIMARY KEY (aluno,curso)
);

--- Povoando o banco de dados ---

	INSERT INTO aluno(matricula, nome, telefone) VALUES(123656, 'Juca', '9878-9821');
	INSERT INTO aluno(matricula, nome, telefone) VALUES(123289, 'Bety', '9190-1029');
	INSERT INTO aluno(matricula, nome, telefone) VALUES(123897, 'Ana', '8112-8456');

	INSERT INTO Campus(id, descricao,endereco) VALUES(1,'Passo Fundo','Br 285');
	INSERT INTO Campus(id, descricao,endereco) VALUES(2,'Passo Fundo','Rua Teixeira Soares');
	INSERT INTO Campus(id, descricao,endereco) VALUES(3,'Carazinho','Rua dos Saberes, 776');
	
	INSERT INTO curso(codigo, nome, nhoras, idCampus) VALUES(10, 'Ciências da Computação', 3240, 1);
	INSERT INTO curso(codigo, nome, nhoras, idCampus) VALUES(11, 'Direito', 2970, 3);
	INSERT INTO curso(codigo, nome, nhoras, idCampus) VALUES(12, 'Psicologia', 3280, 1);
	
	INSERT INTO diploma(id, descricao, ato, idCurso) VALUES(100, 'Confere o título de bacharel', '324/98', 12);
	INSERT INTO diploma(id, descricao, ato, idCurso) VALUES(101, 'Título emerito de bacharel', '120/11', 10);
	
	INSERT INTO alunoCurso(aluno, curso, dataInicio) VALUES(123289, 10, '27/07/2020');
	INSERT INTO alunoCurso(aluno, curso, dataInicio) VALUES(123897, 12, '01/03/2019');
	
	--1- Faça o comando SQL para alterar o tamanho do campo nome da tabela Aluno para 60 caracteres
	ALTER TABLE aluno ALTER COLUMN nome TYPE VARCHAR(60);
	
	--2- Faça o comando SQL para alterar a descrição do campo nome da tabela 
	ALTER TABLE aluno RENAME COLUMN nome TO nomeCurso;
	
	--3- Faça o comando SQL para adicionar um campo cidade na tabela Aluno. Por default atribua conteúdo Passo Fundo
	ALTER TABLE aluno ADD cidade VARCHAR(40) default 'Passo Fundo';
	
	--4- Faça o comando SQL mudar o endereço do campus Passo Fundo, id 1,  "BR 285 Km 292,7" 
	UPDATE campus SET endereco = 'BR 285 km 292,7' WHERE id = 1;
	
	--5- Faça o comando SQL para aumentar em 10% o número de horas do curso de Ciência da Computação e Psicologia
	UPDATE curso SET nhoras = nhoras + (nhoras * 10/100) WHERE UPPER(nome) = 'CIÊNCIA DA COMPUTAÇÃO' OR UPPER(nome) = 'PSICOLOGIA';
	
	--6- Faça o comando SQL para excluir o campus de Carazinho
	DELETE FROM campus WHERE lower(descricao) = 'carazinho';
	
	--7- Faça o comando SQL para listar a descrição e o endereço dos Campi com a descrição Passo Fundo
	SELECT descricao, endereco FROM campus WHERE descricao = 'Passo Fundo';
	
	--8- Faça o comando SQL para listar o nome e nhoras de todos cursos com menos de 3000 horas
	SELECT nome, nhoras FROM curso WHERE nhoras < 3000;
	
	--9- Faça o comando SQL para listar o nome de todos alunos que iniciam ou terminam seu nome com a letra A. Liste em ordem alfabética
	SELECT nome FROM aluno WHERE UPPER(nome) like 'A%' or UPPER(nome) like '%A' order by nome asc;
	
	--10- Faça o comando SQL para listar a matrícula do aluno, código do curso e data de início dos alunos no curso. Liste apenas do ano de 2021 
	SELECT matricula, codigo, 
	
	
	