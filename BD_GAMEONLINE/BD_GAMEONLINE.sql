/*Atividade 1

Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
informações dos personagens desse game.

O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.*/

drop database db_generation_game_online;
CREATE DATABASE IF NOT EXISTS db_generation_game_online
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE       utf8mb4_unicode_ci;

USE db_generation_game_online;

CREATE TABLE IF NOT EXISTS tb_poderes(
id_poder int auto_increment,
nome_poder varchar(100)  not null,
create_at timestamp,
PRIMARY KEY (id_poder)
)ENGINE=InnoDB;


/*ADIOCIONANDO PODERES*/
INSERT IGNORE INTO tb_poderes(nome_poder) VALUES ('CAMUFLAGEM'),('VOAR'),('SUPER RESISTÊNCIA'), ('SUPER VELOCIDADE'), ('MANIPULAR ELEMENTOS DA NATUREZA'),('CAMUFLAGEM');

CREATE TABLE IF NOT EXISTS tb_trajes(
id_traje int auto_increment,
nome_traje varchar(100)  not null,
create_at timestamp,
PRIMARY KEY (id_traje)
)ENGINE=InnoDB;

INSERT IGNORE INTO tb_trajes(nome_traje) VALUES ('ARMADURA PESADA'),('ARMADURA LEVE'),('ROUPA LEVE'), ('ESTILO MAGO'), ('GUARDA DA CIDADELA');

CREATE TABLE IF NOT EXISTS tb_personagens(
id_personagem int auto_increment	,
nome_personagem varchar(100)  not null,
historia text not null,
super_poder int,
traje int,
forca decimal (6,2),
defesa decimal (6,2),
inteligencia decimal(6,2),
create_at timestamp,

FOREIGN KEY (super_poder) references tb_poderes(id_poder),
FOREIGN KEY (traje) references tb_trajes (id_traje),
PRIMARY KEY (id_personagem)

)ENGINE=InnoDB;

INSERT IGNORE INTO tb_personagens (nome_personagem,historia,super_poder,traje,forca,defesa,inteligencia) VALUES

('Akaranai',
'Akaranai é uma garota filha de elfos, lider e sua missão é proteger sua terra natal contra invações de orcs',
1,
3,
3000,
1500,
9000
),

('Feanor',
'Fëanor o que se sabe é que ele enfrentou uma força de Balrogs sozinho!.',
2,
3,
2500,
9000,
1500
),

('Agata',
'Uma prodigia de seu clã, além de lutadora é sabia, gosta da companhia de Duendes e Akaranai é a sua melhor amiga.',
4,
2,
5500,
4000,
7000
),
('Reagar',
'Um garoto inteligente porém ainda em desenvolvimento, vive no reino de Akaranai e se alistou recentemente',
4,
2,
1005,
800,
1500
),
('Chopper',
'Um pequeno duende, brincalhão, e curandeiro. Vive no reino dos Duendes e gosta de se aventurar no mundo dos humanos e ajuda aqueles que consideram de coração bondoso',
6,
3,
40,
900,
3000)

;
/*Faça um select que retorne os personagens com o poder de ataque maior do que 2000.*/

SELECT PER.nome_personagem, PER.historia, P.nome_poder as poder_especial, PER.forca, PER.defesa, PER.inteligencia, T.nome_traje as vestimenta from tb_personagens PER

join tb_poderes P on P.id_poder =  PER.super_poder
join tb_trajes T on T.id_traje = PER.traje

WHERE PER.forca>2000;

/*Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.*/

SELECT PER.nome_personagem, PER.historia, P.nome_poder as poder_especial, PER.forca, PER.defesa, PER.inteligencia, T.nome_traje as vestimenta from tb_personagens PER

join tb_poderes P on P.id_poder =  PER.super_poder
join tb_trajes T on T.id_traje = PER.traje

WHERE PER.forca BETWEEN 1000 and 2000;

/*Faça um select utilizando LIKE buscando os personagens com a letra C.*/

SELECT PER.nome_personagem, PER.historia, P.nome_poder as poder_especial, PER.forca, PER.defesa, PER.inteligencia, T.nome_traje as vestimenta from tb_personagens PER

join tb_poderes P on P.id_poder =  PER.super_poder
join tb_trajes T on T.id_traje = PER.traje

WHERE PER.nome_personagem LIKE '%C%';


/*Faça um select onde traga todos os personagem de uma classe específica.*/

SELECT PER.nome_personagem, PER.historia, P.nome_poder as poder_especial, PER.forca, PER.defesa, PER.inteligencia, T.nome_traje as vestimenta from tb_personagens PER

join tb_poderes P on P.id_poder =  PER.super_poder
join tb_trajes T on T.id_traje = PER.traje

WHERE T.nome_categoria LIKE '%CAMUFLAGEM%';






