-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici5` ;
USE `Exercici5` ;

-- -----------------------------------------------------
-- Table `Exercici5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Client` (
  `idClient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Correu` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Usuari` VARCHAR(45) NULL,
  `Contrasenya` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `Usuari_UNIQUE` (`Usuari` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `Exercici5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Vehicle` (
  `idVehicle` INT NOT NULL,
  `NumCarroseria` VARCHAR(45) NULL,
  `Matricula` VARCHAR(32) NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`idVehicle`),
  INDEX `fk_Vehicle_Client_idx` (`Client_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Exercici5`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Exercici5`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`));


-- -----------------------------------------------------
-- Table `Exercici5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici5`.`Cita` (
  `idCita` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Hora` VARCHAR(32) NULL,
  `Box` VARCHAR(45) NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  `Vehicle_idVehicle` INT NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Cita_Empleat1_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_idVehicle` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Empleat1`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `Exercici5`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_idVehicle`)
    REFERENCES `Exercici5`.`Vehicle` (`idVehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
