-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici4` ;
USE `Exercici4` ;

-- -----------------------------------------------------
-- Table `Exercici4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Client` (
  `idClient` VARCHAR(16) NOT NULL,
  `DNI` VARCHAR(255) NULL,
  `Nom` VARCHAR(32) NULL,
  `Cognoms` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `Exercici4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`TipusPolissa` (
  `idTipusPolissa INT` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Descripcio` VARCHAR(32) NULL,
  PRIMARY KEY (`idTipusPolissa INT`));


-- -----------------------------------------------------
-- Table `Exercici4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Venedor` (
  `idVenedor INT` VARCHAR(16) NOT NULL,
  `DNI` VARCHAR(255) NULL,
  `Nom` VARCHAR(32) NULL,
  `Cognoms` VARCHAR(45) NULL,
  PRIMARY KEY (`idVenedor INT`));


-- -----------------------------------------------------
-- Table `Exercici4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Polissa` (
  `idPolissa INT` VARCHAR(16) NOT NULL,
  `NumPolissa` VARCHAR(255) NULL,
  `Client_idClient` VARCHAR(16) NOT NULL,
  `TipusPolissa_idTipusPolissa INT` VARCHAR(16) NOT NULL,
  `Venedor_idVenedor INT` VARCHAR(16) NOT NULL,
  `DataContratacio` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `TipusPagament` VARCHAR(45) NULL,
  PRIMARY KEY (`idPolissa INT`),
  INDEX `fk_Polissa_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Polissa_TipusPolissa1_idx` (`TipusPolissa_idTipusPolissa INT` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_idVenedor INT` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Exercici4`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_TipusPolissa1`
    FOREIGN KEY (`TipusPolissa_idTipusPolissa INT`)
    REFERENCES `Exercici4`.`TipusPolissa` (`idTipusPolissa INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_idVenedor INT`)
    REFERENCES `Exercici4`.`Venedor` (`idVenedor INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
