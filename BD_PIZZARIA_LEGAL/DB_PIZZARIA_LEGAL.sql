DROP DATABASE IF EXISTS db_pizzaria_legal;
CREATE DATABASE IF NOT EXISTS db_pizzaria_legal
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE db_pizzaria_legal;

create table tb_categorias(
id_categoria int auto_increment,
nome_categoria varchar(100)  not null,
create_at timestamp,
PRIMARY KEY (id_categoria)
)ENGINE=InnoDB;
INSERT IGNORE INTO tb_categorias(nome_categoria) VALUES ('SALGADA'),('DOCE'),('ESPECIAL');

CREATE TABLE IF NOT EXISTS tb_pizzas(
id_pizza int auto_increment,
nome_pizza varchar(100)  not null,
preco varchar(100)  not null,
ingredientes text not null,
categoria int  not null,
tamanho enum ('P', 'G') not null,
create_at timestamp,
PRIMARY KEY (id_pizza)
)ENGINE=InnoDB;


/*ADIOCIONANDO PIZZAS*/
INSERT IGNORE INTO tb_pizzas(nome_pizza,preco,ingredientes,tamanho,categoria) VALUES 

('CALABRESA',
20.00,
'CALABRESA, CEBOLA E MASSA DE TOMATE',
'G',
1),

('MUSSARELA',
20.00,
'MUSSARELA, MOLHO DE TOMATE E OREGANO',
'G',
1),

('FRANGO COM CATUPIRY',
25.00,
'Azeitona, Catupiry, Frango, Molho de Tomate, Mussarela, Orégano',
'G',
1),

('CANADENSE',
50.00,
'Abacaxi, Azeitona, Lombo, Molho de Tomate, Mussarela, Orégano',
'G',
1
),

('CANADENSE ESPECIAL',
80.00,
'Recheio em DOBRO!, Abacaxi, Azeitona, Lombo, Molho de Tomate, Mussarela, Orégano',
'G',
1
),

('BRIGADEIRO',
37.00,
'Brigadeiro, Granulado, Leite Condensado, Mussarela',
'G',
2);




/*Faça um select que retorne os Produtos com o valor maior do que 45 reais.
Faça um select trazendo os Produtos com valor entre 29 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre tabela categoria e pizza.
*/

select * from tb_pizzas;


/*Faça um select que retorne os Produtos com o valor maior do que 45 reais.*/
select P.nome_pizza, P.ingredientes, P.preco, P.tamanho, C.nome_categoria from tb_pizzas P
join tb_categorias C on id_categoria = P.categoria
where (P.preco>45);


/*Faça um select trazendo os Produtos com valor entre 29 e 60 reais.*/
select P.nome_pizza, P.ingredientes, P.preco, P.tamanho, C.nome_categoria from tb_pizzas P
join tb_categorias C on id_categoria = P.categoria
where (P.preco BETWEEN 29.00 AND 60.00);

/*Faça um select utilizando LIKE buscando os Produtos com a letra C.*/
select P.nome_pizza, P.ingredientes, P.preco, P.tamanho, C.nome_categoria from tb_pizzas P
join tb_categorias C on id_categoria = P.categoria where P.nome_pizza  LIKE'%c%';

/*Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).*/
select P.nome_pizza, P.ingredientes, P.preco, P.tamanho, C.nome_categoria from tb_pizzas P
join tb_categorias C on id_categoria = P.categoria where C.nome_categoria  LIKE'%DOCE%';





