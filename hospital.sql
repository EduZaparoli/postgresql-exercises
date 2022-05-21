CREATE TABLE Hospital ( 
cnpj		VARCHAR(15) PRIMARY KEY, 
nome		VARCHAR(30) NOT NULL, 
telefone	VARCHAR(14) 
); 

CREATE TABLE Enfermeira( 
CRE 		VARCHAR(12) PRIMARY KEY, 
nome 		VARCHAR(30) NOT NULL, 
telefone	VARCHAR(14) 
); 

CREATE TABLE Medico( 
CRM		VARCHAR(12) PRIMARY KEY, 
nome 		VARCHAR(30) NOT NULL, 
telefone 	VARCHAR(14), 
especialidade 	VARCHAR(25) 
);

CREATE TABLE Paciente( 
cpfpac 		VARCHAR(14) PRIMARY KEY, 
nome 		VARCHAR(30) NOT NULL, 
sintomas 	VARCHAR(40) NOT NULL, 
tratamento	VARCHAR(40) 
);

CREATE TABLE Atende_paciente( 
data 		DATE NOT NULL, 
hora		VARCHAR(7) NOT NULL, 
paciente_cpf 	VARCHAR(14), 
med_CRM 	VARCHAR(12) PRIMARY KEY, 
FOREIGN KEY (paciente_cpf) REFERENCES Paciente(cpfpac), 
FOREIGN KEY (med_CRM) REFERENCES Medico(CRM) 
);

CREATE TABLE Ala( 
id		INT PRIMARY KEY, 
descricao	VARCHAR(20) NOT NULL, 
capacidade 	INT NOT NULL, 
enf_CRE 	VARCHAR(12), 
paciente_cpf 	VARCHAR(14), 
FOREIGN KEY (enf_CRE) REFERENCES Enfermeira(CRE), 
FOREIGN KEY (paciente_cpf) REFERENCES Paciente(cpfpac) 
);

CREATE TABLE Enf_trabalha( 
enf_CRE 	VARCHAR(12) PRIMARY KEY, 
cnpj_hosp	VARCHAR(15), 
FOREIGN KEY (cnpj_hosp) REFERENCES Hospital(cnpj), 
FOREIGN KEY (enf_CRE) REFERENCES Enfermeira(CRE) 
);

CREATE TABLE Med_trabalha( 
med_CRM  	VARCHAR(12) PRIMARY KEY, 
cnpj_hosp	VARCHAR(15), 
FOREIGN KEY (cnpj_hosp) REFERENCES Hospital(cnpj), 
FOREIGN KEY (med_CRM) REFERENCES Medico(CRM) 
);

CREATE TABLE Endereco_paciente( 
paciente_cpf	VARCHAR(14), 
FOREIGN KEY (paciente_cpf) REFERENCES Paciente(cpfpac), 
cidade 		VARCHAR(20), 
bairro  		VARCHAR(20), 
rua 		VARCHAR(20), 
numero 	INT 
);

insert into Hospital(cnpj, nome, telefone)  
values('12143106/0001', 'São Roque', '5499898-6664');

insert into Hospital(cnpj, nome, telefone)  
values('16139196/0001', 'Santo Antônio', '5496456-4645'); 

insert into Hospital(cnpj, nome, telefone)  
values('19103101/0001', 'São Vicente', '5495435-5435'); 

insert into Hospital(cnpj, nome, telefone)  
values('33463401/0001', 'Jardim da Esperança', '5499470-5455'); 

insert into Hospital(cnpj, nome, telefone)  
values('54234301/0001', 'São Longuinho', '5498460-8435'); 



insert into Enfermeira(CRE, nome, telefone)  
values('43242344-7', 'Maria', '5491245-5346'); 

insert into Enfermeira(CRE, nome, telefone)  
values('42342535-8', 'Fernanda', '5496453-8764'); 

insert into Enfermeira(CRE, nome, telefone)  
values('87654767-4', 'Ana', '5496456-6458'); 

insert into Enfermeira(CRE, nome, telefone)  
values('99644767-4', 'Roberto', '5499300-6779'); 

insert into Enfermeira(CRE, nome, telefone)  
values('17754999-4', 'João', '5499440-6338');



insert into Medico(CRM, nome, telefone, especialidade)  
values ('12345678-9', 'Alberto', '5495635-3459', 'Endoscopia'); 

insert into Medico(CRM, nome, telefone, especialidade)  
values ('54524328-0', 'Fernando', '5498556-4645', 'Cardiologia'); 

insert into Medico(CRM, nome, telefone, especialidade)  
values ('23555366-7', 'Alan', '5490554-3555', 'Neurologia'); 

insert into Medico(CRM, nome, telefone, especialidade)  
values ('93893312-3', 'Jaqueline', '5499224-3578', 'Patologista'); 

insert into Medico(CRM, nome, telefone, especialidade)  
values ('53195333-1', 'Kauane', '5498553-3300', 'Pediatria'); 

 

insert into Paciente(cpfpac, nome, sintomas, tratamento)  
values ('045647790-59', 'Cezar', 'Dor de cabeça', 'Paracetamol'); 

insert into Paciente(cpfpac, nome, sintomas, tratamento)  
values ('045677799-50', 'Julio', 'Dor de barriga', 'Diasec'); 

insert into Paciente(cpfpac, nome, sintomas, tratamento)  
values ('120647749-39', 'Vitor', 'Dor no joelho', 'Paracetamol'); 

insert into Paciente(cpfpac, nome, sintomas, tratamento)  
values ('999643549-40', 'Erica', 'Hemorragia', 'Cirurgia'); 

insert into Paciente(cpfpac, nome, sintomas, tratamento)  
values ('873640249-39', 'Brenda', 'Diarreia', 'Florax'); 

 

insert into Atende_paciente(data, hora, paciente_cpf, med_CRM)  
values ('05/07/2021', '14:40', '045647790-59', '12345678-9'); 

insert into Atende_paciente(data, hora, paciente_cpf, med_CRM)  
values ('20/07/2021', '17:00', '045677799-50', '54524328-0'); 

insert into Atende_paciente(data, hora, paciente_cpf, med_CRM)  
values ('15/08/2021', '13:30', '120647749-39', '23555366-7'); 

insert into Atende_paciente(data, hora, paciente_cpf, med_CRM)  
values ('15/08/2021', '15:30', '999643549-40', '93893312-3'); 

insert into Atende_paciente(data, hora, paciente_cpf, med_CRM)  
values ('16/08/2021', '9:00', '873640249-39', '53195333-1'); 

 

insert into Ala(id, descricao, capacidade, enf_CRE, paciente_cpf)  
values (10, 'Cirurgias', 10, '43242344-7', '999643549-40'); 

insert into Ala(id, descricao, capacidade, enf_CRE, paciente_cpf)  
values (11, 'CTI', 25, '42342535-8', '873640249-39'); 

insert into Ala(id, descricao, capacidade, enf_CRE, paciente_cpf)  
values (13, 'Recêm nascidos', 15, '17754999-4', '045677799-50'); 

insert into Ala(id, descricao, capacidade, enf_CRE, paciente_cpf)  
values (12, 'Cirurgias', 5, '99644767-4', '045647790-59'); 

insert into Ala(id, descricao, capacidade, enf_CRE, paciente_cpf)  
values (14, 'Doenças Contagiosas', 20, '87654767-4', '120647749-39'); 

 

insert into Enf_trabalha(enf_CRE, cnpj_hosp)  
values ('43242344-7', '12143106/0001'); 

insert into Enf_trabalha(enf_CRE, cnpj_hosp)  
values ('42342535-8', '12143106/0001'); 

insert into Enf_trabalha(enf_CRE, cnpj_hosp)  
values ('87654767-4', '12143106/0001'); 

insert into Enf_trabalha(enf_CRE, cnpj_hosp)  
values ('17754999-4', '12143106/0001'); 

insert into Enf_trabalha(enf_CRE, cnpj_hosp)  
values ('99644767-4', '12143106/0001'); 

 

insert into Med_trabalha(med_CRM, cnpj_hosp)  
values ('12345678-9', '12143106/0001'); 

insert into Med_trabalha(med_CRM, cnpj_hosp)  
values ('54524328-0', '12143106/0001'); 

insert into Med_trabalha(med_CRM, cnpj_hosp)  
values ('23555366-7', '12143106/0001'); 

insert into Med_trabalha(med_CRM, cnpj_hosp)  
values ('93893312-3', '12143106/0001'); 

insert into Med_trabalha(med_CRM, cnpj_hosp)  
values ('53195333-1', '12143106/0001'); 

 

insert into Endereco_paciente(paciente_cpf, cidade, bairro, rua, numero)  
values ('045647790-59', 'Passo Fundo', 'Vila Rodrigues', 'Rua Independência', 50); 

insert into Endereco_paciente(paciente_cpf, cidade, bairro, rua, numero)  
values ('045677799-50', 'Passo Fundo', 'São Cristovão', 'Rua Napoleão Mojen', 60); 

insert into Endereco_paciente(paciente_cpf, cidade, bairro, rua, numero)  
values ('120647749-39', 'Passo Fundo', 'São Cristovão', 'Rua Sorocaba', 70); 

insert into Endereco_paciente(paciente_cpf, cidade, bairro, rua, numero)  
values ('999643549-40', 'Erechim', 'Centro', 'Rua Argentina', 110); 

insert into Endereco_paciente(paciente_cpf, cidade, bairro, rua, numero)  
values ('873640249-39', 'Erechim', 'Bela Vista', 'Rua Esperança', 230); 

 
 
a) um comando de atualização de dados (Update)  
1) Mude o nome de algum paciente 

UPDATE 	Paciente 
SET 		nome = 'Fabio' 
WHERE 	(nome) = 'Cezar' 

 

b) uma Consulta que envolva duas tabelas, com uso de Left, Right ou Full join  
2) Faça uma consulta para listar o nome dos pacientes e em qual cidade eles moram 

SELECT 		Paciente.nome, Endereco_paciente.cidade 
FROM		Paciente FULL JOIN Endereco_paciente ON 
Paciente.cpfpac = Endereco_paciente.paciente_cpf 

 

c) uma consulta que envolva três tabelas  
3) Faça uma consulta para listar o nome dos pacientes, em qual cidade eles moram e em que horario vão ser atendidos 

SELECT 		Paciente.nome, endereco_paciente.cidade, Atende_paciente.hora 
FROM		Paciente INNER JOIN Endereco_paciente ON 
Paciente.cpfpac = Endereco_paciente.paciente_cpf 
  INNER JOIN Atende_paciente ON 
Paciente.cpfpac = Atende_paciente.paciente_cpf 

 

d) uma consulta que envolva pelo menos duas tabelas com uso de função de agregação com Group by		 
4) Faça uma consulta para saber quantos pacientes moram em Passo Fundo e quantos moram em Erechim 

SELECT 		count(Paciente.nome) as Pacientes, Endereco_paciente.cidade 
FROM		Paciente FULL JOIN Endereco_paciente ON 
Paciente.cpfpac = Endereco_paciente.paciente_cpf 
GROUP BY 	Endereco_paciente.cidade 