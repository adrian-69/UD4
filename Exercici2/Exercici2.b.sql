-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelicula` (
  `idPelicula` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Sala` VARCHAR(32) NULL,
  `Cine` VARCHAR(45) NULL,
  PRIMARY KEY (`idPelicula`));


-- -----------------------------------------------------
-- Table `mydb`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarifa` (
  `idTarifa` VARCHAR(16) NOT NULL,
  `Tarifa` VARCHAR(255) NULL,
  `Preu` VARCHAR(32) NOT NULL,
  `Cine` VARCHAR(45) NULL,
  PRIMARY KEY (`idTarifa`));


-- -----------------------------------------------------
-- Table `mydb`.`Pelicules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelicules` (
  `idPelicules` VARCHAR(16) NOT NULL,
  `Categoria` VARCHAR(255) NULL,
  `Preu` VARCHAR(32) NULL,
  `Director` VARCHAR(45) NULL,
  `Durada` VARCHAR(45) NULL,
  `Tarifa_idTarifa` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idPelicules`),
  INDEX `fk_Pelicules_Tarifa1_idx` (`Tarifa_idTarifa` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicules_Tarifa1`
    FOREIGN KEY (`Tarifa_idTarifa`)
    REFERENCES `mydb`.`Tarifa` (`idTarifa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `idCine` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Pelicula_idPelicula` VARCHAR(16) NOT NULL,
  `Pelicules_idPelicules` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idCine`),
  INDEX `fk_Cine_Pelicula_idx` (`Pelicula_idPelicula` ASC) VISIBLE,
  INDEX `fk_Cine_Pelicules1_idx` (`Pelicules_idPelicules` ASC) VISIBLE,
  CONSTRAINT `fk_Cine_Pelicula`
    FOREIGN KEY (`Pelicula_idPelicula`)
    REFERENCES `mydb`.`Pelicula` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cine_Pelicules1`
    FOREIGN KEY (`Pelicules_idPelicules`)
    REFERENCES `mydb`.`Pelicules` (`idPelicules`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
