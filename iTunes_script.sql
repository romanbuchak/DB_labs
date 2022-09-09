-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema itunes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema itunes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `itunes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `itunes` ;

-- -----------------------------------------------------
-- Table `itunes`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`genre` (
  `id` INT NOT NULL,
  `type` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`song` (
  `id` INT NOT NULL,
  `name` VARCHAR(70) NOT NULL,
  `Genre_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Song_Genre` (`Genre_id` ASC) VISIBLE,
  CONSTRAINT `Song_Genre`
    FOREIGN KEY (`Genre_id`)
    REFERENCES `itunes`.`genre` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`album_of_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`album_of_song` (
  `quantity` INT NOT NULL,
  `Song_id` INT NOT NULL,
  `id` INT NOT NULL,
  `name` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Album_of_song_Song` (`Song_id` ASC) VISIBLE,
  CONSTRAINT `Album_of_song_Song`
    FOREIGN KEY (`Song_id`)
    REFERENCES `itunes`.`song` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`author` (
  `id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NULL DEFAULT NULL,
  `gender` VARCHAR(5) NULL DEFAULT NULL,
  `email` VARCHAR(100) NOT NULL,
  `Song_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Author_Song` (`Song_id` ASC) VISIBLE,
  CONSTRAINT `Author_Song`
    FOREIGN KEY (`Song_id`)
    REFERENCES `itunes`.`song` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`card_bonus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`card_bonus` (
  `id` INT NOT NULL,
  `unit_type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`user_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`user_card` (
  `id` INT NOT NULL,
  `type` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`card_has_bonus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`card_has_bonus` (
  `bonus_value` DECIMAL(8,2) NOT NULL,
  `user_card_id` INT NOT NULL,
  `Card_bonus_id` INT NOT NULL,
  PRIMARY KEY (`user_card_id`, `Card_bonus_id`),
  INDEX `card_has_bonus_Card_bonus` (`Card_bonus_id` ASC) VISIBLE,
  CONSTRAINT `card_has_bonus_Card_bonus`
    FOREIGN KEY (`Card_bonus_id`)
    REFERENCES `itunes`.`card_bonus` (`id`),
  CONSTRAINT `card_has_bonus_user_card`
    FOREIGN KEY (`user_card_id`)
    REFERENCES `itunes`.`user_card` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`musical_lables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`musical_lables` (
  `id` INT NOT NULL,
  `name` VARCHAR(70) NOT NULL,
  `is_avard` VARCHAR(5) NOT NULL,
  `Song_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Musical_lables_Song` (`Song_id` ASC) VISIBLE,
  CONSTRAINT `Musical_lables_Song`
    FOREIGN KEY (`Song_id`)
    REFERENCES `itunes`.`song` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`region` (
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`city` (
  `name` VARCHAR(100) NOT NULL,
  `Musical_lables_id` INT NOT NULL,
  `region_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `city_Musical_lables` (`Musical_lables_id` ASC) VISIBLE,
  INDEX `city_region` (`region_name` ASC) VISIBLE,
  CONSTRAINT `city_Musical_lables`
    FOREIGN KEY (`Musical_lables_id`)
    REFERENCES `itunes`.`musical_lables` (`id`),
  CONSTRAINT `city_region`
    FOREIGN KEY (`region_name`)
    REFERENCES `itunes`.`region` (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`download`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`download` (
  `id` INT NOT NULL,
  `Song_id` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `Download_Song` (`Song_id` ASC) VISIBLE,
  CONSTRAINT `Download_Song`
    FOREIGN KEY (`Song_id`)
    REFERENCES `itunes`.`song` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `itunes`.`service_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `itunes`.`service_user` (
  `id` INT NOT NULL,
  `name_of_profile` VARCHAR(100) NOT NULL,
  `user_card_id` INT NOT NULL,
  `Download_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `Service_user_Download` (`Download_id` ASC) VISIBLE,
  INDEX `Service_user_user_card` (`user_card_id` ASC) VISIBLE,
  CONSTRAINT `Service_user_Download`
    FOREIGN KEY (`Download_id`)
    REFERENCES `itunes`.`download` (`id`),
  CONSTRAINT `Service_user_user_card`
    FOREIGN KEY (`user_card_id`)
    REFERENCES `itunes`.`user_card` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
