-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 18, 2022 alle 11:50
-- Versione del server: 10.4.18-MariaDB
-- Versione PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PCTO`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Alunno`
--

CREATE TABLE `Alunno` (
  `id` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_anagrafica` int(11) NOT NULL,
  `matricola` varchar(50) NOT NULL,
  `cittadinanza` varchar(50) NOT NULL,
  `residenza` varchar(50) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `cap` int(5) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `cellulare` varchar(20) NOT NULL,
  `e-mail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Anagrafica`
--

CREATE TABLE `Anagrafica` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_nascita` date NOT NULL,
  `sesso` char(1) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Assegnazione`
--

CREATE TABLE `Assegnazione` (
  `id` int(11) NOT NULL,
  `id_alunno` int(11) NOT NULL,
  `id_azienda` int(11) NOT NULL,
  `id_docente_tutor` int(11) NOT NULL,
  `Commento` varchar(300) NOT NULL,
  `data_inizio` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_fine` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Azienda`
--

CREATE TABLE `Azienda` (
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
-- Struttura della tabella `Classe`
--

CREATE TABLE `Classe` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `sezione` varchar(10) NOT NULL,
  `anno` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Contatti`
--

CREATE TABLE `Contatti` (
  `id` int(11) NOT NULL,
  `id_azienda` int(11) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `commento` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Docente`
--

CREATE TABLE `Docente` (
  `id` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_anagrafica` int(11) NOT NULL,
  `data_nascita` varchar(100) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `residenza` varchar(100) NOT NULL,
  `indirizzo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `privilegi` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Periodo Stage`
--

CREATE TABLE `Periodo Stage` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_inizio` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_fine` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Segretari`
--

CREATE TABLE `Segretari` (
  `id` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_anagrafica` int(11) NOT NULL,
  `ruolo` varchar(100) NOT NULL,
  `telefono` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `Tutor aziendale`
--

CREATE TABLE `Tutor aziendale` (
  `id` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `id_anagrafica` int(11) NOT NULL,
  `cellulare` varchar(20) NOT NULL,
  `telefono_ufficio` varchar(20) NOT NULL,
  `residenza` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Alunno`
--
ALTER TABLE `Alunno`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_classe` (`id_classe`,`id_login`),
  ADD KEY `id_login` (`id_login`),
  ADD KEY `id_anagrafica` (`id_anagrafica`);

--
-- Indici per le tabelle `Anagrafica`
--
ALTER TABLE `Anagrafica`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Assegnazione`
--
ALTER TABLE `Assegnazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alunno` (`id_alunno`,`id_azienda`,`id_docente_tutor`),
  ADD KEY `id_azienda` (`id_azienda`),
  ADD KEY `id_docente_tutor` (`id_docente_tutor`);

--
-- Indici per le tabelle `Azienda`
--
ALTER TABLE `Azienda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`,`id_tutor`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indici per le tabelle `Classe`
--
ALTER TABLE `Classe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `Contatti`
--
ALTER TABLE `Contatti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_azienda` (`id_azienda`,`id_docente`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `Docente`
--
ALTER TABLE `Docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_login` (`id_login`),
  ADD KEY `id_anagrafica` (`id_anagrafica`);

--
-- Indici per le tabelle `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Periodo Stage`
--
ALTER TABLE `Periodo Stage`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Segretari`
--
ALTER TABLE `Segretari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_login` (`id_login`),
  ADD KEY `id_anagrafica` (`id_anagrafica`);

--
-- Indici per le tabelle `Tutor aziendale`
--
ALTER TABLE `Tutor aziendale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_login` (`id_login`),
  ADD KEY `id_anagrafica` (`id_anagrafica`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Alunno`
--
ALTER TABLE `Alunno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Anagrafica`
--
ALTER TABLE `Anagrafica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Assegnazione`
--
ALTER TABLE `Assegnazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Azienda`
--
ALTER TABLE `Azienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Classe`
--
ALTER TABLE `Classe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Contatti`
--
ALTER TABLE `Contatti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Docente`
--
ALTER TABLE `Docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Periodo Stage`
--
ALTER TABLE `Periodo Stage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Segretari`
--
ALTER TABLE `Segretari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Tutor aziendale`
--
ALTER TABLE `Tutor aziendale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Alunno`
--
ALTER TABLE `Alunno`
  ADD CONSTRAINT `alunno_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `Classe` (`id`),
  ADD CONSTRAINT `alunno_ibfk_2` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `alunno_ibfk_3` FOREIGN KEY (`id_anagrafica`) REFERENCES `Anagrafica` (`id`);

--
-- Limiti per la tabella `Assegnazione`
--
ALTER TABLE `Assegnazione`
  ADD CONSTRAINT `assegnazione_ibfk_1` FOREIGN KEY (`id_alunno`) REFERENCES `Alunno` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_2` FOREIGN KEY (`id_azienda`) REFERENCES `Azienda` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_3` FOREIGN KEY (`id_docente_tutor`) REFERENCES `Docente` (`id`);

--
-- Limiti per la tabella `Azienda`
--
ALTER TABLE `Azienda`
  ADD CONSTRAINT `azienda_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `Docente` (`id`),
  ADD CONSTRAINT `azienda_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `Tutor aziendale` (`id`);

--
-- Limiti per la tabella `Classe`
--
ALTER TABLE `Classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `Docente` (`id`);

--
-- Limiti per la tabella `Contatti`
--
ALTER TABLE `Contatti`
  ADD CONSTRAINT `contatti_ibfk_1` FOREIGN KEY (`id_azienda`) REFERENCES `Azienda` (`id`),
  ADD CONSTRAINT `contatti_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `Docente` (`id`);

--
-- Limiti per la tabella `Docente`
--
ALTER TABLE `Docente`
  ADD CONSTRAINT `docente_ibfk_2` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `docente_ibfk_3` FOREIGN KEY (`id_anagrafica`) REFERENCES `Anagrafica` (`id`);

--
-- Limiti per la tabella `Segretari`
--
ALTER TABLE `Segretari`
  ADD CONSTRAINT `segretari_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `segretari_ibfk_2` FOREIGN KEY (`id_anagrafica`) REFERENCES `Anagrafica` (`id`);

--
-- Limiti per la tabella `Tutor aziendale`
--
ALTER TABLE `Tutor aziendale`
  ADD CONSTRAINT `tutor aziendale_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `login` (`id`),
  ADD CONSTRAINT `tutor aziendale_ibfk_2` FOREIGN KEY (`id_anagrafica`) REFERENCES `Anagrafica` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
