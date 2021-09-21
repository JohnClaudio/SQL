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
create_at timestamp,

FOREIGN KEY (super_poder) references tb_poderes(id_poder),
FOREIGN KEY (traje) references tb_trajes (id_traje),
PRIMARY KEY (id_personagem)

)ENGINE=InnoDB;

INSERT IGNORE INTO tb_personagens (nome_personagem,historia,super_poder,traje) VALUES

('Akaranai',
'Akaranai é uma garota do mundo mágico dos elfos, a sua missão é proteger sua terra natal contra invações de orcs',
1,
3),

('Feanor',
'Fëanor o que se sabe é que ele enfrentou uma força de Balrogs.',
2,
3),

('Agata',
'Uma prodigia de seu clã, além de lutadora é sabia, gosta da companhia de Duendes e Akaranai é a sua melhor amiga.',
4,
2);

SELECT PER.nome_personagem, PER.historia, P.nome_poder, T.nome_traje from tb_personagens PER

join tb_poderes P on P.id_poder =  PER.super_poder
join tb_trajes T on T.id_traje = PER.traje

;



