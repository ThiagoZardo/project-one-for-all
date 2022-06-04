CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.planos (
  id_plano INT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(50),
  valor_plano DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.planos (plano, valor_plano)
VALUES ('gratuito', 0),
('universitario', 5.99),
('pessoal', 6.99),
('familiar', 7.99);

CREATE TABLE IF NOT EXISTS SpotifyClone.artistas (
  id_artista INT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(100)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.artistas (artista)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

CREATE TABLE IF NOT EXISTS SpotifyClone.albums (
  id_album INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(255),
  ano_lancamento INT,
  id_artista INT,
  FOREIGN KEY(id_artista) REFERENCES SpotifyClone.artistas(id_artista)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.albums (album, ano_lancamento, id_artista)
VALUES ('Envious', 1990, 1),
('Exuberant', 1993, 1),
('Hallowed Steam', '1995', 2),
('Incandescent', 1998, 3),
('Temporary Culture', 2001, 4),
('Library of liberty', 2003, 4),
('Chained Down', 2007, 5),
('Cabinet of fools', 2012, 5),
('No guarantees', 2015, 5),
('Apparatus', 2015, 6);

CREATE TABLE IF NOT EXISTS SpotifyClone.musicas (
	id_musica INT PRIMARY KEY AUTO_INCREMENT,
    musica VARCHAR(255),
    id_artista INT,
    duracao INT,
    id_album INT,
    FOREIGN KEY(id_artista) REFERENCES SpotifyClone.artistas(id_artista),
    FOREIGN KEY(id_album) REFERENCES SpotifyClone.albums(id_album)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.musicas (musica, id_artista, duracao, id_album)
VALUES ("Soul For Us", 1, 200, 1),
("Reflections Of Magic", 1, 163, 1),
("Dance With Her Own", 1, 116, 1),
("Troubles Of My Inner Fire", 1, 203, 2),
("Time Fireworks", 1, 152, 2),
("Magic Circus", 2, 105, 3),
("Honey, So Do I", 2, 207, 3),
("Sweetie, Let's Go Wild", 2, 139, 3),
("She Knows", 2, 244, 3),
("Fantasy For Me", 3, 100, 4),
("Celebration Of More", 3, 146, 4),
("Rock His Everything", 3, 223, 4),
("Home Forever", 3, 231, 4),
("Diamond Power", 3, 241, 4),
("Let's Be Silly", 3, 132, 4),
("Thang Of Thunder", 4, 240, 5),
("Words Of Her Life", 4, 185, 5),
("Without My Streets", 4, 176, 5),
("Need Of The Evening", 4, 190, 6),
("History Of My Roses", 4, 222, 6),
("Without My Love", 4, 111, 6),
("Walking And Game", 4, 123, 6),
("Young And Father", 4, 197, 6),
("Finding My Traditions", 5, 179, 7),
("Walking And Man", 5, 229, 7),
("Hard And Time", 5, 135, 7),
("Honey, I'm A Lone Wolf", 5, 150, 7),
("She Thinks I Won't Stay Tonight", 5, 166, 8),
("He Heard You're Bad For Me", 5, 154, 8),
("He Hopes We Can't Stay", 5, 210, 8),
("I Know I Know", 5, 117, 8),
("He's Walking Away", 5, 159, 9),
("He's Trouble", 5, 138, 9),
("I Heard I Want To Bo Alone", 5, 120, 9),
("I Ride Alone", 5, 151, 9),
("Honey", 6, 79, 6),
("You Cheated On Me", 6, 95, 6),
("Wouldn't It Be Nice", 6, 213, 9),
("Baby", 6, 136, 6),
("You Make Me Feel So..", 6, 83, 6);

CREATE TABLE IF NOT EXISTS SpotifyClone.usuarios (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(255),
    idade INT,
    id_plano INT,
    FOREIGN KEY(id_plano) REFERENCES SpotifyClone.planos(id_plano)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.usuarios (usuario, idade)
VALUES ("Thati", 23),
("Cintia", 35),
("Bill", 20),
("Roger", 45),
("Norman", 58),
("Patrick", 33),
("Vivian", 26),
("Carol", 19),
("Angelina", 42),
("Paul", 46);

CREATE TABLE IF NOT EXISTS SpotifyClone.seguidores (
    id_usuario INT,
    id_artista INT,
    FOREIGN KEY(id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
    FOREIGN KEY(id_artista) REFERENCES SpotifyClone.artistas(id_artista),
    PRIMARY KEY(id_usuario, id_artista)
) ENGINE=InnoDb;

INSERT INTO SpotifyClone.seguidores (id_usuario, id_artista)
VALUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 3),
(6, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 5),
(9, 6),
(9, 4),
(9, 3),
(10, 2),
(10, 6);

CREATE TABLE IF NOT EXISTS SpotifyClone.historico (
    id_musica INT,
    data_reproducao DATETIME,
    id_usuario INT,
    FOREIGN KEY(id_musica) REFERENCES SpotifyClone.musicas(id_musica),
    FOREIGN KEY(id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
    PRIMARY KEY(id_musica, id_usuario)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.historico (id_musica, data_reproducao, id_usuario)
VALUES (36, "2020-02-28 10:45:55", 1),
(25, "2020-05-02 05:30:35", 1),
(23, "2020-03-06 11:22:33", 1),
(14, "2020-08-05 08:05:17", 1),
(15, "2020-09-14 16:32:22", 1),
(34, "2020-01-02 07:40:33", 2),
(24, "2020-05-16 06:16:22", 2),
(21, "2020-10-09 12:27:48", 2),
(39, "2020-09-21 13:14:46", 2),
(6, "2020-11-13 16:55:13", 3),
(3, "2020-12-05 18:38:30", 3),
(26, "2020-07-30 10:00:00", 3),
(2, "2021-08-15 17:10:10", 4),
(35, "2021-07-10 15:20:30", 4),
(27, "2021-01-09 01:44:33", 4),
(7, "2020-07-03 19:33:28", 5),
(12, "2017-02-24 21:14:22", 5),
(14, "2020-08-06 15:23:43", 5),
(1, "2020-11-10 13:52:27", 5),
(38, "2019-02-07 20:33:48", 6),
(29, "2017-01-24 00:31:17", 6),
(30, "2017-10-12 12:35:20", 6),
(22, "2018-05-29 14:56:41", 6),
(5, "2018-05-09 22:30:49", 7),
(4, "2020-07-27 12:52:58", 7),
(11, "2018-01-16 18:40:43", 7),
(39, "2018-03-21 16:56:40", 8),
(40, "2020-10-18 13:38:05", 8),
(32, "2019-05-25 08:14:03", 8),
(11, "2021-08-15 21:37:09", 8),
(16, "2021-05-24 17:23:45", 9),
(17, "2018-12-07 22:48:52", 9),
(8, "2021-03-14 06:14:26", 9),
(9, "2020-04-01 03:36:00", 9),
(20, "2017-02-06 08:21:34", 10),
(21, "2017-12-04 05:33:43", 10),
(12, "2017-07-27 05:24:49", 10),
(13, "2017-12-25 01:03:57", 10);

CREATE TABLE IF NOT EXISTS SpotifyClone.assinaturas (
	id_assinatura INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_plano INT,
    data_assinatura DATE,
    FOREIGN KEY(id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
	FOREIGN KEY(id_plano) REFERENCES SpotifyClone.planos(id_plano)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.assinaturas (id_usuario, id_plano, data_assinatura)
VALUES (1, 1, "2019-10-20"),
(2, 4, "2017-12-30"),
(3, 2, "2019-06-05"),
(4, 3, "2020-05-13"),
(5, 3, "2017-02-17"),
(6, 4, "2017-01-06"),
(7, 2, "2018-01-05"),
(8, 2, "2018-02-14"),
(9, 4, "2018-04-29"),
(10, 4, "2017-01-17");
