-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 01, 2022 alle 12:02
-- Versione del server: 10.1.26-MariaDB
-- Versione PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pcto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `assegnazione`
--

CREATE TABLE `assegnazione` (
  `id` int(11) NOT NULL,
  `id_alunno` int(11) NOT NULL,
  `id_azienda` int(11) NOT NULL,
  `id_docente_tutor` int(11) NOT NULL,
  `id_azienda_tutor` int(11) NOT NULL,
  `Commento` varchar(300) NOT NULL,
  `data_inizio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `azienda`
--

CREATE TABLE `azienda` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `id_tutor` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `locazione` varchar(100) NOT NULL,
  `rappresentante` varchar(50) NOT NULL,
  `convenzione` varchar(50) NOT NULL,
  `iva` int(16) NOT NULL,
  `commento` varchar(1000) NOT NULL,
  `n_informatici` int(20) NOT NULL,
  `n_telecomunicazioni` int(20) NOT NULL,
  `n_elettronici` int(20) NOT NULL,
  `n_automazioni` int(20) NOT NULL,
  `n_liceo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `sezione` varchar(10) NOT NULL,
  `anno` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_studente`
--

CREATE TABLE `classe_studente` (
  `idclasse` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `contatti`
--

CREATE TABLE `contatti` (
  `id` int(11) NOT NULL,
  `id_azienda` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `commento` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `periodo stage`
--

CREATE TABLE `periodo stage` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_inizio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `cognome` varchar(80) NOT NULL,
  `datanascita` date NOT NULL,
  `codicefiscale` varchar(16) NOT NULL,
  `sesso` char(1) NOT NULL,
  `cellulare` varchar(13) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `al_matricola` varchar(20) NOT NULL,
  `al_cittadinanza` varchar(30) NOT NULL,
  `cap` varchar(5) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `residenza` varchar(100) NOT NULL,
  `tut_idazienda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `persona_ruolo`
--

CREATE TABLE `persona_ruolo` (
  `idruolo` int(11) NOT NULL,
  `idpersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `ruolo`
--

CREATE TABLE `ruolo` (
  `id` int(11) NOT NULL,
  `dsruolo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `assegnazione`
--
ALTER TABLE `assegnazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alunno` (`id_alunno`,`id_azienda`,`id_docente_tutor`),
  ADD KEY `id_azienda` (`id_azienda`),
  ADD KEY `id_docente_tutor` (`id_docente_tutor`),
  ADD KEY `id_azienda_tutor` (`id_azienda_tutor`);

--
-- Indici per le tabelle `azienda`
--
ALTER TABLE `azienda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`,`id_tutor`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indici per le tabelle `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `classe_studente`
--
ALTER TABLE `classe_studente`
  ADD KEY `idclasse` (`idclasse`,`idpersona`),
  ADD KEY `idpersona` (`idpersona`);

--
-- Indici per le tabelle `contatti`
--
ALTER TABLE `contatti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_azienda` (`id_azienda`,`id_docente`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `periodo stage`
--
ALTER TABLE `periodo stage`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `al_idclasse` (`tut_idazienda`),
  ADD KEY `tut_idazienda` (`tut_idazienda`);

--
-- Indici per le tabelle `persona_ruolo`
--
ALTER TABLE `persona_ruolo`
  ADD KEY `idruolo` (`idruolo`,`idpersona`),
  ADD KEY `idpersona` (`idpersona`);

--
-- Indici per le tabelle `ruolo`
--
ALTER TABLE `ruolo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `assegnazione`
--
ALTER TABLE `assegnazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `azienda`
--
ALTER TABLE `azienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `contatti`
--
ALTER TABLE `contatti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `periodo stage`
--
ALTER TABLE `periodo stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ruolo`
--
ALTER TABLE `ruolo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `assegnazione`
--
ALTER TABLE `assegnazione`
  ADD CONSTRAINT `assegnazione_ibfk_1` FOREIGN KEY (`id_alunno`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_2` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_3` FOREIGN KEY (`id_docente_tutor`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_4` FOREIGN KEY (`id_azienda_tutor`) REFERENCES `persona` (`id`);

--
-- Limiti per la tabella `azienda`
--
ALTER TABLE `azienda`
  ADD CONSTRAINT `azienda_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `azienda_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `persona` (`id`);

--
-- Limiti per la tabella `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `persona` (`id`);

--
-- Limiti per la tabella `classe_studente`
--
ALTER TABLE `classe_studente`
  ADD CONSTRAINT `classe_studente_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `classe_studente_ibfk_2` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`id`);

--
-- Limiti per la tabella `contatti`
--
ALTER TABLE `contatti`
  ADD CONSTRAINT `contatti_ibfk_1` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`),
  ADD CONSTRAINT `contatti_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `persona` (`id`);

--
-- Limiti per la tabella `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_5` FOREIGN KEY (`tut_idazienda`) REFERENCES `azienda` (`id`);

--
-- Limiti per la tabella `persona_ruolo`
--
ALTER TABLE `persona_ruolo`
  ADD CONSTRAINT `persona_ruolo_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `persona_ruolo_ibfk_2` FOREIGN KEY (`idruolo`) REFERENCES `ruolo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
