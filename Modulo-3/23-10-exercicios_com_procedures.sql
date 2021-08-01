-- 1) Crie um banco de dados com o nome escola
CREATE DATABASE escola;
USE escola;

-- 2) Crie uma tabela chamada professor
CREATE TABLE tb_professor(
  cd_professor INT PRIMARY KEY AUTO_INCREMENT,
  nm_professor TINYTEXT NOT NULL
);

-- 3) Crie uma tabela aluno
CREATE TABLE tb_aluno(
  cd_aluno INT PRIMARY KEY AUTO_INCREMENT,
  nm_aluno TINYTEXT NOT NULL
);

-- 4) Crie uma tabela chamada cursos
CREATE TABLE tb_curso(
  cd_curso INT PRIMARY KEY AUTO_INCREMENT,
  nm_curso VARCHAR(100) NOT NULL,
  ch_curso INT NOT NULL,
  vlm_curso DOUBLE(10, 2) NOT NULL,
  id_professor INT,
  FOREIGN KEY(id_professor) REFERENCES tb_professor(cd_professor)
);

-- 5) Crie uma tabela solução para o relacionamento muitos
-- para muitos entre a tabela aluno e curso.
CREATE TABLE tb_aluno_curso(
  cd_aluno_curso INT PRIMARY KEY AUTO_INCREMENT,
  id_aluno INT NOT NULL,
  id_curso INT NOT NULL,
  FOREIGN KEY(id_aluno) REFERENCES tb_aluno(cd_aluno),
  FOREIGN KEY(id_curso) REFERENCES tb_curso(cd_curso)
);

-- 6) Insira no minimo 5 professores, 15 alunos e 5 cursos.
DELIMITER $$
CREATE PROCEDURE InserirProfs(nomeProf TINYTEXT)
BEGIN
  INSERT INTO tb_professor(nm_professor) VALUES(nomeProf);
END $$
DELIMITER ;

CALL InserirProfs('Profo Jirafales');
CALL InserirProfs('Profo Dumbledore');
CALL InserirProfs('Profa Honey');
CALL InserirProfs('Profo Xavier');
CALL InserirProfs('Profo Raimundo');

DELIMITER $$
CREATE PROCEDURE InserirAlunos(nomeAluno TINYTEXT)
BEGIN
  INSERT INTO tb_aluno(nm_aluno) VALUES(nomeAluno);
END $$
DELIMITER ;

CALL InserirAlunos('Ana Beatriz');
CALL InserirAlunos('Luana');
CALL InserirAlunos('Mauricio');
CALL InserirAlunos('Fábio');
CALL InserirAlunos('Gabriel');
CALL InserirAlunos('Vitória');
CALL InserirAlunos('Giovanna');
CALL InserirAlunos('Gabrielle');
CALL InserirAlunos('Isabely');
CALL InserirAlunos('Jorge');
CALL InserirAlunos('Mariana');
CALL InserirAlunos('Camila');
CALL InserirAlunos('Marcelo');
CALL InserirAlunos('Paula');
CALL InserirAlunos('Pedro');

DELIMITER $$
CREATE PROCEDURE InserirCursos(nomeCurso VARCHAR(100), chCurso INT,
  vlmCurso DOUBLE(10, 2))
BEGIN
  INSERT INTO tb_curso(nm_curso) VALUES(nomeCurso, chCurso, vlmCurso);
END $$
DELIMITER ;

CALL InserirCursos('Desenvolvimento de Sistemas', 80, 1800);
CALL InserirCursos('Administração', 70, 1700);
CALL InserirCursos('Ciência de Dados', 60, 1600);
CALL InserirCursos('Informática para internet', 50, 1500);
CALL InserirCursos('Tricô', 40, 100);

-- 7) Adicione alunos aos cursos e determine um professor para cada curso
DELIMITER $$
CREATE PROCEDURE InserirAlunoCurso(idAluno INT, idCurso INT)
BEGIN
  INSERT INTO tb_aluno_curso(id_aluno, id_curso) VALUES(idAluno, idCurso);
END $$
DELIMITER ;

CALL InserirAlunoCurso(1, 1);
CALL InserirAlunoCurso(2, 2);
CALL InserirAlunoCurso(3, 3);
CALL InserirAlunoCurso(4, 4);
CALL InserirAlunoCurso(5, 5);
CALL InserirAlunoCurso(6, 1);
CALL InserirAlunoCurso(7, 2);
CALL InserirAlunoCurso(8, 3);
CALL InserirAlunoCurso(9, 4);
CALL InserirAlunoCurso(10, 5);
CALL InserirAlunoCurso(11, 1);
CALL InserirAlunoCurso(12, 2);
CALL InserirAlunoCurso(13, 3);
CALL InserirAlunoCurso(14, 4);
CALL InserirAlunoCurso(15, 5);

DELIMITER $$
CREATE PROCEDURE UpdateCurso(idProf INT, numero INT)
BEGIN
  UPDATE tb_curso SET id_professor = idProf WHERE cd_curso = numero;
END $$
DELIMITER ;

CALL UpdateCurso(1, 1);
CALL UpdateCurso(2, 2);
CALL UpdateCurso(3, 3);
CALL UpdateCurso(4, 4);
CALL UpdateCurso(5, 5);

/* 8) Faça uma procedure que liste todos os alunos mostrando seus cursos
com nome do professor e valor da mensalidade. */
DELIMITER $$
CREATE PROCEDURE ListarAlunos()
BEGIN
  SELECT nm_aluno, nm_curso, nm_professor, vlm_curso FROM tb_aluno
  INNER JOIN tb_aluno_curso AS ac
  ON ac.id_aluno = tb_aluno.cd_aluno
  INNER JOIN tb_curso AS c
  ON c.cd_curso = ac.id_curso
  INNER JOIN tb_professor AS p
  ON p.cd_professor = c.id_professor;
END $$
DELIMITER ;

CALL ListarAlunos();
 
/* 9) Faça um function que calcule um desconto de 20% para mensalidades
até  R$ 100.00 e 30% para mensalidade acima desse valor. */
DELIMITER $$
CREATE FUNCTION CalcularDesconto(mensalidade DOUBLE(10, 2))
RETURNS DOUBLE(10, 2)
BEGIN
  IF mensalidade <= 100 THEN
    RETURN mensalidade * 0.2
  ELSEIF mensalidade > 100 THEN
    RETURN mensalidade * 0.3
END $$
DELIMITER ;

SELECT vlm_curso, CalcularDesconto(vlm_curso) AS Desconto FROM tb_curso;