/*
Atividade 2
Crie um banco de dados para um e commerce, onde o sistema trabalhará com as
informações dos produtos deste ecommerce.
Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos produtos para se trabalhar com o serviço deste ecommerce.
Popule esta tabela com até 8 dados;
Faça um select que retorne os produtos com o valor maior do que 500.
Faça um select que retorne os produtos com o valor menor do que 500.
Ao término atualize um dado desta tabela através de uma query de atualização.
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/
drop database DB_ECOMMERCE;

CREATE DATABASE IF NOT EXISTS DB_ECOMMERCE
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE DB_ECOMMERCE;

CREATE TABLE IF NOT EXISTS tb_categoria(
id_categoria int auto_increment not null,
nome varchar(60)  not null,
PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_categoria (nome) VALUES ('MATERIAL ESCOLAR'),('PRODUTOS DE HIGIENE'), ('ELETRÔNICOS');


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
'BORRACHA',
'Borracha Plástica Faber Castell Branca Fc Max 2unid Tk Plast',
5.00,
2025-09-20,
1
),
(
'Celular Xiaomi Note 10',
'6GB RAM 128GB ARMAZENAMENTO',
1500.50,
null,
3
),

(
'Lápis De Cor 50 Cores',
'Mina super macia exclusiva, garantindo o máximo de conforto ao pintar Cores mais vivas',
40.00,
2065-09-20,
1
);

INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (1,25); /*ADICIONANDO ESTOQUE PRODUTO 1*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (2,90); /*ADICIONANDO ESTOQUE PRODUTO 2*/
INSERT IGNORE INTO tb_estoque(produto,quantidade_estoque) VALUES (3,20); /*ADICIONANDO ESTOQUE PRODUTO 3*/

UPDATE tb_produtos  set nome="Borracha FaberCastell" where  id_produto = 1;



/*QUERY CONSULTA VALORES MENORES DO QUE 500 REAIS*/
SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       estoque.quantidade_estoque as ESTOQUE_RESTANTE,
       cat.nome as CATEGORIA from tb_produtos prod
       
inner join tb_estoque estoque on estoque.produto = prod.id_produto
inner join tb_categoria cat on cat.id_categoria = prod.categoria
where (prod.valor_unitario<500);


/*QUERY CONSULTA VALORES SUPERIORES DO QUE 500 REAIS*/

SELECT prod.nome as NOME_PRODUTO,
	   prod.valor_unitario AS VALOR_R$, 
       estoque.quantidade_estoque as ESTOQUE_RESTANTE,
       cat.nome as CATEGORIA from tb_produtos prod
       
inner join tb_estoque estoque on estoque.produto = prod.id_produto
inner join tb_categoria cat on cat.id_categoria = prod.categoria

where (prod.valor_unitario>500);



