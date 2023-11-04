-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 15, 2022 alle 12:51
-- Versione del server: 10.4.17-MariaDB
-- Versione PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struttura per vista `attestato`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attestato`  AS SELECT `al`.`nome` AS `nome_al`, `al`.`cognome` AS `cognome_al`, `cl`.`sezione` AS `sezione`, `cl`.`anno` AS `anno`, `az`.`nome` AS `nome_az`, `a`.`data_inizio` AS `data_inizio`, `a`.`data_fine` AS `data_fine`, `ts`.`nome` AS `nome_ts`, `ts`.`cognome` AS `cognome_ts`, `ta`.`nome` AS `nome_ta`, `ta`.`cognome` AS `cognome_ta`, `a`.`id` AS `id_assegnazione` FROM ((((((`assegnazione` `a` join `persona` `al` on(`a`.`id_alunno` = `al`.`id`)) join `classe_studente` `cs` on(`a`.`id_alunno` = `cs`.`idpersona`)) join `classe` `cl` on(`cs`.`idclasse` = `cl`.`id`)) join `azienda` `az` on(`az`.`id` = `a`.`id_azienda`)) join `persona` `ts` on(`ts`.`id` = `a`.`id_docente_tutor`)) join `persona` `ta` on(`ta`.`id` = `a`.`id_azienda_tutor`)) ;

--
-- VIEW `attestato`
-- Dati: Nessuno
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
