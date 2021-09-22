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

INSERT IGNORE INTO tb_categoria (nome) VALUES ('Beleza e Higiene'),('PERFUMES'), ('ALIMENTOS'), ('MEDICAMENTO'),('HOME CARE');


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


INSERT IGNORE INTO tb_produtos (nome,descricao,valor_unitario,validade,categoria) VALUES 

('asepxia sabonete',
'limpa profundamente e purifica a pele, reduzindo a oleosidade e o tamanho dos poros, além de auxiliar na prevenção de cravos e espinhas.',
2.50,
2025-09-20,
1
),

('Desodorante Aerosol Rexona V8/Amarelo 150ml',
null,
9.50,
2022-09-20,
1),

('Escova Dental Colgate Slim Soft Preta 4 unidades',
'A Escova de dente Colgate Slim Soft Black foi desenvolvida com a tecnologia de ponta da Colgate. Por meio de cerdas macias infundidas em carvão com pontas ultra finas, a escova promove uma limpeza profunda e delicada',
9.50,
2024-09-20,
1),

('CREME DENTAL BLACK KIT 5 UNIDADES',
'Elaborado com diversos ativos vegetais e óleos essenciais (tea tree, limão, menta e outros) que são a base de todo creme dental da Puravida Oral Care, o BLACK tem um elevada concentração de carvão ativado de coco.',
50.50,
2022-09-20,
1),

('Creme Dental Com Flúor Closeup Triple Hortelã 70g',
null,
4.50,
2022-09-20,
1),

('Kit Medidor de Glicose Accu-Chek Active Roche',
null,
64.00,
2022-09-20,
5);


/*Faça um select que retorne os Produtos com o valor maior do que 50 reais.*/

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
where (prod.nome LIKE '%b%');



