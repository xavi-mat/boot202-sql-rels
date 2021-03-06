-- -----------------------------------------------------------------------------
-- Relational Database - Exercise
-- for The Bridge
-- by xavimat
-- 2022-05-13
-- -----------------------------------------------------------------------------

-- MySQL Script generated by MySQL Workbench
-- Fri May 13 14:10:37 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema boot_shop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `boot_shop` ;

-- -----------------------------------------------------
-- Schema boot_shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `boot_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `boot_shop` ;

-- -----------------------------------------------------
-- Table `boot_shop`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boot_shop`.`users` ;

CREATE TABLE IF NOT EXISTS `boot_shop`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `NIF` CHAR(9) NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boot_shop`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boot_shop`.`categories` ;

CREATE TABLE IF NOT EXISTS `boot_shop`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boot_shop`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boot_shop`.`products` ;

CREATE TABLE IF NOT EXISTS `boot_shop`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `author` VARCHAR(45) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `year` YEAR NULL,
  `price` FLOAT NULL,
  `category_id` INT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_products_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `boot_shop`.`categories` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boot_shop`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boot_shop`.`orders` ;

CREATE TABLE IF NOT EXISTS `boot_shop`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `date` DATE NULL,
  `status` ENUM('open', 'paid', 'sent', 'cancelled') DEFAULT 'open',
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `boot_shop`.`users` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `boot_shop`.`details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `boot_shop`.`details` ;

CREATE TABLE IF NOT EXISTS `boot_shop`.`details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_orders_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_orders_has_products_orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `boot_shop`.`orders` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `boot_shop`.`products` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;
