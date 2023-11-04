ALTER TABLE `azienda`
  DROP `id_tutor`;

  CREATE TABLE `pcto`.`tutor_azienda` ( `id_persona` INT NOT NULL , `id_azienda` INT NOT NULL , PRIMARY KEY (`id_persona`, `id_azienda`)) ENGINE = InnoDB; 

  ALTER TABLE `tutor_azienda`
  ADD CONSTRAINT `tutor_azienda_ibfk_1` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`),
  ADD CONSTRAINT `tutor_azienda_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`);
COMMIT;

ALTER TABLE pcto.azienda DROP FOREIGN KEY `azienda_ibfk_2`;

ALTER TABLE `azienda` DROP INDEX `id_tutor`;

ALTER TABLE `azienda` CHANGE `locazione` `indirizzo` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` CHANGE `nome` `denominazione_azienda` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` ADD `cap` INT NOT NULL AFTER `indirizzo`; 

ALTER TABLE `azienda` ADD `comune` VARCHAR(100) NOT NULL AFTER `cap`; 

ALTER TABLE `azienda` ADD `settore` VARCHAR(100) NOT NULL AFTER `denominazione_azienda`; 

ALTER TABLE `azienda` CHANGE `rappresentante` `referente_aziendale` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` ADD `tutor_aziendale` VARCHAR(100) NOT NULL AFTER `referente_aziendale`; 

ALTER TABLE `azienda` ADD `telefono` INT(20) NOT NULL AFTER `tutor_aziendale`; 

ALTER TABLE `azienda` ADD `inizioam` VARCHAR(50) NOT NULL AFTER `telefono`; 

ALTER TABLE `azienda` ADD `fineam` VARCHAR(50) NOT NULL AFTER `inizioam`; 

ALTER TABLE `azienda` ADD `iniziopm` VARCHAR(50) NOT NULL AFTER `fineam`; 

ALTER TABLE `azienda` ADD `finepm` VARCHAR(50) NOT NULL AFTER `iniziopm`; 

ALTER TABLE `azienda` ADD `email` VARCHAR(200) NOT NULL AFTER `finepm`; 

ALTER TABLE `azienda` ADD `sito` VARCHAR(200) NOT NULL AFTER `email`; 

ALTER TABLE `azienda` ADD `n_dipendenti` INT NOT NULL AFTER `sito`; 

ALTER TABLE `azienda` ADD `settore_attivita` VARCHAR(50) NOT NULL AFTER `n_dipendenti`; 

ALTER TABLE `azienda` ADD `leg_denominazioneazienda` VARCHAR(100) NOT NULL AFTER `settore_attivita`; 

ALTER TABLE `azienda` ADD `leg_via` VARCHAR(100) NOT NULL AFTER `leg_denominazioneazienda`; 

ALTER TABLE `azienda` ADD `leg_comune` VARCHAR(50) NOT NULL AFTER `leg_via`; 

ALTER TABLE `azienda` CHANGE `iva` `leg_iva` VARCHAR(100) NOT NULL; 

ALTER TABLE `azienda` ADD `leg_nomecognome` VARCHAR(100) NOT NULL AFTER `leg_comune`; 

ALTER TABLE `azienda` ADD `leg_datanascita` DATE NULL AFTER `leg_nomecognome`; 

ALTER TABLE `azienda` ADD `leg_comunenascita` VARCHAR(100) NOT NULL AFTER `leg_datanascita`; 

ALTER TABLE `azienda` ADD `rapleg_codicefiscale` VARCHAR(100) NOT NULL AFTER `leg_iva`; 

ALTER TABLE `azienda` ADD `rapleg_convenzionedata` DATE NULL AFTER `rapleg_codicefiscale`; 

ALTER TABLE `azienda` CHANGE `convenzione` `rapleg_convenzioneprotocolo` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

///////////////////////////////////////////////////////////////////////////////



CREATE TABLE `pctov3`.`tutor_azienda` ( `id_persona` INT NOT NULL , `id_azienda` INT NOT NULL , PRIMARY KEY (`id_persona`, `id_azienda`)) ENGINE = InnoDB; 

  ALTER TABLE `tutor_azienda`
  ADD CONSTRAINT `tutor_azienda_ibfk_1` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`),
  ADD CONSTRAINT `tutor_azienda_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`);


ALTER TABLE pctov3.azienda DROP FOREIGN KEY `azienda_ibfk_2`;

ALTER TABLE `azienda` DROP INDEX `id_tutor`;


ALTER TABLE `azienda`
  DROP `id_tutor`;

ALTER TABLE `azienda` CHANGE `id_docente` `id_docente` INT(11) NULL DEFAULT NULL; 

ALTER TABLE `azienda` CHANGE `locazione` `indirizzo` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` CHANGE `nome` `denominazione_azienda` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` ADD `cap` INT NOT NULL AFTER `indirizzo`; 

ALTER TABLE `azienda` ADD `comune` VARCHAR(100) NOT NULL AFTER `cap`; 

ALTER TABLE `azienda` ADD `settore` VARCHAR(100) NOT NULL AFTER `denominazione_azienda`; 

ALTER TABLE `azienda` CHANGE `rappresentante` `referente_aziendale` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` ADD `tutor_aziendale` VARCHAR(100) NOT NULL AFTER `referente_aziendale`; 

ALTER TABLE `azienda` ADD `telefono` INT(50) NOT NULL AFTER `tutor_aziendale`; 

ALTER TABLE `azienda` CHANGE `telefono` `telefono` VARCHAR(50) NOT NULL; 

ALTER TABLE `azienda` ADD `inizioam` VARCHAR(50) NOT NULL AFTER `telefono`; 

ALTER TABLE `azienda` ADD `fineam` VARCHAR(50) NOT NULL AFTER `inizioam`; 

ALTER TABLE `azienda` ADD `iniziopm` VARCHAR(50) NOT NULL AFTER `fineam`; 

ALTER TABLE `azienda` ADD `finepm` VARCHAR(50) NOT NULL AFTER `iniziopm`; 

ALTER TABLE `azienda` ADD `email` VARCHAR(200) NOT NULL AFTER `finepm`; 

ALTER TABLE `azienda` ADD `sito` VARCHAR(200) NOT NULL AFTER `email`; 

ALTER TABLE `azienda` ADD `n_dipendenti` INT NOT NULL AFTER `sito`; 

ALTER TABLE `azienda` ADD `settore_attivita` VARCHAR(50) NOT NULL AFTER `n_dipendenti`; 

ALTER TABLE `azienda` ADD `leg_denominazioneazienda` VARCHAR(100) NOT NULL AFTER `settore_attivita`; 

ALTER TABLE `azienda` ADD `leg_via` VARCHAR(100) NOT NULL AFTER `leg_denominazioneazienda`; 

ALTER TABLE `azienda` ADD `leg_comune` VARCHAR(50) NOT NULL AFTER `leg_via`; 

ALTER TABLE `azienda` CHANGE `iva` `leg_iva` VARCHAR(100) NOT NULL; 

ALTER TABLE `azienda` ADD `leg_nomecognome` VARCHAR(100) NOT NULL AFTER `leg_comune`; 

ALTER TABLE `azienda` ADD `leg_datanascita` DATE NULL AFTER `leg_nomecognome`; 

ALTER TABLE `azienda` ADD `leg_comunenascita` VARCHAR(100) NOT NULL AFTER `leg_datanascita`; 

ALTER TABLE `azienda` ADD `rapleg_codicefiscale` VARCHAR(100) NOT NULL AFTER `leg_iva`; 

ALTER TABLE `azienda` ADD `rapleg_convenzionedata` DATE NULL AFTER `rapleg_codicefiscale`; 

ALTER TABLE `azienda` CHANGE `convenzione` `rapleg_convenzioneprotocolo` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL; 

ALTER TABLE `azienda` CHANGE `n_informatici` `n_informatici` INT(20) NOT NULL AFTER `id_docente`, CHANGE `n_telecomunicazioni` `n_telecomunicazioni` INT(20) NOT NULL AFTER `n_informatici`, CHANGE `n_elettronici` `n_elettronici` INT(20) NOT NULL AFTER `n_telecomunicazioni`, CHANGE `n_automazioni` `n_automazioni` INT(20) NOT NULL AFTER