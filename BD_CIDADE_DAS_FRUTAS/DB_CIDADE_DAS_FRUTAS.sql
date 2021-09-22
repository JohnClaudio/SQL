/*Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do
banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o
sistema trabalhará com as informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.

Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre tabela categoria e produto.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são aves ou legumes).

Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

drop database IF EXISTS db_farmacia_do_bem;
CREATE DATABASE IF NOT EXISTS db_farmacia_do_bem
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE db_farmacia_do_bem;

CREATE TABLE IF NOT EXISTS tb_categoria(
id_categoria int auto_increment not null,
nome varchar(60)  not null,
descricao text,
PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_categoria (nome) VALUES ('Fruta'),('Legume'), ('Verdura'), ('Fruta Seca'),('Embalado');


CREATE TABLE IF NOT EXISTS tb_produtos(
id_produto int auto_increment not null,
nome varchar(100)  not null,
descricao text,
valor_unitario float not null,
categoria int not null,
create_at timestamp,
PRIMARY KEY (id_produto),
FOREIGN KEY (categoria) REFERENCES tb_categoria(id_categoria)
)ENGINE=InnoDB;


INSERT IGNORE INTO tb_produtos (nome,descricao,valor_unitario,categoria) VALUES 

('Jiló',
'Bandeja 350g',
8.99,
5
),

('Pimenta Ardida',
'Bandeja 180g',
6.99,
5
),

('Pimenta Ardida',
'Bandeja 180g',
6.99,
5),

('Milho Verde',
'Bandeja 900g',
7.99,
5),

('Ameixa Seca com Coraço',
'Bandeja 200g',
7.99,
4),
('Castanha-de-caju',
'Bandeja 100g',
11.99,
4),

('Abacate',
'Verde ou Maduro 1 unidade',
2.99,
1),

('Abobora Japonesa',
'QUILO/KG',
4.99,
2);

SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       cat.nome as CATEGORIA from tb_produtos prod
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (prod.valor_unitario>50);

/*Faça um select trazendo os Produtos com valor entre 3 e 60 reais*/

SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       cat.nome as CATEGORIA from tb_produtos prod
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (prod.valor_unitario BETWEEN 3.00 AND 60.00);

/*Faça um select utilizando LIKE buscando os Produtos com a letra B*/

SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       cat.nome as CATEGORIA from tb_produtos prod
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (prod.nome LIKE '%c%');



