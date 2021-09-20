/*Atividade 1

Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.

Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.
Popule esta tabela com até 5 dados;

Faça um select que retorne os funcionaries com o salário maior do que 2000.
Faça um select que retorne os funcionaries com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em*/

CREATE DATABASE IF NOT EXISTS DB_RH
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE DB_RH;

CREATE TABLE IF NOT EXISTS tb_funcionarios(
CPF CHAR (11),
nome varchar(100)  not null,
nascimento date,
uf_estado char(2)  not null, 
salario float not null,
setor varchar(30)  not null,
admissao date,
create_at timestamp,
PRIMARY KEY (CPF)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_funcionarios VALUES (
18022060862,
'Eowyn Haikela Souza',
'1996-09-20',
'SP',
5000.20,
'Desenvolvimento de Sistemas',
'2019-09-20',
default),

(
'48022060892',
'Miguel Tulho Soares',
'2000-05-1',
'MG',
3000.00,
'Desenvolvimento de Sistemas',
'2021-05-05',
default
),

('49069060892',
'André Jr',
'2000-05-1',
'SP',
1500.00,
'Estagiario desenvolvimento de Sistemas',
'2021-05-05',
default
);

SELECT nome,salario as SALARIO_SUPERIOR_2000 from tb_funcionarios WHERE (salario > 2000) ;
SELECT nome,salario as SALARIO_INFERIOR_2000 from tb_funcionarios WHERE (salario < 2000) ;




 