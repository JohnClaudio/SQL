/*Atividade 3
Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as
informações dos estudantes deste registro dessa escola.
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos estudantes para se trabalhar com o serviço dessa escola.

Popule esta tabela com até 8 dados;
Faça um select que retorne o/as estudantes com a nota maior do que 7.
Faça um select que retorne o/as estudantes com a nota menor do que 7.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

drop database DB_ESCOLAS;
CREATE DATABASE IF NOT EXISTS DB_ESCOLAS
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE DB_ESCOLAS;

CREATE TABLE IF NOT EXISTS tb_alunes (
  `id_alune` int(11) NOT NULL AUTO_INCREMENT UNIQUE,
  `nome` varchar(100) NOT NULL NULL,
  `uf_estado` VARCHAR(10) NOT NULL NULL,
  `data_nascimento` VARCHAR(10) NOT NULL NULL,
  `email` varchar(150) NOT NULL NULL UNIQUE,
  `create_at` timestamp,
  primary key(id_alune)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tb_notas (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `id_alune` varchar(50) NOT NULL,
  `semestre` tinyint not null,
  `nota` decimal(4,2) not null,
   primary key(id_nota)
) ENGINE=InnoDB;



INSERT IGNORE INTO tb_alunes (nome,uf_estado,data_nascimento,email) VALUES (
'Eowyn Haikela Souza',
'SP',
'1996-09-20',
'haikela@haikela.com');


INSERT IGNORE INTO tb_alunes (nome,uf_estado,data_nascimento,email) VALUES (
'André Soares Pereira',
'SP',
'2000-09-20',
'Andre@Andre.com');

INSERT IGNORE INTO tb_notas (id_alune,semestre, nota) VALUES 
(1,1,8.10),  
(1,1,7.10),
(2,1,5.60),  
(2,1,7.20),

(2,2,7.20),
(1,2,9.20);



select distinct nome as ALUNOS_NOTAS_SUPERIOR_7, notas.nota as NOTA_ALUNO, notas.semestre from tb_alunes alune
left join tb_notas notas on notas.id_alune = alune.id_alune where (notas.nota>7);

select distinct nome as ALUNOS_NOTAS_INFERIOR_7, notas.nota as NOTA_ALUNO, notas.semestre from tb_alunes alune
left join tb_notas notas on notas.id_alune = alune.id_alune where (notas.nota<7);






