-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2022 at 10:22 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

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
-- Table structure for table `assegnazione`
--

CREATE TABLE `assegnazione` (
  `id` int(11) NOT NULL,
  `id_alunno` int(11) NOT NULL,
  `id_azienda` int(11) NOT NULL,
  `id_docente_tutor` int(11) NOT NULL,
  `Commento` varchar(300) NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `tutor` varchar(100) NOT NULL,
  `id_periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assegnazione`
--

INSERT INTO `assegnazione` (`id`, `id_alunno`, `id_azienda`, `id_docente_tutor`, `Commento`, `data_inizio`, `data_fine`, `tutor`, `id_periodo`) VALUES
(11, 4, 1, 24, 'Azienda tranquilla', '2022-03-05', '2022-03-11', '', 0),
(30, 26, 1, 18, 'Non mi interessa commentare', '2022-05-14', '2022-05-19', 'Paolo Bianconi', 0),
(31, 26, 3, 24, 'Era un azienda tranquilla', '2022-05-20', '2022-05-28', 'koulibaly', 0),
(32, 4, 1, 18, 'Azienda tranquilla', '2022-05-15', '2022-05-07', 'koulibaly', 0),
(33, 4, 1, 18, 'Azienda tranquilla', '2022-05-15', '2022-05-12', 'Serena', 0),
(42, 6, 1, 18, 'hsdas', '2022-05-14', '2022-05-21', 'matteo', 0),
(43, 6, 1, 18, 'Azienda tranquilla', '2022-03-03', '2022-04-23', 'g8', 1),
(44, 6, 1, 18, 'Azienda tranquilla', '2022-03-03', '2022-04-23', 'g8', 1),
(45, 6, 1, 18, 'Prova', '2022-05-23', '2022-06-17', 'Mario Gatto', 2),
(46, 47, 1, 24, 'Azienda tranquilla', '2022-05-23', '2022-06-17', 'Lucio Rettore', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assegnazione`
--
ALTER TABLE `assegnazione`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alunno` (`id_alunno`,`id_azienda`,`id_docente_tutor`),
  ADD KEY `id_azienda` (`id_azienda`),
  ADD KEY `id_docente_tutor` (`id_docente_tutor`),
  ADD KEY `id_periodo` (`id_periodo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assegnazione`
--
ALTER TABLE `assegnazione`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assegnazione`
--
ALTER TABLE `assegnazione`
  ADD CONSTRAINT `assegnazione_ibfk_1` FOREIGN KEY (`id_alunno`) REFERENCES `persona` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_2` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`),
  ADD CONSTRAINT `assegnazione_ibfk_3` FOREIGN KEY (`id_docente_tutor`) REFERENCES `persona` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
