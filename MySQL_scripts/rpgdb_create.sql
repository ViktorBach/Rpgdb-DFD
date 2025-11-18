-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rpgdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rpgdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rpgdb` DEFAULT CHARACTER SET utf8 ;
USE `rpgdb` ;

-- -----------------------------------------------------
-- Table `rpgdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE)
ENGINE = InnoDB;

USE rpgdb;
ALTER TABLE user ADD COLUMN is_staff BOOL DEFAULT FALSE;

USE rpgdb;
-- Sikrer at der er plads til Djangos hashes (som er nødvendigt for sikkerhed)
ALTER TABLE user MODIFY password VARCHAR(128) NOT NULL;

select * from user;
-- -----------------------------------------------------
-- Table `rpgdb`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`guild`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`guild` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `guild_name` VARCHAR(45) NOT NULL,
  `members` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `guild_name_UNIQUE` (`guild_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`character` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `character_name` VARCHAR(45) NOT NULL,
  `level` INT NOT NULL,
  `hp` INT NOT NULL,
  `mana` INT NOT NULL,
  `user_id` INT NOT NULL,
  `inventory_id` INT NOT NULL,
  `guild_id` INT NOT NULL,
  PRIMARY KEY (`id`, `inventory_id`),
  UNIQUE INDEX `character_name_UNIQUE` (`character_name` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_character_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_character_inventory1_idx` (`inventory_id` ASC) VISIBLE,
  INDEX `fk_character_guild1_idx` (`guild_id` ASC) VISIBLE,
  CONSTRAINT `fk_character_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `rpgdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `rpgdb`.`inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_guild1`
    FOREIGN KEY (`guild_id`)
    REFERENCES `rpgdb`.`guild` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`item` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NULL,
  `rarity` VARCHAR(45) NOT NULL,
  `value` VARCHAR(45) NULL,
  `stats` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `rpgdb`.`npc`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`npc` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`quest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`quest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `reward_money` VARCHAR(45) NULL,
  `reward_xp` INT NULL,
  `description` VARCHAR(45) NULL,
  `npc_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_quest_npc1_idx` (`npc_id` ASC) VISIBLE,
  CONSTRAINT `fk_quest_npc1`
    FOREIGN KEY (`npc_id`)
    REFERENCES `rpgdb`.`npc` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  `damage` INT NULL,
  `healing` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`battle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`battle` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `outcome` VARCHAR(45) NULL,
  `xp` INT NULL,
  `money` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`transaction` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` VARCHAR(45) NULL,
  `cost` INT NULL,
  `user_id` INT NOT NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_transaction_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_transaction_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `rpgdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`inventory_has_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`inventory_has_item` (
  `inventory_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`, `item_id`),
  INDEX `fk_inventory_has_item_item1_idx` (`item_id` ASC) VISIBLE,
  INDEX `fk_inventory_has_item_inventory1_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_has_item_inventory1`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `rpgdb`.`inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_has_item_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `rpgdb`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`character_has_quest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`character_has_quest` (
  `character_id` INT UNSIGNED NOT NULL,
  `character_inventory_id` INT NOT NULL,
  `quest_id` INT NOT NULL,
  PRIMARY KEY (`character_id`, `character_inventory_id`, `quest_id`),
  INDEX `fk_character_has_quest_quest1_idx` (`quest_id` ASC) VISIBLE,
  INDEX `fk_character_has_quest_character1_idx` (`character_id` ASC, `character_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_character_has_quest_character1`
    FOREIGN KEY (`character_id` , `character_inventory_id`)
    REFERENCES `rpgdb`.`character` (`id` , `inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_quest_quest1`
    FOREIGN KEY (`quest_id`)
    REFERENCES `rpgdb`.`quest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `rpgdb`.`character_has_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`character_has_skills` (
  `character_id` INT UNSIGNED NOT NULL,
  `character_inventory_id` INT NOT NULL,
  `skills_id` INT NOT NULL,
  PRIMARY KEY (`character_id`, `character_inventory_id`, `skills_id`),
  INDEX `fk_character_has_skills_skills1_idx` (`skills_id` ASC) VISIBLE,
  INDEX `fk_character_has_skills_character1_idx` (`character_id` ASC, `character_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_character_has_skills_character1`
    FOREIGN KEY (`character_id` , `character_inventory_id`)
    REFERENCES `rpgdb`.`character` (`id` , `inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_skills_skills1`
    FOREIGN KEY (`skills_id`)
    REFERENCES `rpgdb`.`skills` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rpgdb`.`character_has_battle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rpgdb`.`character_has_battle` (
  `character_id` INT UNSIGNED NOT NULL,
  `character_inventory_id` INT NOT NULL,
  `battle_id` INT NOT NULL,
  PRIMARY KEY (`character_id`, `character_inventory_id`, `battle_id`),
  INDEX `fk_character_has_battle_battle1_idx` (`battle_id` ASC) VISIBLE,
  INDEX `fk_character_has_battle_character1_idx` (`character_id` ASC, `character_inventory_id` ASC) VISIBLE,
  CONSTRAINT `fk_character_has_battle_character1`
    FOREIGN KEY (`character_id` , `character_inventory_id`)
    REFERENCES `rpgdb`.`character` (`id` , `inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_character_has_battle_battle1`
    FOREIGN KEY (`battle_id`)
    REFERENCES `rpgdb`.`battle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;