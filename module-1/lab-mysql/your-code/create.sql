-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Costumers` (
  `c_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cost_id` INT UNSIGNED NOT NULL,
  `cost_name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`c_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `sp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `staff_id` INT UNSIGNED NOT NULL,
  `sp_name` VARCHAR(45) NOT NULL,
  `sp_store` VARCHAR(45) NULL,
  PRIMARY KEY (`sp_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `invoice_id` INT UNSIGNED AUTO_INCREMENT,
  `invoice_number` INT UNSIGNED NOT NULL,
  `date` DATETIME NOT NULL,
  `c_id` INT UNSIGNED NOT NULL,
  `sp_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `c_id_idx` (`c_id` ASC),
  INDEX `sp_id_idx` (`sp_id` ASC),
  CONSTRAINT `c_id`
    FOREIGN KEY (`c_id`)
    REFERENCES `mydb`.`Costumers` (`c_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sp_id`
    FOREIGN KEY (`sp_id`)
    REFERENCES `mydb`.`Salespersons` (`sp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cars` (
  `car_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vin` VARCHAR(45) NOT NULL,
  `manuf` VARCHAR(45) NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` INT UNSIGNED NULL,
  `color` VARCHAR(45) NULL,
  `invoice_id` INT UNSIGNED,
  PRIMARY KEY (`car_id`),
  INDEX `invoice_id_idx` (`invoice_id` ASC),
  CONSTRAINT `invoice_id`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `mydb`.`Invoices` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




