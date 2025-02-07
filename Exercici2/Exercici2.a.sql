-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici2.a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici2.a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici2.a` ;
USE `Exercici2.a` ;

-- -----------------------------------------------------
-- Table `Exercici2.a`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `Exercici2.a`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`user` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);


-- -----------------------------------------------------
-- Table `Exercici2.a`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`PACIENT` (
  `idpacient` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Telefon` VARCHAR(32) NOT NULL,
  `Adreça` VARCHAR(45) NULL,
  PRIMARY KEY (`idpacient`));


-- -----------------------------------------------------
-- Table `Exercici2.a`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`PACIENT` (
  `idpacient` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Telefon` VARCHAR(32) NOT NULL,
  `Adreça` VARCHAR(45) NULL,
  PRIMARY KEY (`idpacient`));


-- -----------------------------------------------------
-- Table `Exercici2.a`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`Metge` (
  `Metge` VARCHAR(16) NOT NULL,
  `Consulta` VARCHAR(255) NULL,
  `Data` VARCHAR(32) NULL,
  `Pacient` VARCHAR(45) NULL,
  PRIMARY KEY (`Metge`));


-- -----------------------------------------------------
-- Table `Exercici2.a`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`CONSULTA` (
  `Consulta` INT NOT NULL,
  `Despatx` VARCHAR(255) NULL,
  `Metge` VARCHAR(32) NULL,
  `Pacient` VARCHAR(45) NULL,
  `Diagnostic` VARCHAR(45) NULL,
  `PACIENT_idpacient` VARCHAR(16) NOT NULL,
  `Metge_Metge` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`Consulta`),
  INDEX `fk_CONSULTA_PACIENT1_idx` (`PACIENT_idpacient` ASC) VISIBLE,
  INDEX `fk_CONSULTA_Metge1_idx` (`Metge_Metge` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT1`
    FOREIGN KEY (`PACIENT_idpacient`)
    REFERENCES `Exercici2.a`.`PACIENT` (`idpacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_Metge1`
    FOREIGN KEY (`Metge_Metge`)
    REFERENCES `Exercici2.a`.`Metge` (`Metge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Exercici2.a`.`CONSULTA_has_Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici2.a`.`CONSULTA_has_Metge` (
  `CONSULTA_Consulta` INT NOT NULL,
  `Metge_Metge` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`CONSULTA_Consulta`, `Metge_Metge`),
  INDEX `fk_CONSULTA_has_Metge_Metge1_idx` (`Metge_Metge` ASC) VISIBLE,
  INDEX `fk_CONSULTA_has_Metge_CONSULTA1_idx` (`CONSULTA_Consulta` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_has_Metge_CONSULTA1`
    FOREIGN KEY (`CONSULTA_Consulta`)
    REFERENCES `Exercici2.a`.`CONSULTA` (`Consulta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_has_Metge_Metge1`
    FOREIGN KEY (`Metge_Metge`)
    REFERENCES `Exercici2.a`.`Metge` (`Metge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
