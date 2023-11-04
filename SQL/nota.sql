CREATE TABLE `pcto`.`nota` ( `idnota` INT NOT NULL AUTO_INCREMENT , `idazienda` INT NOT NULL , `idpersona` INT NOT NULL , `titolo` VARCHAR(200) NULL , `descrizione` VARCHAR(2000) NOT NULL , `data` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , `scadenza` DATETIME NULL DEFAULT NULL , PRIMARY KEY (`idnota`)) ENGINE = InnoDB;

ALTER TABLE `nota` ADD CONSTRAINT `associazione_nota_azienda` FOREIGN KEY (`idazienda`) REFERENCES `azienda`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `nota` ADD CONSTRAINT `associazione_nota_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

ALTER TABLE `nota` DROP FOREIGN KEY `associazione_nota_azienda`; ALTER TABLE `nota` ADD CONSTRAINT `associazione_nota_azienda` FOREIGN KEY (`idazienda`) REFERENCES `azienda`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION; ALTER TABLE `nota` DROP FOREIGN KEY `associazione_nota_persona`; ALTER TABLE `nota` ADD CONSTRAINT `associazione_nota_persona` FOREIGN KEY (`idpersona`) REFERENCES `persona`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;