DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Plans` (
  `plan_id` INT NOT NULL,
  `plan_type` VARCHAR(45) NOT NULL,
  `plan_value` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Users` (
	`user_id` INT AUTO_INCREMENT,
	`username` VARCHAR(45) NOT NULL,
	`age` INT(120) NOT NULL,
	`plan_id` INT NOT NULL,
	PRIMARY KEY (`user_id`, `plan_id`),
	CONSTRAINT `fk_plan_id_1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`Plans` (`plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Artists` (
  `artist_id` INT NOT NULL,
  `artist_name` VARCHAR(45) NOT NULL,
PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Albuns` (
	`album_id` INT AUTO_INCREMENT,
	`album_name` VARCHAR(45) NOT NULL,
	`artist_id` INT NOT NULL,
	`release_year` YEAR NOT NULL,
	PRIMARY KEY (`album_id`, `artist_id`),
	CONSTRAINT `fk_artist_1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`Artists` (`artist_id`)
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Songs` (
	`song_id` INT AUTO_INCREMENT,
	`song_name` VARCHAR(45) NOT NULL,
	`album_id` INT NOT NULL,
	`duration_seconds` INT NOT NULL,
	PRIMARY KEY (`song_id`, `album_id`),
	CONSTRAINT `fk_album_id_1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`Albuns` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Playbacks_History` (
  `playback_id` INT AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  `playback_data` DATETIME NOT NULL,
  PRIMARY KEY (`playback_id`),
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`Users` (`user_id`),
    FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`Songs` (`song_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`Followed_Artists` (
  `followed_id` INT AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `artist_id` INT,
  PRIMARY KEY (`followed_id`),
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`Users` (`user_id`),
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`Artists` (`artist_id`))
ENGINE = InnoDB;


INSERT INTO SpotifyClone.Plans (plan_id, plan_type, plan_value)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitario', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.Users (username, age, plan_id)
  VALUES
    ('Barbara Liskov', 82, 1),
    ('Robert Cecil Martin', 58, 1),
    ('Ada Lovelace', 37, 2),
    ('Martin Fowler', 46, 2),
    ('Sandi Metz', 58, 2),
    ('Paulo Freire', 19, 3),
    ('Bell Hooks', 26, 3),
    ('Christopher Alexander', 85, 4),
    ('Judith Butler', 45, 4),
    ('Jorge Amado', 58, 4);
    
	INSERT INTO SpotifyClone.Artists (artist_id, artist_name)
  VALUES
    (1,	'Beyoncé'),
    (2,	'Queen'),
    (3,	'Elis Regina'),
    (4,	'Baco Exu do Blues'),
    (5,	'Blind Guardian'),
    (6,	'Nina Simone');
    
    INSERT INTO SpotifyClone.Albuns (album_name, artist_id, release_year)
  VALUES
    ("Renaissance",	1, 2022),
    ("Jazz", 2, 1978),
    ("Hot Space", 2, 1982),
    ("Falso Brilhante",	3, 1998),
    ("Vento de Maio", 3,	2001),
    ("QVVJFA?",	4,	2003),
    ("Somewhere Far Beyond", 5,	2007),
    ("I Put A Spell On You", 6,	2012);
    
    INSERT INTO SpotifyClone.Songs (song_name, album_id, duration_seconds )
  VALUES
    ("BREAK MY SOUL", 1, 279),
    ("VIRGO'S GROOVE", 1, 369),
    ("ALIEN SUPERSTAR", 1, 116),
    ("Don't Stop Me Now", 2, 203),
    ("Under Pressure", 3, 152),
    ("Como Nossos Pais", 4, 105),
    ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
    ("Samba em Paris",	6, 267),
    ("The Bard's Song",	7, 244),
    ("Feeling Good", 8, 100);
    

    INSERT INTO SpotifyClone.Playbacks_History (user_id, song_id, playback_data)
  VALUES
	(1, 8, "2022-02-28 10:45:55"),
    (1, 2, "2020-05-02 05:30:35"),
    (1, 10, "2020-03-06 11:22:33"),
    (2,	10,	"2022-08-05 08:05:17"),
    (2, 7, "2020-01-02 07:40:33"),
    (3,	10,	"2020-11-13 16:55:13"),
    (3, 2, "2020-12-05 18:38:30"),
    (4,	8,	"2021-08-15 17:10:10"),
    (5,	8,"2022-01-09 01:44:33"),
    (5, 5, "2020-08-06 15:23:43"),
    (6,	7,	"2017-01-24 00:31:17"),
    (6, 1, "2017-10-12 12:35:20"),
    (7,	4,	"2011-12-15 22:30:49"),
    (8,	4,	"2012-03-17 14:56:41"),
    (9,	9,	"2022-02-24 21:14:22"),
    (10, 3,	"2015-12-13 08:30:22");

INSERT INTO SpotifyClone.Followed_Artists (user_id, artist_id)
  VALUES
    (1,	1),
    (1, 2),
    (1, 3),
    (2,	1),
    (2, 3),
    (3,	2),
    (4,	4),
    (5,	5),
    (5, 6),
    (6,	6),
    (6, 1),
    (7,	6),
    (8,	null),
    (9,	3),
    (10, 2);


