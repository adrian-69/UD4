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
-- Table `mydb`.`Alumnat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumnat` (
  `idAlumnat` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Correu` VARCHAR(32) NULL,
  `DNI` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Adreça` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlumnat`));


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `idMatricula` VARCHAR(16) NOT NULL,
  `CursacAcademic` VARCHAR(255) NULL,
  `preu` VARCHAR(32) NULL,
  `Alumna` VARCHAR(45) NULL,
  `Assignatura` VARCHAR(45) NULL,
  `Alumnat_idAlumnat` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_Matricula_Alumnat_idx` (`Alumnat_idAlumnat` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumnat`
    FOREIGN KEY (`Alumnat_idAlumnat`)
    REFERENCES `mydb`.`Alumnat` (`idAlumnat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departament` (
  `idDepartament` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  PRIMARY KEY (`idDepartament`));


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `DNI` VARCHAR(32) NULL,
  `Assignatura` VARCHAR(45) NULL,
  `Departament` VARCHAR(45) NULL,
  `Departament_idDepartament` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_idDepartament` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_idDepartament`)
    REFERENCES `mydb`.`Departament` (`idDepartament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura` (
  `idAssigantura` VARCHAR(16) NOT NULL,
  `Nom` VARCHAR(255) NULL,
  `Professor` VARCHAR(32) NOT NULL,
  `Dapartamen` VARCHAR(45) NULL,
  PRIMARY KEY (`idAssigantura`));


-- -----------------------------------------------------
-- Table `mydb`.`LiniaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LiniaMatricula` (
  `idMatricula` VARCHAR(16) NOT NULL,
  `NumHores` VARCHAR(255) NULL,
  `Matricula_idMatricula` VARCHAR(16) NOT NULL,
  `Professor_idProfessor` VARCHAR(16) NOT NULL,
  `Assignatura_idAssigantura` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_LiniaMatricula_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  INDEX `fk_LiniaMatricula_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  INDEX `fk_LiniaMatricula_Assignatura1_idx` (`Assignatura_idAssigantura` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaMatricula_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `mydb`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaMatricula_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaMatricula_Assignatura1`
    FOREIGN KEY (`Assignatura_idAssigantura`)
    REFERENCES `mydb`.`Assignatura` (`idAssigantura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
