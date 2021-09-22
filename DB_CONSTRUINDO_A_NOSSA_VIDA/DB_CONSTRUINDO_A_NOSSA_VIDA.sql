/*Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome
do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema
trabalhará com as informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

Siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço deste ecommerce.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço de uma loja de produtos (não
esqueça de criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são da categoria hidráulica).


Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/
drop database db_construindo_a_nossa_vida;

CREATE DATABASE IF NOT EXISTS db_construindo_a_nossa_vida
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE db_construindo_a_nossa_vida;

CREATE TABLE IF NOT EXISTS tb_categoria(
id_categoria int auto_increment not null,
nome varchar(60)  not null,
PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_categoria (nome) VALUES ('Impermeabilizantes'),('Sacarias'), ('hidráulica'), ('Construção'),('Ferragem');


CREATE TABLE IF NOT EXISTS tb_produtos(
id_produto int auto_increment not null,
nome varchar(100)  not null,
descricao text,
valor_unitario float not null,
validade date, 
categoria int not null,
create_at timestamp,
PRIMARY KEY (id_produto),
FOREIGN KEY (categoria) REFERENCES tb_categoria(id_categoria)
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tb_estoque(
id_estoque int auto_increment not null,
produto int not null unique,
quantidade_estoque SMALLINT,
PRIMARY KEY (id_estoque),
FOREIGN KEY (produto) references tb_produtos(id_produto)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_produtos (nome,descricao,valor_unitario,validade,categoria) VALUES 
(
'Areia Fina Lavada Saco',
'Saco de areia fina Grupo Tomico 20kg ',
4.00,
null,
2),

('Areia Grossa Lavada Saco',
'Saco de areia Grossa Grupo Tomico 20kg ',
4.00,
null,
2),

('Aditivo Plastificante Liga para Massas 18L Axton',
'Aditivo plastificante dosado para proporcionar excelente trabalhabilidade, coesão e liga',
69.90,
2026-09-03,
1
),

('Cimento CP II F 32 Todas as Obras 50kg Votoran',
'Na hora de construir ou reformar, um item que não pode faltar é o cimento. É importante um produto de qualidade para não ter problemas futuros na obra. O Cimento CP II F 32 Todas as Obras 50 kg Votoran é ideal para reboco, contrapiso, concreto convencional e laj',
31.90,
2023-09-03,
4
),

(
'Aditivo Impermeabilizante Vedalaje 15kg Rebotec',
'Mina super macia exclusiva, garantindo o máximo de conforto ao pintar Cores mais vivas',
199.00,
2025-09-20,
1),


('Mangueira Flexível para Água Branco Baixa Pressão 1/2" 40cm Plastilit',
null,
12.00,
null,
3),

('Lixeira Calçada até 53L Alumínio Prata Ideale',
'Este produto lhe proporciona armazenar e facilitar na hora do descarte do lixo.',
339.40,
null,
4);


INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (1,25); /*ADICIONANDO ESTOQUE PRODUTO 1*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (2,90); /*ADICIONANDO ESTOQUE PRODUTO 2*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (3,2); /*ADICIONANDO ESTOQUE PRODUTO 3*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (4,15); /*ADICIONANDO ESTOQUE PRODUTO 4*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (5,4); /*ADICIONANDO ESTOQUE PRODUTO 5*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (6,30); /*ADICIONANDO ESTOQUE PRODUTO 6*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (7,9); /*ADICIONANDO ESTOQUE PRODUTO 7*/


/*QUERY Faça um select trazendo os Produtos com valor entre 3 e 60 reais.*/
SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       estoque.quantidade_estoque as ESTOQUE_RESTANTE,
       cat.nome as CATEGORIA from tb_produtos prod
       
inner join tb_estoque estoque on estoque.produto = prod.id_produto
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (prod.valor_unitario BETWEEN 3 AND 60);


/*QUERY Faça um select utilizando LIKE buscando os Produtos com a letra C.*/

SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       estoque.quantidade_estoque as ESTOQUE_RESTANTE,
       cat.nome as CATEGORIA from tb_produtos prod
       
inner join tb_estoque estoque on estoque.produto = prod.id_produto
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (prod.valor_nome like '%C%');


/*QUERY Faça um select utilizando LIKE buscando de uma categoria especifica*/

SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       estoque.quantidade_estoque as ESTOQUE_RESTANTE,
       cat.nome as CATEGORIA from tb_produtos prod
       
inner join tb_estoque estoque on estoque.produto = prod.id_produto
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (cat.nome LIKE 'hidráulica');





