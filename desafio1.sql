DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE IF NOT EXISTS SpotifyClone.Plans (
  plan_id  INT PRIMARY KEY,
  plan_type VARCHAR(45) NOT NULL,
  plan_value DECIMAL(3,2) NOT NULL
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS SpotifyClone.Users (
	user_id INT PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	plan_id INT NOT NULL,
    subscription_date DATE NOT NULL,
	FOREIGN KEY (plan_id) REFERENCES Plans (plan_id)
    ) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Artists (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Albuns (
	album_id INT PRIMARY KEY,
	album_name VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
	artist_id INT NOT NULL,
	FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
    )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.Songs (
	song_id INT PRIMARY KEY,
	song_name VARCHAR(50) NOT NULL,
    duration_seconds INT NOT NULL,
	album_id INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES Albuns (album_id)
    ) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Playbacks_History(
      user_id INT NOT NULL,
      song_id INT,
      playback_data DATETIME NOT NULL,
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.Users (user_id),
      FOREIGN KEY (song_id) REFERENCES SpotifyClone.Songs (song_id),
      CONSTRAINT PRIMARY KEY(user_id, song_id)
  ) engine = InnoDB;

CREATE TABLE SpotifyClone.Followed_Artists(
      user_id INT NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (user_id) REFERENCES Users (user_id),
      FOREIGN KEY (artist_id) REFERENCES Artists (artist_id),
      CONSTRAINT PRIMARY KEY(user_id, artist_id)
  ) engine = InnoDB;


INSERT INTO SpotifyClone.Plans (plan_id, plan_type, plan_value)
  VALUES
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

  INSERT INTO SpotifyClone.Users (user_id, username, age, plan_id, subscription_date)
  VALUES
   (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
    (4, 'Martin Fowler', 46, 2, '2017-01-17'),
    (5, 'Sandi Metz', 58, 2, '2018-04-29'),
    (6, 'Paulo Freire', 19, 3, '2018-02-14'),
    (7, 'Bell Hooks', 26, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
    (9, 'Judith Butler', 45, 4, '2020-05-13'),
    (10, 'Jorge Amado', 58, 4, '2017-02-17');
    
	INSERT INTO SpotifyClone.Artists (artist_id, artist_name)
  VALUES
	(1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');
    
    INSERT INTO SpotifyClone.Albuns (album_id, album_name, release_year, artist_id)
  VALUES
    (1, 'Renaissance', 2022, 1),
    (2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'I Put A Spell On You', 2012, 6);
    
    INSERT INTO SpotifyClone.Songs (song_id, song_name, duration_seconds, album_id)
  VALUES
	(1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard’s Song', 244, 7),
    (10, 'Feeling Good', 100, 8);
    

    INSERT INTO SpotifyClone.Playbacks_History (user_id, song_id, playback_data)
  VALUES
	(1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.Followed_Artists (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);