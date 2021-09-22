/*Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco
deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste site de cursos onlines.

Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço de um site de cursos
onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra J.
Faça um um select com Inner join entre tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria Java)..*/
drop database if exists db_cursoDaMinhaVida;

CREATE DATABASE IF NOT EXISTS db_cursoDaMinhaVida
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE db_cursoDaMinhaVida;

CREATE TABLE IF NOT EXISTS tb_categoria(
id_categoria int auto_increment not null,
nome varchar(60)  not null,
PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_categoria (nome) VALUES ('FROTEND'),('BACKEND'), ('BANCO DE DADOS'), ('FULLSTACK'),('MOBILE');


CREATE TABLE IF NOT EXISTS tb_cursos(
id_cursos int auto_increment not null,
nome varchar(100)  not null,
descricao text,
preco float not null, 
categoria int not null,
create_at timestamp,
PRIMARY KEY (id_cursos),
FOREIGN KEY (categoria) REFERENCES tb_categoria(id_categoria)
)ENGINE=InnoDB;



INSERT IGNORE INTO tb_cursos (nome,descricao,preco,categoria) VALUES 
('Construindo websites para internet com Bootstrap',
'APRENDA BOOTSTRAP HTML E CSS ',
35.00,
1),
('APRENDENDO HTML NA PRÁTICA',
'Neste curso você aprenderá HTML e as boas práticas com semânticas ',
20.00,
1),
('CRIANDO SEU WEBSITE COMPLETO COM PHP',
'Suba no elefante azul e E CRIE SEU PRIMEIRO WEBSITE COMPLETO COMEÇANDO DO ZERO!',
40.00,
3),
('JAVA 11',
'DESBRAVANDO Aprendendo JAVA com amor e carinho ',
40.00,
2),
('PostgreSQL <3',
'Aprenda os melhores práticas e desenvolva seu primeiro banco de dados, VOCÊ VAI SE APAIXONAR POR POSTGRE SZ ',
30.00,
3);


/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra J.
Faça um um select com Inner join entre tabela categoria e produto.*/

/*QUERY CONSULTA VALORES MENORES DO QUE 500 REAIS*/

SELECT CURSO.nome as NOME_CURSO,
	   CURSO.preco AS VALOR_R$, 
       CAT.nome as CATEGORIA from tb_cursos CURSO
       
inner join tb_categoria CAT on cat.id_categoria = CURSO.categoria
where (CURSO.preco>50);

/*QUERY Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
SELECT CURSO.nome as NOME_CURSO,
	   CURSO.preco AS VALOR_R$, 
       CAT.nome as CATEGORIA from tb_cursos CURSO
       
inner join tb_categoria CAT on cat.id_categoria = CURSO.categoria
where (CURSO.preco BETWEEN 3 AND 60);

/*QUERY Faça um select utilizando LIKE buscando os Produtos com a letra J*/
SELECT CURSO.nome as NOME_CURSO,
	   CURSO.preco AS VALOR_R$, 
       CAT.nome as CATEGORIA from tb_cursos CURSO
       
inner join tb_categoria CAT on cat.id_categoria = CURSO.categoria
where (CURSO.nome LIKE '%J%');


