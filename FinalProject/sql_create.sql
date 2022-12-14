-- MySQL Script generated by MySQL Workbench
-- Sun Dec  4 21:51:48 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema moviedb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema moviedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moviedb` DEFAULT CHARACTER SET utf8 ;
USE `moviedb` ;

-- -----------------------------------------------------
-- Table `moviedb`.`MOVIE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`MOVIE` (
  `movieid` INT NOT NULL AUTO_INCREMENT,
  `imdbid` VARCHAR(20) NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `year` INT NULL,
  `rated` VARCHAR(45) NULL,
  PRIMARY KEY (`movieid`),
  UNIQUE INDEX `movieid_UNIQUE` (`movieid` ASC) VISIBLE,
  UNIQUE INDEX `imdbid_UNIQUE` (`imdbid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`ACTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`ACTOR` (
  `actorid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`actorid`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`GENRE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`GENRE` (
  `genreid` INT NOT NULL AUTO_INCREMENT,
  `genre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`genreid`),
  UNIQUE INDEX `genre_UNIQUE` (`genre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`LANGUAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`LANGUAGE` (
  `languageid` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`languageid`),
  UNIQUE INDEX `language_UNIQUE` (`language` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`RATING`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`RATING` (
  `ratingid` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `movieid` INT NOT NULL,
  `rating` DOUBLE NOT NULL,
  `timestamp` TIMESTAMP NULL,
  PRIMARY KEY (`ratingid`),
  INDEX `movie_idx` (`movieid` ASC) VISIBLE,
  CONSTRAINT `movie`
    FOREIGN KEY (`movieid`)
    REFERENCES `moviedb`.`MOVIE` (`movieid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`MOVIE_GENRE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`MOVIE_GENRE` (
  `movie_genreid` INT NOT NULL AUTO_INCREMENT,
  `movieid` INT NOT NULL,
  `genreid` INT NOT NULL,
  PRIMARY KEY (`movie_genreid`),
  INDEX `genre_idx` (`movieid` ASC) VISIBLE,
  INDEX `genre_idx1` (`genreid` ASC) VISIBLE,
  CONSTRAINT `MOVIE_GENRE_MOVIE`
    FOREIGN KEY (`movieid`)
    REFERENCES `moviedb`.`MOVIE` (`movieid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MOVIE_GENRE_GENRE`
    FOREIGN KEY (`genreid`)
    REFERENCES `moviedb`.`GENRE` (`genreid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`MOVIE_ACTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`MOVIE_ACTOR` (
  `movie_actorid` INT NOT NULL AUTO_INCREMENT,
  `movieid` INT NOT NULL,
  `actorid` INT NOT NULL,
  PRIMARY KEY (`movie_actorid`),
  INDEX `movie_idx` (`movieid` ASC) VISIBLE,
  INDEX `actor_idx` (`actorid` ASC) VISIBLE,
  CONSTRAINT `MOVIE_ACTOR_MOVIE`
    FOREIGN KEY (`movieid`)
    REFERENCES `moviedb`.`MOVIE` (`movieid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MOVIE_ACTOR_ACTOR`
    FOREIGN KEY (`actorid`)
    REFERENCES `moviedb`.`ACTOR` (`actorid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`MOVIE_LANGUAGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`MOVIE_LANGUAGE` (
  `movie_languageid` INT NOT NULL AUTO_INCREMENT,
  `movieid` INT NOT NULL,
  `languageid` INT NOT NULL,
  PRIMARY KEY (`movie_languageid`),
  INDEX `movie_idx` (`movieid` ASC) VISIBLE,
  INDEX `language_idx` (`languageid` ASC) VISIBLE,
  CONSTRAINT `MOVIE_LANGUAGE_MOVIE`
    FOREIGN KEY (`movieid`)
    REFERENCES `moviedb`.`MOVIE` (`movieid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MOVIE_LANGUAGE_LANGUAGE`
    FOREIGN KEY (`languageid`)
    REFERENCES `moviedb`.`LANGUAGE` (`languageid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`DIRECTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`DIRECTOR` (
  `directorid` INT NOT NULL AUTO_INCREMENT,
  `director` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`directorid`),
  UNIQUE INDEX `director_UNIQUE` (`director` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moviedb`.`MOVIE_DIRECTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moviedb`.`MOVIE_DIRECTOR` (
  `movie_directorid` INT NOT NULL AUTO_INCREMENT,
  `movieid` INT NOT NULL,
  `directorid` INT NOT NULL,
  PRIMARY KEY (`movie_directorid`),
  INDEX `MOVIE_DIRECTOR_MOVIE_idx` (`movieid` ASC) VISIBLE,
  INDEX `MOVIE_DIRECTOR_DIRECTOR_idx` (`directorid` ASC) VISIBLE,
  CONSTRAINT `MOVIE_DIRECTOR_MOVIE`
    FOREIGN KEY (`movieid`)
    REFERENCES `moviedb`.`MOVIE` (`movieid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MOVIE_DIRECTOR_DIRECTOR`
    FOREIGN KEY (`directorid`)
    REFERENCES `moviedb`.`DIRECTOR` (`directorid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
