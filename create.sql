CREATE DATABASE IF NOT EXISTS itunes;
USE itunes;

CREATE TABLE IF NOT exists `card_bonus` (
  `id`        int          PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `unit_type` varchar(25)  NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `user_card` (
  `id`    int          PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `type`  varchar(25)  NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `genre` (
  `id`    int         PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `type`  varchar(35) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `song` (
  `id`        int          PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name`      varchar(70)  NOT NULL,
  `Genre_id`  int          NOT NULL,
  CONSTRAINT `Song_Genre`
  FOREIGN KEY (`Genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `author` (
  `id`      int           PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name`    varchar(50)   NOT NULL,
  `surname` varchar(50)   DEFAULT NULL,
  `gender`  varchar(5)    DEFAULT NULL,
  `email`   varchar(100)  NOT NULL,
  `Song_id` int           NOT NULL,
  CONSTRAINT `Author_Song`
  FOREIGN KEY (`Song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS `album_of_song` (
  `quantity` int         NOT NULL,
  `Song_id`  int         NOT NULL,
  `id`       int         PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name`     varchar(70) NOT NULL,
  CONSTRAINT `Album_of_song_Song`
  FOREIGN KEY (`Song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `musical_lables` (
  `id`       int          PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name`     varchar(70)  NOT NULL,
  `is_avard` varchar(5)   NOT NULL,
  `Song_id`  int          NOT NULL,
  CONSTRAINT `Musical_lables_Song`
  FOREIGN KEY (`Song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `region` (
  `name`  varchar(100)  PRIMARY KEY NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `city` (
  `name`              varchar(100)  PRIMARY KEY NOT NULL,
  `Musical_lables_id` int           NOT NULL,
  `region_name`       varchar(100)  NOT NULL,
  CONSTRAINT `city_Musical_lables`
  FOREIGN KEY (`Musical_lables_id`) REFERENCES `musical_lables` (`id`),
  CONSTRAINT `city_region`
  FOREIGN KEY (`region_name`) REFERENCES `region` (`name`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `download` (
  `id`       int     PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `Song_id`  int     NOT NULL,
  `price`    float   NOT NULL,
  `quantity` int     DEFAULT NULL,
  CONSTRAINT `Download_Song`
  FOREIGN KEY (`Song_id`) REFERENCES `song` (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `service_user` (
  `id`              int            PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `name_of_profile` varchar(100)   NOT NULL,
  `user_card_id`    int            NOT NULL,
  `Download_id`     int            NOT NULL,
  CONSTRAINT `Service_user_Download`
  FOREIGN KEY (`Download_id`) REFERENCES `download` (`id`),
  CONSTRAINT `Service_user_user_card`
  FOREIGN KEY (`user_card_id`) REFERENCES `user_card` (`id`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT exists `card_has_bonus` (
  `bonus_value`    decimal(8,2) NOT NULL,
  `user_card_id`   int          NOT NULL,
  `Card_bonus_id`  int          NOT NULL,
  `id`             int          PRIMARY KEY AUTO_INCREMENT NOT NULL,
  CONSTRAINT `card_has_bonus_ibfk_1`
  FOREIGN KEY (`Card_bonus_id`) REFERENCES `card_bonus` (`id`),
  CONSTRAINT `card_has_bonus_ibfk_2`
  FOREIGN KEY (`user_card_id`) REFERENCES `user_card` (`id`)
) ENGINE=InnoDB;

CREATE INDEX song_idx ON song(name);
CREATE INDEX download_idx ON download(price, quantity);
CREATE INDEX service_user_idx ON service_user(name_of_profile);

SHOW INDEX FROM song;
SHOW INDEX FROM download;
SHOW INDEX FROM service_user;
