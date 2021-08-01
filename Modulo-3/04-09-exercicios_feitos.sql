-- a) Criar o banco de dados Clinica.
CREATE DATABASE Clinica;

USE Clinica;

-- d) Criar a tabela médicos.
CREATE TABLE tb_medicos(
	cd_medico INT AUTO_INCREMENT,
	nm_medico VARCHAR(100) NOT NULL,
	PRIMARY KEY(cd_medico)
);

-- c) Criar a tabela serviços.
CREATE TABLE tb_servicos(
	cd_servico INT AUTO_INCREMENT,
	nm_servico VARCHAR(100) NOT NULL,
	vl_servico DECIMAL(8, 2) NOT NULL,
	id_medico INT,
	PRIMARY KEY(cd_servico),
	FOREIGN KEY (id_medico) REFERENCES tb_medicos(cd_medico)
);

-- b) Criar a tabela clientes.
CREATE TABLE tb_clientes(
	cd_cliente INT AUTO_INCREMENT,
	nm_cliente VARCHAR(100) NOT NULL,
	snm_cliente VARCHAR(100) NOT NULL,
	gen_cliente CHAR(1) NOT NULL,
	end_cliente VARCHAR(100) NOT NULL,
	cid_cliente VARCHAR(100) NOT NULL,
	est_cliente CHAR(2) NOT NULL,
	id_servico INT,
	PRIMARY KEY(cd_cliente),
	FOREIGN KEY (id_servico) REFERENCES tb_servicos(cd_servico)
);

-- g) Inserir os dados na tabela médicos.
INSERT INTO tb_medicos(nm_medico)
VALUES
('Ângelo Felizardo'), ('Roberta Teixeira'),
('Paula Silveira'), ('Silvia Nascimento'),
('Paulo Santiago'), ('Silvio Pereira');

-- f) Inserir os dados na tabela serviços.
INSERT INTO tb_servicos(nm_servico, vl_servico, id_medico)
VALUES
('Exame de sangue', 30, 1),
('Endoscopia', 80, 2),
('Ultrassonografia', 90, 4),
('Consulta com clinico', 100, 5),
('Consulta com ortopedista', 120, 6),
('Consulta com dermatologista', 110, 3);

-- e) Inserir os dados na tabela clientes.
INSERT INTO tb_clientes(nm_cliente, snm_cliente, gen_cliente,
	end_cliente, cid_cliente, est_cliente, id_servico)
VALUES
('Victoria', 'Souza Santos', 'F', 'Rua Trinta', 'São Paulo', 'SP', 1),
('Pedro', 'Mathias Silveira', 'M', 'Rua Paraná', 'Petrópolis', 'RJ', 5),
('Felipe', 'Reis Oliveira', 'M', 'Al. São Paulo', 'Curitiba', 'PR', 2),
('Henrique', 'Nogueira Costa', 'M', 'Rua Goiás', 'Mongaguá', 'SP', 5),
('Paulo', 'Oliveira Santana', 'M', 'Al. Batista', 'Niterói', 'RJ', 3),
('Pamela', 'Rosa Salgueiro', 'F', 'Villa Real', 'Itanhaém', 'SP', 6),
('Silvio', 'Silveira Martins', 'M', 'Av. Ana Costa', 'Santos', 'SP', 5),
('Jorge', 'Souza Reis', 'M', 'Av. São João', 'São Paulo', 'SP', 4);

-- h) Escreva o comando que mostra todos os campos da tabela clientes.
SELECT * FROM tb_clientes;

-- i) Escreva o comando necessário para fazer uma busca por clientes
-- que contenha “Souza” em seu sobrenome.
SELECT cd_cliente, nm_cliente, snm_cliente
FROM tb_clientes
WHERE snm_cliente LIKE '%Souza%';

-- j) Comando que mostra os dados dos registros entre 2 e 6.
SELECT * FROM tb_clientes
WHERE cd_cliente BETWEEN 2 AND 6;

-- k) Comando que mostra os registros 1, 7 e 8.
SELECT * FROM tb_clientes
WHERE cd_cliente IN(1, 7, 8);

-- l) Foi identificado que na tabela de cliente será necessário inserir
-- o campo e-mail. Escreva os comandos necessários para essa alteração.
ALTER TABLE tb_clientes
ADD em_cliente VARCHAR(100) NOT NULL;

-- m) Escreva o comando necessário para preencher o campo e-mail.
UPDATE tb_clientes SET em_cliente = 'VI_S_SANTOS@GMAIL.COM'
WHERE cd_cliente = 1;
UPDATE tb_clientes SET em_cliente = 'PEDRO@UOL.COM.BR'
WHERE cd_cliente = 2;
UPDATE tb_clientes SET em_cliente = 'OLIVEIRA.REIS@GMAIL.COM'
WHERE cd_cliente = 3;
UPDATE tb_clientes SET em_cliente = 'HNCOSTA@BOL.COM.BR'
WHERE cd_cliente = 4;
UPDATE tb_clientes SET em_cliente = 'PAULOSANATNA@OUTLOOK.COM'
WHERE cd_cliente = 5;
UPDATE tb_clientes SET em_cliente = 'SALGUEIRO.PAM@TERRA.COM.BR'
WHERE cd_cliente = 6;
UPDATE tb_clientes SET em_cliente = 'SILVIO.MARTINS@HOTMAIL.COM'
WHERE cd_cliente = 7;
UPDATE tb_clientes SET em_cliente = 'JORGE@YAHOO.COM.BR'
WHERE cd_cliente = 8;

-- n)
SELECT
  cd_cliente AS 'Cliente',
  CONCAT(nm_cliente, ' ', snm_cliente) AS 'Nome completo',
  gen_cliente AS 'Gênero', end_cliente AS 'Endereço',
  cid_cliente AS 'Cidade', est_cliente AS 'Estado',
  em_cliente AS 'E-mail', nm_servico AS 'Serviço',
  vl_servico AS 'Valor', nm_medico AS 'Nome do médico'
FROM tb_servicos
INNER JOIN tb_clientes AS c
ON c.id_servico = tb_servicos.cd_servico
INNER JOIN tb_medicos AS m
ON m.cd_medico = tb_servicos.id_medico
ORDER BY `Nome completo`;