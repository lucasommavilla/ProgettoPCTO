-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Nov 22, 2023 alle 12:57
-- Versione del server: 8.1.0
-- Versione PHP: 8.2.11

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
-- Struttura della tabella `assegnazione`
--

CREATE TABLE `assegnazione` (
  `id` int NOT NULL,
  `id_alunno` int NOT NULL,
  `id_azienda` int NOT NULL,
  `id_docente_tutor` int NOT NULL,
  `id_azienda_tutor` int NOT NULL,
  `Commento` varchar(300) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `tutor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `assegnazione`
--

INSERT INTO `assegnazione` (`id`, `id_alunno`, `id_azienda`, `id_docente_tutor`, `id_azienda_tutor`, `Commento`, `data_inizio`, `data_fine`, `tutor`) VALUES
(3, 4, 2, 13, 14, '', '2022-02-09', '2022-02-09', '');

-- --------------------------------------------------------

--
-- Struttura stand-in per le viste `attestato`
-- (Vedi sotto per la vista effettiva)
--
CREATE TABLE `attestato` (
`nome_al` varchar(80)
,`cognome_al` varchar(80)
,`data_nascita` date
,`cod_fiscale_al` varchar(16)
,`telefono_al` varchar(13)
,`mail_al` varchar(100)
,`cap_res_al` varchar(5)
,`indirizzo_res_al` varchar(100)
,`residenza_al` varchar(100)
,`sezione` varchar(10)
,`anno` varchar(9)
,`nome_az` varchar(100)
,`indirizzo_az` varchar(100)
,`cap_az` int
,`comune_az` varchar(100)
,`leg_indirizzo_az` varchar(100)
,`leg_comune_az` varchar(50)
,`codice_fiscale_az` varchar(100)
,`nome_cognome_ta` varchar(100)
,`telefono_az` varchar(50)
,`mail_az` varchar(200)
,`data_conv` date
,`conv_protocollo` varchar(50)
,`inizio_mattina` varchar(50)
,`fine_mattina` varchar(50)
,`inizio_pomeriggio` varchar(50)
,`fine_pomeriggio` varchar(50)
,`data_inizio` date
,`data_fine` date
,`nome_ts` varchar(80)
,`cognome_ts` varchar(80)
,`telefono_ts` varchar(13)
,`mail_ts` varchar(100)
,`nome_ta` varchar(80)
,`cognome_ta` varchar(80)
,`telefono_ta` varchar(13)
,`mail_ta` varchar(100)
,`id_assegnazione` int
);

-- --------------------------------------------------------

--
-- Struttura della tabella `azienda`
--

CREATE TABLE `azienda` (
  `id` int NOT NULL,
  `id_docente` int DEFAULT NULL,
  `n_informatici` int NOT NULL,
  `n_telecomunicazioni` int NOT NULL,
  `n_elettronici` int NOT NULL,
  `n_automazioni` int NOT NULL,
  `n_liceo` int NOT NULL,
  `n_totale` int NOT NULL,
  `denominazione_azienda` varchar(100) NOT NULL,
  `settore` varchar(100) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `cap` int NOT NULL,
  `comune` varchar(100) NOT NULL,
  `referente_aziendale` varchar(100) NOT NULL,
  `tutor_aziendale` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `inizioam` varchar(50) NOT NULL,
  `fineam` varchar(50) NOT NULL,
  `iniziopm` varchar(50) NOT NULL,
  `finepm` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `sito` varchar(200) NOT NULL,
  `n_dipendenti` int NOT NULL,
  `settore_attivita` varchar(50) NOT NULL,
  `leg_denominazioneazienda` varchar(100) NOT NULL,
  `leg_via` varchar(100) NOT NULL,
  `leg_comune` varchar(50) NOT NULL,
  `leg_nomecognome` varchar(100) NOT NULL,
  `leg_datanascita` date DEFAULT NULL,
  `leg_comunenascita` varchar(100) NOT NULL,
  `leg_iva` varchar(100) NOT NULL,
  `rapleg_convenzioneprotocolo` varchar(50) NOT NULL,
  `rapleg_codicefiscale` varchar(100) NOT NULL,
  `rapleg_convenzionedata` date DEFAULT NULL,
  `commento` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `azienda`
--

INSERT INTO `azienda` (`id`, `id_docente`, `n_informatici`, `n_telecomunicazioni`, `n_elettronici`, `n_automazioni`, `n_liceo`, `n_totale`, `denominazione_azienda`, `settore`, `indirizzo`, `cap`, `comune`, `referente_aziendale`, `tutor_aziendale`, `telefono`, `inizioam`, `fineam`, `iniziopm`, `finepm`, `email`, `sito`, `n_dipendenti`, `settore_attivita`, `leg_denominazioneazienda`, `leg_via`, `leg_comune`, `leg_nomecognome`, `leg_datanascita`, `leg_comunenascita`, `leg_iva`, `rapleg_convenzioneprotocolo`, `rapleg_codicefiscale`, `rapleg_convenzionedata`, `commento`) VALUES
(1, 290, 2, 0, 0, 0, 0, 0, 'ABAR SRL', 'INFORMATICO', 'Via Senatore Fabbri 60', 31027, 'Spresiano (TV)', 'Alvise Piccoli', 'Alvise Piccoli', '0422 880820 / 3939261440', '8.00', '12.00', '13.30', '17.30', 'info@abar.it', 'www.abar.it', 1, 'servizi informatici', 'ABAR SRL', 'Via Senatore Fabbri 60', 'Spresiano (TV)', 'Davide Scantamburlo', NULL, 'Treviso (TV)', '4271680268', '3279/C24D', 'SCNDVD73A31L407N', '2019-05-04', ''),
(2, 0, 0, 0, 0, 0, 0, 0, 'ACQUA MINERALE SAN BENEDETTO SPA', 'INFORMATICO', 'Viale Kennedy 65', 30037, 'Scorzè (VE)', 'Giuriato Alesio', 'Ballarin Michele', '041 5846494', '8.30', '12.30', '13.30', '17.30', 'alessio.giuriato@sanbenedetto.it', 'Industrie alimentari e delle bevande', 0, '', 'ACQUA MINERALE SAN BENEDETTO SPA', 'Viale Kennedy 65', 'Scorzè (VE)', 'Pisano Luca', '1963-10-01', 'Chieri (TO)', '00593710247', '3279/C24D', 'PSNLCU63R01C627J', '2019-05-04', ''),
(3, 0, 0, 1, 1, 0, 0, 0, 'ADFWEB SRL', 'INFORMATICO', 'V.Franchini 1', 31010, 'Villorba (TV)', 'Dalla Torre Alessandro', 'Comacchio Alex', '0438 309131', '8.30', '12.00', '13.30', '18.00', 'info@adfweb.com   a.dallatorre@adfweb.com', 'www.adfweb.com', 8, 'produz. schede elettroniche', 'ADFWEB SRL', 'V.Franchini 1', 'Villorba (TV)', 'Alessandro Dalla Torre', '1971-11-23', 'Conegliano (TV)', '3853620262', '3279/C24D', 'DLLLSN71S23C357M', '2019-05-04', ''),
(4, 0, 0, 0, 0, 0, 0, 0, 'ALDEBRA SPA', 'INFORMATICO', 'V.Luigi Einaudi 25', 31030, 'Casier (TV)', 'Zamberlam Flavio', 'Zamberlam Flavio', '0422 559200', '', '', '', '', 'info@aldebra.com', 'www.aldebra.com', 0, 'servizi informatici', 'ALDEBRA SPA', 'V.Luigi Einaudi 25', 'Casier (TV)', 'Giordano Tamanini', '1952-11-08', 'Trento (TN)', '1170810228', '278/C24D', 'TMNGDN52S08L378G', '2017-01-19', ''),
(5, 0, 0, 0, 0, 0, 0, 0, 'ALGORITMO SRL', 'INFORMATICO', 'V.le della Repubblica 193/i', 31100, 'Treviso (TV)', 'Pegoraro Andrea', 'Pegoraro Andrea', '0422 541149', '', '', '', '', 'info@algoritmoautomazioni.com', 'algoritmoautomazioni.com', 2, 'servizi informatici', 'ALGORITMO SRL', 'V.le della Repubblica 193/i', 'Treviso (TV)', 'Federico Cadamuro', '1967-10-06', 'Treviso (TV)', '3131070264', '213/C24D', 'CDMFRC67R06L407T', '2017-01-17', ''),
(6, 0, 0, 0, 0, 0, 0, 0, 'ALPHA SISTEMI SRL', 'INFORMATICO', 'V. Ghirada 2', 31100, 'Treviso (TV)', 'Aggujaro Alberto', 'Aggujaro Alberto', '340 9044185', '', '', '', '', 'info@alphasistemi.it', 'www.hr-alphasistemi.it', 28, 'servizi informatici', 'ALPHA SISTEMI SRL', 'V. Ghirada 2', 'Treviso (TV)', 'Federico Cadamuro', '1967-10-06', 'Treviso (TV)', '1834310599', '7888/C24', 'CDMFRC67R06L407T', '2016-12-27', ''),
(8, 0, 0, 0, 0, 0, 0, 0, 'ASITRON Srl', 'INFORMATICO', 'Via G. Poli 50', 31032, 'Casale sul Sile (TV)', 'Bellio Sergio', 'Bellio Sergio', '041/2689076', '8.00', '12.00', '13.00', '17.00', 'amministrazione@asitron.it', 'www.asitron.it', 0, '', 'ASITRON Srl', 'Via G. Poli 50', 'Casale sul Sile (TV)', 'Sergio Bellio', '1961-05-27', 'Torino ', '04998930269', '7174/C24D', '', '2021-05-20', ''),
(9, 0, 1, 0, 0, 0, 0, 0, 'ETHICA CONSULTING S.P.A', 'INFORMATICO', 'V.le Della Repubblica 12/I ', 31020, 'Villorba (TV)', '', '', '0422 910300', '9.30', '13.00', '14.00', '18.00', '', 'www.altevie.com', 160, 'servizi informatici', 'ETHICA CONSULTING S.P.A', 'V.le Della Repubblica 12/I ', 'Villorba (TV)', 'Valentino Girardi', '1969-11-12', 'Montebelluna (TV)', '3765320266', '3279/C24D', 'GRRVNT69S12F443L', '2019-05-04', ''),
(10, 0, 0, 0, 0, 0, 0, 0, 'APIEL SRL', 'INFORMATICO', 'v.Francesco Guardi 35', 31038, 'Paese (TV)', '', '', '0422 480902', '8.00', '12.30', '14.00', '17.30', 'apiel@apiel.it', 'www.apiel.it', 1, 'servizi informatici', 'APIEL SRL', 'v.Francesco Guardi 35', 'Paese (TV)', 'Maurizio Mattiuzzo', '1950-12-10', 'Treviso (TV)', '03610750261', '3279/C24D', 'MTTMRZ63D09L407X', '2019-05-04', ''),
(11, 0, 0, 0, 0, 0, 0, 0, 'ARCADIA SRL', 'INFORMATICO', 'v. Manin 64', 31015, 'Conegliano (TV)', 'Dal Col Giovanni', 'Dal Col Giovanni', '0438 64994', '', '', '', '', 'info@arcadiasrl.com', 'www.arcadiasrl.com', 8, 'servizi informatici', 'ARCADIA SRL', 'v. Manin 64', 'Conegliano (TV)', 'Jacobo Giacomo Camerin', '1955-11-19', 'Caracas (Venezuela)', '02083140265', '2617/C24', 'CMRJBG655S19Z614M', '2021-02-20', ''),
(12, 0, 0, 0, 0, 0, 0, 0, 'ARMONIA COMPUTERS SRL', 'INFORMATICO', 'Via Conegliano 74', 31058, 'Susegana (TV)', 'Vanzella Domenico', 'Vanzella Domenico', '0438 435010', '', '', '', '', 'amministrazione@armotech.it', '', 5, 'commercio computer', 'ARMONIA COMPUTERS SRL', 'Via Conegliano 74', 'Susegana (TV)', 'Vanzella Domenico', '1964-10-24', 'Conegliano (TV)', '02185390263', '3279/C24D', 'VNZDNC64R24C957Y', '2019-05-04', ''),
(13, 0, 0, 0, 0, 0, 0, 0, 'ASSICURAZIONI GENERALI', 'INFORMATICO', 'Largo Porta Altinia 23', 31100, 'Treviso (TV)', 'Pedrocco Alessandro', 'Pedrocco Alessandro', '0422 579984', '', '', '', '', 'agenzia.trevisoportaaltinia.it@generali.com', 'www.generali.com', 0, 'servizi assicurativi', 'ASSICURAZIONI GENERALI', 'Largo Porta Altinia 23', 'Treviso (TV)', 'Domenico Baldasso', '1977-07-23', 'Treviso (TV)', '04362080261', '7877/C24', 'BLDDNC77L23L407N', '2016-12-23', ''),
(14, 0, 1, 0, 0, 0, 0, 0, 'BEANTECH', 'INFORMATICO', 'Via Don Luigi Peron 1', 30174, 'Venezia (VE)', 'Enrico Puggioni', 'Ilaria Sguassero', '0432 889787', '8.30', '12.30', '13.30', '17.30', 'nicola.paro@beantech.it - andrea.pitussi@beantech.it', 'https://www.beantech.it/', 51, '', 'BEANTECH', 'Via Ivrea, 5', '30174', 'Anziutti Massimiliano', '1970-02-26', 'Tolmezzo (UD)', '02175740303', '13269/C24', 'NZTMSM70A26L195H', '2020-10-23', ''),
(15, 0, 2, 0, 0, 0, 0, 0, 'BLUDATA INFORMATICA SRL', 'INFORMATICO', ' Via delle Industrie 10', 31030, 'Breda di Piave (TV)', 'Maria Chiara Visentin', 'Alessio Brunello', '0422 445442', '8.30', '12.30', '14.30', '18.30', 'info@bludata.com', 'www.bludata.com/', 11, '', 'BLUDATA INFORMATICA SRL', 'Via delle industrie, 10', 'Breda di Piave (TV)', 'Pierantonio Bovo', '1966-03-20', 'Venezia (VE)', '033510402060', '6816/C24', 'BVOPNT66C20L736F', '2021-05-14', ''),
(16, 0, 0, 0, 0, 0, 0, 0, 'BOXXAPPS SRL', 'INFORMATICO', 'V. della Stazione 2', 30020, 'Marcon (VE)', 'De Poli Nicoletta', '', '041 309 0915 / 348 7160125 ', '', '', '', '', 'info@boxxapps.com', 'www.boxxapps.com', 0, 'Servizi professionali nel settore dell Information', 'BOXXAPPS SRL', 'V. della Stazione 2', 'Marcon (VE)', '', '0000-00-00', '', '4155080270', '', '', '0000-00-00', ''),
(17, 0, 0, 0, 0, 0, 0, 0, 'BP SRL', 'INFORMATICO', 'Strada sant angelo 53', 31100, 'Treviso (TV)', 'Benedetti Paolo', 'Benedetti Paolo', '0422 424459', '', '', '', '', 'info@bpcomputer.tv', 'www.bpcomputer.tv', 2, 'servizi informatici', 'BP SRL', 'Strada sant angelo 53', 'Treviso (TV)', 'Benedetti Paolo', '1978-04-14', 'Treviso (TV)', '04626580262', '381/C24D', 'BNDPLA78D1L407O', '2017-01-24', ''),
(18, 0, 2, 0, 0, 0, 0, 0, 'C 4 B SRL', 'INFORMATICO', 'Piazza delle Istituzioni 39/F', 31100, 'Treviso (TV)', 'Battaglion Francesca', 'Pavanello Mirko', '0422 1627564', '8.30', '12.30', '14.00', '18.00', 'amministrazione@consulting4business.it', '', 15, 'Gestione banche dati (Ateco 63.11.2)', 'C 4 B SRL', 'Via Pasquale Sottocorno, 3 - ', 'Milano (MI)', 'Spiccia Simone', '1984-02-21', 'Foligno (PG)', '04509100261', '3279/C24D', 'SPCSMN84B21D653G', '2019-05-04', ''),
(19, 0, 0, 0, 0, 0, 0, 0, 'C.E.M.E.S DI SCARABELLO ANGELO', 'INFORMATICO', 'v. Valdemoneghe 10A', 31030, 'Carbonera (TV)', 'Scarabello Angelo', 'Scarabello Angelo', '347 4288547', '', '', '', '', 'scarabmoto@gmail.com', 'www.cemes-moto.com', 4, 'progettazione-costruzione', 'C.E.M.E.S DI SCARABELLO ANGELO', 'v. Valdemoneghe 10A', 'Carbonera (TV)', 'Scarabello Angelo', '1974-03-04', 'Treviso (TV)', '04506730268', '415/C24D', 'SCRNGL74C04L407D', '2017-01-27', ''),
(20, 0, 0, 0, 0, 0, 0, 0, 'CDFP', 'INFORMATICO', 'Via del Nascimben 1/B', 31100, 'Treviso (TV)', 'Angeloni Federico', 'Angeloni Federico', '3331985162', '8.00', '', '', '20.00', 'accademiatreviso@federugby.it', '', 1, 'Associazione sportiva Rugby', 'CDFP', 'Via del Nascimben 1/B', 'Treviso (TV)', 'Angeloni Federico', '1980-01-03', 'Avezzano (AQ)', '02151961006', '3279/C24d', 'NGLFRC80A03A515V', '2019-05-04', ''),
(21, 0, 0, 0, 0, 0, 0, 0, 'CGIL Camera del lavoro territoriale di Treviso', 'INFORMATICO', 'via E. Dandolo 4', 31100, 'Treviso (TV)', 'Sara Avanzi', 'Sara Avanzi', '0422 409241', '8.30', '12.30', '14.30', '18.30', 'amministrazione@cgiltreviso.it', '', 0, 'servizi al cittadino', 'CGIL Camera del lavoro territoriale di Treviso', 'via E. Dandolo 4', 'Treviso (TV)', 'Vendrame Giacomo', '1980-06-16', 'Conegliano (TV)', '80028260265', '3279/C24D', 'VNDGCM80H16C957U', '2019-05-04', ''),
(22, 0, 0, 0, 0, 0, 0, 0, 'CHS', 'INFORMATICO', 'v. Belluno 1', 31046, 'Oderzo (TV)', 'Cappellotto Mario', 'Cappellotto Mario', '0422 207083', '', '', '', '', 'mario@chs-italia.com', 'www.chs-italia.com', 2, 'commercio e servizi informatici', 'CHS', 'v. Belluno 1', 'Oderzo (TV)', 'Mario Cappellotto', '1958-04-28', 'Oderzo (TV)', '03243170267', '390/C24D', 'CPPMRA58D28F999S', '2017-01-24', ''),
(23, 0, 0, 0, 0, 0, 0, 0, 'CIELLE CNC', 'INFORMATICO', 'Via G. Toniolo 6Zona Artigianale', 31030, 'Breda di Piave (TV)', 'De Lazzari Elena', 'De Lazzari Elena', '04226050  0422605120', '8.30', '12.30', '14.00', '18.00', 'edelazzari@ciellecnc.com', 'www.cielle.it', 0, 'macchime laser', 'CIELLE CNC', 'Via G. Toniolo 6Zona Artigianale', 'Breda di Piave (TV)', 'Luigino De Lazzari', '1946-11-21', 'Roncade (TV)', '00628870263', '3279/C24D', 'DLZLGN46S21H523I', '2019-05-04', ''),
(24, 0, 0, 0, 0, 0, 0, 0, 'TENNIS CLUB 82 ASD CHIUSO', 'INFORMATICO', 'Via Medaglie d oro 6', 31100, 'Treviso (TV)', 'Guadagnini Roberta', 'Guadagnini Roberta', '422403316', '', '', '', '', 'club82tv@yahoo.com', 'www.club82treviso.com', 1, 'servizi informatici', 'TENNIS CLUB 82 ASD CHIUSO', 'Via Medaglie d oro 6', 'Treviso (TV)', 'Roberto Guadagnini', '1983-12-29', 'Venezia (VE)', '04516130269', '531/C24D', 'GDGRRT83T69L736E', '2017-02-01', ''),
(25, 0, 0, 0, 0, 0, 0, 0, 'CISL VENETO SERVIZI', 'INFORMATICO', 'Via Cacciatori del Sile 23', 31100, 'Treviso (TV)', 'Bulighin Mario', 'Bulighin Mario', '3346615998', '8.30', '12.30', '14.30', '18.30', 'm.bulighin@cisl.it', 'www.cislbellunotreviso.it', 0, 'servizi al cittadino', 'CISL VENETO SERVIZI', 'Via Cacciatori del Sile 23', 'Treviso (TV)', 'Roberto Miguel Griffa', '1975-01-14', 'Concordia (Argentina)', '03099360269', '3279/C24D', 'GRFRRT75A14Z600H', '2019-05-04', ''),
(26, 0, 1, 0, 0, 0, 0, 0, 'COMPUTER SRL', 'INFORMATICO', 'v. Conegliano 94/B', 31015, 'Susegana (TV)', 'Sartor Giovanni', 'Dei Negri Gino', '0438 450500', '8.15', '12.15', '14.00', '18.00', 'sartor@computersrl.com', 'www.computersrl.com', 13, 'servizi informatici', 'COMPUTER SRL', 'v. Conegliano 94/B', 'Susegana (TV)', 'Giovanni Sartor', '1946-08-05', 'San Vendemmiano (TV)', '0721520260', '3279/C24D', 'SRTGNN46M05I382A', '2019-05-04', ''),
(27, 0, 0, 0, 0, 0, 0, 0, 'COMPUTERWARE SRL', 'INFORMATICO', 'Viale Brigata Treviso 21/d', 31100, 'Treviso (TV)', 'Vicelli Pierluigi', 'Vicelli Pierluigi', '0422 422422', '8.30', '12.30', '14.30', '18.30', 'info@0422422422.it', '', 10, 'servizi informatici', 'COMPUTERWARE SRL', 'Viale Brigata Treviso 21/d', 'Treviso (TV)', 'Vicelli Pierluigi', '1977-10-09', 'Conegliano (TV)', '04870230267', '3279/C24D', 'VCLPLG77R09C957J', '2019-05-04', ''),
(28, 0, 0, 0, 0, 0, 0, 0, 'COMUNE DI NERVESA', 'INFORMATICO', 'Piazza La Piave 1', 31040, 'Nervesa della Battaglia (TV)', 'Tomietto Maria Rosa', 'Tomietto Maria Rosa', '0422 886231', '8.00', '13.30', '14.30', '18.00', 'segreteria@comune.nervesa.tv.it', '', 20, 'ATECO 841110, ISTAT 026050', 'COMUNE DI NERVESA', 'Piazza La Piave 1', 'Nervesa della Battaglia (TV)', 'Tomietto Maria Rosa', '1966-04-21', 'Nervesa della Battaglia (TV)', '00638210260', '2633/C24', 'TMTMRS66D61F872S', '2021-02-20', ''),
(29, 0, 0, 0, 0, 0, 0, 0, 'COMUNICA COOPERATIVA SOCIALE ONLUS', 'INFORMATICO', 'V. Galvani 21/III', 31020, 'Villorba (TV)', 'Corregioli Daniele', 'Corregioli Daniele', '0422 432745', '', '', '', '', 'info@cooperativacomunica.org', '', 11, 'animazione, educazione, corsi formazione', 'COMUNICA COOPERATIVA SOCIALE ONLUS', 'Lungosile Mattei, 23', 'Treviso (TV)', 'Marconi Matteo', '0000-00-00', 'Treviso (TV)', '03715800268', '2538/C24D', 'MRCMTT90T16L407R', '2017-05-31', ''),
(30, 0, 0, 0, 0, 0, 0, 0, 'SER. COOP. DE. Soc. Coop.', 'INFORMATICO', 'Via Roma 4/D', 31020, 'Lancenigo di Villorba (TV)', 'Danila Attene', 'Danila Attene', '0422 910926', '8.30', '12.30', '13.30', '17.30', 'servizi.bltv@confcooperative.it', 'www.bellunotreviso.confcooperative.it', 13, 'servizi alle imprese', 'SER. COOP. DE. Soc. Coop.', 'Via Roma 4/D', 'Lancenigo di Villorba (TV)', 'Claudio Venturin', '1955-12-21', 'Vazzola (TV)', '01757300262', '7416/C24D', 'VNTCLD55T21L700F', '2021-05-25', ''),
(31, 0, 1, 0, 0, 0, 0, 0, 'CONSULMARC SVILUPPO', 'INFORMATICO', 'Via Pezza alta10/a', 31046, 'Oderzo (TV)', 'Bragato Lidia', 'Bragogna Davide', '0422 853611', '9.00', '13.00', '14.00', '18.00', 'selezione@consulmarc.it', 'www.consulmarc.it', 0, 'servizzi innovativi aziende', 'CONSULMARC SVILUPPO', 'Via Pezza alta10/a', 'Oderzo (TV)', 'Elena Toffolo', '1951-08-27', 'Venezia (VE)', '02116310281', '3279/C24D', 'TFFLNE51M67L736M', '2019-05-04', ''),
(32, 0, 0, 0, 0, 0, 0, 0, 'CONTARINA SPA', 'INFORMATICO', 'Via Vittorio Veneto 6', 31027, 'Spresiano (TV)', 'Matteo Barbon', 'Luigi Zanutto, Manuel Carniato', '0422 916500, 3601066501', '8.15', '13.00', '14.00', '17.45', 'contarina@contarina.it', 'www.contarina.it', 0, '', 'CONTARINA SPA', 'Via Vittorio Veneto 6', 'Spresiano (TV)', 'Rasera Michele', '1965-09-07', 'Treviso (TV)', '02196020263', '3279/C24D', 'RSRMHL69P07L407Z', '2019-05-05', ''),
(33, 0, 0, 0, 0, 0, 0, 0, 'CONTE GESTIONI SAS', 'INFORMATICO', 'V. L. Galvani 6/A', 31027, 'Spresiano (TV)', 'Conte Michele', 'Conte Michele', '0422 521063', '', '', '', '', 'francesca@contegestioni.it', '', 10, 'elaborazione dati', 'CONTE GESTIONI SAS', 'V. L. Galvani 6/A', 'Spresiano (TV)', 'Rocco Francesca', '1963-09-09', 'Treviso (TV)', '04316670266', '2589/C24D', 'RCCFNC63P49L407V', '2017-06-05', ''),
(34, 0, 0, 0, 0, 0, 0, 0, 'DATA VENETA COMPUTERS', 'INFORMATICO', 'v. Mattei 2', 31030, 'Casier (TV)', 'Brusadin Roberto', 'Brusadin Roberto', '0422 381109', '', '', '', '', 'r.brusadin@dataveneta.it', 'www.dataveneta.it', 14, 'servizi informatici', 'DATA VENETA COMPUTERS', 'v. Mattei 2', 'Casier (TV)', 'Andrea Barbon', '1966-11-23', 'Treviso (TV)', '04492410263', '7561/C17', 'BRBNDR66S23L407D', '2016-12-12', ''),
(35, 0, 0, 0, 0, 0, 0, 0, 'DBA LAB SPA', 'INFORMATICO', 'viale Felissent 20/D', 31020, 'Villorba (TV)', '', '', '0422 318811', '8.30', '12.30', '13.30', '17.30', 'info@dbalab.it', 'www.dbala.it', 1, 'servizi informatici', 'DBA LAB SPA', 'viale Felissent 20/D', 'Villorba (TV)', 'Raffaele De Bettin', '1963-11-10', 'Auronzo di cadore (BL)', '04489820268', '3279/C24D', 'DBTRFL63S10A501E', '2019-05-04', ''),
(36, 0, 3, 0, 0, 0, 0, 0, 'E-SERVICES (De Longhi)\r\n', 'INFORMATICO', 'Via Treviso 42 (V. Duca D Aosta 121)\r\n', 31030, 'Silea (Mignagola di Carbonera) (TV)\r\n', 'Soligo Romano', 'Soligo Romano', '0422 413096', '9.00', '13.00', '14.00', '17.30', 'mariagiulia.paolucci@delonghigroup.com', '', 251, 'Ateco 62.09.09', 'E-SERVICES (De Longhi)\r\n', 'V. L. Seitz, 47', 'Treviso (TV)', 'Ceschin Roberto', '1966-02-28', 'Conegliano (TV)', '03486540267', '14639/C24', 'CSRRRT66B28C957D', '2021-09-17', ''),
(37, 0, 0, 0, 0, 0, 0, 0, 'DELLA TOFFOLA SPA', 'INFORMATICO', 'v. Feltrina Sud 72', 31040, 'Trevignano (TV)', 'Paneghel Laura', 'Paneghel Laura', '0423 677300', '', '', '', '', 'lpaneghel@della toffola.it', 'www.dellatoffola.it', 150, 'metalmeccanico', 'DELLA TOFFOLA SPA', 'v. Feltrina Sud 72', 'Trevignano (TV)', 'Vittorio Della Toffola', '1944-05-02', 'Montebelluna (TV)', '00556470268', '214/C24D', 'DLLVTR44E02F443W', '2017-01-17', ''),
(38, 0, 0, 0, 0, 0, 0, 0, 'DELTA LINE', 'INFORMATICO', 'Terraglio  106', 31100, 'Treviso (TV)', 'Corrado Scalto', 'Corrado Scalto', '0422 403077', '8.30', '12.30', '15.00', '19.00', 'info@deltaline.it', '', 0, '', 'DELTA LINE', 'Terraglio  106', 'Treviso (TV)', 'Corrado Scalco', '1969-08-14', 'Treviso (TV)', '03045900267', '3279/C24D', 'SCLCRD69M14L407Q', '2019-05-04', ''),
(39, 0, 1, 0, 0, 0, 0, 0, 'DIGIWARE SRL (adesso si chiama HENKO (Marghera))', 'INFORMATICO', 'Via Galilei 5 ', 31021, 'Mogliano Veneto (TV)', 'Scarfi  Michele', 'Scarfi  Michele', '041 5936176', '9.00', '13.30', '14.30', '18.00', 'info@henko.it', 'www.henko.it', 11, 'servizi informatici', 'HENKO SRL', 'Via delle industrie, 17/A', 'Venezia (VE)', 'Michele Scarfì', '1962-05-17', 'Venezia (VE)', '04531800276', '216/C24D', 'SCRMHL62E17L736W', '2017-01-17', ''),
(40, 0, 0, 0, 0, 0, 0, 0, 'DIMOORA', 'INFORMATICO', 'Viale Liegi 35/B', 198, 'Roma (RM)', 'Pierpaolo Ranieri', 'Pierpaolo Ranieri', '068552053/3395321016', '', '', '', '', 'p.ranieri@dimoora.it', 'https://www.dimoora.it/', 10, 'sviluppo siti web', 'DIMOORA', 'Viale Liegi 35/B', 'Roma (RM)', 'Pier Paolo Ranieri', '1982-01-12', 'Roma (RM)', '15524401005', '13388/C24', 'RNRPPL82A12H501C', '2020-10-26', ''),
(41, 0, 2, 0, 0, 0, 0, 0, 'DIRECT FROM ITALY', 'INFORMATICO', 'Viale Appiani 26/A', 31100, 'Treviso (TV)', 'Andolfo Denis ', 'AndolfoDenis', '348 0633710', '9.00', '13.00', '14.30', '18.30', 'info@directfromitaly.it', '', 44470, 'Ateco 47.91.1', 'DIRECT FROM ITALY', 'Viale Appiani 26/A', 'Treviso (TV)', 'Andolfo Denis', '1971-09-07', 'Montebelluna (TV)', '05031550261', '0013391/c24', 'NDLDNS71P07F443B', '2021-09-04', ''),
(42, 0, 0, 0, 0, 0, 0, 0, 'DOCTOR MOUSE', 'INFORMATICO', 'v. Castellana 46', 31100, 'Treviso (TV)', 'Grilli Fabio', 'Grilli Fabio', '0422 433522', '', '', '', '', 'info@doctormouse.it', 'www.doctormouse.it', 1, 'servizi informatici', 'DOCTOR MOUSE', 'v. Castellana 46', 'Treviso (TV)', 'Fabio Grilli', '1966-11-29', 'Brindisi (BR)', '04504040264', '7902/C24', 'GRLFBA66S29BI80D', '2016-12-27', ''),
(43, 0, 0, 0, 0, 0, 0, 0, 'DOLCEFREDDO MORALBERTI SRL', 'INFORMATICO', 'v. San Marco 17', 31052, 'Maserada sul Piave (TV)', 'Moratto Giovanni', 'Moratto Giovanni', '0422 686679', '', '', '', '', 'info@moralberti.com', 'www.moralberti.com', 0, 'commercio alimenti surgelati', 'DOLCEFREDDO MORALBERTI SRL', 'v. San Marco 17', 'Maserada sul Piave (TV)', 'Giovanni Moratto', '1967-08-24', 'Crocetta del Montello (TV)', '03012770263', '280/C24D', 'MRTGNN67M24C670I', '2017-01-19', ''),
(44, 0, 0, 0, 0, 0, 0, 0, 'EASY PC SRL', 'INFORMATICO', 'Via Bruno Maderna 7/23', 30174, 'Mestre (VE)', 'Pizzato Dario', 'Pizzato Dario', '041 971229', '9.00', '13.00', '14.00', '18.00', 'info@easy.pc.it', 'www.easy.pc.it', 1, 'servizi informatici', 'EASY PC SRL', 'Via Bruno Maderna 7/23', 'Mestre (VE)', 'Pizzato Dario', '1975-08-08', 'Treviso (TV)', '03226510273', '3279/C24D', '', '2019-05-04', ''),
(45, 0, 0, 0, 1, 1, 0, 0, 'ECMA SRL', 'INFORMATICO', 'V. Antonio Canova 7', 31040, 'Giavera del Montello (TV)', 'Anziliero Angela', 'Anziliero Angela', '0422 775153', '6.00', '14.00', '14.00', '22.00', 'info@ecmamobili.com', 'www.ecmamobili.com', 11, 'Elementi per mobili', 'ECMA SRL', 'V. Antonio Canova 7', 'Giavera del Montello (TV)', 'Angela Anziliero', '1986-01-20', 'Valdobbiadene (TV)', '01894010261', '6429/C24', 'NZLNGL86A60L565I', '2021-05-07', ''),
(46, 0, 0, 0, 0, 0, 0, 0, 'ECONATURASI  SPA', 'INFORMATICO', 'Via Palù 23', 31020, 'S. Vendemiano (TV)', 'Zanoni Roberto', 'Zamolli Alessandro', '045 8918611', '', '', '', '', 'personale@econaturasi.it', '', 251, 'commercio all ingrosso e al dettaglia', 'ECONATURASI  SPA', 'Via L. De Besi, 20/C', 'Verona (VR)', 'Zanini Roberto', '1953-03-26', 'Verona (VR)', '02010550263', '1928/c24d', 'ZNNRRT53C26L781S', '2017-04-22', ''),
(47, 0, 0, 0, 1, 1, 0, 0, 'EFFICIENTA SCRL', 'INFORMATICO', 'v. Enrico Mattei 8', 31059, 'Zero Branco (TV)', 'De Benedetti fabrizio', 'De Benedetti fabrizio', '0422 1626815', '8.00', '12.00', '13.30', '17.30', 'info@efficienta.it', '', 10, '', 'EFFICIENTA SCRL', 'v. Enrico Mattei 8', 'Zero Branco (TV)', 'De Benedetti fabrizio', '1971-09-25', 'Treviso (TV)', '0459160268', '3279/C24D', 'DBNFRZ71P25L407J', '2019-05-04', ''),
(48, 0, 0, 0, 0, 0, 0, 0, 'EMERGO S.R.L.', 'INFORMATICO', 'Via Scattolin 26', 31055, 'Quinto (TV)', 'Gasparini Franco', 'Bortoletto Ivan', '0422 445426', '0,333333333333333', '0,541666666666667', '14.00', '17.00', 'amministrazione@emergo.srl', '', 10, 'Ateco 43.21.02 - Progett.Realiz.Manut.Imp.e Sistem', 'EMERGO S.R.L.', 'Viale della Repubblica 209', 'Treviso (TV)', 'Miglioranza Ido', '1973-09-14', 'Treviso (TV)', '04467060267', '6928', 'MGLDIO73P14L407E', '2021-05-17', ''),
(49, 0, 0, 0, 0, 0, 0, 0, 'ENTER SNC', 'INFORMATICO', 'v. Cavallotti 80', 31015, 'Conegliano (TV)', 'Bragato Stefano', 'Bragato Stefano', '0438 418632', '', '', '', '', 'entersnc@alice.it', 'www.enterlab.net', 2, 'commercio e servizi informatici', 'ENTER SNC', 'v. Cavallotti 80', 'Conegliano (TV)', 'Vittorio Della Toffola', '1944-05-02', 'Montebelluna (TV)', '0556470268', '7908/C24', 'DLLVTR44EO2F443W', '2016-12-27', ''),
(50, 0, 0, 0, 0, 0, 0, 0, 'ENTERPRISE GROUP SRL', 'INFORMATICO', 'v. Adige 10', 31027, 'Spresiano (TV)', 'Bertozzi Andrea', 'Bertozzi Andrea', '0422 5225', '', '', '', '', 'andrea.bertozzi@levia.it', 'www.levia.it', 34, 'commercio e servizi informatici', 'ENTERPRISE GROUP SRL', 'v. Adige 10', 'Spresiano (TV)', 'Lucio Scaramella', '1963-06-09', 'Udine (UD)', '04771480284', '321/C24D', 'SCRLCU63H09L483T', '2017-01-21', ''),
(51, 0, 0, 0, 0, 0, 0, 0, 'ERA DEL COMPUTER', 'INFORMATICO', 'v. Vittorio Veneto 66', 31030, 'Carbonera (TV)', 'Erald Dermani', 'Erald Dermani', '0422397102/3665026826', '', '', '', '', 'info@eradelcomputer.com', 'www.eradelcomputer.com', 0, 'servizi informatici', 'ERA DEL COMPUTER', 'v. Vittorio Veneto 66', 'Carbonera (TV)', 'Domenico Baldasso', '1977-07-23', 'Treviso (TV)', '04362080261', '61/C24D', 'BLDDNC77L23L407N', '2017-01-10', ''),
(52, 0, 0, 0, 0, 0, 0, 0, 'ESSE LINK S.R.L.', 'INFORMATICO', 'v. Adige10', 31027, 'Spresiano (TV)', 'Fumei Gianluca', 'Fumei Gianluca', '0422 5225', '8.30', '12.30', '14.00', '18.00', 'amministrazione@esselink.it', '', 10, 'Servizi informatici', 'ESSE LINK S.R.L.', 'v. Adige, 101/a', 'Spresiano (TV)', 'Fumei Gianluca', '1968-02-24', 'Treviso (TV)', '04737710261', '3279/C24D', 'FMUGLC68B24L407I', '2019-05-04', ''),
(53, 0, 0, 0, 0, 0, 0, 0, 'ETA BETA DI BOLOGNI FEDERICO', 'INFORMATICO', 'v. Immacolata di Lourdes 135/B', 31015, 'Conegliano (TV)', 'Bolognin Federico', 'Bolognin Federico', '0438 21871', '', '', '', '', 'info@etabetacomputer.net', 'www.etabetacomputer.net', 2, 'commercio, servizi informatici', 'ETA BETA DI BOLOGNI FEDERICO', 'v. Immacolata di Lourdes 135/B', 'Conegliano (TV)', 'Federico Bologni', '1971-10-02', 'Vittorio Veneto (TV)', '03835750260', '325/C24D', 'BLGFRC71R02M089K', '2017-01-21', ''),
(54, 0, 0, 0, 0, 0, 0, 0, 'EURISING SRL', 'INFORMATICO', 'Via Delle Industrie 15', 30175, 'Venezia (VE)', 'Palmerini Riccardo', 'Palmerini Riccardo', '393 9033134', '', '', '', '', 'info@eurising.eu', '', 10, 'Gestione database', 'EURISING SRL', 'Via Delle Industrie 15', 'Venezia (VE)', 'Palmerini Riccardo', '1965-01-30', 'Bologna (BO)', '04345310272', '168/C24D', 'PLMRCR65A30A944A', '2018-01-11', ''),
(55, 0, 0, 0, 0, 0, 0, 0, 'FILIPPO MARIA MARIANI SRL (peendy)', 'INFORMATICO', 'Borgo Cavour 45', 31100, 'Treviso (TV)', '', '', '3886482784', '', '', '', '', '', '', 0, '', 'FILIPPO MARIA MARIANI SRL (peendy)', 'Borgo Cavour 45', 'Treviso (TV)', '', '0000-00-00', '', '', '3279/C24D', '', '2019-05-04', ''),
(56, 0, 0, 0, 0, 0, 0, 0, 'FIN.IT SRL', 'INFORMATICO', 'v. Alfieri 1', 31015, 'Conegliano (TV)', 'Donadel Gianni', 'Donadel Gianni', '0438 360757', '8.30', '13.00', '14.30', '18.00', 'selezione@finini', '', 11, 'consulenza informatica', 'FIN.IT SRL', 'v. Alfieri 1', 'Conegliano (TV)', 'Donadel Gianni', '1957-08-19', 'Pieve di Soligo (TV)', '03424670267', '3279/C24D', 'DNGGNN57M19G645I', '2019-05-04', ''),
(57, 0, 0, 0, 0, 0, 0, 0, 'FLO.IT SRL', 'INFORMATICO', 'Via Castellana 48A', 31039, 'Riese Pio x (TV)', '', '', '0423 4532', '', '', '', '', '', '', 0, 'Ateco 46731 - rivendita legname', 'FLO.IT SRL', 'Via Castellana 48A', 'Riese Pio x (TV)', 'Florian Elvio', '1956-08-29', 'Loria (TV)', '04304100268', '13268/C24', 'FLRLVE56M29E692U', '2020-10-23', ''),
(58, 0, 1, 0, 0, 0, 0, 0, 'FOURTEEN TEC', 'INFORMATICO', 'V.le Fellissent 86/c', 31100, 'Treviso (TV)', 'Palmisano Carmen', 'Palmisano carmen', '0422 1722976', '9.00', '13.00', '14.00', '18.00', 'info@fourteentec.com - carmen.palmisano@fourteentec.com', '', 0, 'consulenza informatica', 'FOURTEEN TEC', 'V.le Fellissent 86/c', 'Treviso (TV)', 'Palmisano Carmen', '1986-12-14', 'Bari (BA)', '03446101200', '6431/C24', 'PLMCMN86T54A66', '2021-05-07', ''),
(59, 0, 1, 0, 0, 0, 0, 0, 'GAM GROUP SRL', 'INFORMATICO', 'Via Callalta 31/E', 31100, 'Treviso (TV)', 'Mirko Mellone', 'Walter Zoccarato', '0422 583693/Sonia Maiano 3388106873', '9.00', '13.00', '14.00', '18.00', 'sonia.maiano@gamgroup.it', 'https://gamgroup.it/it/', 15, 'Servizi informatici', 'GAM GROUP SRL', 'Via Callalta 31/E', 'Treviso (TV)', 'Mirko Mellone', '1967-09-18', 'Treviso (TV)', '03641560267', '13546/C24', 'MLLMRK67P18L407P', '2020-10-29', ''),
(60, 0, 0, 0, 0, 0, 0, 0, 'GEISOFT SRL', 'INFORMATICO', 'v.le Veneto 38', 31015, 'Conegliano (TV)', 'Scarpel Sergio', 'Scarpel Sergio', '0438 23295', '9.00', '13.00', '14.00', '18.00', 'sergio.scarpel@geisoft.com', 'www.geisoft.com', 8, 'servizi informatici', 'GEISOFT SRL', 'v.le Veneto 38', 'Conegliano (TV)', 'Mauro Roggio', '1961-08-28', 'Treviso (TV)', '03075490262', '3279/C24D', 'RGGMRA61M28L407L', '2019-05-04', ''),
(61, 0, 0, 0, 0, 0, 0, 0, 'HOT SPOT S.R.L.', 'INFORMATICO', 'v.Cappella 34/D', 31059, 'Zero Branco (TV)', 'Roccaro Carlo', 'Roccaro Carlo', '0422 978720', '', '', '', '', 'carlo@hotspotsrl.it', '', 10, '', 'HOT SPOT S.R.L.', 'v.Cappella 34/D', 'Zero Branco (TV)', 'Roccaro Carlo', '1972-12-10', 'Mirano (VE)', '03528630274', '3141/C24D', 'RCCCRL72T10F241H', '2017-06-26', ''),
(62, 0, 0, 0, 0, 0, 0, 0, 'HENKO SRL', 'INFORMATICO', 'Via Delle Industrie 17/A', 30175, 'Venezia (VE)', 'Gianluca Romanelli', 'Marco Baù', '041 8629000', '9.00', '13.30', '14.30', '18.00', 'info@henko.it', '', 11, '', 'HENKO SRL', 'Via DELLE INDUSTRIE, 17/A', 'Venezia (VE)', 'Scarfì Michele', '1962-05-17', 'Venezia (VE)', '04531800276', '6448/C24', 'SCRMHL62E17L736W', '2021-05-07', ''),
(63, 0, 0, 0, 0, 0, 0, 0, 'HUNEXT SOFTWARE SRL', 'INFORMATICO', 'v. Terraglio 263/A', 31022, 'Preganziol (TV)', 'Bortolin Marco', 'Bortolin Marco', '0422 633882', '8.30', '13.00', '14.00', '17.00', 'software@hunext.com', 'www.hunext.com', 8, 'servizi informatici', 'HUNEXT SOFTWARE SRL', 'v. Terraglio 263/A', 'Preganziol (TV)', 'Mauro Badalin ', '1964-11-17', 'Quarto d Altino (VE)', '04505810269', '3279/C24D', 'BDLMRA64S17H117X', '2019-05-04', ''),
(64, 0, 0, 0, 0, 0, 0, 0, 'ICT4B2B SRL', 'INFORMATICO', 'v. Treviso 55', 31020, 'Silea (TV)', 'Fiorin Franco', 'Fiorin Franco', '0422 363320', '9.00', '13.00', '14.00', '18.30', 'enrico.fiorin@ict4b2b.com', 'www.ict4b2b.com', 19, 'servizi informatici', 'ICT4B2B SRL', 'v. Treviso 55', 'Silea (TV)', 'Franco Fiorin', '1960-12-30', 'Treviso (TV)', '04839900265', '3279/C24D', 'FRNFNC60T30L407R', '2019-05-04', ''),
(65, 0, 1, 0, 0, 0, 0, 0, 'IDEA GRIP SNC', 'INFORMATICO', 'V.lo Zaccaria 4', 31039, 'Quinto di Treviso (TV)', 'Franceschet Mauro', 'Franceschet Mauro', '0422 97097', '8.30', '12.30', '14.30', '18.30', 'amministrazione@ideagrip.it', '', 0, 'servizi informatici', 'IDEA GRIP SNC', 'V.lo Zaccaria 4', 'Quinto di Treviso (TV)', 'Franceschet Mauro', '1970-01-03', 'Torino (TO)', '04045190263', '2621/C24', 'FRNMRA70A03L219D', '2021-02-20', ''),
(66, 0, 0, 0, 0, 0, 0, 0, 'INTERPUTER', 'INFORMATICO', 'v. Padova 73/B', 30037, 'Scorzè (VE)', 'Ruosi Marco', 'Ruosi Marco', '041 5840663', '', '', '', '', 'info@interputer.it', 'www.interpunter.it', 3, 'commercio e servizi informatici', 'INTERPUTER', 'v. Padova 73/B', 'Scorzè (VE)', 'Marco Ruosi', '1957-02-24', 'Cavezzo (MO)', '03464640279', '7862/C24', 'RSUMRC57B24C398C', '2016-12-23', ''),
(67, 0, 0, 0, 0, 0, 0, 0, 'IRF EUROPA', 'INFORMATICO', 'via Francesco ferrara3', 31030, 'Casier (TV)', 'Gabriele Biasetto', 'Gabriele Biasetto', '422340145', '', '', '', '', 'irf-europa@irf-europa.com', 'www.irf-europa.com', 20, 'mettallurgico', 'IRF EUROPA', 'via Francesco ferrara3', 'Casier (TV)', 'Giovanni Piccoli', '1963-09-19', 'Paese (TV)', '01060420018', '347/C24D', 'PCCGNN63P19G229W', '2017-01-23', ''),
(68, 0, 2, 0, 0, 0, 0, 0, 'JAZZ INFORMATICA', 'INFORMATICO', 'Via Donatori del Sangue 7', 31020, 'Villorba (TV)', '', '', '339 3377039', '9.00 ', '12.30', '15.30', '19.00', 'box@jazzinformatica.it', 'www.jazzinformatica.it', 0, 'servizi hardware informatici', 'JAZZ INFORMATICA', 'Via Donatori del Sangue 7', 'Villorba (TV)', 'Lucio rettore', '1968-07-06', 'Maser (TV)', '04331790263', '3279/C24D', 'RTTLCU68L06F009Q', '2019-05-04', ''),
(69, 0, 0, 0, 0, 0, 0, 0, 'JMAX SRL', 'INFORMATICO', 'Via dell economia 8/e', 35010, 'Trebaseleghe (PD)', 'Della Regina Andrea', 'Della Regina Andrea', '049 9387939', '8.30', '12.30', '14.30', '18.30', 'michela.bonetti@jmax.it', '', 0, '', 'JMAX SRL', 'Via dell economia 8/e', 'Trebaseleghe (PD)', 'Rogante Fabio', '1964-11-28', 'Venezia (VE)', '03412960274', '3279/C24D', '', '2019-05-04', ''),
(70, 0, 0, 0, 0, 0, 0, 0, 'KART 2000 INTERNATIONAL SRL', 'INFORMATICO', 'Via Enrico Fermi 29/b', 31046, 'Oderzo (TV)', 'Peater Gamelli', 'Peater Gamelli', '393 8479990', '8.15', '12.30', '14.30', '17.30', 'info@kart2000.com', 'www.solutiontiming.com', 44470, '', 'KART 2000 INTERNATIONA SRL', 'Via Enrico Fermi, 29/b', 'Oderzo (TV)', 'Parato Giovanni', '1962-05-10', 'Erchie (br)', '03619650264', '7167/C24D', 'PRTGNN62E10D422Q', '2021-05-20', ''),
(71, 0, 0, 0, 0, 0, 0, 0, 'KIMIA', 'INFORMATICO', 'Via dell Indipendenza 8', 31050, 'Ponzano Veneto (TV)', '', '', '0422 440818', '', '', '', '', 'amministrazione@kimiasrl.it', 'www.kimiasrl.com', 0, 'analisi chimiche', 'KIMIA', 'Via dell Indipendenza 8', 'Ponzano Veneto (TV)', 'Valter Parin', '1952-08-09', 'Treviso (TV)', '03332420268', '470/C24D', 'PSNVTR52M09L407C', '2017-01-28', ''),
(72, 0, 0, 0, 0, 0, 0, 0, 'KODIS SRL', 'INFORMATICO', 'V. Enrico Azzi 1', 31038, 'Paese (TV)', '', '', '0422 1760695', '', '', '', '', 'info@kodis.com', '', 0, 'Industria 4.0', 'KODIS SRL', 'V. Enrico Azzi 1', 'Paese (TV)', '', '0000-00-00', '', '', '', '', '0000-00-00', ''),
(73, 0, 2, 0, 0, 0, 0, 0, 'KUIK', 'INFORMATICO', 'Vicolo Giuseppe Verdi 89', 31020, 'Villorba (TV)', 'Diego Visentin', 'Diego Visentin', '340 224 7886', '', '', '', '', 'dv@kuik.it', '', 0, 'Servizi informatici', 'KUIK', 'Vicolo Giuseppe Verdi 89', 'Villorba (TV)', 'Visentin Diego', '1980-12-28', 'Conegliano (TV)', '04498830266', '13321/C24', 'VSNDGI80T28C957R', '2020-10-24', ''),
(74, 0, 0, 0, 0, 0, 0, 0, 'LAVANDERIA PIAVE S.R.L', 'INFORMATICO', 'Via G. Mazzini 64', 31010, 'Cimadolmo (TV)', 'Mario Baro', 'Mario Baro', '0422 743090', '', '', '', '', 'mario.baro@lavanderiapiave.it', 'http://www.lavanderiapiave.it/', 0, 'Servizi di pulizia', 'LAVANDERIA PIAVE S.R.L', 'Via G. Mazzini 64', 'Cimadolmo (TV)', 'Baro Igino', '1956-01-14', 'Cimadolmo  (TV)', '00856030267', '13783/C24', 'BRAGNI56A14C689Y', '2021-09-09', ''),
(75, 0, 0, 0, 0, 0, 0, 0, 'MHT SRL', 'INFORMATICO', 'Via Roma 4', 31020, 'Villorba (TV)', 'PATRIZIA ULERI', 'Coin Franco', '0422 911796', '', '', '', '', 'talent@mht.net', 'www.mht.net', 1, 'servizi informatici', 'MHT SRL', 'Via Roma 4', 'Villorba (TV)', 'PATRIZIA ULERI', '1959-06-24', 'Pont-Canadese (TO )', '03305220265', '348/C24D', 'LRUPRZ59H64G826Z', '2017-01-23', ''),
(76, 0, 0, 0, 0, 0, 0, 0, 'MIDI MEDIA', 'INFORMATICO', 'v. Noalese 37', 31100, 'Treviso (TV)', 'Roggio Mauro', 'Roggio Mauro', '0422 434456', '', '', '', '', 'info@midimedia.it', 'www.midimedia.it', 1, 'servizi informatici telecom', 'MIDI MEDIA', 'v. Noalese 37', 'Treviso (TV)', 'Mauro Roggio', '1961-08-28', 'Treviso (TV)', '03075490262', '7913/C24', 'RGGMRA61M28L407L', '2016-12-27', ''),
(77, 0, 0, 0, 0, 0, 0, 0, 'MILESTONE D3SIGN SRL', 'INFORMATICO', 'v. Friuli 10', 31020, 'S. Vendemiano (TV)', 'Jassica Genna', '', '0438 1918092', '', '', '', '', 'md3.finance@milestone-d3sign.com', '', 0, 'servizi finanziari', 'MILESTONE D3SIGN SRL', 'v. Friuli 10', 'S. Vendemiano (TV)', '', '0000-00-00', '', '', '3279/C24D', '', '2019-05-04', ''),
(78, 0, 0, 0, 0, 0, 0, 0, 'MIND-WARE ', 'INFORMATICO', 'via N.Machiavelli33', 31021, 'Mogliano Veneto (TV)', 'Beninatto Francesco', 'Beninatto Francesco', '3405906603', '', '', '', '', 'info@mind-ware.it', 'www.mind-ware.it', 0, 'servizi informatici', 'MIND-WARE ', 'via N.Machiavelli33', 'Mogliano Veneto (TV)', 'Giovanni Sartor', '1946-08-05', 'San Vendemmiano (TV)', '0721520260', '7889/C24', 'SRTGNN46M05I382A', '2016-12-27', ''),
(79, 0, 0, 0, 0, 0, 0, 0, 'MTS SRL', 'INFORMATICO', 'v.E.Reginato 85/H', 31100, 'Treviso (TV)', 'Pertile Marco', 'Pertile Marco', '3484048764', '', '', '', '', 'm.pertile@mtsinformatica.com', 'www.mtsinformatica.com', 1, 'servizi informatici', 'MTS SRL', 'v.E.Reginato 85/H', 'Treviso (TV)', 'Marco Pertile', '1972-12-25', 'Mestre (VE)', '03611030267', '337/C24D', 'PRTMRC721T25L736U', '2017-01-21', ''),
(80, 0, 0, 0, 0, 0, 0, 0, 'MUNICIPIO DI SAN BIAGIO DI C.', 'INFORMATICO', 'Via Postumia Centro 71', 31048, 'San Biagio di Callalta (TV)', '', '', '0422 894373 ', '', '', '', '', 'info@comune.sanbiagio.tv.it', '', 0, 'servizi informatici', 'MUNICIPIO DI SAN BIAGIO DI C.', 'Via Postumia Centro 71', 'San Biagio di Callalta (TV)', '', '0000-00-00', '', '80009250269', '3257/C24D', '', '2018-05-18', ''),
(81, 0, 3, 0, 0, 0, 0, 0, 'COMUNE DI TREVISO', 'INFORMATICO', 'v. Municipio16', 31100, 'Treviso (TV)', 'Coniglioni Venera', 'Roberto Meneghetti', '0422-658354', '8.00', '14.00', '15.00', '17.00', 'venera.coniglione@comune.treviso.it', 'www.comune.trevisso.it', 0, 'servizi informatici', 'COMUNE DI TREVISO', 'v. Municipio16', 'Treviso (TV)', 'Corocher Gaspare', '1965-12-21', 'Motta di Livenza (TV)', '80007310263', '7171/C24D', 'CRCGPR65T21F770P', '2018-05-18', ''),
(82, 0, 1, 0, 0, 0, 0, 0, 'MP INFORMATICA TREVISO', 'INFORMATICO', 'V. Santa Bona nuova 33/b', 31100, 'Treviso (TV)', 'Paba Mario', 'Paba Mario', '0422 1991085', '9.00', '12.30', '15.30', '19.30', 'info@mpinformatica33.it', '', 0, '', 'MP INFORMATICA TREVISO', 'V. Santa Bona nuova 33/b', 'Treviso (TV)', 'Paba Mario', '1972-12-21', 'Roma (RM)', '10413371005', '7189/C24D', '', '2021-05-20', ''),
(83, 0, 0, 0, 0, 0, 0, 0, 'NET-PRIME SRL', 'INFORMATICO', 'v. Adige 10/A', 31027, 'Spresiano (TV)', 'Soldera Luca', 'Soldera Luca', '0422 5225', '', '', '\r\n', '', 'luca.soldera@net-prime.it', 'www.net-prime.it', 7, 'servizi informatici', 'NET-PRIME SRL', 'v. Adige 10/A', 'Spresiano (TV)', 'Michele Scarfì', '1962-05-17', 'Venezia (VE)', '3192600272', '282/C24D', 'SCRMHL62E17L736W', '2017-01-19', ''),
(84, 0, 0, 0, 0, 0, 0, 0, 'NORDEST INFORMATICA SRL', 'INFORMATICO', 'v. Treviso 214', 31020, 'S. Vendemiano (TV)', 'Franco Fiorentini', 'Franco Fiorentini', '0438 1736453', '', '', '', '', 'info@neinformatica.it', 'www.neinformatica.it', 0, 'servizi informatici', 'NORDEST INFORMATICA SRL', 'v. Treviso 214', 'S. Vendemiano (TV)', 'Franco Fiorentini', '1963-01-05', 'Conegliano (TV)', '3175920267', '387/C24D', 'FRNFNC63A05C957Y', '2017-01-24', ''),
(85, 0, 0, 0, 0, 0, 0, 0, 'OASIS\r\n', 'INFORMATICO', '', 30175, 'Marghera (VE)', '', '', '', '', '', '', '', 'direzione@bbcc.it\r\n', '', 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '0000-00-00', ''),
(86, 0, 0, 0, 0, 0, 0, 0, 'OLOJIN SRL', 'INFORMATICO', 'Via Ferrovia 26', 31020, 'San Fior (TV)', 'Zanchetta Roberto', 'Zanchetta Roberto', '0438 409186', '', '', '', '', 'amministrazione@olojin.it', '', 20, '', 'OLOJIN SRL', 'Via Ferrovia 26', 'San Fior (TV)', 'Notturno Stefano', '1973-01-23', 'Conegliano V. (TV)', '1560130930', '2540/c24d', 'NTTSFN73A23C957Q', '2017-05-31', ''),
(87, 0, 0, 0, 0, 0, 0, 0, 'PANOTEC SRL', 'INFORMATICO', 'Via G. Polese 2', 31010, 'Cimadolmo (TV)', 'Dal Bo  Sabrina', 'Di Buscolo Marco', '0422 432715', '8.00', '12.00', '13.00', '17.00', 'uff.personale@panotec.it', '', 60, 'Industria manifatturiera', 'PANOTEC SRL', 'Via G. Polese 2', 'Cimadolmo (TV)', 'Capoia Giuseppe', '1954-03-17', 'Ponte di Piave (TV)', '02462930260', '1991/C24', 'CPAGPP54C17G846Z', '2018-03-23', ''),
(88, 0, 0, 0, 0, 0, 0, 0, 'PAPER ECO SRL', 'INFORMATICO', 'Via Pacinotti14', 31100, 'Casale sul Sile (TV)', 'Biasuzzi Andrea', 'Biasuzzi Andrea', '0422 670659', '8.30', '12.30', '13.30', '17.30', 'amministrazione@paper-eco.com', '', 44470, 'ATECO 17-21 ; ISTAT 026086 - Fabbricazione imballa', 'PAPER ECO SRL', 'Via Borin, 48', 'Treviso (TV)', 'Biasuzzi Andrea', '1968-08-22', 'Treviso (TV)', '05098310260', '4320/C24', 'BSZNDR86M22L407J', '2021-03-23', ''),
(89, 0, 0, 0, 0, 0, 0, 0, 'PARROCCHIA SAN BARTOLOMEO APOSTOLO', 'INFORMATICO', 'Piazza Chiesa 15', 31050, 'Ponzano Veneto (TV)', 'Bernardi Chiara', 'Feltrin Lisa', '0422 969183', '', '', '', '', 'infanzia.merlengo@alice.it', '', 10, 'parrocchia', 'PARROCCHIA SAN BARTOLOMEO APOSTOLO', 'Piazza Chiesa 15', 'Ponzano Veneto (TV)', 'Don Roberto Cavalli', '1957-11-10', 'Bassano del Grappa (VI)', '80008490262', '3279/C24D', 'CVLRRT57S10A703C', '2019-05-04', ''),
(90, 0, 0, 0, 0, 0, 0, 0, 'PCCLINIC', 'INFORMATICO', 'Via Tiziano Vecellio 2', 31030, 'Casier (TV)', 'Simone scaramuzza', 'Simone scaramuzza', '3401848845', '', '', '', '', 'info@assistenzapcclinic.it', 'www.assistenzapcclinic.it', 1, ' assistenza sistemistica aziendale', 'PCCLINIC', 'Via Tiziano Vecellio 2', 'Casier (TV)', 'Matteo Gottardo', '1974-04-22', 'Treviso (TV)', '3762800260', '349/C24D', 'GTTMTT74B22L407J', '2017-01-23', ''),
(91, 0, 0, 0, 0, 0, 0, 0, 'PLANETECH', 'INFORMATICO', 'v. Postumia 67', 31050, 'Ponzano Veneto (TV)', 'Mattiuzzo Maurizio', 'Mattiuzzo Maurizio', '0422 963090', '', '', '', '', 'info@planetechsrl.com', 'www.planetechsrl.com', 0, 'commercio e servizi informatici', 'PLANETECH', 'v. Postumia 67', 'Ponzano Veneto (TV)', 'Federico Cadamuro', '1967-10-06', 'Treviso (TV)', '3131070264', '7912/C24', 'CDMFRC67R06L407T', '2016-12-27', ''),
(92, 0, 0, 0, 0, 0, 0, 0, 'POLIFAR SRL', 'INFORMATICO', 'v. Don L. Sturzo 4', 30037, 'Scorzè (VE)', 'Biancon Luisa', '', '0422 97337', '', '', '', '', 'biancon@polifar.it', '', 10, 'Informatica', 'POLIFAR SRL', 'v. Don L. Sturzo 4', 'Scorzè (VE)', 'Gian Francesco Biancon', '1957-08-17', 'Scorze  (VE)', '03110210261', '', 'BNCGFR57M17I55G', '0000-00-00', ''),
(93, 0, 0, 0, 0, 2, 0, 0, 'PROVEN Sas', 'INFORMATICO', 'Via Bosco10', 31032, 'Casale sul Sile (TV)', 'Tronchin Alberto', 'Tronchin Alberto', '347 2703847', '', '', '', '', 'proven@proven.team', '', 0, '', 'PROVEN Sas', 'Via Bosco10', 'Casale sul Sile (TV)', 'Alberto Tronchin', '1972-04-26', 'Treviso (TV)', '05070360267', '7177/C24D', '', '2021-05-20', ''),
(94, 0, 0, 0, 0, 0, 0, 0, 'PUNTO INFORMATICO SRL', 'INFORMATICO', 'Largo Molino 2', 31020, 'Villorba (TV)', 'Zanin Claudia', 'Zanin Claudia', '0422 303171', '', '', '', '', 'info@pitv.it', 'www.pitv.it', 9, 'servizi informatici', 'PUNTO INFORMATICO SRL', 'Largo Molino 2', 'Villorba (TV)', 'Stefano Bassan', '1965-10-11', 'Treviso (TV)', '3204990265', '215/C24D', 'BSSSFN65R11L407K', '2017-01-17', ''),
(95, 0, 0, 0, 0, 0, 0, 0, 'QUA.D.R.A. S.R.L.', 'INFORMATICO', 'Via Dante 12\r\n', 31010, 'Orsago (TV)', 'Altinier Corrado\r\n', 'Daniotti Alberto', '0438 1710004', '9.00', '13.00', '14.00', '18.00', 'info@quadra-group.it', '', 44105, '71.1 - Progettazione,Realiz.ne prodotti Macchinari', 'QUA.D.R.A. S.R.L.', 'Via Friuli, 11', 'San vendemmiano (TV)', 'Altinier Corrado', '1964-12-24', 'Conegliano (TV)', '03392600262', '1252/C24D', 'LTNCRD64T24C957P', '2020-02-04', ''),
(96, 0, 1, 0, 0, 0, 0, 0, 'QUERTY LAB SRL', 'INFORMATICO', 'V. XXIV maggio 35/a', 31015, 'Conegliano (TV)', 'Casagrande Riccardo', 'Casagrande Riccardo', '3474424884', '', '', '', '', 'riccardo@qwertylab.it', 'www.qwertylab.it', 7, 'commercio e servizi informatici', 'QUERTY LAB SRL', 'V. XXIV maggio 35/a', 'Conegliano (TV)', 'Riccardo Casagrande', '1976-09-12', 'Conegliano (TV)', '4783000260', '165/C24D', 'CSGRCR76P12C957Y', '2017-01-13', ''),
(97, 0, 1, 0, 0, 0, 0, 0, 'RADIO TV 2000 SRL', 'INFORMATICO', 'v. Dante Alighieri 126/B', 31027, 'Spresiano (TV)', 'Gottardo Matteo', 'Modesto Ilaria', '0422 725644', '8.30', '12.30', '15.30', '19.30', 'info@radiotv2000.it', 'www.radiotv2000.expertonline.it', 8, 'commercio apparecchi', 'RADIO TV 2000 SRL', 'v. Dante Alighieri 126/B', 'Spresiano (TV)', 'Matteo Gottardo', '1974-04-22', 'Treviso (TV)', '3762800260', '3279/C24D', 'GTTMTT74B22L407J', '2019-05-04', ''),
(98, 0, 0, 0, 0, 0, 0, 0, 'REAN SPA', 'INFORMATICO', 'Via adige 10', 31027, 'Spresiano (TV)', 'Latin Sabina', 'Mancuso Luca', '0422 5225', '8.30', '12.30', '14.00', '14.00', 'sabina.latin@levia.it', '', 51, '', 'REAN SPA', 'Via Rugabella, 1', 'Milano (MI)', 'Parovel Alessandro', '1972-05-28', 'Trieste (TS)', '01233220324', '3279/C24D', 'PRVLSN72E28L424Q', '2019-05-04', ''),
(99, 0, 0, 0, 0, 0, 0, 0, 'ROBYONE SRL', 'INFORMATICO', 'Via Lazzaretto 10/B', 35010, 'Trebaselehe (PD)', 'Morello Roberto', 'Morello Roberto', '049 0998416', '8.30', '13.00', '14.30', '18.00', 'amministrazione@robyone.net', 'www.robyone.net', 11, '', 'ROBYONE SRL', 'Via Lazzaretto, 10/B', 'Trebaseleghe (PD)', 'Morello Roberto', '1968-11-06', 'Camposampiero (PD)', '04435720281', '6815/C24', 'MRLRRT68S06B563E', '2021-05-14', ''),
(100, 0, 0, 0, 0, 0, 0, 0, 'SARTORETTO SAS', 'INFORMATICO', 'v. S. Antonino 209', 31100, 'Treviso (TV)', 'Sartoretto Luca', 'Sartoretto Luca', '0422 321610', '', '', '', '', 'preventivi@sartoretto.com', 'www.sartoretto.com', 1, 'commercio e servizi informatici', 'SARTORETTO SAS', 'v. S. Antonino 209', 'Treviso (TV)', 'Luca Sartoretto', '1974-01-03', 'Treviso (TV)', '3738100266', '1009/C24D', 'SRTLCU74AOIL407P', '2017-02-27', ''),
(101, 0, 0, 0, 0, 0, 0, 0, 'SCINTILLE SRL', 'INFORMATICO', 'V. San Lazzaro 32', 31100, 'Treviso (TV)', 'Barbieri Bruno', '', '342 5159422 - 0422 301 115', '', '', '', '', 'bruno@scintille.net', 'www.scintille .net', 0, 'commercio e servizi informatici', 'SCINTILLE SRL', 'V. Saltorio, 7', 'Treviso (TV)', '', '0000-00-00', '', 'IT04636010268', '', 'BRBBRN73R22L407H', '0000-00-00', ''),
(102, 0, 0, 0, 0, 0, 0, 0, 'SHADO SRL', 'INFORMATICO', 'Via Sile 41 31056', 31056, 'Roncade (TV)', 'Alessandra Guido', 'Alessandra Guido', '0422 789611', '', '', '', '', 'alessandra.guido@h-farm.com', 'http://www.shado-srl.com', 0, 'servizi e analisi chimiche', 'SHADO SRL', 'Via Sile 41 31056', 'Roncade (TV)', '', '0000-00-00', '', '4153820263', '396/C24D', '', '2017-01-25', ''),
(103, 0, 0, 0, 0, 0, 0, 0, 'SIEI AUTOMAZIONI SRL', 'INFORMATICO', 'Via Verdi 5', 31010, 'San Michele di Piave - Cimadolmo (TV)', 'Sig.ra Ivana Betto', 'Sig.ra Ivana Betto', '0438 492525', '', '', '', '', 'amministrazione@sieiautomazioni.it', '', 0, 'http://www.sieiautomazioni.com/', 'SIEI AUTOMAZIONI SRL', 'Via Verdi 5', 'San Michele di Piave - Cimadolmo (TV)', 'Angelo Ros', '1958-08-24', 'Svizzera (EU)', '2468700261', '394/C24D', 'RSONGL58MZ4Z133F', '2017-01-25', ''),
(104, 0, 0, 0, 0, 0, 0, 0, 'SIES', 'INFORMATICO', 'viale 4 novembre  113', 31100, 'Treviso (TV)', 'Barbon Andrea', 'Barbon Andrea', '3482418930', '', '', '', '', 'amministrazione@sies.it', 'www.sies.it', 0, 'servizi informatici', 'SIES', 'viale 4 novembre  113', 'Treviso (TV)', 'Andrea Barbon', '1966-11-23', 'Treviso (TV)', '4492410263', '7911/C24', 'BRBNDR66S23L407D', '2016-12-27', ''),
(105, 0, 0, 0, 0, 0, 0, 0, 'SIPA SPA', 'INFORMATICO', 'Via Caduti del Lavoro 3', 31029, 'Vittorio Veneto (TV)', 'Liviero Alessandra', 'Rossetto Paolo', '0438 911511', '8.30', '12.30', '13.30', '17.30', 'personale@zoppas.com', '', 0, 'Progettazione e costruzione di impianti', 'SIPA SPA', 'Via Caduti del Lavoro 3', 'Vittorio Veneto (TV)', 'Narder Antonio', '1964-09-10', 'Conegliano (TV)', '01118790268', '3279/C24D', 'NRDNTN64P10C957X', '2019-05-04', ''),
(106, 0, 0, 0, 0, 0, 0, 0, 'SIX LAB SRL', 'INFORMATICO', 'Viale della Repubblica 235', 31100, 'Treviso (TV)', 'Genovese Andrea', 'Bergamo Yuri', '0422 484672', '9.00', '13.00', '14.00', '18.00', 'info@gruppogenovese.com', '', 43739, 'Sviluppo e programmazione software', 'SIX LAB SRL', 'Via giovanni Gasparini, 50', 'Porcellendo (TV)', 'Genovese Andrea', '1974-04-12', 'Treviso (TV)', '04885880262', '3279/C24D', 'GNVNDR74S12L407V', '2019-05-04', ''),
(107, 0, 2, 0, 0, 0, 0, 0, 'SMC TREVISO SRL', 'INFORMATICO', 'v. Roma 4', 31020, 'Villorba (TV)', 'Valeri Paolo', 'Valeri Paolo', '0422 608043', '8.30', '12.30', '14.00', '18.00', 'ufficio.personale@smc.it', 'www.smc.it', 2, 'servizi informatici', 'SMC TREVISO SRL', 'v. Roma 4', 'Villorba (TV)', 'Carlo Piccin', '1952-05-29', 'Conegliano (TV)', '3304900263', '3279/C24D', 'PCCCRL52E29C957T', '2019-05-04', ''),
(108, 0, 0, 0, 0, 0, 0, 0, 'SMURFIT KAPPA ITALIA SPA', 'INFORMATICO', 'v. Monti 12', 20123, 'Milano (MI)', 'Picot Livia', 'Coren Marco', '0438 757304', '8.30', '12.30', '14.30', '18.30', 'livia.picot@smurfitkappa.it', '', 51, 'Attività manifatturiera', 'SMURFIT KAPPA ITALIA SPA', 'Via IV novembre, 52', 'Susegana (TV)', 'Franchini Enrico', '1970-08-02', 'Vicenza (VI)', '07034140157', '3279/C24D', 'FRNNRC70M02L840S', '2019-05-04', ''),
(109, 0, 0, 0, 0, 0, 0, 0, 'SOLINF SRL', 'INFORMATICO', 'Via Piave 20', 31100, 'Treviso (TV)', 'Laura Annibal', 'Laura Annibal', '0422 306727', '', '', '', '', 'info@solinf.eu', '', 0, 'servizi informatici', 'SOLINF', 'Via Piave, 20', 'Treviso (TV)', 'Scarpa Marco', '1960-05-18', 'Venezia (VE)', '03692620267', '3279/C24D', 'SCRMRC60E18L736E', '2019-05-04', ''),
(110, 0, 0, 0, 0, 0, 0, 0, 'SOLUZIONI DIGITALI SRL', 'INFORMATICO', 'Via Monte Cervino 6', 30173, 'Venezia (VE)', 'Rossetto Enrico', 'Rossetto Enrico', '041 5351518', '', '', '', '', 'er@soluzionidigitali.com', '', 10, '', 'SOLUZIONI DIGITALI SRL', 'Via Monte Cervino 6', 'Venezia (VE)', 'Rossetto Enrico', '1967-05-19', 'Mestre (VE)', '3217460272', '2585/C24D', 'RSSNRC67E19L736E', '2017-06-05', ''),
(111, 0, 0, 0, 0, 0, 0, 0, 'SOTREVA SPA', 'INFORMATICO', 'v.le Montegrappa 27/B', 31100, 'Treviso (TV)', 'Stocco Davide', 'Stocco Davide', '0422 4374', '', '', '', '', 'davide.stocco@sotreva.com', 'www.sotreva.com', 62, 'commercio, autoveicoli', 'SOTREVA SPA', 'v.le Montegrappa 27/B', 'Treviso (TV)', 'Elena Toffolo', '1951-08-27', 'Venezia (VE)', '2116310281', '339/C24D', 'TFFLNE51M67L763M', '2017-01-23', ''),
(112, 0, 0, 0, 0, 0, 0, 0, 'SPECIFICI EUROPE SRL', 'INFORMATICO', 'v. Roma 101/5', 30020, 'Quarto d Altino (TV)', 'Salomoni Luca', 'Salomoni Luca', '0422 823977', '', '', '', '', 'l.salomoni@specifiglobal.com', 'www.specifiglobal.com', 15, 'servizi informatici', 'SPECIFICI EUROPE SRL', 'v. Roma 101/5', 'Quarto d Altino (TV)', 'Luca Salomoni', '1970-07-29', 'Quarto d Altino (VE)', '4311610275', '2016/C24D', 'SLMLCU70L29H117Q', '2017-01-16', ''),
(113, 0, 0, 0, 0, 0, 0, 0, 'START INFORMATICA', 'INFORMATICO', 'Via L. Einaudi 7', 31030, 'Casier (TV)', 'Bellio Massimo', 'Bellio Massimo', '0422 825222/3471063880', '9.00', '13.00', '14.00', '18.00', 'massimiliano@startinformaticasrl.it', '', 10, 'ateco 620909', 'START INFORMATICA', 'Via L. Einaudi 7', 'Casier (TV)', 'Massimo Bellio', '1967-11-04', 'VENEZIA (VE)', '03742490265', '14168/C24', 'BLLMSM67S04L736K', '2020-11-10', ''),
(114, 0, 0, 0, 0, 0, 0, 0, 'STESI  SRL', 'INFORMATICO', 'Vic.lo Cadore 29/7', 31020, 'S. Vendemiano (TV)', '', '', '0438/403271', '', '', '', '', 'info@stesi.it', 'www.stesi.it', 0, '', 'STESI  SRL', 'Vic.lo Cadore 29/7', 'S. Vendemiano (TV)', 'Cuscio Stefano', '1966-03-30', 'Adria', '04361220264', '2275/C24D', 'CDCSFN66C30A059K', '2017-05-17', ''),
(115, 0, 0, 0, 0, 0, 0, 0, 'STUDIO 3F SRL', 'INFORMATICO', 'p.ta Unità d Italia 13/1', 30010, 'Camponogara (VE)', 'Ferrini Andrea', 'Ferrini Andrea', '041 5100613', '', '', '', '', 'info@studio3f.it', 'www.3fwebtech.it', 3, 'servizi informatici', 'STUDIO 3F SRL', 'p.ta Unità d Italia 13/1', 'Camponogara (VE)', 'Ferrini Andrea', '1978-06-10', 'Dolo (VE)', '4506730268', '343/C24D', 'FRRNDR78H10D325O', '2017-01-23', ''),
(116, 0, 0, 0, 0, 0, 0, 0, 'SVILUPPO PROGETTI SOCIETA  COOPERATIVA', 'INFORMATICO', 'Via Pezza alta10/a', 31046, 'Oderzo (TV)', 'Nardini Riccardo', 'Furlan Lorenzo', '0422 853611', '9.00', '13.00', '14.00', '18.00', 'contabilità@sviluppoprogetti.com', '', 10, 'Ateco 829999, Istat 030129', 'SVILUPPO PROGETTI SOCIETA  COOPERATIVA', 'Via Pezza alta10/a', 'Oderzo (TV)', 'Snidero Paolo', '1953-10-09', 'Udine (UD)', '01326850938', '14576/C24', 'SNDPLA53R09L483B', '2020-11-17', ''),
(117, 0, 0, 0, 0, 0, 0, 0, 'SYSDATA ITALIA SPA', 'INFORMATICO', 'v. De  Carracci 13', 40100, 'Bologna (BO)', 'Ragusa Valerio', 'Mameli Walter', '051 4144911', '9.00', '13.00', '14.00', '18.00', 'hr@sysdata.it', 'www.sysdata.it', 150, 'servizi informatici (Ateco 62.02.00)', 'SYSDATA ITALIA SPA', 'V. Bissolati, 4', 'Mestre (VE)', 'Gianmarco Vecchione', '1977-07-10', 'Roma (RM)', '02454011202', '7903/C24', 'VCCGMR77L10H501E', '2016-12-27', '');
INSERT INTO `azienda` (`id`, `id_docente`, `n_informatici`, `n_telecomunicazioni`, `n_elettronici`, `n_automazioni`, `n_liceo`, `n_totale`, `denominazione_azienda`, `settore`, `indirizzo`, `cap`, `comune`, `referente_aziendale`, `tutor_aziendale`, `telefono`, `inizioam`, `fineam`, `iniziopm`, `finepm`, `email`, `sito`, `n_dipendenti`, `settore_attivita`, `leg_denominazioneazienda`, `leg_via`, `leg_comune`, `leg_nomecognome`, `leg_datanascita`, `leg_comunenascita`, `leg_iva`, `rapleg_convenzioneprotocolo`, `rapleg_codicefiscale`, `rapleg_convenzionedata`, `commento`) VALUES
(118, 0, 0, 0, 0, 0, 0, 0, 'TECHGEST SAS DI GIRARDI STEFANO & C.', 'INFORMATICO', 'Via Schiavonesca Priula 95', 31044, 'Montebelluna (TV)', 'Girardi Stefano', 'Girardi Stefano', '0423 605112', '', '', '', '', 'amministrazione@techqest.it', '', 6, 'altri servizi non specificati', 'TECHGEST SAS DI GIRARDI STEFANO & C.', 'Via Schiavonesca Priula 95', 'Montebelluna (TV)', 'Girardi Stefano', '1976-08-10', 'Montebelluna (TV)', '03943070262', '', 'FRRSFN76M10F443W', '0000-00-00', ''),
(119, 0, 0, 0, 0, 0, 0, 0, 'TESY SOFTWARE SRL', 'INFORMATICO', 'v. Reginato 3', 31100, 'Treviso (TV)', 'Luca Polesello', 'Luca Polesello', '0422 230424', '', '', '', '', 'ennio.zanuccoi@tesysoftware.com', 'www.tesysoftware.net', 60, 'servizi informatici', 'TESY SOFTWARE SRL', 'v. Reginato 3', 'Treviso (TV)', 'Ennio Zanucca', '1954-08-04', 'Venezia (VE)', '4188620266', '7890/C24', 'ZNCNNE51M04L736J', '2016-12-27', ''),
(120, 0, 0, 0, 0, 0, 0, 0, 'TEAM23 S.R.L.', 'INFORMATICO', 'Via Solferino 5/3', 31020, 'Carità di Villorba (TV)', 'Etzel Lava', 'Etzel Lava', '0422 1833754', '9.00', '13.30', '14.00', '17.30', 'info@team23.it', 'https://team23.it/', 0, '', 'TEAM23 S.R.L.', 'V. Strada  la Bassa, 15', 'Treviso (TV)', 'Etzel Lava', '1979-08-24', 'Conegliano (TV)', '04908940267', '7365/C24D', 'LVATZL79M24C957X', '2021-05-24', ''),
(121, 0, 0, 0, 0, 0, 0, 0, 'TIQUADRA SRL', 'INFORMATICO', 'V. Bassanese 61/2', 31044, 'Montebelluna (TV)', 'Della Mora Alessia', '', '0423 1736772', '9.00', '13.00', '14.00', '18.00', 'hr@tiquadra.it', '', 10, 'Servizi informatici (Ateco 620)', 'TIQUADRA SRL', 'V. Bassanese 61/2', 'Montebelluna (TV)', 'Damian Francesco', '1968-04-01', 'Montebelluna (TV)', '04303840260', '', 'DMNFNC68D01F443R', '0000-00-00', ''),
(122, 0, 2, 0, 0, 0, 0, 0, 'UBWARE SRL', 'INFORMATICO', 'Via Castagnole 20/h', 31100, 'Treviso (TV)', 'Baldasso Domenico', 'Baldasso Domenico', '340 2590388', '8.30', '12.30', '14.30', '18.30', 'domenico@ubware.it', '', 43739, 'servizi informatici', 'UBWARE SRL', 'Via Castagnole 20/h', 'Treviso (TV)', 'Domenico Baldasso', '1977-07-23', 'Treviso (TV)', '4362080261', '3279/C24D', 'BLDDNC77L23L407N', '2019-05-04', ''),
(123, 0, 0, 0, 0, 0, 0, 0, 'UNINDUSTRIA SERVIZI&FORMAZIONE TV-PN SCARL', 'INFORMATICO', 'p.za Istituzioni 12/Venzone 12', 31100, 'Treviso (TV)', 'Mercurio Alberto', 'Mercurio Alberto', '0422 916400', '', '', '', '', 'amercurio@unisef.it', 'www.unisef.it', 42, 'servizi alle imprese (lab. Proget. Dig.)', 'UNINDUSTRIA SERVIZI&FORMAZIONE TV-PN SCARL', 'p.za Istituzioni 12/Venzone 12', 'Treviso (TV)', 'Giuseppe Antonello', '1955-01-01', 'Treviso (TV)', '2301900268', '57/C24D', 'NTNGPP55A01L407J', '2017-01-10', ''),
(124, 0, 0, 0, 0, 0, 0, 0, 'VALUE AGENCY', 'INFORMATICO', 'viale san giacomo felisset 68', 31100, 'Treviso (TV)', 'Tiscini Isabella', 'Tiscini Isabella', '3480841488', '', '', '', '', 'isabella.tiscini@valueagency.it', 'www.valueagency.it', 1, 'servizi informatici', 'VALUE AGENCY', 'viale san giacomo felisset 68', 'Treviso (TV)', 'Isabella Tiscini', '1974-08-14', 'Roma (RM)', '4627570262', '382/C24D', 'TSCSLL74E54H501E', '2017-01-24', ''),
(125, 0, 0, 0, 0, 0, 0, 0, 'VENETA CUCINE', 'INFORMATICO', 'Via Paris Bordone 84', 31056, 'Roncade (TV)', 'Taffarello Cristian', 'Sandrin Roberto', '0422 8471', '8.30', '12.30', '14.00', '18.00', 'cristian.taffarello@venetacucine.con', '', 0, 'industria produzione cucine', 'VENETA CUCINE', 'Via Paris Bordone 84', 'Roncade (TV)', 'Pellizer Roberto', '1959-06-21', 'Venezia (VE)', '03764840264', '3279/C24D', 'PLLRBT59H21L736T', '2019-05-04', ''),
(126, 0, 0, 0, 0, 0, 0, 0, 'VERO SOLUTIONS', 'INFORMATICO', 'v.le San Marco 38', 30020, 'Marcon (VE)', 'Gastaldon Ezio', 'Gastaldon Ezio', '041 5951523', '', '', '', '', 'ezio.gastaldon@vero-solutions.it', 'www.vero-solutions.it', 6, 'servizi informatici (cad-cam)', 'VERO SOLUTIONS', 'v.le San Marco 38', 'Marcon (VE)', 'Giuseppe Antonello', '1955-01-01', 'Treviso (TV)', '2301900268', '7907/C24', 'NTNGPP55A01L407J', '2016-12-27', ''),
(127, 0, 0, 0, 0, 0, 0, 0, 'YARIX', 'INFORMATICO', 'Vicolo Boccacavalla 12', 31044, 'Montebelluna (TV)', 'Nicola Bressan', '', '0423 614249, 347 4248450', '', '', '', '', 'nicola.bressan@yarix.com', 'www.yarix.com', 0, '', 'YARIX', 'Vicolo Boccacavalla 12', 'Montebelluna (TV)', '', '0000-00-00', '', '', '', '', '0000-00-00', ''),
(128, 0, 0, 0, 0, 0, 0, 0, 'ZETEC SRL', 'INFORMATICO', 'v.le della Repubblica 12', 31020, 'Villorba (TV)', 'Scantamburlo Davide', 'Scantamburlo Davide', '0422 265458', '', '', '', '', 'davide@zetec.it', 'www.zetec.it', 3, 'commercio e servizi informatici', 'ZETEC SRL', 'v.le della Repubblica 12', 'Villorba (TV)', 'Davide Scantamburlo', '1979-01-31', 'Treviso (TV)', '4271680268', '7909/C24', 'SCNDVD73A31L407N', '2016-12-27', ''),
(129, 0, 1, 0, 0, 0, 0, 0, 'ADL S.R.L. ', 'TELECOMUNICAZIONI', 'v.le Italia 194', 31015, 'Conegliano (TV)', 'Dal Tio Alice', 'Della Libera Antonio', '0438 418072', '8.30', '12.30', '14.30', '18.30', 'segreteria@adlgroup.it', 'www.adlgroup.it', 0, 'servizi informatici', 'ADL S.R.L. ', 'v.le Italia 194', 'Conegliano (TV)', 'Katia Marchesin', '1969-10-29', 'Conegliano (TV)', '03685320263', '7190/C24D', 'MRCKTA69R69Z114C', '2021-05-20', ''),
(130, 0, 0, 0, 0, 0, 0, 0, 'ASTEL TLC DI STEFANO CAMPANA & C.', 'TELECOMUNICAZIONI', 'v. Liberazione 85/A', 31020, 'S. Vendemiano (TV)', 'Campana Stefano', 'Campana Stefano', '0438 402567', '8.00', '12.00', '14.00', '18.00', 'info@asteltlc.it', 'www.asteltlc.it', 0, 'telecomunicazioni', 'ASTEL TLC DI STEFANO CAMPANA & C.', 'v. Liberazione 85/A', 'S. Vendemiano (TV)', 'Stefano Campana', '1967-01-29', 'Udine (UD)', '02362550267', '3279/C24D', 'CMPSFN67A29L483P', '2019-05-04', ''),
(131, 0, 1, 0, 0, 0, 0, 0, 'ATON', 'TELECOMUNICAZIONI', 'Via A. Volta2', 31020, 'Villorba (TV)', 'Elena Pera', 'De Nardi Giorgio ', '0422 6184', '9.00', '13.00', '14.00', '18.00', 'HumanResources@aton.com', '', 0, '', 'ATON', 'Via A. Volta2', 'Villorba (TV)', 'Giorgio De Nardi', '1960-07-10', 'Venezia (VE)', '02479320265', '3279/C24D', 'DNRGRG60L10L736L', '2019-05-04', ''),
(132, 0, 0, 0, 0, 0, 0, 0, 'AZIENDA ULSS N. 2 MARCA TREVIGIANA', 'TELECOMUNICAZIONI', 'Via S.Abrogio di Fiera', 31100, 'Treviso (TV)', 'Dott.Benazzi Francesco', 'Ferrari Franco', '0422 323227', '8.00', '12.00', '12.00', '14.00', 'protocollo@aulss2.veneto.it', '', 0, '', '', '', '', 'Benazzi Francesco', '1956-03-02', 'Treviso (TV)', '03084880263', '3279/C 24D', 'BNZFNC56C02L407Z', '2019-05-04', ''),
(133, 0, 0, 0, 0, 0, 0, 0, 'BIT.WARE S.R.L.', 'TELECOMUNICAZIONI', 'Via Friuli3', 31020, 'S. Vendemiano (TV)', 'Maschio Valeria', 'Maschio Valeria', '0438 402123', '8.30', '12.30', '13.30', '17.30', 'bit.ware@bit-ware.com', '', 10, 'vendita e assistenza informatica', 'BIT.WARE S.R.L.', 'Via Friuli3', 'S. Vendemiano (TV)', 'Valerio Maschio', '1955-03-03', 'Conegliano (TV)', '03367340266', '3279/C24D', 'MSCVLR55C43C957G', '2019-05-04', ''),
(134, 0, 0, 0, 0, 0, 0, 0, 'C.E.M.E.S DI SCARABELLO ANGELO', 'TELECOMUNICAZIONI', 'v. Valdemoneghe 10A', 31030, 'Carbonera (TV)', 'Scarabello Angelo', 'Scarabello Angelo', '347 4288547', '', '', '', '', 'scarabmoto@gmail.com', 'www.cemes-moto.com', 4, 'progettazione-costruzione', 'C.E.M.E.S DI SCARABELLO ANGELO', 'v. Valdemoneghe 10A', 'Carbonera (TV)', 'Scarabello Angelo', '1974-03-04', 'Treviso (TV)', '04506730268', '415/C24D', 'SCRNGL74C04L407D', '2017-01-27', ''),
(135, 0, 0, 0, 0, 0, 0, 0, 'CIBOTEC SRL', 'TELECOMUNICAZIONI', 'Via San Marco14', 31052, 'Maserada sul Piave (TV)', 'Furlanetto Marco', 'Furlanetto Marco', '0422 5225', '', '', '', '', 'info@cibotec.it', '', 0, '', 'CIBOTEC SRL', 'Via San Marco14', 'Maserada sul Piave (TV)', 'Marco Furlanetto', '1968-06-08', 'Treviso (TV)', '03723660266', '585/C24D', 'FRLMRC68H08L407W', '2017-02-03', ''),
(136, 0, 0, 0, 0, 0, 0, 0, 'DATA SERVICES SRL', 'TELECOMUNICAZIONI', 'v. Tintoretto 46', 31056, 'Roncade (TV)', 'Passarella Alessandro', 'Passarella Alessandro', '0422 7053', '', '', '', '', 'alessandro.passarella@dataservices.it', 'www.dataservices.it', 63, 'commercio e servizi informatici', 'DATA SERVICES SRL', 'v. Tintoretto 46', 'Roncade (TV)', 'Oliviero Minetto', '1958-02-06', 'Fossalta di piave (TV)', '01288220260', '3279/C24D', 'MNTLVR58B06D740O', '2019-05-04', ''),
(137, 0, 0, 0, 0, 0, 0, 0, 'DATALOGIC', 'TELECOMUNICAZIONI', 'Viale dell Industria1', 31055, 'Quinto di Treviso (TV)', 'Giovannelli Flavio', 'Giovannelli Flavio', '051 3147670', '9.00', '13.00', '14.00', '18.00', 'corporate@datalogic.com', '', 0, '', 'DATALOGIC', 'Via San Vitalino,13', 'Lippo di Calderara di Reno (Bo)', 'Valentina Volta', '1958-02-22', 'Bologna (BO)', '03218701202', '3279/C24D', ' VLTVNT58B62A944F', '2019-05-04', ''),
(138, 0, 0, 0, 0, 0, 0, 0, 'DPC TELECOMUNICAZIONI S.R.L.', 'TELECOMUNICAZIONI', 'V. Prato della Valle 37', 31050, 'Povegliano V. (TV)', 'Dalle Crode Paolo', 'Dalle Crode Paolo', '0422 870466', '', '', '', '', 'tecnico@dcptelecomunicazioni.com', '', 10, 'telecomunicazioni', 'DPC TELECOMUNICAZIONI S.R.L.', 'V. Prato della Valle 37', 'Povegliano V. (TV)', 'Dalle Crode Paolo', '1962-05-15', 'Conegliano V. (TV)', '04134510264', '3712/C24D', 'DLLPLA62E15C957W', '2017-08-04', ''),
(139, 0, 0, 0, 0, 0, 0, 0, 'EDE. TECH. S.N.C.', 'TELECOMUNICAZIONI', 'Via Donatori del Sangue 7', 31020, 'Villorba (TV)', '', '', '0422 608154', '', '', '', '', '', '', 0, '', 'EDE. TECH. S.N.C.', 'Via Donatori del Sangue 7', 'Villorba (TV)', 'Lucio rettore', '1968-07-06', 'Maser (TV)', '04331790263', '279/C24D', 'RTTLCU68L06F009Q', '2017-01-19', ''),
(140, 0, 0, 0, 0, 0, 0, 0, 'FERRACIN SRL', 'TELECOMUNICAZIONI', 'Via Don Gino Ceschelli 17', 31010, 'Orsago (TV)', 'Battistuz Federica', 'Ferracin Filippo', '0438 992107', '8.00', '12.00', '13.30', '17.30', 'ferracin@ferracinsrl.com', '', 11, 'Installazioni linee elettriche', 'FERRACIN SRL', 'Via Don Gino Ceschelli 17', 'Orsago (TV)', 'Ferracin Angelo', '1965-10-08', 'Conegliano (TV)', '03755110263', '3279/C24D', 'FRRNGL65R08C957N', '2019-05-04', ''),
(141, 0, 0, 0, 0, 0, 0, 0, 'GRAPHITE  S.R.L.', 'TELECOMUNICAZIONI', 'Viale Antonio Cacciga 94', 31052, 'Maserada sul Piave (TV)', 'Eddy Mazzarini', 'Eddy Mazzarini', '0422 722119', '', '', '', '', 'info@graphite.it', '', 0, '', 'GRAPHITE  S.R.L.', 'Via Antonio Caccianiga,94/1', 'Maserada sul Piave (TV)', 'Eddy Mazzarini', '1951-03-28', 'Treviso (TV)', '03921460261', '446/C24D', ' MZZDDY51C28L407V', '2017-01-27', ''),
(142, 0, 0, 0, 0, 0, 0, 0, 'GRUPPO EUROSYSTEM  S.P.A', 'TELECOMUNICAZIONI', 'Via Newton21', 31020, 'Villorba (TV)', 'Sonda Stefano', 'Sonda Stefano', '0422 668711', '', '', '', '', 'info@eurosystem.it / Lisa.francesca@eurosystem.it', '', 0, '', 'GRUPPO EUROSYSTEM  S.P.A', 'Via Newton21', 'Villorba (TV)', 'Sonda Stefano', '0000-00-00', '', '02243020266', '3279/C24D', '', '2019-05-04', ''),
(143, 0, 0, 0, 0, 0, 0, 0, 'INNOVA SOFT', 'TELECOMUNICAZIONI', 'Via Lanzaghe26', 31020, ' Silea (TV)', 'Carraro Massimo', 'Carraro Massimo', '0422 1782729', '8.30', '12.30', '13.30', '17.30', 'emmecisistemisrl@alice.it', 'www.emmecisistemisrl.com', 15, 'costruzione installazione serramenti', 'INNOVA SOFT', 'Via Lanzaghe26', ' Silea (TV)', 'Zavadzaz Roberto', '1969-04-06', 'Gorizia (GO)', '04492250263', '3279/C24D', 'ZVDRRT69D06E098S', '2019-05-04', ''),
(144, 0, 0, 0, 0, 0, 0, 0, 'ITALACUSTICA DI TASCA WLADIMIRO', 'TELECOMUNICAZIONI', 'Borgo Cavalli 31', 31100, 'Treviso (TV)', 'Tasca Wladimiro', 'Tasca Wladimiro', '347 3936833', '', '', '', '', 'italacustica@alice.it', '', 3, '', 'ITALACUSTICA DI TASCA WLADIMIRO', 'Borgo Cavalli 31', 'Treviso (TV)', 'Tasca Wladimiro', '1963-12-31', 'Milano (MI)', '03383580264', '2650/C24D', 'TSCWDM63T31F205G', '2017-06-08', ''),
(145, 0, 1, 0, 1, 0, 0, 0, 'HI-FI FOREST SNC', 'TELECOMUNICAZIONI', 'Via Cadore Mare 98', 31013, 'Codogne  (TV)', 'Eugenio Forest', 'Eugenio Forest', '0438 794082', '8.30', '12.30', '15.00', '19.00', 'negozio@hififorest.it', '', 50, '', 'HI-FI FOREST SNC', 'Via Cadore Mare 98', 'Codogne  (TV)', 'Forest Eugenio', '1952-03-29', 'Godega di SU (TV)', '00707940268', '3279/C24D', 'FRSGNE52C29E071X', '2019-05-04', ''),
(146, 0, 0, 0, 0, 0, 0, 0, 'MORATTO S.R.L.', 'TELECOMUNICAZIONI', 'Via Alessandro Volta 2', 31030, 'Breda di Piave (TV)', 'Moratto Eligio', 'Moratto Michele', '0422 904032', '', '', '', '', 'moratto@moratto.it', '', 0, '', 'MORATTO S.R.L.', 'Via Alessandro Volta 2', 'Breda di Piave (TV)', 'Michele Moratto', '1971-12-09', 'Treviso (TV)', '02403160266', '3279/C24D', 'MRTMHL71T09L407X', '2019-05-04', ''),
(147, 0, 0, 0, 0, 0, 0, 0, 'NICE S.P.A.', 'TELECOMUNICAZIONI', 'Via Callalta 1', 31046, 'Oderzo (TV)', 'Luca Drusian', 'Luca Drusian', '0422 853838', '', '', '', '', 'L.drusian@niceforyou.com', 'www.niceforyou.com', 0, '', 'NICE S.P.A.', 'Via Callalta 1', 'Oderzo (TV)', 'Roberto Miguel Griffa', '1975-01-14', 'Concordia (Argentina)', '03099360269', '3279/C24D', 'GRFRRT75A14Z600H', '2019-05-04', ''),
(148, 0, 0, 0, 0, 0, 0, 0, 'PHYLOS SRL', 'TELECOMUNICAZIONI', 'Strada  Terraglio 249', 31022, 'Preganziol (TV)', 'Fichera  Lorenzo', 'Fichera  Lorenzo', '0422 491872', '9.00', '13.00', '14.00', '18.00', 'info@phylos.it', '', 0, '', 'PHYLOS SRL', 'Strada  Terraglio 249', 'Preganziol (TV)', 'Chiara Rizzato', '1966-05-01', 'Treviso (TV)', '04043830266', '3279/C24D', 'RZZCHR66E41L407H', '2019-05-04', ''),
(149, 0, 0, 0, 0, 0, 0, 0, 'ROTAS ITALIA SRL', 'TELECOMUNICAZIONI', 'v. San Francesco di Sales', 31100, 'Treviso (TV)', 'Ilaria', 'Ilaria', '0422 433100', '8.30', '12.30', '14.30', '18.30', 'info@rotas.com', 'www.rotas.it', 0, 'servizi per prodotti industriali', 'ROTAS ITALIA SRL', 'v. San Francesco di Sales', 'Treviso (TV)', 'Francesco Celante', '1941-05-01', 'Chiarano (TV)', '00526430269', '500/C24D', 'CLNFNC41E01C614F', '2017-01-31', ''),
(150, 0, 0, 0, 0, 0, 0, 0, 'SOMEC SPA', 'TELECOMUNICAZIONI', 'V. Palù 30', 31020, 'Zoppè di San Vendemmiano (TV)', 'Padoin Valentino', 'Padoin Valentino', '0438 4717', '8.30', '13.00', '14.00', '17.30', 'info@somecgroup.com', '', 150, 'ateco 2312', 'SOMEC SPA', 'V. Palù 30', 'Zoppè di San Vendemmiano (TV)', 'Frattarolo Diego', '1969-01-22', 'Vetralla (VT)', '04245710266', '2632/C24', 'FRTDGI69A22L814M', '2021-02-20', ''),
(151, 0, 0, 0, 0, 0, 0, 0, 'SPAGNOL SRL', 'TELECOMUNICAZIONI', 'Via Paludotti 5/7', 31020, 'Vidor (TV)', '', '', '0423 986083', '', '', '', '', 'amministrazione@spagnolaut.com', 'www.spagnolaut.com', 6, 'Produzione macchinari per fertirrigazione serre', 'SPAGNOL SRL', 'Via Paludotti 5/7', 'Vidor (TV)', 'Daniele Spagnol', '1960-06-16', 'Vidor (TV)', '03978110264', '496/C245D', 'SPGDNL60H16L856S', '2017-01-31', ''),
(152, 0, 0, 0, 0, 0, 0, 0, 'S.T. DISTRIBUZIONI SRL', 'TELECOMUNICAZIONI', 'Via Conegliano 74', 31058, 'Susegana (TV)', '', '', '0438 738161', '', '', '', '', ' info@stdistribuzione.it', '', 0, '', 'S.T. DISTRIBUZIONI SRL', 'Via Conegliano 74', 'Susegana (TV)', '', '0000-00-00', '', '04556400267', '3753/C24D', '', '2017-08-10', ''),
(153, 0, 0, 0, 0, 0, 0, 0, 'TELEBIT SRL', 'TELECOMUNICAZIONI', 'Via  M. Fanno 1', 31030, 'Casier (TV)', 'Quarta Germano', 'Quarta Germano', '0422 6362', '8.30', '12.30', '13.30', '17.30', 'risorseumane@telebit.it', 'www.telebit.it', 217, 'telecomunicazioni', 'Telebit srl', 'Via  M. Fanno, 1', 'Dosson di Casier (TV)', 'Giovanni Quarta', '1949-04-23', 'Cles (TN)', '01144610936', '494/C24D', 'QRTGNN49D23C794R', '2017-01-31', ''),
(154, 0, 0, 0, 0, 0, 0, 0, 'TELEGAMMA S.A.S', 'TELECOMUNICAZIONI', 'Via Noalese 63', 31100, 'Treviso (TV)', 'Biasuzzo Franco', 'Mamprin Mauro', '0422 2976', '8.00', '12.00', '13.30', '17.30', '', '', 0, '', 'TELEGAMMA S.A.S', 'Via Noalese, 63/B', 'Treviso (TV)', 'Gamma Dividino', '1948-03-02', 'Paese (TV)', '01201380266', '3279/C24D', 'GMMDDN48C02G229Z', '2019-05-04', ''),
(155, 0, 2, 0, 0, 0, 0, 0, 'TESSER ANTENNE', 'TELECOMUNICAZIONI', 'Via Gen. E. Reginato13', 31100, 'Treviso (TV)', 'Tesser Luigino', 'Tesser Luigino', '0422 230283', '8.00', '12.00', '13.30', '16.30', 'noc@tesser.it ', '', 0, '', 'TESSER ANTENNE', 'Via Gen. E. Reginato13', 'Treviso (TV)', 'Luigino Tesser', '1956-12-06', 'Mogliano Veneto (TV)', '01893880268', '3279/C24D', 'TSSLGN56T06F269M', '2019-05-04', ''),
(156, 0, 1, 0, 0, 0, 0, 0, 'WAP STUDIO DI DE CARLI M. E FLORIDUZ L. SNC', 'TELECOMUNICAZIONI', 'P.zza Garibaldi', 31047, 'Ponte di Piave (TV)', 'De Carli Manuel', 'De Carli Manuel', '0422 759909', '', '', '', '', 'info@wapstudiolab.it', 'www.wapstudiolab.it', 2, 'Assistenza e vendita materiale informatico', 'WAP STUDIO DI DE CARLI M. E FLORIDUZ L. SNC', 'P.zza Garibaldi', 'Ponte di Piave (TV)', 'Manuel De Carli', '1980-03-29', 'Motta di Livenza (TV)', '04220770269', '3279/C24D', 'DCRMNL80C29F770H', '2019-05-04', ''),
(157, 0, 0, 0, 0, 0, 0, 0, 'A.C. AUTOMAZIONI S.R.L.S.', 'AUTOMAZIONE', 'Via Fiume2 ', 31038, 'Paese (TV)', 'Bissoli Paola', 'Pozzobon Fabio', '0422 450117', '7.30', '12.30', '13.30', '16.30', 'info@AC-automazioni.it', '', 0, 'Automazione Industriale', 'A.C. AUTOMAZIONI S.R.L.S.', 'Via Fiume2 ', 'Paese (TV)', 'Brunello Carlo', '1963-10-05', 'Melbourne (AUS)', '04693000269', '13462/C24', 'FRNRND61L22Z133W', '2020-10-28', ''),
(158, 0, 0, 0, 0, 0, 0, 0, 'ADAT SRL', 'AUTOMAZIONE', 'Via Borgo Tocchet 11', 31010, 'Godega Sant Urbano (TV)', 'Gava Emanuela', 'Tomè Edoardo', '3496010190-0438208174', '8.00', '13.00', '14.00', '17.00', 'info@adatsrl.it', '', 10, '', 'ADAT SRL', 'Via Martimpelle foibe', 'Conegliano (TV)', 'Ongaro Claudio', '1964-07-26', 'Conegliano (TV)', '03647650260', '3279/C24D', 'NGRCLD64L26C957Y', '2019-05-04', ''),
(159, 0, 0, 0, 0, 0, 0, 0, 'ALI SPA', 'AUTOMAZIONE', 'V. Conti Agosti 231', 31010, 'Mareno di Piave (TV)', 'Zanardo Sergio', 'Zanardo Sergio', '3489691538', '', '', '', '', 'sergio.zanardo@aligroup.it', 'www.mareno.it', 230, 'Metalmeccanico/Apparec. Per la Ristor', 'ALI SPA', 'V. Conti Agosti 231', 'Mareno di Piave (TV)', 'Maurizio Anastasia', '1970-08-01', 'Latisana (UD)', '00872030150', '139/C24D', 'NSTMRZ70M01E473D', '2017-01-12', ''),
(160, 0, 0, 0, 0, 0, 0, 0, 'A.M. TEKNOSTAMPI SPA', 'AUTOMAZIONE', 'Via Trieste 10', 31025, 'S. Lucia di Piave (TV)', 'Bin Gianni', 'Da Ros Gianni', '0438661397/3483727011', '', '', '', '', 'Walmec@Walmec.com', '', 0, 'Stampaggi e Produzione minuterie plastica', 'A.M. TEKNOSTAMPI SPA', 'Via Trieste 10', 'S. Lucia di Piave (TV)', 'Paolo Zanetti', '1953-09-07', 'Mareno di Piave (TV)', '04219990266', '142/C24D', 'ZNTPLA53P07E940F', '2017-01-12', ''),
(161, 0, 0, 0, 0, 0, 0, 0, 'ASTON ENERGY S.R.L.', 'AUTOMAZIONE', 'V. Montegrappa 2/d', 31050, 'Ponzano Veneto (TV)', 'Scomparin Chiara', '', '0422 837262', '', '', '', '', 'amministrazione@astonenergy.it', '', 19, 'Commercio all ingrosso di materiale elettrico per ', 'ASTON ENERGY S.R.L.', 'V. Montegrappa 2/d', 'Ponzano Veneto (TV)', 'Sabbadin Massimo', '1977-02-14', 'Camposanpiero (PD)', '', '', 'SBBMNL77B14B563N', '0000-00-00', ''),
(162, 0, 0, 0, 0, 0, 0, 0, 'BANDIERA IMPIANTI', 'AUTOMAZIONE', 'Via E. Reginato 87', 31100, 'Treviso (TV)', 'Bandiera Massimiliano', 'Bandiera Massimiliano', '0422 210692', '8.00', '12.30', '15.00', '18.30', 'info@bandieraimpianti.it', '', 44470, 'Ateco 74.90.91', 'BANDIERA IMPIANTI', 'Via E. Reginato 87', 'Treviso (TV)', 'Bandiera Alberto', '1939-06-13', 'Treviso (TV)', '03764230268', '', 'BNDLRT39H13L407G', '0000-00-00', ''),
(163, 0, 0, 0, 0, 0, 0, 0, 'BETTIOL S.R.L.', 'AUTOMAZIONE', 'V. Della Mostra 8', 31020, 'Bolzano (BZ)', '', 'Bigolin Andrea (vice Stefani Mirco)', '0422 444590', '7.00', '12.00', '13.00', '19.00', 'info@bettiolsrl.com', '', 51, 'ateco 43.22.01', 'BETTIOL S.R.L.', 'V. Roma, 261', 'Bolzano (BZ)', 'Emanuela Putoto', '1958-09-19', 'Arcade (TV)', '03237650266', '13006/C24', 'PTTMNL58P59192V', '2020-10-17', ''),
(164, 0, 0, 0, 0, 0, 0, 0, 'BITFOX S.R.L', 'AUTOMAZIONE', 'Via 1° Maggio 14 ', 31040, 'Giavera del Montello (TV)', 'Favaro Denis / Rufoloni Marco', 'Favaro Denis / Rufoloni Marco', '0422918918', '8.00', '12.00', '13.00', '17.00', 'bitfox@bitfox.it', '', 51, 'Ateco 43.21.03', 'BITFOX S.R.L', 'Via Fratelli Rosselli, 7/9', 'Villorba (TV)', 'Pasin Paolo', '1969-07-08', 'Treviso (TV)', '03792890265', '8274/C24D', 'PSNPLA69L08L407O', '2021-06-09', ''),
(165, 0, 0, 0, 0, 0, 0, 0, 'BJOSORA SRL', 'AUTOMAZIONE', 'V. Guecello Tempesta 59', 30033, 'Noale (VE)', 'Bellio Federico', 'Bellio Federico', '3482233456', '8.30', '12.30', '13.30', '16.30', 'federico@bjosora.com', '', 0, '', 'BJOSORA SRL', 'V. Le Canevare, 30', 'Noale (VE)', 'Bellio Federico', '1957-12-31', 'Mogliano Veneto (TV)', '05153730261', '5969/C24', 'BLLFRC57T31F269A', '2021-04-29', ''),
(166, 0, 0, 0, 0, 0, 0, 0, 'BOTTEON ANTONIO SRL', 'AUTOMAZIONE', 'Via delle Industrie 7', 31040, 'Nervesa della Battaglia (TV)', 'Pagotto Claudio', 'Pagotto Marco', '0422 885260', '8.00', '12.00', '13.30', '17.30', 'info@botteon.it', 'www.botteon.it', 47, 'Costruzioni meccaniche', 'BOTTEON ANTONIO SRL', 'Via delle Industrie 7', 'Nervesa della Battaglia (TV)', 'Pagotto Claudio', '1948-08-30', 'Bolzano (BZ)', '03534080266', '3279/C24D', 'PGTCLD48M30A952Y', '2019-05-04', ''),
(167, 0, 0, 0, 0, 0, 0, 0, 'BOTTER ELETTROTECNICA SRL', 'AUTOMAZIONE', 'V. Sile 18/B', 31020, 'Silea (TV)', 'Botter Andrea', 'Malimpensa Fortunato Silvano', '0422 361003', '8.00', '12.00', '13.30', '17.30', 'amministrazione@botter.com', 'www.botter.com', 20, 'Metalmeccanico/Trasformatori Elettrici', 'BOTTER ELETTROTECNICA SRL', 'V. Sile 18/B', 'Silea (TV)', 'Renzo Botter', '1940-01-08', 'Treviso (TV)', '02412440261', '3279/C24D', 'BTTRNZ40A08L407F', '2019-05-04', ''),
(168, 0, 0, 0, 0, 0, 0, 0, 'BPS CLIMA', 'AUTOMAZIONE', 'Zona industriale Biban 56', 31030, 'Carbonera (TV)', 'Schiavon Andrea', 'Schiavon Andrea', '0422 445363', '8.00', '12.00', '13.00', '17.00', 'info@bpstecnologie.com', 'www.bpstecnologie.com', 230, 'climatizzatori ad aria', 'BPS CLIMA', 'Zona industriale Biban 56', 'Carbonera (TV)', 'Schiavon Andrea', '1966-04-04', 'Treviso (TV)', '03302570266', '7210/C24D', 'SCHNDR66D04L407N', '2021-05-21', ''),
(169, 0, 0, 0, 0, 0, 0, 0, 'BRILLAUTOMATION', 'AUTOMAZIONE', 'Via Zagaria 2/7', 31055, 'Quinto di Treviso (TV)', 'Claudio Corrò', 'Claudio Corrò', '0422 470724', '8.00', '12.00', '13.30', '17.30', 'brill@brillautomation.it', '', 44470, 'Ateco 43.21.01', 'BRILLAUTOMATION', 'Via Zagaria 2/7', 'Quinto di Treviso (TV)', 'Corrò Claudio', '1971-10-24', 'Treviso (TV)', '03493800266', '', 'CRRCLD71R24L407J', '0000-00-00', ''),
(170, 0, 0, 0, 0, 0, 0, 0, 'CA.DI s.r.l.', 'AUTOMAZIONE', 'Viale delle Industrie 107', 31030, 'Dosson di Casier (TV)', '', '', '0422 491412', '', '', '', '', 'info@ca-di.it', '', 0, '', 'CA.DI s.r.l.', 'Viale delle Industrie 107', 'Dosson di Casier (TV)', 'Lucchese Claudio', '1968-12-04', 'Treviso (TV)', 'IT04492880267', '', 'LCCCLD68T04L407Z', '0000-00-00', ''),
(171, 0, 0, 0, 0, 0, 0, 0, 'CALDATO & FOFFANO IMPIANTI SNC', 'AUTOMAZIONE', 'VIA ENRICO MATTEI37/G', 31055, 'Quinto di Treviso (TV)', '', '', '347 5610262', '', '', '', '', 'info@caldatoimpianti.it - caldatoimpianti@icloud.com', '', 0, 'climatizzatori ad aria', 'CALDATO & FOFFANO IMPIANTI SNC', 'VIA ENRICO MATTEI37/G', 'Quinto di Treviso (TV)', '', '0000-00-00', '', '', '', '', '0000-00-00', ''),
(172, 0, 0, 0, 0, 0, 0, 0, 'CAME', 'AUTOMAZIONE', 'Via Martiri della libertà 15', 31030, 'Casier (TV)', 'Pavan Francesca', 'Pavan Francesca', '0422 4940', '8.30', '12.30', '13.30', '17.30', 'humanresources@came.com', '', 260, 'automazioni', 'CAME', 'Via Martiri della libertà 15', 'Casier (TV)', 'Menuzzo Andrea', '1975-01-04', 'Treviso (TV)', '03481280265', '3279/C24D', 'MNZNDR75A04L407E', '2019-05-04', ''),
(173, 0, 0, 0, 0, 0, 0, 0, 'CARMET AUTOMAZIONI SRL', 'AUTOMAZIONE', 'Via Aquileia', 31048, 'San Biagio di Callalta (TV)', 'Girardi Luciano', 'Taffarello Cristiano', '0422 899105', '', '', '', '', 'info@carmetautomazioni.it', '', 15, 'Industrie manifatturiere', 'CARMET AUTOMAZIONI SRL', 'Via Aquileia', 'San Biagio di Callalta (TV)', 'Girardi Luciano', '1962-12-28', 'Torino (TO)', '03481760266', '1973/C24D', 'GRRLCN62T28L219D', '2018-03-23', ''),
(174, 0, 0, 0, 0, 0, 0, 0, 'CARRETTA SRL', 'AUTOMAZIONE', 'Via Zecchina19/A', 31055, 'Quinto di Treviso (TV)', 'Pavanetto Giancarlo', 'Pavanetto Giancarlo', '0422 371023', '8.00', '12.00', '13.30', '17.30', 'v.barban@carrettaautomazioni.it', 'www.carrettaatumazioni.it', 20, 'Automazione Ind.le', 'CARRETTA SRL', 'Via Zecchina19/A', 'Quinto di Treviso (TV)', 'Renato Pavanetto', '1972-07-01', 'Treviso (TV)', '02260110263', '3279/C24D', 'PVNRNT72P01L407D', '2019-05-04', ''),
(175, 0, 0, 0, 0, 0, 0, 0, 'CASELLATO SERVIZI SNC', 'AUTOMAZIONE', 'Via Montegrappa 116/a', 31020, 'Villorba (TV)', 'Casellato Gilberto', 'Casellato Diego', '0422 1582591', '8.00', '12.00', '13.30', '17.30', 'casellatoservizisnc@gmail.com', '', 10, 'Realizzazione impianti elettrici', 'CASELLATO SERVIZI SNC', 'Via Montegrappa 116/a', 'Villorba (TV)', 'Casellato Gilberto', '1970-11-23', 'Treviso (TV)', '04730120260', '3279/C24D', 'CSLGBR70S23L407V', '2019-05-04', ''),
(176, 0, 0, 0, 0, 0, 0, 0, 'CLIMOSFERA SRL', 'AUTOMAZIONE', 'Via Monte Grappa 25', 31020, 'Villorba (TV)', 'Tasca Elettra', 'Minet Elvi', '0422 608987', '8.30', '12.30', '14.30', '18.30', 'info@climosfera.it', '', 44105, 'ateco 711220 -', 'CLIMOSFERA SRL', 'Via Monte Grappa 25', 'Villorba (TV)', 'Paissan Marco\r\n', '1970-11-24', 'Trento (TV)', '04182080269\r\n', '8275/C24D', 'PSSMRC70S24L378J', '2021-06-09', ''),
(177, 0, 0, 0, 0, 0, 0, 0, 'COMAS SPA', 'AUTOMAZIONE', 'Via Cendon 1', 31057, 'Silea (TV)', 'Freire Walter', 'Freire walter', '0422360514', '8.00', '12.30', '13.30', '17.00', 'comas@comastm.it', '', 51, 'Fabbricazione maccine lav.ni alimentare, bevande, ', 'COMAS SPA', 'Via Cendon 1', 'Silea (TV)', 'Lena Matteo', '1971-05-11', 'Bologna (BO)', '00200400265', '', 'LNEMTT71E11A944D', '0000-00-00', ''),
(178, 0, 0, 0, 0, 0, 0, 0, 'COMTEC ENGINEERING S.r.l.', 'AUTOMAZIONE', 'Via Montello 7', 31040, 'Nervesa della Battaglia (TV)', 'Omizzolo Federica', 'Polo Ivan', '0422 887547', '8.30', '12.30', '13.00', '15.00', 'federica@cometecengineering.com', '', 11, 'Ateco 28.29.2   Industria Manifatturiera', 'COMTEC ENGINEERING S.r.l.', 'Via Montello 7', 'Nervesa della Battaglia (TV)', 'Omizzolo Fabrizio', '1976-04-21', 'Treviso (TV)', '04162570263', '7168/C24D', 'MZZFRZ76D21L407R', '2021-05-20', ''),
(179, 0, 0, 0, 0, 0, 0, 0, 'CRM SAS', 'AUTOMAZIONE', 'Via Ungheresca Nord 10', 31010, 'Mareno di Piave (TV)', 'Fontana Domenico', 'Fontana Domenico', '0438 30373', '8.00', '12.00', '13.30', '17.30', 'cristina@crmelevatori.it', '', 10, 'Officina meccanica', 'CRM SAS', 'Via Ungheresca Nord 10', 'Mareno di Piave (TV)', 'Fontana Domenico', '1968-05-10', 'Conegliano (TV)', '03359030263', '3279/C24D', 'FNTDNC68E10C957O', '2019-05-04', ''),
(180, 0, 0, 0, 0, 0, 0, 0, 'D.B.M. TECNOLOGIE S.R.L.', 'AUTOMAZIONE', 'V.le della Ricerca 1', 31032, 'Casale sul Sile (TV)', 'Mattiuzzo Oriano', 'Mazzon Alberto / Rossetto Alberto', '0422 827110', '8.00', '12.00', '13.00', '17.00', 'amministrazione@dbmtecnologie.com', 'www.dbmtec.com', 39, '28.29.9 Industrie manifatturiere non specificate', 'D.B.M. TECNOLOGIE S.R.L.', 'V.le della Ricerca 1', 'Casale sul Sile (TV)', 'Oriano Mattiuzo', '1952-11-20', 'Silea (TV)', '00834720260', '141/C24D', 'MTTRNO52S20F116X', '2017-01-12', ''),
(181, 0, 0, 0, 0, 0, 0, 0, 'D.I.G. AUTOMAZIONI SRL', 'AUTOMAZIONE', 'Via Dell Industria 54', 31052, 'Maserada sul Piave (TV)', 'Dal Col Emanuela', 'Pol Simone', '0422 880214', '8.00', '12.00', '13.30', '17.30', 'info@digautomazionisrl.com', '', 5, 'Centro conduzione lavorazioni meccaniche', 'D.I.G. AUTOMAZIONI SRL', 'Via Dell Industria 54', 'Maserada sul Piave (TV)', 'Dal Col Isidoro', '1943-08-17', 'Maserada sul P. (TV)', '01985420262', '3279/C24D', 'DLCSDR43M17F012V', '2019-05-04', ''),
(182, 0, 0, 0, 0, 0, 0, 0, 'DAIMEL SRL', 'AUTOMAZIONE', 'V. Monte Adamello 35', 31059, 'Zero Branco (TV)', 'Sarai Daniele ', 'Callegaro Daris', '0422 470978', '8.00', '12.00', '13.30', '17.30', 'amministrazione@daimel.it', 'www.daimel.it', 22, 'Impiantistica ', 'DAIMEL SRL', 'V. Monte Adamello 35', 'Zero Branco (TV)', 'Daniele Sarai', '1970-07-11', 'Treviso (TV)', '03804060261', '3279/C24D', 'SRADNL70L11L407T', '2019-05-04', ''),
(183, 0, 0, 0, 0, 0, 0, 0, 'DEMOMECC SRL', 'AUTOMAZIONE', 'V. Tintoretto 2', 31056, 'Roncade (TV)', '', '', '0422 841157', '', '', '', '', 'info@demomeccsrl.it', 'www.demomeccsrl.it', 0, 'azienda meccanica', 'DEMOMECC SRL', 'V. Tintoretto 2', 'Roncade (TV)', '', '0000-00-00', '', '03294670264', '', '', '0000-00-00', ''),
(184, 0, 0, 0, 0, 0, 0, 0, 'DIMENSIONE ELETTRICA', 'AUTOMAZIONE', 'V. Palù 49', 31020, 'S. Vendemiano (TV)', 'Maschio Stefano', 'Maschio Stefano', '0438 1863063', '', '', '', '', 'info@dimensioneelettrica.it', '', 11, '', 'DIMENSIONE ELETTRICA', 'V. Palù 49', 'S. Vendemiano (TV)', 'Vitagliano Frank', '1970-07-15', 'Charleroi', '04781820263', '', 'VTGFNK70L15Z103Q', '0000-00-00', ''),
(185, 0, 0, 0, 0, 0, 0, 0, 'Ateco 43.21.01', 'AUTOMAZIONE', 'Via Guardi 33', 35137, 'Postioma di Paese (TV)', 'Bonaldo Matteo', 'Bonaldo Matteo', '0422 591702', '9.00', '13.00', '14.00', '18.00', 'davide.spotti@formulaeworld.com / amministrazione@vismunda.com', '', 0, 'Programmazione motori lineari', 'Ateco 43.21.01', 'Via Galliera dei Borromeo, 3', 'Padova (PD)', 'Davide Spotti', '1963-05-05', 'Mantova (MN)', '03204711208', '3279/C24D', 'SPTDVD63E05897Q', '2019-05-04', ''),
(186, 0, 0, 0, 0, 0, 0, 0, 'E.B.S. DI BUSATO STEFANO', 'AUTOMAZIONE', 'Via Martiri Della Libertà 30', 31059, 'Zero Branco (TV)', 'Busato Stefano', 'Busato Stefano', '0422 486361', '8.00', '12.00', '13.30', '17.30', 'ebselettroimpianti@gmail.com', '', 0, 'Impianti elettrici', 'E.B.S. DI BUSATO STEFANO', 'Via Martiri Della Libertà 30', 'Zero Branco (TV)', 'Busato Stefano', '1967-12-26', 'Noale (VE)', '00925870271', '3279/C24D', 'BSTSFN67T26F904I', '2019-05-04', ''),
(187, 0, 0, 0, 0, 0, 0, 0, 'ELETTRA TREVIGIANA SNC', 'AUTOMAZIONE', 'Via dei gelsi 9', 31010, 'Godega Sant Urbano (TV)', 'Gallon Vania', 'Baldessin Paolo', '0438 430491', '8.00', '12.00', '13.00', '17.00', 'info@elettratrevigiana.com', '', 11, 'Impianti elettrici di automazione', 'ELETTRA TREVIGIANA SNC', 'Via dei gelsi 9', 'Godega Sant Urbano (TV)', 'Ghirardo Tiziano', '1947-05-24', 'San Pietro di Feletto (TV)', '00328910260', '3279/C24D', 'GHRTZN47E24I103G', '2019-05-04', ''),
(188, 0, 0, 0, 0, 0, 0, 0, 'ELETTROINNOVATION', 'AUTOMAZIONE', 'V. A. Traversi 12', 31056, 'Roncade (TV)', 'Carrer Federico', 'Carrer Federico', '349 4549174', '8.00', '12.00', '13.00', '17.00', 'elettroinnovation@gmail.com', '', 10, 'Costruzioni', 'ELETTROINNOVATION', 'V. A. Traversi 12', 'Roncade (TV)', 'Carrer Federico', '1978-08-15', 'S. Donà di Piave (VE)', '04647730268', '3279/C24D', 'CRRFRC78E18H823E', '2019-05-04', ''),
(189, 0, 0, 0, 0, 0, 0, 0, 'ELETTROTECH DI SECOLI PIERO', 'AUTOMAZIONE', 'V. Giambattista Tiepolo 5', 31050, 'Ponzano Veneto (TV)', 'Secoli Piero', 'Secoli Piero', '349 4140193', '', '', '', '', 'piero.elettrotech@gmail.com', '', 0, '', 'ELETTROTECH DI SECOLI PIERO', 'V. Giambattista Tiepolo 5', 'Ponzano Veneto (TV)', 'Piero Secoli', '1974-01-29', 'Conegliano  (TV)', '', '168/C24D', 'SCLPRI74A29C957J', '2017-01-14', ''),
(190, 0, 0, 0, 0, 0, 0, 0, 'EMMECI SISTEMI SRL', 'AUTOMAZIONE', 'V. Gemelli 43/B', 31038, 'Paese (TV)', 'Bertuola Giada', 'BErtuola Luca', '0422480166', '07.00', '12.00', '13.30', '16.30', 'info@emmecisistemisrl.com', 'www.emmecisistemisrl.com', 11, 'installazione/ automazioni', 'EMMECISISTEMI SRL', 'V. Gemelli, 43/b', 'Paese (TV)', 'Carraro Massimi', '1965-04-02', 'Montebelluna (TV)', '03929060261', '6703/C24', 'CRRMSM65D02F443T', '2021-05-12', ''),
(191, 0, 0, 0, 0, 0, 0, 0, 'EMMEGI SNC', 'AUTOMAZIONE', 'V. Delle Industrie  II 18', 30020, 'Meolo (VE)', 'Gasparini Mauro / Venturato Andrea', 'Gasparini Mauro / Venturato Andrea', '328 1266455', '8.00', '12.00', '13.00', '17.00', 'emmegigasparini@libero.it', '', 6, 'Industria/Servizi- Instal. Imp. Elett.', 'EMMEGI SNC', 'V. G. Verdi, 24', 'Meolo (VE)', 'Mauro Gasparini', '1970-12-02', 'Zojingen (CH)', '03725580272', '3279/C24D', 'GSPMRA70T02Z133X', '2019-05-04', ''),
(192, 0, 0, 0, 0, 0, 0, 0, 'ERAL SRL', 'AUTOMAZIONE', 'Via Europa 21', 31028, 'Vazzola (TV)', 'Peruzza Loredana', 'Peruzza Loredana', '0438 444495', '8.00', '12.00', '13.00', '17.00', 'pietro.modolo@linealight.com', 'www.eralsolution.com', 0, '', 'ERAL SRL', 'Via Europa, 14', 'Vazzola (TV)', 'Peruzza Loredana', '1952-08-19', 'Vazzola (TV)', '04269920262', '3279/C24D', 'PRZLDN52M59L700G', '2019-05-04', ''),
(193, 0, 0, 0, 0, 0, 0, 0, 'EUREKA SYSTEM SRL', 'AUTOMAZIONE', 'Via G. Amendola 24', 31100, 'Treviso (TV)', 'Contò Eros', 'Pozzobon Fabio', '0422 263254', '8.30', '13.00', '14.00', '17.00', 'amministrazione@eurekasystem.it', 'www.eurekasystem.it', 16, '', 'EUREKA SYSTEM SRL', 'Via G. Amendola 24', 'Treviso (TV)', 'Lino Cappellazzo', '1973-04-12', 'Treviso (TV)', '03851590269', '3279/C24D', 'CPPLNI73D12L407C', '2019-05-04', ''),
(194, 0, 0, 0, 0, 0, 0, 0, 'EURO-DATA', 'AUTOMAZIONE', 'Via Treviso  66/A', 31020, 'Silea (TV)', 'Rigato Walter', 'Rigato Walter', '0422 460466', '8.30', '13.00', '14.00', '17.30', 'valter.rigato@eurogroup.com', 'www.eurogroup.com', 0, 'Automazione ', 'EURO-DATA', 'Via Treviso  66/A', 'Silea (TV)', 'Valter Rigato', '1957-10-23', 'San Paolo (Brasile)', '02296860261', '3279/C24D', 'RGTVTR57R23Z602G', '2019-05-04', ''),
(195, 0, 0, 0, 0, 0, 0, 0, 'EUROGROUP SPA', 'AUTOMAZIONE', 'V. Treviso 66', 31020, 'Silea (TV)', 'De Lazzari Massimo', 'Automazione: Fabio Negroni, Telecomunicazioni: Ing. Mattiuzzo Nicola, Gabrielli Guerrino - Elettroni', '0422 4647', '8.00', '12.00', '13.00', '17.00', 'info@eurogroup.com', 'www.eurogroup.com', 0, 'Impianti Tecnologici  Industriali', 'EUROGROUP SPA', 'V. Treviso 66', 'Silea (TV)', 'Walter Piologo', '1953-05-15', 'Breda di P.ve (TV)', '00030280267', '3279/C24D', 'PLCWTR53E15B128D', '2019-05-04', ''),
(196, 0, 0, 0, 0, 0, 0, 0, 'FACTORY08 SRL', 'AUTOMAZIONE', 'V. Abbate Tommaso 47', 30020, 'Quarto d Altino (TV)', 'Tonello Claudio', 'Tonello Claudio', '338 83710371', '8.00', '12.00', '13.00', '17.00', 'amministrazione@factory08.com', '', 10, 'Ateco 2841', 'FACTORY08 SRL', 'V. Abbate Tommaso, 41', 'Quarto d Altino (TV)', 'Scomparin Davide', '1972-07-08', 'Treviso (TV)', '04456060278', '14070/C24', 'SCMDVD82L08L407Z', '2020-11-09', ''),
(197, 0, 1, 0, 0, 1, 0, 0, 'FCS System SRLU', 'AUTOMAZIONE', 'Via della Ricerca 15', 31032, 'CASALE SUL SILE (TV)', 'Katia Pasquali', 'Canzan Francesco', '0422 785518', '8.00', '12.00', '13.00', '17.00', 'info@fcsystem.com', '', 50, 'ateco 284909', 'FCS System SRLU', 'Belvedere, 48', 'Casale sul Sile (TV)', 'Canuto Almerino', '1954-07-03', 'Casale sul sile (TV)', '03778970263', '', 'CNTLMN54L03B879K', '0000-00-00', ''),
(198, 0, 0, 0, 0, 0, 0, 0, 'FISET SRL ', 'AUTOMAZIONE', 'V. Cendon 1', 31020, 'Silea (TV)', 'Martin Anna ', 'Martin Anna ', '0422 360011', '', '', '', '', 'fiset@fiset.it', 'www.fiset.it', 28, 'Industria Metalmeccanica/Automazioni', 'FISET SRL ', 'V. Cendon 1', 'Silea (TV)', 'Sergio Martin', '1965-10-31', 'Treviso (TV)', '02052720261', '3279/C24D', 'MRTSRG65R31L407T', '2019-05-04', ''),
(199, 0, 0, 0, 0, 0, 0, 0, 'Flex Service', 'AUTOMAZIONE', 'Via Postumia 19', 31050, 'Ponzano Veneto (TV)', 'Visentin Stefano', 'Visentin Stefano', '0422480128', '0,25', '0,604166666666667', '', '', 'info@flexservice.it', 'www.flexservice.it', 0, '', '', '', '', '', '0000-00-00', '', '', '7166/C24D', '', '2021-05-20', ''),
(200, 0, 0, 0, 0, 0, 0, 0, 'FOREL SPA', 'AUTOMAZIONE', 'V. per Monastier 4', 31056, 'Roncade (TV)', 'Davanzo Nadia', 'Davanzo Nadia', '0422 840507', '8.00', '12.30', '13.30', '17.00', 'romina.ricordini@Forelspa.com', 'www.forelspa.com', 0, 'costruzioni macchine per lavorazione vetro', 'FOREL SPA', 'V. per Monastier 4', 'Roncade (TV)', 'Fortunato Vianello', '1946-09-11', 'Roncade (TV)', '02093600266', '3279/C24D', 'VNLFTN46P11H523D', '2019-05-04', ''),
(201, 0, 0, 0, 0, 0, 0, 0, 'FORNASIER SRL', 'AUTOMAZIONE', 'V. Mioni 28', 31020, 'San Polo di Piave (TV)', 'Peruzzetto Daniela', 'Brugnera Giampietro', '0438 445354', '8.00', '12.00', '13.00', '17.30', 'daniela.peruzzetto@fornasierautomazioni.com', '', 11, 'Impiantistica industriale', 'FORNASIER SRL', 'V. Mioni 28', 'San Polo di Piave (TV)', 'Pradal Sandro', '1959-10-13', 'Conegliano (TV)', '04944460262', '3279/C24D', 'PRDSND59R13C957W', '2019-05-04', ''),
(202, 0, 0, 0, 0, 0, 0, 0, 'FRE TOR S.R.L.', 'AUTOMAZIONE', 'Via Iginio Lasta 64 ', 32016, 'Farra D Alpago (BL)', 'De Moliner Barbara', 'Dal Borgo Simone', '0427 989133', '8.00', '12.00', '13.00', '17.00', 'fretor@fretor.com', '', 51, 'Ateco 28.49.09', 'FRE TOR S.R.L.', 'Via Iginio Lasta 64 ', 'Farra D Alpago (BL)', 'De Col Jury', '1973-03-11', 'Vittorio Veneto (TV)', '00658410253', '', 'DCLJRY73C11M089S', '0000-00-00', ''),
(203, 0, 0, 0, 0, 0, 0, 0, 'GICO SPA', 'AUTOMAZIONE', 'Via IV Novembre 81', 31028, 'Vazzola (TV)', '', '', '0438 4444', '', '', '', '', 'info@gico.it', '', 251, 'Cucine industriali', 'GICO SPA', 'Via IV Novembre 81', 'Vazzola (TV)', 'Ongaro Valeria', '1962-12-08', 'Conegliano (TV)', '00195610266', '3279/C24D', 'NGRVLR62T48C957T', '2019-05-04', ''),
(204, 0, 0, 0, 0, 0, 0, 0, 'G.L. ELETTROTECNICA', 'AUTOMAZIONE', 'via A . VOLTA 13', 31030, 'Breda di Piave (TV)', 'Luison Galliano', 'Luison Galliano', '0422 90832', '8.00', '12.00', '13.30', '17.30', 'info@glelettrotecnica.com', 'www.glelettrotecnica.com', 0, 'ATECO 43.21.01. Impiantistica industriale', 'G.L. ELETTROTECNICA', 'A . VOLTA 13', 'Breda di Piave (TV)', 'LUISON GALLIANO', '0000-00-00', 'Treviso (TV)', '00880390265.', '7359/C24D', 'LSNGLN62C25L407J', '0000-00-00', ''),
(205, 0, 0, 0, 0, 0, 0, 0, 'GM IMPIANTIN SAS', 'AUTOMAZIONE', 'V. Gobetti 6', 31050, 'Badoere di Morgano (TV)', '', '', '0422 837255', '', '', '', '', 'INFO@GMIMPIANTI.NET', 'it.gmimpianti.net', 0, '', 'GM IMPIANTIN SAS', 'V. Gobetti 6', 'Badoere di Morgano (TV)', '', '0000-00-00', '', '', '', '', '0000-00-00', ''),
(206, 0, 0, 0, 0, 0, 0, 0, 'IEMMEDI SAS', 'AUTOMAZIONE', 'Via Gen.Dalla Chiesa 6', 31038, 'Breda di Piave (TV)', 'Davanzo Michele', 'Davanzo Michele', '0422 600777', '07.30', '12.00', '13.30', '17.30', 'amministrazione@iemmedi.it', 'www.iemmedi.it', 0, 'Istallazione/Manutenzione', 'IEMMEDI SAS', 'Via Gen.Dalla Chiesa 6', 'Breda di Piave (TV)', 'Michele Davanzo', '1958-03-06', 'Breda di P.ve (TV)', '03616180265', '3279/C24D', 'DVNMHL58P06B128T', '2019-05-04', ''),
(207, 0, 0, 0, 0, 0, 0, 0, 'ILSA SPA', 'AUTOMAZIONE', 'V. Ferrovia 31', 31020, 'San Fior (TV)', 'Chies Monica', 'De Lorenzo Carlo', '0438 4905524', '8.00', '12.30', '13.30', '17.00', 'finance1@ilsaspa.com', '', 94, 'Metalmeccanico/Mobili. Per La Rist.', 'ILSA SPA', 'V. Ferrovia 31', 'San Fior (TV)', 'Luciano Zago', '1938-01-14', 'Conegliano  (TV)', '02061090268', '3279/C24D', 'ZGALCN38A14C957A', '2019-05-04', ''),
(208, 0, 0, 0, 0, 0, 0, 0, 'INGLASS SPA', 'AUTOMAZIONE', 'Via Piave 4', 31020, 'S. Polo di Piave (TV)', '', '', '0422 750111', '', '', '', '', 'info@inglass.it', '', 0, '', 'INGLASS SPA', 'Via Piave 4', 'S. Polo di Piave (TV)', 'Bortuzzo Antonio', '1960-01-11', 'Spilimbergo (PN)', '1584400988', '3279/C24D', 'BRTNTN60A11I904W', '2019-05-04', ''),
(209, 0, 0, 0, 0, 0, 0, 0, 'INNOVA.TEK SRL', 'AUTOMAZIONE', 'Via Marinai D Italia 8 ', 31020, ' San Polo di Piave (TV)', 'Salvadori franco', 'Granzotto Marco', '0422 855704', '8.30', '12.30', '14.00', '18.00', 'info@innovateksrl.com', '', 11, 'Ateco ', 'INNOVA.TEK SRL', 'Via Marinai D Italia 8 ', ' San Polo di Piave (TV)', 'Salvadori Franco', '1965-09-19', 'Treviso (TV)', '03801580261', '', 'SLVFNC65P19L407M', '0000-00-00', ''),
(210, 0, 0, 0, 0, 0, 0, 0, 'MARCHIOL S.P.A.', 'AUTOMAZIONE', 'Viale della Repubblica 41', 31020, 'Villorba (TV)', 'Bardini Renzo', 'Bardini Renzo', '04224271', '8.30', '12.30', '14.30', '18.30', 'ufficio.personale@marchiol.com', '', 0, 'Automazione', 'MARCHIOL S.P.A.', 'Viale della Repubblica 41', 'Villorba (TV)', 'Davetta Roberto', '1972-04-12', 'Gorizia (GO)', '01176110268', '3279/C24D', 'DVTRRT72D12E098V', '2019-05-04', ''),
(211, 0, 0, 0, 0, 0, 0, 0, 'MASTER BUILDERS SOLUTIONS ITALIA SPA', 'AUTOMAZIONE', 'V. Vicinali delle corti 31', 31100, 'Treviso (TV)', 'Cernicchi Enrico', 'Feltrin Christian', '0422 421802', '8.00', '12.30', '13.30', '17.00', 'infomac@mbcc-group.com', '', 51, 'Ateco 20.3', 'MASTER BUILDERS SOLUTIONS ITALIA SPA', 'V. Vicinali delle corti 31', 'Treviso (TV)', 'Smecca Francesco', '1958-12-20', 'Naro (AG)', '09193910156', '7187/C24', 'SMCFNC58T20F845F', '2021-05-20', ''),
(212, 0, 0, 0, 0, 0, 0, 0, 'MERMEC SPA', 'AUTOMAZIONE', 'Vicolo Ongarie 13', 31050, 'Morgano (TV)', 'Marangon Manola', 'Dalla Torre Marco - Todaro Stefano', '0422 839217', '9.00', '13.00', '14.00', '16.30', 'manola.marangon@mermecgroup.com', '', 51, 'Metalmeccanico', 'MERMEC SPA', 'Vicolo Ongarie 13', 'Morgano (TV)', 'Trione Luigi', '1964-11-03', 'Bari (BA)', '05033050963', '2284/C24d', 'TRNLGU64S03A662F', '2018-04-05', ''),
(213, 0, 0, 0, 0, 0, 0, 0, 'METEOR sas di Fabio Dell Oglio', 'AUTOMAZIONE', 'via S.Anna 3', 31010, 'Mareno di Piave (TV)', 'francesca sgroi', 'Trevisan - Betterle', '0438493911', '8.30', '12.30', '13.00', '17.00', '', '', 53, 'ateco 27.11.00', 'METEOR sas di Fabio Dell Oglio', 'via S.Anna 3', 'Mareno di Piave (TV)', 'Dell Oglio Fabio', '1965-12-27', 'Conegliano (TV)', '04255770267', '', 'DLLFBA65T27C957V', '0000-00-00', ''),
(214, 0, 0, 0, 0, 0, 0, 0, 'MR ROBOTICA SRL', 'AUTOMAZIONE', 'Via Luigi Galvani 9/7', 31027, 'Spresiano (TV)', 'Guerra William', ' ', '0422 881554', '', '', '', '', 'info@mr-robotica.it', '', 5, '', 'MR ROBOTICA SRL', 'Via Luigi Galvani 9/7', 'Spresiano (TV)', 'Breda Roberto', '1966-12-08', 'Treviso (TV)', '04442140267', '1989/C24D', 'BRDRRT66T08L407D', '2018-03-23', ''),
(215, 0, 0, 0, 0, 0, 0, 0, 'NARDI IMPIANTI SRL', 'AUTOMAZIONE', 'V.Longhin 97', 31056, 'Roncade (TV)', 'Pietrobon Stefano', 'Pietrobon Stefano', '0422 708628', '', '', '', '', 'info@nardimpianti.eu', 'www.nardimpianti.eu', 15, 'Impianti Elettrici - Civ. Indus.', 'NARDI IMPIANTI SRL', 'V.Longhin 97', 'Roncade (TV)', 'Lena Nardi', '1981-06-28', 'Treviso (TV)', '04706830264', '3279/C24D', 'NRDLNE81H68L407W', '2019-05-04', ''),
(216, 0, 0, 0, 0, 0, 0, 0, 'NEW SUPPLY GROUP SRL', 'AUTOMAZIONE', 'V. Antonio Meucci 5', 31050, 'Ponzano Veneto (TV)', 'Barzì Flavio', 'Barzì Flavio', '0422 962972', '', '', '', '', 'info@newsupplygroup.com', '', 0, 'Automazione', 'NEW SUPPLY GROUP SRL', 'V. Antonio Meucci 5', 'Ponzano Veneto (TV)', 'Flavio Barzi', '1962-06-25', 'Villorba (TV)', '03765720267', '180/C24D', 'BRZFLV62H25H048Z', '2017-01-14', ''),
(217, 0, 0, 0, 0, 0, 0, 0, 'NORDEST AUTOMAZIONI SRL', 'AUTOMAZIONE', 'Via Volta 47/A', 31030, 'Casier (TV)', 'Carraretto Stefano', 'Carraretto stefano', '0422 491887', '8.00', '12.00', '14.00', '18.00', 'info@nordestautomazioni.it', '', 25, 'Automazione', 'NORDEST AUTOMAZIONI SRL', 'Via Volta 47/A', 'Casier (TV)', 'Stefani Francesco', '1962-03-10', 'Mogliano Veneto (TV)', '4602370266', '3279/C24D', 'STFFNC62C10F269C', '2017-01-15', ''),
(218, 0, 0, 0, 0, 0, 0, 0, 'NOVAGEST SRL', 'AUTOMAZIONE', 'Via Paludetti 28/C', 31100, 'Treviso (TV)', 'Gallinaro Enrico', 'Gallinaro Enrico', '0422 230402', '', '', '', '', 'enrico@novagest.com', 'www.novagest.com', 25, 'Commercio/Gestione Distrib. Automatici', 'NOVAGEST SRL', 'Via Paludetti 28/C', 'Treviso (TV)', 'Enrico Gallinaro', '1968-02-27', 'Treviso (TV)', '03139640266', '143/C24D', 'GLLRNC68B27L407C', '2017-01-16', ''),
(219, 0, 0, 0, 0, 0, 0, 0, 'NOVATEC SRL', 'AUTOMAZIONE', 'V. Primo Maggio 1', 31050, 'Monastier di Treviso (TV)', 'Viale Gianni', 'Viale Gianni', '0422 898339', '', '', '', '', 'info@novatec.tv', 'www.novatec.tv', 8, 'Metalmeccanico/Automazioni Ind.', 'NOVATEC SRL', 'V. Primo Maggio 1', 'Monastier di Treviso (TV)', 'Gianni Viale', '1966-08-18', 'Brescia', '031734280260', '7839/C24', 'VLIGNN66M18B1517F', '2017-01-17', ''),
(220, 0, 0, 0, 0, 0, 0, 0, 'OLMA SRL', 'AUTOMAZIONE', 'v.dell  Industria', 31020, 'S. Vendemiano (TV)', 'Rui Corrado', 'Rui Corrado', '0438 778206', '8.00', '12.00', '13.30', '17.30', 'info@olmasrl.net', '', 43739, 'Progettazione elettrica', 'OLMA SRL', 'v.dell  Industria', 'S. Vendemiano (TV)', 'Rui Corrado', '1968-04-22', 'Conegliano (TV)', '00210390266', '3279/C24D', 'RUICRD68D22C957M', '2017-01-18', ''),
(221, 0, 0, 0, 0, 0, 0, 0, 'OSPEDALE VILLA SALUS', 'AUTOMAZIONE', 'Via Terraglio 114', 30174, 'Mestre (VE)', 'Vitale Di Maio Teresa', 'Bassano Mario', '041 2906411', '', '', '', '', 'ufficio.informazioni@ospedalevillasalus.it', '', 300, 'Servizi sanitari', 'OSPEDALE VILLA SALUS', 'Via Terraglio 114', 'Mestre (VE)', 'Vitale Di Maio Teresa', '1943-06-21', 'Recale (CE)', '00336090477', '1990/C24D', 'VTLTRS43H61H210X', '2017-01-19', ''),
(222, 0, 0, 0, 0, 0, 0, 0, 'OSRAM SPA', 'AUTOMAZIONE', 'Via Castagnole 65A', 31038, 'Paese (TV)', 'Saccardo Stefania', '', '0422 2901', '8.30', '12.30', '13.30', '17.30', 'g.costa-ext@osram.com', 'www.osram.it', 582, 'Automazione Ind.le', 'OSRAM SPA', 'Via dell innovazione, 3', 'Milano (MI)', 'ALFREDO MASCHIO', '1962-11-17', 'Treviso (TV)', '00745030155', '3279/C24D', 'MSCLRD62S17L407R', '2017-01-20', ''),
(223, 0, 0, 0, 0, 0, 0, 0, 'PAVAN ALESSIA', 'AUTOMAZIONE', 'piazza Vittoria 10', 31100, 'Treviso (TV)', 'Pavan Alessia', 'Mistro Denis', '3331295154', '', '', '', '', 'alessipavan684@gmail.com', '', 0, '', 'PAVAN ALESSIA', 'piazza Vittoria 10', 'Treviso (TV)', '', '0000-00-00', '', '', '', '', '2017-01-21', ''),
(224, 0, 0, 0, 0, 0, 0, 0, 'PESCE EDOARDO VI SRL', 'AUTOMAZIONE', 'V. G.B. Tiepolo 15', 31021, 'Mogliano Veneto (TV)', '', '', '', '', '', '', '', '', '', 0, '', 'PESCE EDOARDO VI SRL', 'V. G.B. Tiepolo 15', 'Mogliano Veneto (TV)', 'Pesce Alessandro', '1971-10-18', 'Forlì (FC)', '03085050262', '13265/C24', 'PSCLSN71R18D704H', '2017-01-22', ''),
(225, 0, 0, 0, 0, 0, 0, 0, 'POZZOBON IMPIANTI SRL', 'AUTOMAZIONE', 'VIA D. QUIRINI 3/A', 31036, 'Istrana (TV)', 'Pozzobon Massimo', 'Pozzobon Massimo', '0422 832605', '', '', '', '', 'amministrativo@pozzobonimpiantisrl.com', '', 0, 'Automazione (New', 'POZZOBON IMPIANTI SRL', 'VIA D. QUIRINI 3/A', 'Istrana (TV)', 'Massimo Pozzobon', '1970-07-25', 'Castelfranco Veneto (TV)', '03811370265', '170/C24D', 'PZZMSM70L25C111W', '2017-01-23', ''),
(226, 0, 0, 0, 0, 0, 0, 0, 'A.R.I.A.M.', 'AUTOMAZIONE', 'Venier 35', 31050, 'VEDELAGO', 'Agnoletto Roberto', 'Agnoletto Roberto', '3357525090', '8.00', '12.00', '13.30', '17.30', 'agnolettoroberto@outlook.it', '', 10, '', 'A.R.I.A.M.', 'Venier 35', 'VEDELAGO', 'Roberto Agnoletto', '1964-12-08', 'Castelfranco Veneto (TV)', '04023580261', '7176/C24D', '', '2017-01-24', ''),
(227, 0, 0, 0, 0, 0, 0, 0, 'PRADAL srl', 'AUTOMAZIONE', 'via Mioni 28', 31020, 'San Polo di Piave (TV)', 'Daniela Peruzzetto', 'Gianpiero Brugnera', '0422 855080', '', '', '', '', 'pradal@pradal.it', '', 0, '', 'PRADAL srl', 'via Mioni 28', 'San Polo di Piave (TV)', '', '0000-00-00', '', '', '3279/C24D', '', '2017-01-25', ''),
(228, 0, 0, 0, 0, 0, 0, 0, 'PROSOFT SRL', 'AUTOMAZIONE', 'Via Alzaia sul Sile 26/D', 31057, 'Silea (TV)', 'Cenedese Andrea', 'Cenedese Andrea', '0422 363524', '8.30', '12.30', '14.00', '18.00', 'andrea.cenedese@prosoft-srl.com', '', 0, 'Automazione ', 'PROSOFT SRL', 'Via Alzaia sul Sile 26/D', 'Silea (TV)', 'Andrea Cenedese', '1968-10-11', 'Treviso (TV)', '03618850261', '3279/C24D', 'CNDNDR68R11L407B', '2017-01-26', ''),
(229, 0, 0, 0, 0, 0, 0, 0, 'ROGER TECNOLOGY SRL', 'AUTOMAZIONE', 'Via Botticelli 8', 31021, 'Mogliano Veneto (TV)', 'Florian Primo', 'Florian Manuel', '041 5937023', '', '', '', '', 'amministrazione@rogertechnology.it', '', 60, 'Fabbricazione di motori', 'ROGER TECNOLOGY SRL', 'Via Botticelli 8', 'Mogliano Veneto (TV)', 'Florian Dino', '1959-09-27', 'Silea (TV)', '01612340263', '7163/C24D', 'FLRDNI59P27F116Y', '2017-01-27', ''),
(230, 0, 0, 0, 0, 0, 0, 0, 'PURARCHITETTURA', 'AUTOMAZIONE', 'Via Treviso19', 31059, 'Zero Branco (TV)', 'Barbazza Nicola', '', '0422 97436', '', '', '', '', 'conctat@purarchitettura.it', '', 0, 'Studio di progettazione', 'PURARCHITETTURA', 'Via Treviso19', 'Zero Branco (TV)', 'Barbazza Nicola', '0000-00-00', '', '', '', '', '2017-01-28', ''),
(231, 0, 0, 0, 0, 0, 0, 0, 'Sirio Srl', 'AUTOMAZIONE', 'Via Nuova Trevigiana Lughignano 124', 31032, 'CASALE SUL SILE (TV)', 'Marian Adriano', 'Marian Adriano', '0422822506', '8.00', '12.00', '13.30', '17.30', 'amministrazione@siriotreviso.it', '', 50, 'quadri elettrici, PLC', 'SIRIO SRL', 'Via Nuova Trevigiana Lughignano, 124', 'Casale sul Sile (TV)', 'Zago Paolo', '1962-06-26', 'Treviso (TV)', '03315340269', '7158/C24D', 'ZGAPLA62H26L407H', '2017-01-29', ''),
(232, 0, 0, 0, 0, 0, 0, 0, 'S. G. ELETTRONICA SRL', 'AUTOMAZIONE', 'Via Ferrari 28', 30037, 'Scorzè (VE)', 'Zottino Sandro', 'Zottino Sandro', '041 5841973', '', '', '', '', 'info@almot.it', '', 5, '', 'S. G. ELETTRONICA SRL', 'Via Ferrari 28', 'Scorzè (VE)', 'Zottino Sandro', '1959-02-24', 'Bolzano (BZ)', '02272310273', '1994/C24D', 'ZTTSDR59B24A952G', '2017-01-30', ''),
(233, 0, 0, 0, 0, 0, 0, 0, 'SGE SRL', 'AUTOMAZIONE', 'V. Terraglio  263', 31022, 'Preganziol (TV)', 'Salvadori Sergio', 'Salvadori Sergio', '0422 490651', '8.30', '12.30', '14.00', '18.00', 'salvadori@sgetreviso.it', 'www.sgesrl.com', 17, 'Servizi Information Tecnology', 'SGE SRL', 'V. Terraglio  263', 'Preganziol (TV)', 'Sergio Salvadori', '1955-09-05', 'Casale sul sile (TV)', '01675950263', '3279/C24D', 'SLVSRG55P05B879R', '2017-01-31', '');
INSERT INTO `azienda` (`id`, `id_docente`, `n_informatici`, `n_telecomunicazioni`, `n_elettronici`, `n_automazioni`, `n_liceo`, `n_totale`, `denominazione_azienda`, `settore`, `indirizzo`, `cap`, `comune`, `referente_aziendale`, `tutor_aziendale`, `telefono`, `inizioam`, `fineam`, `iniziopm`, `finepm`, `email`, `sito`, `n_dipendenti`, `settore_attivita`, `leg_denominazioneazienda`, `leg_via`, `leg_comune`, `leg_nomecognome`, `leg_datanascita`, `leg_comunenascita`, `leg_iva`, `rapleg_convenzioneprotocolo`, `rapleg_codicefiscale`, `rapleg_convenzionedata`, `commento`) VALUES
(234, 0, 0, 0, 0, 0, 0, 0, 'SICURINGROS DI LUCA DONATO', 'AUTOMAZIONE', 'Via Postumia 26/D', 31055, 'Quinto di Treviso (TV)', 'Donato Luca', 'Donato Luca', '0422 260826', '8.00', '12.00', '14.00', '18.00', 'amministrazione@sicuringros.com', '', 5, 'Impianti antifurto', 'SICURINGROS DI LUCA DONATO', 'Via Postumia 26/D', 'Quinto di Treviso (TV)', 'Donato Luca', '1964-05-03', 'Treviso (TV)', '03177690264', '3279/C24D', 'DNTLCU64E03L407M', '2017-02-01', ''),
(235, 0, 0, 0, 0, 0, 0, 0, 'SINTHESI ENGINEERING S.R.L.', 'AUTOMAZIONE', 'Via Mira 20/8', 31053, 'Pieve di Soligo (TV)', 'Canal Mauro', 'Canal Mauro', '0438 82216', '8.30', '12.30', '14.00', '18.00', 'info@sinthesi.net', '', 10, '', 'SINTHESI ENGINEERING S.R.L.', 'V. Bellucci, 35', 'Farra di Soligo (TV)', 'Andreola Pierpaolo', '1970-11-08', 'Pieve di Soligo (TV)', '03930730266', '3279/C24D', 'NDRPPL 70S08G645Q', '2017-02-02', ''),
(236, 0, 0, 0, 0, 0, 0, 0, 'SISTEC SRL', 'AUTOMAZIONE', 'Via Roveredo 20/b', 33170, 'Pordenone (PN)', 'De Vecchi Daniele', 'Da Re Luca', '0434 789511', '', '', '', '', 'sistec@sistec-pn.it', '', 20, 'Lavoraz. Materie plastiche', 'SISTEC SRL', 'Via Roveredo 20/b', 'Pordenone (PN)', 'De Vecchi Daniele', '1966-02-14', 'Svizzera', '01507090932', '3279/C24D', 'DVCDNL66B14Z133D', '2017-02-03', ''),
(237, 0, 0, 0, 0, 0, 0, 0, 'SONEPAR ITALIA SPA', 'AUTOMAZIONE', 'Via Alessandro Volta 2', 35100, 'Villorba (TV)', 'Donato Fiore', 'Visentin Massimo', '0422 3122', '8.30', '12.30', '14.30', '18.30', 'federica.lattebono@sonepar.it', '', 251, 'Commercio materiale elettrico', 'SONEPAR ITALIA SPA', 'Via Riviera maestri del lavoro, 24', 'Padova (PD)', 'Fiore Donato', '1972-03-23', 'Salerno (SA)', '00825330285', '3279/C24D', 'FRIDNT72C23H703Z', '2017-02-04', ''),
(238, 0, 0, 0, 0, 0, 0, 0, 'SPELSY S.N.C.', 'AUTOMAZIONE', 'V. Chiesa 81/C', 31047, 'Ponte Di Piave (TV)', 'Raffael Daniele', 'Zanotto Giovanni', '0422 854610', '8.00', '12.00', '13.30', '17.30', 'info@spelsy.it', 'www.spelsy.it', 5, 'Automazione Industriale ', 'SPELSY S.N.C.', 'V. Chiesa 81/C', 'Ponte Di Piave (TV)', 'Romano Zanotto', '1958-05-12', 'Ponte di Piave (TV)', '02485930263', '7844/C24', 'ZNTRMN58E12G846W', '2017-02-05', ''),
(239, 0, 0, 0, 0, 0, 0, 0, 'STAM SPA', 'AUTOMAZIONE', 'Via Piave 6', 31050, 'Ponzano Veneto (TV)', 'Bordignon Marco', 'Pizzolo Mauro / De Biasi Bruno', '0422 440100', '8.00', '12.00', '13.00', '17.00', 'stam@stam.it', '', 55, '282999 - Metalmeccanica', 'STAM SPA', 'Via Piave 6', 'Ponzano Veneto (TV)', 'Saccà Giovanna', '1968-08-04', 'Treviso (TV)', '04412800262', '3279/C24D', 'SCCGNN68M44L407T', '2017-02-06', ''),
(240, 0, 0, 0, 0, 0, 0, 0, 'STARMATIK  S.R.L. U.', 'AUTOMAZIONE', 'Via Tagliamento1', 31027, 'Spresiano (TV)', 'Soldera Tiziana ', 'Calesso Stefano', '0422 722 964', '8.00', '12.30', '14.00', '17.30', 'info@starmatik.com', 'www.starmatik.com', 50, 'Metalmeccanico/Automazioni ', 'STARMATIK  S.R.L. U.', 'Via Tagliamento1', 'Spresiano (TV)', 'Stefano Fava', '1961-09-11', 'Treviso (TV)', '03233720261', '3279/C24D', 'FVASFN61P11L407G', '2017-02-07', ''),
(241, 0, 0, 0, 0, 0, 0, 0, 'STUDIO TECNICO ZANIN', 'AUTOMAZIONE', 'Via Corti Comunale 756 ', 422, 'Treviso (TV)', 'Zanin Giorgio', 'Zanin Giorgio', '0422 693023', '8.00', '12.30', '14.00', '17.30', 'zanin@progettizanin.it', '', 44470, 'Ateco 74.90.91', 'STUDIO TECNICO ZANIN', 'Via Rosi, 18', 'S.Biagio di Callalta (TV)', 'Zanin Giorgio', '1969-03-14', 'Treviso (TV)', '03122520269', '', 'ZNNGRG69C14L407W', '2017-02-08', ''),
(242, 0, 0, 0, 0, 0, 0, 0, 'SYTEC SRL', 'AUTOMAZIONE', 'Via della Libertà 1', 31050, 'Ponzano Veneto (TV)', 'Mazzobel Daniele', 'Mazzobel Daniele', '0422 961111', '8.00', '12.00', '13.00', '17.00', 'alessandro.noro@sytecgroup.it', '', 0, 'Automazione ', 'SYTEC SRL', 'Via della Libertà 1', 'Ponzano Veneto (TV)', 'Dareio Lazzaro', '1976-04-24', 'Treviso (TV)', '03053310268', '3279/C24D', 'LZZDRA76D24L407L', '2017-02-09', ''),
(243, 0, 0, 0, 0, 0, 0, 0, 'TA AUTOMATION', 'AUTOMAZIONE', 'Via Bosco 10', 31032, 'Casale sul Sile (TV)', 'Tronchin Alberto', 'Tronchin Alberto', '347 2703847', '8.00', '12.30', '13.30', '17.00', 'taautomation@libero.it', '', 10, 'Quadi elettrici e programmazione PLC', 'TA AUTOMATION', 'Via Bosco 10', 'Casale sul Sile (TV)', 'Tronchin Alberto', '1972-04-26', 'Treviso (TV)', '04370260268', '3279/C24D', 'TRNLRT72D26L407N', '2017-02-10', ''),
(244, 0, 0, 0, 0, 0, 0, 0, 'T.E.I. TREVISO ELETTRO IMPIANTI SNC', 'AUTOMAZIONE', 'Via Trieste 70', 31020, 'Villorba (TV)', 'Camarotto Stefano', 'Gagliazzo Sergio', '0422 442121- 3492228410', '7.30', '12.00', '13.30', '17.30', 'teisnc@alice.it', '', 5, 'Impianti elettrici', 'T.E.I. TREVISO ELETTRO IMPIANTI SNC', 'Via Trieste 70', 'Villorba (TV)', 'Camarotto Stefano', '1970-02-04', 'Treviso (TV)', '03152500264', '3279/C24D', 'CMRSFN70B04L407C', '2017-02-11', ''),
(245, 0, 0, 0, 0, 0, 0, 0, 'TECNEL S.I.E.E. SRL', 'AUTOMAZIONE', 'Via Postumia 113 ', 31050, 'Pontano Veneto (TV) ', 'Bigolin stefania', 'Michielan Oriano', '0422 961691', '8.00', '12.00', '13.00', '17.00', 'tecnel@tecnelsiee.it', '', 11, 'Ateco 43.21.01', 'TECNEL S.I.E.E. SRL', 'Via Postumia 113 ', 'Pontano Veneto (TV) ', 'Bigolin Davide', '1974-06-11', 'Treviso (TV)', '00872680269', '', 'BGLDVD74H11L407Y', '2017-02-12', ''),
(246, 0, 0, 0, 0, 0, 0, 0, 'TECHNO SYSTEMS', 'AUTOMAZIONE', 'Via Arma di cavalleria 5', 31055, 'Quinto di Treviso (TV)', 'Zara Bruno', 'Zara Riccardo', '0422 470958', '07.30', '12.00', '13.30', '17.00', 'info@technosystems.it', '', 7, '', 'TECHNO SYSTEMS', 'Via Arma di cavalleria 5', 'Quinto di Treviso (TV)', 'Zara Bruno', '1966-02-03', 'Martellago (VE)', '03783270261', '3279/C24D', 'ZRABRN66B03E980V', '2017-02-13', ''),
(247, 0, 0, 0, 0, 0, 0, 0, 'TECNOGAMMA SRL', 'AUTOMAZIONE', 'Via Pareto 4/6', 31030, 'Casier (TV)', 'Norma Marzà', 'Norma Marzà', '0422 330583', '', '', '', '', 'tecnogammasrl@gmail.com', 'www.mermecgroup', 0, 'Automazione', 'TECNOGAMMA SRL', 'Via Pareto, 4/6', 'Dosson di Casier (TV)', 'Norma Marzà', '1978-04-08', 'Treviso (TV)', '03817910262', '94/C24D', 'MRZNRM78D48L407B', '2017-02-14', ''),
(248, 0, 0, 0, 0, 0, 0, 0, 'TECNO LOGICA SRL', 'AUTOMAZIONE', 'Via Indipendenza 12', 31027, 'Spresiano (TV)', 'Galiazzo Walter', 'Meneghin Claudio x aut.ne / Olivotto Mauro x Inf.ca', '0422 725928', '8.00', '12.30', '13.30', '17.30', 'info@tecno-logica.com', 'www.tecno-logica.com', 32, 'Automazioni Industriali', 'TECNO LOGICA SRL', 'Via Indipendenza 12', 'Spresiano (TV)', 'Mirko  Piasentin', '1962-06-22', 'Winterthur  (SVIZZERA)', '03503350260', '3279/C24D', 'PSNMRK62H22Z133R', '2017-02-15', ''),
(249, 0, 0, 0, 0, 0, 0, 0, 'TECNO TEST SRL', 'AUTOMAZIONE', 'Via Colombera 125', 30175, 'Marghera (VE)', 'Abbadir Matteo', 'Gesuato Davide', '041 5382134', '', '', '', '', 'amministrazione@tecno-test.it', '', 20, 'Collaudi ed analisi tecniche di prodotti', 'TECNO TEST SRL', 'Via Colombera 125', 'Marghera (VE)', 'Abbadir Matteo', '1979-09-04', 'Venezia (VE)', '00675840276', '1998/C24D', 'BBDMTT79P04L736H', '2017-02-16', ''),
(250, 0, 0, 0, 0, 0, 0, 0, 'TECNOLOGIA INDUSTRIALE SRL', 'AUTOMAZIONE', 'V. Alfred Nobel 30', 31020, 'Villorba (TV)', 'Mauro Aloisio /Sconza Testa ', 'Mauro Aloisio /Sconza Testa ', '0422 609117', '', '', '', '', 'info@tecnologiaindustriale.eu', 'www.tecnologiaindustriale.eu', 0, 'Automazione Industriale ', 'TECNOLOGIA INDUSTRIALE SRL', 'V. Alfred Nobel 30', 'Villorba (TV)', 'Mauro Aloisio /Sconza Testa ', '1972-05-03', 'Treviso (TV)', '04521000267', '27/C24D', 'LSSMRA72E03L407W', '2017-02-17', ''),
(251, 0, 0, 0, 0, 0, 0, 0, 'TECNOSTUDIO', 'AUTOMAZIONE', 'Via Castellana 67/b', 31100, 'Treviso (TV)', 'Lorenzetto Maurizio', 'Lorenzetto Maurizio', '0422 433677', '8.30', '12.30', '14.00', '18.00', 'amministrazione@tecnostudio.it', '', 0, 'Studio ingegneria', 'TECNOSTUDIO', 'Via Castellana 67/b', 'Treviso (TV)', 'Lorenzetto Maurizio', '1957-09-22', 'Treviso (TV)', '01552960260', '3279/C24D', 'LRNMRZ57P22L407X', '2017-02-18', ''),
(252, 0, 0, 0, 0, 0, 0, 0, 'TECNO TUBI S.R.L.', 'AUTOMAZIONE', 'Via Postumia 87/A', 31050, 'Ponzano  (TV)', 'Gallia Vanna', 'Foffano Cristian', '0422 421851', '8.00', '12.00', '14.00', '18.00', 'info@tecnotubi.com', '', 11, 'Ateco 28.12', 'TECNO TUBI S.R.L.', 'Via Postumia 87/A', 'Ponzano  (TV)', 'Gallina Germano', '1968-05-10', 'Treviso (TV)', '00831450267', '', 'GLLGMN68E10L407I', '2017-02-19', ''),
(253, 0, 3, 0, 0, 0, 0, 0, 'TEXA SPA', 'AUTOMAZIONE', 'Via I Maggio', 31050, 'Monastier di Treviso (TV)', 'Luigi Bastianello', 'Luigi Bastianello', '0422 791311', '', '', '', '', 'info.it@texa.com', 'www.texa.it', 0, 'Diagnosi Elettronica', 'TEXA SPA', 'Via I Maggio', 'Monastier di Treviso (TV)', 'Luigi Bastianello', '1975-08-07', 'Mirano (VE)', '02413550266', '7191/C24D', 'BSTLGU75M07F241T', '2017-02-20', ''),
(254, 0, 0, 0, 0, 0, 0, 0, 'TREESSE PROGETTI SRL', 'AUTOMAZIONE', 'Via Brondi 18', 31055, 'Quinto di Treviso (TV)', 'Baldisseri MIrco', 'Baldisseri MIrco', '0422960811', '8.30', '12.30', '13.30', '17.30', 'info@treesseprogetti.it', '', 50, '', 'TREESSE PROGETTI SRL', 'Via Brondi 18', 'Quinto di Treviso (TV)', 'Luigi Berlese', '1959-09-06', 'Vedelago (TV)', '04416960260', '7180/C24D', '', '2017-02-21', ''),
(255, 0, 0, 0, 0, 0, 0, 0, 'WEB N GO  ITALIA SRL', 'AUTOMAZIONE', 'Via Roma 44', 31030, 'Casier (TV)', 'Diego', 'Diego', '0422 493059', '', '', '', '', 'Amministrazione@webngo.net', 'www.webngo.net', 10, 'Cartellonistica Pubb.', 'WEB N GO  ITALIA SRL', 'Via Roma 44', 'Casier (TV)', 'Visentin Diego', '1976-01-22', 'Treviso (TV)', '03563060262', '3279/C24D', 'VSNDGI76A22L407M', '2017-02-22', ''),
(256, 0, 0, 0, 0, 0, 0, 0, 'ZULIAN FRANCESCO', 'AUTOMAZIONE', 'Viale Monte Grappa 26', 31100, 'Treviso (TV)', 'Zulian Francesco', 'Zulian Francesco', '0422 303124', '7.30', '12.30', '14.00', '17.00', 'fzimpianti21@gmail.com', '', 44470, 'Ateco 43.21.01', 'ZULIAN FRANCESCO', 'Viale Monte Grappa 26', 'Treviso (TV)', 'Zulian Francesco', '1970-03-19', 'Treviso (Tv)', '03324330269', '', 'ZLNFNC70C19L407G', '2017-02-23', ''),
(257, 0, 0, 0, 0, 0, 0, 0, 'ZAGO ROMEO SNC', 'AUTOMAZIONE', 'V. Fratelli Rossetti 5/1', 31020, 'Villorba (TV)', 'Zago Luca', 'Zago Luca', '3407060645', '8.00', '12.00', '13.30', '17.30', 'LucaZago9@Alice.it', '', 0, 'Automazione Industriale', 'ZAGO ROMEO SNC', 'V. Fratelli Rossetti 5/1', 'Villorba (TV)', 'Luca Zago', '1979-06-29', 'Treviso (TV)', '03831000264', '3279/C24D', 'ZGALCU79H29L407N', '2017-02-24', ''),
(258, 0, 0, 0, 0, 0, 0, 0, 'ALBA ELETTRONICA', 'ELETTRONICA', 'V.Leonardo Da Vinci 3', 31021, 'Mogliano Veneto (TV)', 'Bacchin Luca', 'Casagrande Tiziano', '041 5902638', '8.30', '12.30', '13.30', '17.30', 'info@alba-pcb.com', 'www.alba-pcb-.com/it', 40, 'Elettronica/ Circuiti stampati', 'ALBA ELETTRONICA', 'V.Leonardo Da Vinci 3', 'Mogliano Veneto (TV)', 'Luca Bacchin', '1967-01-10', 'Treviso (TV)', '02155920263', '3279/C24D', 'BCCLCU67A10L407B', '2017-02-25', ''),
(259, 0, 0, 0, 0, 0, 0, 0, 'AMG ASCENSORI SRL', 'ELETTRONICA', 'V. Levante 2', 33080, 'Porcia (PN)', 'Rigo Ado', 'Rigo Ado', '334 6689495', '', '', '', '', 'amg.ascensori@g.mail.com', 'www.ascensori.com', 3, 'Artigiano/Metalmeccanico', 'AMG ASCENSORI SRL', 'V. Levante 2', 'Porcia (PN)', 'Matteo Battistella', '1984-02-13', 'Maniago (PN)', '01643930934', '233/C24D', 'BTTMTT84B12E889F', '2017-02-26', ''),
(260, 0, 0, 0, 0, 0, 0, 0, 'AUDITEC SNC AUDIO VIDEO TECHNICAL EQUIPE', 'ELETTRONICA', 'Via Treviso 66', 31020, 'Silea (TV)', 'Bresolin David', 'Bresolin David', '0422 363452', '8.00', '12.00', '13.30', '17.30', 'auditec@auditec.it', '', 0, 'Commercio/Artigianato', 'AUDITEC SNC AUDIO VIDEO TECHNICAL EQUIPE', 'Via Treviso 66', 'Silea (TV)', 'Ermanno Pavan Michielon', '0000-00-00', 'Treviso (TV)', '02453610269', '3279/C24D', 'PVNRRM69E04L407R', '2017-02-27', ''),
(261, 0, 0, 0, 0, 0, 0, 0, 'BAMAT IMPIANTI SRL', 'ELETTRONICA', 'Via dell  artigianato 14', 45030, 'Occhiobello (RO)', 'Tonello Fanny', 'Marella Michele', '0425 750154', '8.30', '12.30', '14.00', '18.00', 'bamatsrl@gmail.com', '', 11, 'Progettazione e realizzazione quadri elettrici', 'BAMAT IMPIANTI SRL', 'Via dell  artigianato 14', 'Occhiobello (RO)', 'Tonello Gianpietro', '1974-04-04', 'Lendinara (RO)', 'IT01138240294', '3279/C24D', 'TNLGPT74D04E522Q', '2017-02-28', ''),
(262, 0, 0, 0, 0, 0, 0, 0, 'BERNARDI SAS', 'ELETTRONICA', 'V.dei Bersaglieri 14', 31020, 'San Polo di Piave (TV)', '', '', '0422 856153', '', '', '', '', '', '', 0, '', 'BERNARDI SAS', 'V.dei Bersaglieri 14', 'San Polo di Piave (TV)', 'Bernardi Loris', '1966-02-22', 'San polo di Piave (TV)', '03986130262', '13314/C24', 'BRNLRS66B22I124R', '2017-03-01', ''),
(263, 0, 0, 0, 0, 0, 0, 0, 'BERTAZZON 3B', 'ELETTRONICA', 'Via Trevigiana 178', 31020, 'Serneglia della Battaglia (TV)', 'Bertazzon Giuseppe', 'Bertazzon Giuseppe', '0438 966291', '8.00', '12.00', '13.30', '17.30', '', '', 0, '', 'BERTAZZON 3B', 'Via Trevigiana 178', 'Serneglia della Battaglia (TV)', 'Giuseppe Bertazzon', '1963-10-01', 'Pieve di Soligo (TV)', '00190680264', '3279/C24D', 'BRTGPP63R01G645P', '2017-03-02', ''),
(264, 0, 0, 0, 0, 0, 0, 0, 'BIEFFEZETA SRL', 'ELETTRONICA', 'V. Monte Nero 47', 31032, 'Casale sul Sile (TV)', 'Benetello Giorgio', 'Zoia Matteo', '0422 820499', '8.00', '12.00', '13.30', '17.30', '', 'info@bieffezeta.com', 10, 'Ateco T04ZHR3 - istat 026009', 'BIEFFEZETA SRL', 'V. Monte Nero 47', 'Casale sul Sile (TV)', 'Benetello giorgio', '1962-04-08', 'Treviso (TV)', '04170490264', '2623/C24', 'BNTGRG62D08L407X', '2017-03-03', ''),
(265, 0, 0, 0, 0, 0, 0, 0, 'CABLE IMPIANTI S.R.L.', 'ELETTRONICA', 'VIA TOTI DAL MONTE 8', 31100, 'TREVISO (TV)', '', '', '0422432283', '', '', '', '', '', 'info@cableimpianti.it', 0, '', 'CABLE IMPIANTI S.R.L.', 'VIA TOTI DAL MONTE 8', 'TREVISO (TV)', '', '0000-00-00', '', '', '', '', '2017-03-04', ''),
(266, 0, 0, 0, 0, 0, 0, 0, 'CARTIERA BURGO GROUP SPA', 'ELETTRONICA', 'Via Piave1', 31020, 'Altavilla vicentina(VI)', 'Garnier Maurizio', 'Garnier Maurizio', '0422 6281', '8:00', '12:00', '13:00', '17:00', 'gaggia.luca@burgo.com', '', 0, '', 'CARTIERA BURGO GROUP SPA', 'Via Roma, 212', 'Villorba (TV)', 'Errani Marco Pietro', '1971-04-25', 'Frosinone', '13051890153', '14258/C24D', 'RRNMCP71D25D810L', '2017-03-05', ''),
(267, 0, 0, 0, 0, 0, 0, 0, 'CEOTTO FRANCO', 'ELETTRONICA', 'Via Barca II 66', 31058, 'Susegana (TV)', 'Ceotto Franco', 'Ceotto Franco', '348 3312003', '', '', '', '', 'franco_ceotto@yahoo.com', '', 2, '', 'CEOTTO FRANCO', 'Via Barca II,66', 'Susegana (TV)', 'Ceotto Franco', '1966-09-09', 'Conegliano (TV)           ', '04799340262', '14258/C24', 'CTTFNC66P09C9572', '2017-03-06', ''),
(268, 0, 0, 0, 0, 0, 0, 0, 'C.V.A. SRL', 'ELETTRONICA', 'V. Al Bigonzo 11', 31030, 'Casier (TV)', 'Peruzzo Mauro', 'Peruzzo Mauro', '0422 633227', '8.00', '12.00', '13.00', '17.00', 'info@cvasrl.it', 'www.cvasrl.it', 6, 'Artigiano/Metalmeccanico', 'C.V.A. SRL', 'V. Al Bigonzo 11', 'Casier (TV)', 'Vanni Sottana', '1965-03-19', 'Treviso (TV)', '00980010276', '3279/C24D', 'STTVNN65C19L407B', '2017-03-07', ''),
(269, 0, 0, 0, 0, 0, 0, 0, 'CMZ  SISTEMI ELETTRONICI S.R.L.', 'ELETTRONICA', 'V. Dell Artigianato 21', 31030, 'Carbonera (TV)', 'Mambrin Michela', 'Bortoletto  Andrea', '0422 447411', '8.00', '12.30', '13.30', '17.00', 'cmz@cmz.it', 'www.cmz.it', 0, 'Sistemi Elettronici', 'CMZ  SISTEMI ELETTRONICI S.R.L.', 'V. Dell Artigianato 21', 'Carbonera (TV)', 'Giuseppe Zamuner', '1948-12-10', 'Fossalta di P.ve (VE)', '04016440267', '3279/C24D', 'ZMNGPP48T10D740H', '2017-03-08', ''),
(270, 0, 0, 0, 0, 0, 0, 0, 'CRISMATICA  NETWORK SRL', 'ELETTRONICA', 'Via Maggiore Piovesana 13/b', 31015, 'Conegliano (TV)', 'Malagoga Paolo', 'Malagoga Paolo', '0438 426606', '8.30', '12.30', '15.00', '19.00', 'info@crismatica.com', '', 43739, '', 'CRISMATICA  NETWORK SRL', 'Via Maggiore Piovesana 13/b', 'Conegliano (TV)', 'Rossitto Marco', '1971-02-22', 'Venezia (VE)', '04019350265', '3279/C24D', 'RSSMRC71B22L736B', '2017-03-09', ''),
(271, 0, 0, 0, 0, 0, 0, 0, 'CTS - CENTRO TECNICO SERVIZI', 'ELETTRONICA', 'Via Masotti 51', 31032, 'Casale sul Sile (TV)', 'Bettiol Stefano', 'Bettiol Stefano, Piccian Mattia', '0422 821293', '8.30', '12.30', '14.00', '18.00', 'amministrazionects@gmail.com', 'www.cts-servizi.eu', 4, 'Riparazione e Realizzazioni Imp. Sicur.', 'CTS - CENTRO TECNICO SERVIZI', 'Via Masotti 51', 'Casale sul Sile (TV)', 'Stefano Bettiol', '1965-08-16', 'Treviso (TV)', '031259600264', '3279/C24D', 'BTTSFC65M16L407M', '2017-03-10', ''),
(272, 0, 0, 0, 0, 0, 0, 0, 'DINAMICA IT SRL', 'ELETTRONICA', 'V. Adige 10\r\n', 31027, 'Spresiano (TV)', 'Cortesi Giulio', 'Cortesi Giulio', '0422 5225', '8.30', '12.30', '14.00', '18.00', 'sabina.latin@levia.it', '', 11, '46.66 - ', 'DINAMICA IT SRL', 'V. Adige 10\r\n', 'Spresiano (TV)', 'Castagnera Andrea', '1981-05-11', 'Vittorio Veneto (TV)', '04560600266', '', 'CSTNDR81E11M089Q', '2017-03-11', ''),
(273, 0, 0, 0, 0, 0, 0, 0, 'EGO GROUP SRL', 'ELETTRONICA', 'Via L. Einaudi 4/6', 31050, 'Badoere di Morgano (TV)', 'Libralesso Diego', 'Libralesso Diego', '0422 838933', '8.00', '12.00', '13.00', '17.00', '', '', 15, '', 'EGO GROUP SRL', 'Piazza Mons. G.Almici, 13', 'Brescia (BS)', 'Bracco Salvatore', '1959-02-11', 'Licata (AG)', '03736510987', '3279/C24D', 'BRCSVT59B11E573T', '2017-03-12', ''),
(274, 0, 0, 0, 0, 0, 0, 0, 'ELETTRICITA  PILON SRL', 'ELETTRONICA', 'Viale della Repubblica 42', 31050, 'Villorba (TV)', 'Dotto Roberto', 'Dotto Roberto', '0422 421596', '8.00', '12.00', '13.30', '17.30', 'amministrazione@elettricitapilon.it', '', 15, '', 'ELETTRICITA  PILON SRL', 'Viale della Repubblica 42', 'Villorba (TV)', 'Vidor Luca', '1968-08-05', 'Treviso (TV)', '00285060265', '3279/C24D', 'VRDLCU68M05L407S', '2017-03-13', ''),
(275, 0, 0, 0, 0, 0, 0, 0, 'ELETTRICITA  V/R SNC', 'ELETTRONICA', 'Via Bernart 9', 32020, 'Selva di cadore (BL)', 'Martini Roberto', 'Martini Roberto', '0437521172', '8.00', '12.00', '13.00', '17.00', 'elettricitavr@libero.it', '', 44470, 'impianti elettrici civili e industriali', 'ELETTRICITA  V/R SNC', 'VIa Bernat, 9', 'Selva di Cadore (BL)', 'Martini Roberto', '1969-11-26', 'Agordo (BL)', '00836610253', '6426/C24', 'MRTRRT69S26A083G', '2017-03-14', ''),
(276, 0, 0, 0, 0, 0, 0, 0, 'ELETTROAUDIOVIDEO SANSON', 'ELETTRONICA', 'Via Roma 110', 31050, 'Ponzano Veneto (TV)', 'Sanson Davide', 'Sanson Davide', '0422 969126', '8.00', '12.30', '15.30', '19.30', 'sanson.elettroaudiovideo@gmail.com', '', 43739, 'Commercio e riparazione elettrodomestici', 'ELETTROAUDIOVIDEO SANSON', 'Via Roma 110', 'Ponzano Veneto (TV)', 'Sanson Davide', '1962-02-19', 'Ponzano Veneto (TV)', '02420170246', '3279/C24D', 'SNSDVD62H19G875Y', '2017-03-15', ''),
(277, 0, 0, 0, 0, 0, 0, 0, 'ELETTROMARCA SRL', 'ELETTRONICA', 'V. Ungheresca Nord 8/G', 31010, 'Mareno di Piave (TV)', 'Marcuzzo Graziano', 'Dassiè Dino', '0438 309022', '8.00', '12.00', '13.30', '17.30', 'amministrazione@elettromarca.it', 'www.elettromarca.it', 20, 'Automazione e Quadristica Ind.le', 'ELETTROMARCA SRL', 'V. Ungheresca Nord 8/G', 'Mareno di Piave (TV)', 'Dal Borgo Luciano', '1959-01-07', 'Mareno di Piave (TV)', '03804510265', '3279/C24D', 'DLBLCN59A07E940N', '2017-03-16', ''),
(278, 0, 0, 0, 0, 0, 0, 0, 'ELETTRONICA DAMIANI ZARA SRL', 'ELETTRONICA', 'Via Galilei 2/A', 31021, 'Mogliano Veneto (TV)', 'Zara Deraborah', 'Zara Deraborah', '041 5903807', '', '', '', '', 'info@elettronicadamianizara.com', '', 14, 'Ass. Elettronico Schede', 'ELETTRONICA DAMIANI ZARA SRL', 'Via Galilei 2/A', 'Mogliano Veneto (TV)', 'Debora Zara', '1972-03-14', 'Leongerg', '03565270265', '3279/C24D', 'ZRADBR72C54Z112A', '2017-03-17', ''),
(279, 0, 0, 0, 0, 0, 0, 0, 'ELETTROTECNICA ZANATTA DANIELE', 'ELETTRONICA', 'Via Ferrarezza8', 31020, 'Villorba (TV)', 'Zanatta Daniele', 'Zanatta Daniele', '0422 608239 / 348 8406250', '8.00', '12.00', '13.30', '17.30', 'info@zanattadaniele.it', '', 43739, 'Installazione e manutenzione impianti elettrici', 'ELETTROTECNICA ZANATTA DANIELE', 'Via Ferrarezza8', 'Villorba (TV)', 'Zanatta Daniele', '1961-12-30', 'Villorba (TV)', '2100390265', '3279/C24D', 'ZNTDNL61T30M048Y', '2017-03-18', ''),
(280, 0, 0, 0, 0, 0, 0, 0, 'EMMEBI SRL', 'ELETTRONICA', 'Via C.A. Dalla Chiesa10', 31030, 'Breda di Piave (TV)', 'Barbon Mirco', 'Pivato Mirco', '0422 600050/335 6055425', '8.00', '12.00', '13.00', '17.00', 'info@emmebi.tv.it', '', 10, '', 'EMMEBI SRL', 'Via C.A. Dalla Chiesa10', 'Breda di Piave (TV)', 'Barbon Mirco', '1963-03-23', 'Spresiano (TV)', '04371390263', '5963/C24D', 'BRBMRC63C23I927P', '2017-03-19', ''),
(281, 0, 0, 0, 0, 0, 0, 0, 'ESSECI COMPUTER SAS', 'ELETTRONICA', 'vIA G. Zanzotto 10/12', 31053, 'Pieve di Soligo (TV)', 'Cortiana Roberto', 'Cortiano Roberto', '0438841188', '9.00', '12.30', '15.30', '19.30', 'info@esseci.tv', 'www.esseci.tv', 44470, 'Assistenza computer', 'ESSECI COMPUTER SAS', 'Via G. Zanzotto, 10/12', 'Pieve di Soligo (TV)', 'Cortiana Roberto', '1970-07-23', 'Pieve di Soligo (TV)', '03182410260', '6813/C24', 'CRTRRT70L23G645S', '2017-03-20', ''),
(282, 0, 0, 0, 0, 0, 0, 0, 'EUCLID LABS SRL', 'ELETTRONICA', 'Via Priula 78', 31040, 'Nervesa della Battaglia (TV)', 'Polesel Roberto', 'Bottero Fabio', '0422 887075', '8.30', '12.30', '13.30', '17.30', 'info@euclidlabs.it', '', 11, 'Produzione software', 'EUCLID LABS SRL', 'Via Priula 78', 'Nervesa della Battaglia (TV)', 'Polesel Roberto', '1977-09-05', 'Conegliano (TV)', '03969550262', '3279/C24D', 'PLSRRT77P05C957Z', '2017-03-21', ''),
(283, 0, 0, 0, 0, 0, 0, 0, 'FABRIS MASSIMO', 'ELETTRONICA', 'V. Torino', 35020, 'Saonara (PD)', 'Fabris Massimo', 'Fabris Massimo', '335 8433708', '', '', '', '', 'fabris.installazioni@virgilio.it', '', 5, 'Automazione', 'FABRIS MASSIMO', 'V. Torino', 'Saonara (PD)', 'Massimo Fabris', '1967-12-20', 'Padova (PD)', '03219550286', '235/C24D', 'FBRMSM67T20G224P', '2017-03-22', ''),
(284, 0, 0, 0, 0, 0, 0, 0, 'F.A.R.T. srl', 'ELETTRONICA', 'V. Terraglio  193', 31022, 'Preganziol (TV)', 'Marisa graziati', 'Crivellaro renato', '0422498300', '8.30', '13.00', '13.30', '17.00', 'RD@fart-neon.com', 'fart-neon.com', 0, '', 'F.A.R.T. srl', 'V. Terraglio  193', 'Preganziol (TV)', 'Graziati Marisa', '1962-12-07', 'Treviso (TV)', '01765650260', '13463/C24', 'GRZMRS62T47L407A', '2017-03-23', ''),
(285, 0, 0, 0, 0, 0, 0, 0, 'FAVARO TECNOLOGIE SRL', 'ELETTRONICA', 'Via Everardo 3', 31020, 'Villorba (TV)', '', '', '', '', '', '', '', '', '', 0, '', 'FAVARO TECNOLOGIE SRL', 'Via Everardo 3', 'Villorba (TV)', 'Favaro Antonio', '1968-01-28', 'Cairns (AUS)', '03919230262', '13737/C24', 'FVRNTN68A28Z700O', '2017-03-24', ''),
(286, 0, 0, 0, 0, 0, 0, 0, 'Ing. Matteo Pozzobon', 'ELETTRONICA', 'Via Giacomo Matteotti 42', 31052, 'Maserada sul Piave (TV)', 'Pozzobon Matteo', 'Pozzobon Matteo', '393 1852660', '8.00', '12.00', '14.00', '18.00', 'matteo.pozzobon@pmtechs.net', '', 44470, 'Studio Ingegneria', 'Ing. Matteo Pozzobon', 'Via Giacomo Matteotti 42', 'Maserada sul Piave (TV)', 'Pozzobon Matteo', '1987-02-18', 'Treviso (TV)', '04929170266', '2634/C24', 'PZZMTT87B18L407X', '2017-03-25', ''),
(287, 0, 0, 0, 0, 0, 0, 0, 'GARDIN QUADRI SRL', 'ELETTRONICA', 'Vicolo g. verdi 69/B', 31020, 'Villorba (TV)', 'Gardin Marco', 'Gardin Marco', '0422877002', '7.00', '12.00', '13.00', '16.00', 'amministrazione@gardinquadri.com', '', 44105, 'cablaggio quadri elettrici', 'GARDIN QUADRI', 'vicolo g.verdi 69/b', 'Villorba (TV)', 'gardin marco', '1974-08-06', 'Treviso (TV)', '04418790269', '13315/C24', 'GRDMRC74M06L407W', '2017-03-26', ''),
(288, 0, 0, 0, 0, 0, 0, 0, 'GATTO IMPIANTI', 'ELETTRONICA', 'VIA SBROJAVACCA 24', 300037, 'Scorzè (VE)', 'Gatto Gastone', 'Gatto Gastone', '041449409', '8.00', '12.00', '13.00', '17.00', 'info@gattoimpianti.it', '', 0, 'impianti elettrici', 'GATTO IMPIANTI SRL', 'via Sbrojavacca', 'Scorze  (VE)', 'Gatto Gastone', '1948-02-28', 'Scorze  (Ve)', '03274680275', '14404/C24', 'GTTGTN48B28I5519', '2017-03-27', ''),
(289, 0, 0, 0, 0, 0, 0, 0, 'GEA IMPIANTI SRL', 'ELETTRONICA', 'V. Pantiera 70', 31056, 'Roncade (TV)', 'Vacillotto Bruno', 'Vacillotto Bruno', '335 6162940', '8.00', '12.00', '13.00', '17.00', 'geaimpianti@gmail.com', '', 12, 'Impianti Elettrici e Speciali', 'GEA IMPIANTI SRL', 'V. Pantiera 70', 'Roncade (TV)', 'Bruno Vacilotto', '1996-08-03', 'Winterthur  (SVIZZERA)', '04795900267', '3279/C24D', 'VLCBRN66M03Z133P', '2017-03-28', ''),
(290, 0, 0, 0, 0, 0, 0, 0, 'GEASTAR Srl', 'ELETTRONICA', 'V. Nerbon 4', 31057, 'Silea (TV)', 'Ruffoni Devy', 'Vendrame Enrico', '0438 991224', '8.30', '12.30', '13.30', '17.30', 'www.geastar.it', 'info@geastar.it', 5, 'impianti elettrici su autotelai', 'GEASTAR Srl', 'Strada Casut, 15', 'Sacile (PN)', 'Cappellotto Luciano', '1967-07-27', 'Gaiarine (TV)', '04938850262', '7182/C24D', 'CPPLCN67L27D854D', '2017-03-29', ''),
(291, 0, 0, 0, 0, 0, 0, 0, 'GIDAUTO SRL', 'ELETTRONICA', '', 0, '', '', '', '', '', '', '', '', '', '', 0, 'Servizio manutenzione autoveicoli', 'GIDAUTO SRL', 'Via Palladio, 3', 'San Fior (TV)', 'Sarlo Gregorio', '1951-03-07', 'San Pietro di Caridà (RC)', '00797760261', '2619/C24', '', '2017-03-30', ''),
(292, 0, 0, 0, 0, 0, 0, 0, 'GOLFETTO SANGATI SRL', 'ELETTRONICA', 'Via Fratelli Bandiera 3', 31055, 'Quinto di Treviso (TV)', 'Fantin Orlando', 'Fantin Orlando', '0422 476700', '8.00', '12.00', '13.30', '17.30', 'fantin.o@golfettosangati.com', '', 0, 'Industria Metalmeccanica/Automazioni', 'GOLFETTO SANGATI SRL', 'Via Fratelli Bandiera 3', 'Quinto di Treviso (TV)', 'Claudio Zanatta', '1959-12-23', 'Svizzera', '04444310280', '3279/C24D', 'ZVTCLD59T23Z133R', '2017-03-31', ''),
(293, 0, 0, 0, 0, 0, 0, 0, 'GOSETTO SRL', 'ELETTRONICA', 'Via Montegrappa 122', 31010, 'Moriago della Battaglia (TV)', 'Luca Gosetto', 'Luca Gosetto', '0438 892847', '8.00', '12.00', '13.00', '17.00', 'amministrazione@.com', 'www.gosetto.com', 40, 'Attrezzature Parchi divertimento', 'GOSETTO SRL', 'Via Montegrappa 122', 'Moriago della Battaglia (TV)', 'Luca Gosetto', '1973-05-24', 'Pieve di Soligo (TV)', '0322200261', '3279/C24D', 'GSTLCU73E26G645L', '2017-04-01', ''),
(294, 0, 0, 0, 0, 2, 0, 0, 'IMET SRL', 'ELETTRONICA', 'Via Fornace 8', 33077, 'Sacile (PN)', 'Da Re Stefano', 'Da Re Stefano, Sacilotto Mauro', '0434 7878', '8.00', '12.00', '13.30', '17.30', 'info@imet.eu', '', 100, 'Costruz.strumenti elettrici', 'IMET SRL', 'Via Fornace 8', 'Sacile (PN)', 'Cadorin Evio', '1963-10-22', 'Sacile (PN)', '01106390931', '3279/C24D', 'CDRVEI63R22H657B', '2017-04-02', ''),
(295, 0, 0, 0, 0, 0, 0, 0, 'IMPUT STUDIO SRL', 'ELETTRONICA', 'V.Leonardo Da Vinci50', 31048, 'San Biagio di Callalta (TV)', 'De Masi Giovanni', 'De Masi Giovanni', '0422 1743575', '9.00', '13.00', '15.00', '19.00', 'info@imputlevel.com', 'www.imputlevel.com', 0, 'Forniture Elettroniche Eventi', 'IMPUT STUDIO SRL', 'V.Leonardo Da Vinci50', 'San Biagio di Callalta (TV)', 'Giovanni De Masi', '1963-04-16', 'Treviso (TV)', '04772230266', '3279/C24D', 'DMSGNN63D16L407S', '2017-04-03', ''),
(296, 0, 0, 0, 0, 0, 0, 0, 'INDUSTRIAL CARS', 'ELETTRONICA', 'V. Roma 155', 31020, 'Villorba (TV)', 'Ceccato Antonella', '', '', '', '', '', '', '', '', 0, '', 'INDUSTRIAL CARS', 'V. Roma 155', 'Villorba (TV)', 'Ceccato Antonella', '1972-07-31', 'Malo (VI)', '02134450283', '', 'CCCNNL72L71E864U', '2017-04-04', ''),
(297, 0, 0, 0, 0, 0, 0, 0, 'ISIS SRL', 'ELETTRONICA', 'Via Enrico Azzi 1', 31038, 'Paese (TV)', 'Pancot Giuseppe', 'Pancot Giuseppe', '0422 433685', '', '', '', '', 'beppe.ancot@isisware.com', 'www.isisware.com', 36, 'Industria/Sviluppo Software', 'ISIS SRL', 'Via Enrico Azzi 1', 'Paese (TV)', 'Favaro Mansueto', '1951-10-13', 'Padova (PD)', 'IT03627130267', '7866/C24', 'FVFMST51R13G224H', '2017-04-05', ''),
(298, 0, 0, 0, 0, 0, 0, 0, 'ISTRA S.R.L', 'ELETTRONICA', 'Vicolo Giuseppe Verdi 53', 31020, 'Vilorba (TV)', 'Munerotto Stefano', 'Munerotto Stefano', '0422618686', '8.00', '12.00', '14.00', '18.00', 'amministrazione@istrasistemi.it', '', 0, '', 'ISTRA S.R.L', 'Vicolo Giuseppe Verdi 53', 'Vilorba (TV)', 'Pizzolon Raffaele', '1952-12-16', 'Ponzano Veneto (TV)', '02295220269', '6812/C24', 'PZZRFL52T16G875A', '2017-04-06', ''),
(299, 0, 0, 0, 0, 0, 0, 0, 'JANUS SRL', 'ELETTRONICA', 'Via Palu  70', 31020, 'San Vendemiano (TV)', 'Lovat Gianpiero', 'Lovat Giampiero', '0438 24836', '', '', '', '', 'janus@jns.it', '', 10, '', 'JANUS SRL', 'Via Palu , 70', 'San Vendemiano (TV)', 'Lovat Gianpiero', '1963-10-02', 'Conegliano (TV)', '03066690268', '631/C24D', 'LVTGPR63R02C957L', '2017-04-07', ''),
(300, 0, 0, 0, 0, 0, 0, 0, 'KEESTRACK-OM', 'ELETTRONICA', 'Via Postumia 62', 31050, 'Ponzano Veneto (TV)', 'Tiziano Zago', 'Tiziano Zago', '0422 441311', '8.00', '12.30', '13.30', '17.00', 'keestrack@keestrack.it', '', 0, '', 'KEESTRACK-OM', 'Via Postumia 62', 'Ponzano Veneto (TV)', 'Tacob Peter Hoogendoorn', '1989-03-01', 'Belgio', '04312510268', '3279/C24D', 'HGNJBP89C12103C', '2017-04-08', ''),
(301, 0, 0, 0, 0, 0, 0, 0, 'LAE ELECTRONIC SPA', 'ELETTRONICA', 'Via Padova 25', 31046, 'Oderzo (TV)', 'Simonetto Alfio', 'Simonetto Alfio', '0422 815320', '8.00', '12.15', '13.15', '17.00', 'admin@lae-electronic.com', 'www.lae-electronic.com', 51, 'Collaudo schede elettroniche', 'LAE ELECTRONIC SPA', 'VIA PADOVA 25', 'Oderzo (TV)', 'Vizzotto Giuseppe', '1943-04-06', 'Gaiarine (TV)', '02205880269', '3279/C24D', 'VZZGPP43D06D854W', '2017-04-09', ''),
(302, 0, 0, 0, 0, 0, 0, 0, 'LINEA LIGHT SRL', 'ELETTRONICA', 'V. Europa 14', 321028, 'VAZZOLA (TV)', 'Modolo Pietro', 'Stefan Luca', '0438 444895', '8.00', '12.00', '13.00', '17.30', 'pietro.modolo@linealight.com', '', 0, 'ATECO 27.40.09', 'LINEA LIGHT SRL', 'V. Europa 14', 'VAZZOLA (TV)', 'Vendrame Nicola', '1977-11-09', 'Motta di Livenza (TV)', '01220530263', '', 'VNDNCL77S09F770Q', '2017-04-10', ''),
(303, 0, 0, 0, 0, 0, 0, 0, 'L.R.E. IMPIANTI SRL', 'ELETTRONICA', 'Via San Rocco 48', 31040, 'Giavera del Montello (TV)', 'Bettiol Thomas', 'Bettiol Thomas', '0422 882281', '8.00', '12.00', '13.30', '17.30', 'info@lre.it', '', 0, 'Elettronica Industriale', 'L.R.E. IMPIANTI SRL', 'Via San Rocco 48', 'Giavera del Montello (TV)', 'Adriano Pizzolato', '1966-04-30', 'Volpago del Montello (TV)', '03764570267', '3279/C24D', 'PZZDRN66D30M118J', '2017-04-11', ''),
(304, 0, 0, 0, 0, 0, 0, 0, 'LABOMAR SRL', 'ELETTRONICA', 'Via Nazario Sauro 35/I', 31031, 'Istrana (TV)', 'Bertin Walter', 'Ramunno Elsa', '0422 7312', '', '', '', '', 'labomar@labomar.com', '', 51, 'Produzione integratori alimentari', 'LABOMAR SRL', 'Via Nazario Sauro 35/I', 'Istrana (TV)', 'Bertin Walter', '1959-01-11', 'Treviso (TV)', '03412720264', '1987/C24D', 'BRTWTR59A11L407P', '2017-04-12', ''),
(305, 0, 0, 0, 0, 0, 0, 0, 'MECCATRONICA AUTOMAZIONE', 'ELETTRONICA', 'Via Albrizzi alle Pozzette', 31030, 'Casier (TV)', 'Bonfini Cinzia ', 'Bonfini Cinzia ', '3334250933', '8.00', '12.30', '13.30', '17.00', 'commerciale@automazionispeciali.it', 'www.automazionispeciali.it', 10, 'Industria Metalmeccanica/Automazioni', 'MECCATRONICA AUTOMAZIONE', 'Via Albrizzi alle Pozzette', 'Casier (TV)', 'Federico De ', '0000-00-00', 'Treviso (TV)', '03904000266', '3279/C24D', 'DMRFRC74M17L407G', '2017-04-13', ''),
(306, 0, 0, 0, 0, 0, 0, 0, 'MICROTRONICS SRL', 'ELETTRONICA', 'Via Schiavonia Casale 93', 31032, 'Casale sul Sile (TV)', 'Montagner Fabrizio', 'Montagner Fabrizio', '0422 827178', '8.30', '12.30', '14.00', '18.00', 'sales@microtronics.it', '', 0, 'Elettronica/ Circuiti stampati', 'MICROTRONICS SRL', 'Via Schiavonia Casale 93', 'Casale sul Sile (TV)', 'Fabrizio Montagner', '1967-05-29', 'Roncade (TV)', '03735740262', '3279/C24D', 'MNTFRZ67E29H523K', '2017-04-14', ''),
(307, 0, 1, 0, 0, 0, 0, 0, 'MION VENTOLTERMICO SPA', 'ELETTRONICA', 'V. Dolomiti 30', 31052, 'Maserada sul Piave (TV)', 'Mion Pieralberto', 'Benedetti Ermes', '0422 8777', '8.00', '12.00', '14.00', '18.00', 'personale@h-farm.com', '', 0, '', 'MION VENTOLTERMICO SPA', 'V. Dolomiti 30', 'Maserada sul Piave (TV)', 'Mion Pieralberto', '1946-07-30', 'Maserada sul Piave )TV)', '04053860260', '26622/C24', 'MNIPLB46L30F012B', '2017-04-15', ''),
(308, 0, 0, 0, 0, 0, 0, 0, 'MOBILITA  DI MARCA', 'ELETTRONICA', 'Via Polveriera 1', 31100, 'Treviso (TV)', 'Mattiazzi Rolando', 'Lazzaro Paolo', '0422 588311', '', '', '', '', 'info@mobilitadimarca.it', '', 251, 'Trasporto pubblico', 'MOBILITA  DI MARCA', 'Via Polveriera 1', 'Treviso (TV)', 'Colladon Giacomo', '1948-01-31', 'Treviso (TV)', '04498000266', '1988/C24D', 'CLLGCM48A31L407X', '2017-04-16', ''),
(309, 0, 1, 0, 0, 0, 0, 0, 'MONKEY EVOLUTIONS.R.L.', 'ELETTRONICA', 'Via Feltrina Sud 162', 31044, 'Montebelluna (TV)', 'Alampora Giuseppe', 'Alampora Giuseppe', '3472360611', '09.00', '1300', '13.30', '17.30', 'monkeyevolutionsrl@gmail.com', '', 44470, '', 'MONKEY EVOLUTIONS.R.L.', 'Via Feltrina Sud, 162', 'Montebelluno ', 'Zanatta Stefano ', '1957-10-09', 'Montebelluna (TV)', '05113990260', '9554/C24D', 'ZNTSFN75R09F4430', '2017-04-17', ''),
(310, 0, 0, 0, 0, 0, 0, 0, 'MY-3D', 'ELETTRONICA', 'Via Antonio Born 1', 31100, 'Treviso (TV)', 'Beraldo Simone ', 'Beraldo Simone ', '0422 360433', '', '', '', '', 'info@my-3d.it', 'www.my-3d.it', 1, 'Commercio/Stampanti 3D', 'MY-3D', 'Via Antonio Born 1', 'Treviso (TV)', 'Simone beraldo', '1973-09-20', 'Treviso (TV)', '04748430963', '7840/C24', 'BRLSMN73B20L407A', '2017-04-18', ''),
(311, 0, 0, 0, 0, 0, 0, 0, 'OFFICINE DEL BELLO MBM SRL', 'ELETTRONICA', 'V. Rovereto 4', 31010, 'Mareno di Piave (TV)', '', '', '0422 880649', '', '', '', '', 'info@odbmbm.com ', 'www.odbmbm.com', 0, '', 'OFFICINE DEL BELLO MBM SRL', 'V. Aquileia, 17', 'Udine (UD)', 'Bigolin Maurizio', '1968-05-01', 'Treviso (TV)', '01159200318', '14095/C24', 'BGLMRZ68E01L407U', '2017-04-19', ''),
(312, 0, 0, 0, 0, 0, 0, 0, 'OFFICINE INFORMATICHE', 'ELETTRONICA', 'V. Colombo 10/I', 31010, 'Godega Sant Urbano (TV)', '', '', '0438 38523', '', '', '', '', 'ordini@offinf.eu', 'www.officineinformatiche.biz', 0, 'Assitenza Hardwar-Softwar Computer', 'OFFICINE INFORMATICHE', 'V. Colombo 10/I', 'Godega Sant Urbano (TV)', 'Giacomazzi Daniele', '1979-07-09', 'Valdobiadene (TV)', '04147310264', '1276/C24D', 'GCMDNL79L9L565H', '2017-04-20', ''),
(313, 0, 0, 0, 0, 0, 0, 0, 'PLB INFORMATICA', 'ELETTRONICA', 'Via Montegrappa 3', 31030, 'Breda di Piave (TV)', 'Pio Loco Boscariol Raoul', 'Pio Loco Boscariol Raoul', '0422 1832323', '//', '//', '15,30', '19,30', 'info@plbinformatica.it', '', 1, 'Assemblaggio e riparazione PC', 'PLB INFORMATICA', 'Via Montegrappa 3', 'Breda di Piave (TV)', 'Pio Loco Boscariol Raoul', '1981-09-11', 'Treviso', '03903440265', '2626/C24', 'PLCRLA81P11L407X', '2017-04-21', ''),
(314, 0, 0, 0, 0, 0, 0, 0, 'REDO GROUP ITALIA SRL', 'ELETTRONICA', 'Via Gelsomini 4', 31100, 'Treviso (TV)', 'Bacchin Monica', 'Battistella Andrea', '0422 1847197', '8.30', '12.30', '14.30', '18.30', 'info@redogroup.it', '', 1, 'Commercio Ingrosso e Dettaglio', 'REDO GROUP ITALIA', 'Via Gelsomini, 4', 'Treviso', 'Battistella Andrea', '1962-08-10', 'Treviso', '04831360260', '5917/C24', 'BTTNDR62M10L407O', '2017-04-22', ''),
(315, 0, 0, 0, 0, 0, 0, 0, 'ROBOR SRL', 'ELETTRONICA', 'V.lo P.S. Mattarella 6', 31055, 'Quinto di Treviso (TV)', 'Rocchetto Andrea', 'Rocchetto Andrea', '0422 454347', '8.00', '12.00', '13.30', '17.30', 'info@robor.it', '', 11, '', 'ROBOR SRL', 'Via lombardia, 2', 'Padernello (TV)', 'Borsato Rogerio', '1950-01-07', 'Murage (Belgio)', '03429450269', '3279/C24D', 'BRSRGS50A07L103L', '2017-04-23', ''),
(316, 0, 0, 0, 0, 0, 0, 0, 'RVR  ERREVERRE DI Biscaro Michela', 'ELETTRONICA', 'Via Trieste 80', 31020, 'Villorba (TV)', 'Biscaro Michela', 'Cuccato Ivan', '0422918716', '8.00', '12.00', '13.30', '17.30', 'info@erreverre.com', '', 44470, '', 'RVR ERREVERRE DI BOSCO MICHELA', 'Via Trieste,80', 'Villorba (TV)', 'Biscaro Michela', '1973-09-07', 'Trsviso', '0483300268', '6814/C24', 'BSCMHL73P47L4070', '2017-04-24', ''),
(317, 0, 0, 0, 0, 0, 0, 0, 'SIMPLEX SRL', 'ELETTRONICA', 'Via Castagnole 24', 31100, 'Treviso (TV)', 'Miami Giancarlo', 'Miami Giancarlo', '0422 230765', '8.00', '12.30', '13.30', '17.00', 'info@simplexluce.it', '', 1, '', 'SIMPLEX SRL', 'Via Castagnole, 24', 'Treviso', 'Miami Giancarlo', '1953-10-08', 'Treviso', '04247830260', '2630/C24', 'MNIGCR53R08L407C', '2017-04-25', ''),
(318, 0, 0, 0, 0, 0, 0, 0, 'STAC HOME SYSTEM', 'ELETTRONICA', 'V. Milano 7', 31048, 'San Biagio di Callalta (TV)', 'Berton Daniele', 'Tonellato Luca', '0422 899141', '8.00', '12.00', '14.00', '18.00', 'info@stachomesystem.it', 'www.stachomesystem.it', 4, 'Assistenza Elettronica', 'STAC HOME SYSTEM', 'V. Milano 7', 'San Biagio di Callalta (TV)', 'Daniele Berton', '1981-03-07', 'Treviso (TV)', '04707320265', '5919/C24', 'BRTDNL81C07L407', '2017-04-26', ''),
(319, 0, 0, 0, 0, 0, 0, 0, 'T4 SRL', 'ELETTRONICA', 'Via Franchini 1', 31020, 'Villorba (TV)', 'Tonon Italo', 'Tonon Achille', '0422 485262', '8.30', '12.30', '13.30', '17.00', 'info@t4group.it', '', 10, '', 'T4 SRL', 'Via Franchini 1', 'Villorba (TV)', 'Tonon Raffaella', '1964-07-19', 'Quinto (TV)', '02486510262', '3279/C24D', 'TNNRFL64L59L407S', '2017-04-27', ''),
(320, 0, 0, 0, 0, 0, 0, 0, 'TECNODINAMICA SRL', 'ELETTRONICA', 'V.le europa 37-38', 31010, 'Farra di Soligo (TV)', 'Cusin Leopoldo- Fregolet Edi', 'Cusin Leopoldo - Fregolet Edi', '0438 980484', '8.00', '12.00', '13.00', '17.00', 'risorse@tecnodinamica.it', '', 69, 'metalmeccanica Industria automazione', '1', 'V.le europa 37-38', 'Farra di Soligo (TV)', 'Oscar Bortot', '1951-08-31', 'Sernaglia della Batt. TV', '01192040267', '3279/C24D', 'BRTSCR51M31I635P', '2017-04-28', ''),
(321, 0, 0, 0, 0, 0, 0, 0, 'TECNOELETTRA SRL IMPIANTI', 'ELETTRONICA', 'Via Venzone 16', 31100, 'Treviso (TV)', 'Ramon Remo', 'Gagliazzo Enrico', '0422 305372', '7.30', '12.00', '14.00', '17.30', 'mteedizi@mteedizioni.it', '', 0, '', 'TECNOELETTRA SRL IMPIANTI', 'Via Venzone 16', 'Treviso (TV)', 'Remo Ramon', '1952-05-30', 'S. Biagio di callalta (TV)', '01195760267', '3279/C24D', 'RMMRME52E30H781J', '2017-04-29', ''),
(322, 0, 0, 0, 0, 0, 0, 0, 'TEMA ENERGY', 'ELETTRONICA', 'Via S.Rocco 48', 31040, 'Giavera del Montello (TV)', 'Fadel Michele', 'Fadel Michele', '0422 775143', '8.00', '12.00', '13.30', '17.30', '', '', 0, '', 'TEMA ENERGY', 'Via S. Rocco, 48', 'Giavera del Montello (TV)', 'Antonio Orlando', '1961-11-14', 'Oderzo (TV)', '04390580266', '3279/C24D', 'RLNNTN61S14F999R', '2017-04-30', ''),
(323, 0, 0, 0, 0, 0, 0, 0, 'VEICOLI BLINDATI NOM SRL', 'ELETTRONICA', 'V. Brigata Treviso 6', 31100, 'Dosson di Casier (TV)', '', '', '', '', '', '', '', '', '', 0, '', 'VEICOLI BLINDATI NOM SRL', 'V. Brigata Treviso 6', 'Dosson di Casier (TV)', 'Guerretta Luca', '1970-01-09', 'Carbonera (TV)', '03613890262', '13266/C24', 'GRRLCU70A09B744Q', '2017-05-01', ''),
(324, 0, 1, 0, 0, 0, 0, 0, 'VIDEO SERVICE DI LORENZO BIOTTI', 'ELETTRONICA', 'Via Podgora 2 31032', 31032, 'Casale sul Sile (TV)', 'Biotti Di lorenzo', 'Biotti Di lorenzo', '0422 788145', '08.30', '12.30', '15.30', '19.00', 'videoservice_biotti@tin.it', '', 43739, 'Commercio/Artigianato', 'VIDEO SERVICE DI LORENZO BIOTTI', 'Via Podgora 2 31032', 'Casale sul Sile (TV)', 'Lorenzo Biotti', '1961-11-12', 'Treviso (TV)', '01898760260', '5918/C24', 'BTTLNR61M12B879P', '2017-05-02', ''),
(325, 0, 0, 0, 0, 0, 0, 0, 'V.I.P. GROUP SRL', 'ELETTRONICA', 'VIia Trieste 225/A', 31030, 'Arcade(TV)', 'Ferro Rnrico', 'Avveduto Giovanni', '3495152823', '08.00', '12.00', '14.00', '18.00', 'info@vipgroupsrl.com', '', 11, 'Cablaggio quadri elettrici', 'V.I.P. GROUP SRL', 'Via Triese, 255/A', 'Arcade (TV)', 'Ferro Enrico', '1955-01-11', 'Buenos Aires (RA)', '05028650264', '7225/C24D', 'FRRNRC55A112600S', '2017-05-03', ''),
(326, 0, 0, 0, 0, 0, 0, 0, 'VOLPATO INDUSTRIE SPA', 'ELETTRONICA', 'Via Galvani 22/D', 31027, 'Spresiano (TV)', 'Caron Valerio', 'Caron Valerio', '0422 7227', '', '', '', '', 'info@volpatoindustrie.it', 'www.volpatoindustrie,it', 160, '', 'VOLPATO INDUSTRIE SPA', 'Via Galvani 22/D', 'Spresiano (TV)', 'Valerio Caron', '1967-12-27', 'Treviso (TV)', '00855020269', '7841/C24', 'CRNVLR67T27L407U', '2017-05-04', ''),
(327, 0, 0, 0, 0, 0, 0, 0, 'V.V.B SRL', 'ELETTRONICA', 'VIA RIVERE 41/A', 31028, 'VAZZOLA (TV)', 'Bragato Marino', 'Venturin Ezio', '0438441692', '8.00', '12.00', '13.30', '17.30', 'info@vvbsrl.it', '', 44105, 'automazione plc - cablaggio', 'VVBSRL', 'VIA MAZZINI, 16', 'MARENO DI PIAVE (TV)', 'Bragato Marino', '1970-04-23', 'Conegliano (Tv)', '03130020260', '', 'BRGMRN70D23C957N', '2017-05-05', ''),
(328, 0, 0, 0, 0, 0, 0, 0, 'ZUCCON MASSIMO', 'ELETTRONICA', 'Via Roma 20', 31021, 'Mogliano Veneto (TV)', 'Zuccon Massimo', 'Zuccon Massimo', '331 1069099', '', '', '', '', 'zmnegozio@libero.it', 'www.zucconmassimo.info', 0, 'Automazione', 'ZUCCON MASSIMO', 'Via Roma 20', 'Mogliano Veneto (TV)', 'Massimo Zuccon', '1973-11-02', 'Mirano (VE)', '04368030260', '3279/C24D', 'ZCCMSM73S02F241N', '2017-05-06', ''),
(329, 0, 0, 0, 0, 0, 0, 0, 'ZANATTA VALERIO ELETTRODOMESTICI', 'ELETTRONICA', 'Via Cal Trevigiana 1', 31050, 'Camalò di Povegliano (TV)', 'Boscarato Nicola', 'Cuzziol Ivan', '0422 772066', '9.30', '12.30', '14.30', '19.00', 'amministrazione@valeriostore.com', 'www.valeriostore.com', 0, 'Commercio prodotti elettronici', 'VALERIO ZANATTA', 'VIA CAL TREVIGIANA 1', 'Povegliano (TV)', 'Zanatta Valerio', '1950-12-27', 'Povegliano (TV)', '00240490268', '3279/C24D', 'ZNTVLR50T27G944W', '2017-05-07', ''),
(330, 0, 0, 0, 0, 0, 0, 0, 'COMUNE DI PONTE DI PIAVE', 'LICEO', '', 31047, 'Ponte di Piave (TV)', 'Roma Paola', 'Marcassa Eddo', '0422 858900', '', '', '', '', 'ragioneriatributi@pontedipiave.com', '', 11, '', 'COMUNE DI PONTE DI PIAVE', '0', 'Ponte di Piave (TV)', 'Roma Paola', '1982-11-26', 'Treviso (TV)', '0595560269', '2596/C24D', 'RMOPLA82S66L407L', '2017-05-08', ''),
(331, 0, 0, 0, 0, 0, 0, 0, 'BOSS SRL', 'LICEO', 'Via Marconi 98', 21012, 'Cassano Magnago (VA)', 'Paggiaro Simone', 'Paggiaro Simone', '0200 619323', '', '', '', '', 'info@bossitalia.com', '', 20, 'Commercio', 'BOSS SRL', 'via Brianza, 9/b', 'Mira (VE)', 'Braggian Cristiano', '1971-05-03', 'Busto Arsizio (VA)', '03668350964', '', 'BRGCST71E03B300E', '2017-05-09', ''),
(332, 0, 0, 0, 0, 0, 0, 0, 'CLINICA VETERINARIA ARGOS', 'LICEO', '', 31025, 'Santa Lucia di piave (TV)', '', '', '', '', '', '', '', '', '', 0, '', 'CLINICA VETERINARIA ARGOS', '', '', '', '0000-00-00', '', '', '', '', '2017-05-10', ''),
(333, 0, 0, 0, 0, 0, 0, 0, 'DIRECT FROM ITALY S.r.l', 'LICEO', 'V.le Appiani 26/A', 31100, 'Treviso (TV)', 'Andolfo Denis', 'Andolfo Deniss', '3480633710', '', '', '14.30', '18.30', 'info@directfromitaly.it', '', 44470, 'ATECO 47.91.1', 'DIRECT FROM ITALY S.r.l', 'V.le Appiani 26/A', 'Treviso (TV)', 'Andolfo Denis', '1971-09-07', 'Montebelluna (TV)', '05031550261', '13391/C24', 'NDLDNS71P03F443B', '2017-05-11', ''),
(334, 0, 0, 0, 0, 0, 0, 0, 'XEPTAGEN SPA', 'LICEO', 'Via delle Industrie 9', 30175, 'Marghera (VE)', 'Fassina Giorgio', 'Gallotta Andrea', '041 5093910', '', '', '', '', 'info@xeptagen.com', '', 50, '', 'XEPTAGEN SPA', 'Via delle Industrie 9', 'Marghera (VE)', 'Fassina Giorgio', '1960-10-01', 'Padova (PD)', '7784560638', '2594/C24D', 'FSSGRG60R01G224E', '2017-05-12', ''),
(335, 0, 0, 0, 0, 0, 0, 0, 'ETNIA SRL', 'LICEO', 'Via Vittorio emanuele', 31055, 'Quinto di Treviso (TV)', 'Mello Irene', 'Mello Irene', '347 5760746', '', '', '', '', 'antonio@etniaviaggi.it', '', 10, '', 'ETNIA SRL', 'Via Vittorio emanuele', 'Quinto di Treviso (TV)', 'Falcone Antonio', '1970-03-04', 'Foggia (FG)', '04332610288', '2597/C24D', 'FLCNTN70C04D643Z', '2017-05-13', ''),
(336, 0, 0, 0, 0, 0, 0, 0, 'LA LINEA SPA', 'LICEO', 'Via della fisica 27', 30175, 'Venezia (VE)', 'Tiozzo Marianna', 'Gastaldi Giuliano', '041 5470646', '', '', '', '', 'info@lalineaspa.it', '', 120, '', 'LA LINEA SPA', 'Via della fisica 27', 'Venezia (VE)', 'Fiorese Massimo', '1960-01-30', 'Padova (PD)', '03396010278', '', 'FRSMSM60A30G224O', '2017-05-14', ''),
(337, 0, 0, 0, 0, 0, 0, 0, 'STUDIO CARUZZO ED ASSOCIATI', 'LICEO', 'Viale della Repubblica 9', 31020, 'Villorba (TV)', 'Dore Isabella', 'Dore Isabella', '0422 306600', '', '', '', '', 'studiocaruzzo@studiocaruzzo.it', '', 10, '', 'STUDIO CARUZZO ED ASSOCIATI', 'Viale della Repubblica 9', 'Villorba (TV)', 'Caruzzo Antonio', '1955-09-02', 'Treviso (TV)', '04014270260', '2600/C24D', 'CRZNTN55P02L407S', '2017-05-15', ''),
(338, 0, 0, 0, 0, 0, 0, 0, 'FARMACIA MILLIONI SNC', 'LICEO', 'Corso del popolo 69', 31100, 'Treviso (TV)', 'Zanoni Luisa', 'Znoni Luisa', '0422 543370', '', '', '', '', 'forma098@farmaciatv.it', '', 10, '', 'FARMACIA MILLIONI SNC', 'Corso del popolo 69', 'Treviso (TV)', 'Zanoni Ermes', '1936-06-16', 'Curtatone (MN)', '02495110260', '2656/C24D', 'ZNNRMS36H16D227A', '2017-05-16', ''),
(339, 0, 0, 0, 0, 0, 0, 0, 'GIORGIO RIGO COSTRUZIONI S.R.L.', 'LICEO', 'Strada del Mozzato 1', 31100, 'Treviso (TV)', 'Rigo Giorgio', 'Rigo Giorgio', '0422 485180', '8.00', '12.00', '13.00/14.00', '17.00/18.00', 'giorgiorigocostruzioni@gmail.com', '', 10, '', 'GIORGIO RIGO COSTRUZIONI S.R.L.', 'Via Giorgione, 8', 'Zero Branco (TV)', 'Rigo Giorgio', '1968-05-20', 'Treviso (TV)', '00349370262', '', 'RGIGRG68E20L407V', '2017-05-17', ''),
(340, 0, 0, 0, 0, 0, 0, 0, 'G.S. GENERAL SERVICE SOC. COOP.', 'LICEO', 'Via Lussemburgo2', 35100, 'Padova (PD)', 'Garlet Chiara', 'Garlet Chiara', '393 9952374', '', '', '', '', 'gs.personale.coop@gmail.com', '', 51, '', 'G.S. GENERAL SERVICE SOC. COOP.', 'Via Martin Luther King, 66', 'Casale sul Sile (TV)', 'Negro Tatiana', '1973-06-05', 'Treviso (TV)', '04512820285', '2655/C24D', 'NGRTTN73H45L407P', '2017-05-18', ''),
(341, 0, 0, 0, 0, 0, 0, 0, 'ITIS MAX PLANCK ', 'LICEO', 'Via Franchini 1', 31020, 'Lancenigo Di Villorba (TV)', 'Di Virgilio Sergio', 'DOCENTE INCARICATO', '04226171', '8.00', '13.00', '14.00', '16.00', '-', 'www.itisplanck.it', 51, '', 'ITIS MAX PLANCK ', 'Via Franchini 1', 'Lancenigo Di Villorba (TV)', 'Pol Emanuela', '1963-09-02', 'Spresiano (TV)', '94000960263', '-', 'PLO MNL 63P42 I927Q', '2017-05-19', ''),
(342, 0, 0, 0, 0, 0, 0, 0, 'USD FONTANELLE', 'LICEO', 'Via Kennedy1', 31043, 'Fontanelle (TV)', '', '', '0422 809020', '', '', '', '', 'usdfontanelle@gmail.com', '', 0, '', 'USD FONTANELLE', 'Via Kennedy1', 'Fontanelle (TV)', 'Cavinato Livio', '1946-11-22', 'Piazzola sul Brenta (PD)', '02111700262', '2714/C24D', 'CVNLVI46S22G587X', '2017-05-20', ''),
(343, 0, 0, 0, 0, 0, 0, 0, 'AZIENDA ULSS N. 2 MARCA TREVIGIANA', 'LICEO', 'Ospedale Ca Foncello Piazza Ospedali 1', 31100, 'Treviso (TV)', 'Benazzi Francesco', 'Gambino Francesca', '0422 323209', '', '', '', '', 'protocollo.aulss2@pecveneto.it', '', 251, '', 'AZIENDA ULSS N. 2 MARCA TREVIGIANA', 'Ospedale Ca Foncello Piazza Ospedali 1', 'Treviso (TV)', 'Benazzi Francesco', '1956-03-02', 'Treviso (TV)', '03084880263', '3279/C 24D', 'BNZFNC56C02L407Z', '2017-05-21', ''),
(344, 0, 0, 0, 0, 0, 0, 0, 'NOTORIOUS SRL', 'LICEO', 'V.lo S. Antonio 10', 31033, 'Castelfranco Veneto (TV)', 'D Ambros Davide', 'D Ambros Davide', '0423 492526', '', '', '', '', 'info@notorious.agency', '', 10, '', 'NOTORIOUS SRL', 'V.lo S. Antonio 10', 'Castelfranco Veneto (TV)', 'La Fiura Marco', '1982-06-24', 'Castelfranco Veneto (TV)', '04485330262', '3209/C24D', 'LFRMRC82H24C111N', '2017-05-22', ''),
(345, 0, 0, 0, 0, 0, 0, 0, 'SMART BUGS s.s.', 'LICEO', 'Via strada di Ponzano 5', 31050, 'Ponzano Veneto (TV)', 'Rigato Emanuele', 'Rigato Emanuele', '0422969352', '9.00', '13.30', '14.30', '18.00 - sabato 8.00-11.00', 'info.smartbugs@gmail.com', '', 44470, 'ATECO 01.49.90', 'SMART BUGS s.s.', 'Via Cave, 66', 'Villorba (TV)', 'Rigato Emanuele', '1989-12-23', 'Treviso (TV)', '04659080263', '16763/C24', 'RGTMNL89T23L407D', '2017-05-23', ''),
(346, 0, 0, 0, 0, 0, 0, 0, 'SOPREMA SRL', 'LICEO', 'Via Gattole 1', 31040, 'Salgareda (TV)', 'Vacilotto Luciano', 'Vacilotto Luciano', '0422 8084', '', '', '', '', '', '', 0, '', 'SOPREMA SRL', 'Via delle Industrie, 3', 'Chignolo d Isola (BG)', 'Perez Jean Denis', '1976-01-18', 'Marsiglia (Francia)', '01250140165', '3637/C24D', 'PRZJDN76A18Z110N', '2017-05-24', ''),
(347, 0, 0, 0, 0, 0, 0, 0, 'SERVICE 2000', 'LICEO', 'Via Martin Luther King 66', 31032, 'Casale sul Sile (TV)', '', '', '0437 88907', '', '', '', '', 'info@service2000srl.it ', '', 0, '', 'SERVICE 2000', 'Via Martin Luther King 66', 'Casale sul Sile (TV)', '0', '0000-00-00', '', '00818270258', '', '', '2017-05-25', ''),
(348, 0, 0, 0, 0, 0, 0, 0, 'EUROSERVICE SRL', 'LICEO', 'V.le della Navigazione inerna 51', 35129, 'Padova (PD)', 'Trolese Luca', 'Rigato Simone', '049 8079191', '', '', '', '', 'info@euroservicehq.it', '', 50, '', 'EUROSERVICE SRL', 'V.le della Navigazione inerna 51', 'Padova (PD)', 'Trolese Luca', '1970-07-31', 'Vigonovo (VE)', '03378140283', '3637/C24D', 'TRLGLC70L31L899B', '2017-05-26', ''),
(349, 0, 0, 0, 0, 0, 0, 0, 'NATATORIUM TREVISO', 'LICEO', 'Vilae Europa 40', 31100, 'Treviso (TV)', '', '', '0422 433631', '8.30', '11.30', '16.30', '18.30', '', '', 10, '', 'NATATORIUM TREVISO', 'Vilae Europa 40', 'Treviso (TV)', 'Cognonato Roberto', '1961-09-12', 'Torino (TO)', '3228790261', '3279/C24D', 'CGNRRT61P12L219I', '2017-05-27', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `id` int NOT NULL,
  `id_docente` int DEFAULT NULL,
  `sezione` varchar(10) NOT NULL,
  `anno` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`id`, `id_docente`, `sezione`, `anno`) VALUES
(1, 13, '4AEE', '2021/2022'),
(2, NULL, '4AII', '2021/2022'),
(3, NULL, '4BEA', '2021/2022'),
(4, NULL, '4BEE', '2021/2022'),
(5, NULL, '4BII', '2021/2022'),
(6, NULL, '4CEA', '2021/2022'),
(7, NULL, '4CII', '2021/2022'),
(8, 13, '4DAR', '2021/2022'),
(9, NULL, '4DEA', '2021/2022'),
(10, 290, '5BII', '2023/2024');

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_studente`
--

CREATE TABLE `classe_studente` (
  `idclasse` int NOT NULL,
  `idpersona` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `classe_studente`
--

INSERT INTO `classe_studente` (`idclasse`, `idpersona`) VALUES
(1, 101),
(4, 102),
(-1, 103),
(3, 104),
(2, 105),
(6, 106),
(4, 107),
(9, 108),
(7, 109),
(3, 110),
(6, 111),
(9, 112),
(5, 113),
(7, 114),
(4, 115),
(6, 116),
(6, 117),
(6, 118),
(2, 119),
(3, 120),
(8, 121),
(4, 122),
(6, 123),
(6, 124),
(6, 125),
(1, 126),
(7, 127),
(9, 128),
(9, 130),
(5, 131),
(1, 132),
(1, 133),
(1, 134),
(4, 135),
(4, 136),
(2, 137),
(1, 138),
(8, 139),
(4, 140),
(6, 141),
(6, 142),
(7, 143),
(6, 144),
(3, 145),
(3, 146),
(6, 147),
(8, 148),
(1, 149),
(3, 150),
(2, 151),
(3, 152),
(-1, 153),
(7, 154),
(2, 155),
(5, 156),
(3, 157),
(1, 158),
(2, 159),
(8, 160),
(6, 161),
(8, 162),
(5, 163),
(7, 164),
(3, 165),
(3, 166),
(6, 167),
(5, 168),
(6, 169),
(5, 170),
(9, 171),
(7, 172),
(5, 173),
(5, 174),
(1, 175),
(9, 176),
(3, 177),
(7, 178),
(8, 179),
(4, 180),
(6, 181),
(7, 182),
(7, 183),
(7, 184),
(9, 185),
(3, 186),
(5, 187),
(2, 188),
(8, 189),
(1, 190),
(6, 191),
(7, 192),
(4, 193),
(8, 194),
(2, 195),
(2, 196),
(8, 197),
(7, 198),
(3, 199),
(9, 200),
(2, 201),
(9, 202),
(2, 203),
(8, 204),
(8, 205),
(8, 206),
(9, 207),
(9, 208),
(6, 209),
(2, 210),
(8, 211),
(4, 212),
(1, 213),
(9, 214),
(6, 215),
(5, 216),
(7, 217),
(7, 218),
(1, 219),
(9, 220),
(7, 221),
(3, 222),
(4, 223),
(3, 224),
(7, 225),
(8, 226),
(3, 227),
(1, 228),
(8, 229),
(5, 230),
(4, 231),
(3, 232),
(7, 233),
(8, 234),
(5, 235),
(9, 236),
(3, 237),
(9, 238),
(2, 239),
(4, 240),
(8, 241),
(9, 242),
(9, 243),
(5, 244),
(2, 245),
(6, 246),
(8, 247),
(4, 248),
(8, 249),
(2, 250),
(9, 251),
(8, 252),
(2, 253),
(5, 254),
(5, 255),
(9, 256),
(9, 257),
(5, 258),
(3, 259),
(3, 260),
(7, 261),
(7, 262),
(7, 263),
(6, 264),
(5, 265),
(1, 266),
(2, 267),
(8, 268),
(6, 269),
(9, 270),
(2, 271),
(2, 272),
(8, 273),
(7, 274),
(5, 275),
(5, 276),
(3, 277),
(2, 278),
(1, 279),
(8, 280),
(5, 281),
(1, 282),
(2, 283),
(4, 284),
(5, 285),
(2, 286),
(10, 291);

-- --------------------------------------------------------

--
-- Struttura della tabella `contatti`
--

CREATE TABLE `contatti` (
  `id` int NOT NULL,
  `id_azienda` int NOT NULL,
  `id_docente` int NOT NULL,
  `data` datetime NOT NULL,
  `commento` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `contatti`
--

INSERT INTO `contatti` (`id`, `id_azienda`, `id_docente`, `data`, `commento`) VALUES
(1, 2, 13, '2022-02-09 12:28:32', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `periodo_stage`
--

CREATE TABLE `periodo_stage` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_inizio` date NOT NULL DEFAULT (curdate()),
  `data_fine` date NOT NULL DEFAULT (curdate())
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dump dei dati per la tabella `periodo_stage`
--

INSERT INTO `periodo_stage` (`id`, `nome`, `data_inizio`, `data_fine`) VALUES
(1, 'PCTO-2022', '2022-05-23', '2022-06-17'),
(2, 'PCTO-2023', '2023-05-22', '2023-06-18');

-- --------------------------------------------------------

--
-- Struttura della tabella `persona`
--

CREATE TABLE `persona` (
  `id` int NOT NULL,
  `nome` varchar(80) NOT NULL,
  `cognome` varchar(80) NOT NULL,
  `datanascita` date DEFAULT NULL,
  `codicefiscale` varchar(16) NOT NULL,
  `sesso` char(1) NOT NULL,
  `cellulare` varchar(13) NOT NULL,
  `login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `al_matricola` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `al_cittadinanza` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cap` varchar(5) DEFAULT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `indirizzo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `residenza` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `provincia` varchar(2) DEFAULT NULL,
  `tut_idazienda` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `persona`
--

INSERT INTO `persona` (`id`, `nome`, `cognome`, `datanascita`, `codicefiscale`, `sesso`, `cellulare`, `login`, `password`, `al_matricola`, `al_cittadinanza`, `cap`, `telefono`, `email`, `indirizzo`, `residenza`, `provincia`, `tut_idazienda`) VALUES
(1, 'null', 'null', '1000-01-01', '', '', '', 'adminpcto', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', NULL, '', '', '', '', NULL, NULL),
(4, 'andrea', 'cestaro', '2002-09-21', '', 'm', '', 'cestaro.andrea', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(5, 'nicholas', 'darisi', '2022-02-17', '', 'm', '', 'darisi.nicholas', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(6, 'ruize', 'lin', '2022-02-14', '', 'm', '', 'lin.ruize', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(7, 'davide', 'marin', '2022-02-17', '', 'm', '', 'marin.davide', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(8, 'francesco', 'mariotto', '2022-02-21', '', 'm', '', 'mariotto.francesco', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(9, 'francesco', 'marsura', '2022-02-14', '', 'm', '', 'marsura.francesco', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(10, 'matteo', 'pretto', '2022-02-01', '', 'm', '', 'pretto.matteo', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(11, 'manuele', 'saccon', '2022-02-10', '', 'm', '', 'saccon.manuele', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(12, 'alessio', 'sartoretto', '2022-02-05', '', 'm', '', 'sartoretto.alessio', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(13, 'fabio ', 'biscaro', '1822-02-02', '', 'm', '', 'biscaro.fabio', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(14, 'roberto', 'olivotto', '1823-02-08', '', 'm', '', 'olivotto.roberto', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', '', '', '', NULL, NULL),
(16, '4AEE', 'SANFILIPPO', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(17, '4BEE', 'DOMENICALE', '1000-01-01', '', '', '', '', '', '', '', 'Lance', '', '', '', 'Lancenigo', NULL, NULL),
(18, '4BEA', 'PAONESSA', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(19, '4CEA', 'LUCCHESI', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(20, '4DEA', 'DALESSANDRO', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(21, '4AII', 'OLIVOTTO', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(22, '4BII', 'BISCARO', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(23, '4CII', 'VENTILII', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(24, '4DII', 'PEDUTO', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(25, '4DIT', 'DAMIAN', '1000-01-01', '', '', '', '', '', '', '', '', '', '', '', 'Lancenigo', NULL, NULL),
(101, 'FILIPPO', 'BACCICHETTO', NULL, '', '', '', 'baccichetto.st.filippo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31042', '', 'baccichetto.st.filippo@maxplanck.edu.it', 'VIA FRANCESCO BARACCA, 12A', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(102, 'ALESSANDRO', 'BALDASSO', NULL, '', '', '', 'baldasso.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'baldasso.st.alessandro@maxplanck.edu.it', 'Via Chianni n. 31', 'CASIER', 'TV', NULL),
(103, 'RICCARDO', 'BALDIN', '2005-05-12', 'werg', '', '', 'baldin.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'baldin.st.riccardo@maxplanck.edu.it', 'VIA SCHIAVON 5', 'ZERO BRANCO', 'TV', NULL),
(104, 'ALESSANDRO', 'BANDIERA', NULL, '', '', '', 'bandiera.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'bandiera.st.alessandro@maxplanck.edu.it', 'VIA BOTTENIGA 36', 'TREVISO', 'TV', NULL),
(105, 'IVAN CLEDJ', 'BANDIERA', NULL, '', '', '', 'bandiera.st.ivancledj@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'bandiera.st.ivancledj@maxplanck.edu.it', 'VIA 25 APRILE, 17', 'GORGO AL MONTICANO', 'TV', NULL),
(106, 'ALBERTO', 'BARBON', NULL, '', '', '', 'barbon.st.alberto@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'barbon.st.alberto@maxplanck.edu.it', 'Via Madonna delle Vittorie, 20', 'MASERADA SUL PIAVE', 'TV', NULL),
(107, 'FRANCESCO', 'BASEGGIO', NULL, '', '', '', 'baseggio.st.francesco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'baseggio.st.francesco@maxplanck.edu.it', 'VIA IPPOLITO NIEVO N. 1/A', 'CASIER', 'TV', NULL),
(108, 'SOUFIANE', 'BASSITI', NULL, '', '', '', 'bassiti.st.soufiane@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'bassiti.st.soufiane@maxplanck.edu.it', 'VIA CENTA, 63', 'VILLORBA', 'TV', NULL),
(109, 'ENRIC', 'BATKU', NULL, '', '', '', 'batku.st.enric@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'batku.st.enric@maxplanck.edu.it', 'VIA CAPITELLO n. 11', 'QUINTO DI TREVISO', 'TV', NULL),
(110, 'MIRCO', 'BELLIO', NULL, '', '', '', 'bellio.st.mirco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'bellio.st.mirco@maxplanck.edu.it', 'Via Treforni, 35/A', 'PAESE', 'TV', NULL),
(111, 'DAVIDE', 'BENINCA', NULL, '', '', '', 'beninca.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'beninca.st.davide@maxplanck.edu.it', 'VIA MONTEGRAPPA 43', 'MASERADA SUL PIAVE', 'TV', NULL),
(112, 'EDOARDO', 'BENVENUTO', NULL, '', '', '', 'benvenuto.st.edoardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'benvenuto.st.edoardo@maxplanck.edu.it', '33, Viale Trento Trieste ', 'CASALE SUL SILE', 'TV', NULL),
(113, 'RICCARDO', 'BERGAMO', NULL, '', '', '', 'bergamo.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'bergamo.st.riccardo@maxplanck.edu.it', 'VIA PIOVENSAN 43', 'CARBONERA', 'TV', NULL),
(114, 'NICOLO', 'BERTAZZO', NULL, '', '', '', 'bertazzo.st.nicolo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'bertazzo.st.nicolo@maxplanck.edu.it', 'Vicolo Feltrina C, 7', 'TREVISO', 'TV', NULL),
(115, 'NICOLE', 'BERTO', NULL, '', '', '', 'berto.st.nicole@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'berto.st.nicole@maxplanck.edu.it', '15, Via Grave Ponte', 'PONTE DI PIAVE', 'TV', NULL),
(116, 'RICCARDO', 'BERTOLDO', NULL, '', '', '', 'bertoldo.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'bertoldo.st.riccardo@maxplanck.edu.it', 'via turati 14', 'PREGANZIOL', 'TV', NULL),
(117, 'SIMONE', 'BERTOLIN', NULL, '', '', '', 'bertolin.st.simone@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'bertolin.st.simone@maxplanck.edu.it', 'via Boschetta  n 51', 'PREGANZIOL', 'TV', NULL),
(118, 'GABRIELE', 'BETTIOL', NULL, '', '', '', 'bettiol.st.gabriele@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'bettiol.st.gabriele@maxplanck.edu.it', 'Via delle ABSIDI, 13', 'TREVISO', 'TV', NULL),
(119, 'LUCA', 'BETTIOL', NULL, '', '', '', 'bettiol.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'bettiol.st.luca@maxplanck.edu.it', 'via roma 40/a', 'ARCADE', 'TV', NULL),
(120, 'SAMUELE', 'BETTIOL', NULL, '', '', '', 'bettiol.st.samuele@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'bettiol.st.samuele@maxplanck.edu.it', 'VIA MESTRINA 39', 'QUINTO DI TREVISO', 'TV', NULL),
(121, 'DAVIDE', 'BIASUZZI', NULL, '', '', '', 'biasuzzi.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'biasuzzi.st.davide@maxplanck.edu.it', 'Via Frasnelli n.6', 'NERVESA DELLA BATTAGLIA', 'TV', NULL),
(122, 'MATTEO', 'BISCARO', NULL, '', '', '', 'biscaro.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'biscaro.st.matteo@maxplanck.edu.it', 'Via volpago Sud 30', 'PONZANO', 'TV', NULL),
(123, 'ANDREA', 'BOLIGON', NULL, '', '', '', 'boligon.st.andrea@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'boligon.st.andrea@maxplanck.edu.it', 'VIA PEGORILE 6/A', 'VILLORBA', 'TV', NULL),
(124, 'LUIGI', 'BORANGA', NULL, '', '', '', 'boranga.st.luigi@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'boranga.st.luigi@maxplanck.edu.it', 'VIA MADONNA DELLE GRAZIE 6', 'GIAVERA DEL MONTELLO', 'TV', NULL),
(125, 'FEDERICO', 'BORSATO', NULL, '', '', '', 'borsato.st.federico@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'borsato.st.federico@maxplanck.edu.it', 'Carrer, 3/8', 'ARCADE', 'TV', NULL),
(126, 'ALBERTO', 'BORTOLI', NULL, '', '', '', 'bortoli.st.alberto@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31028', '', 'bortoli.st.alberto@maxplanck.edu.it', 'VIA BEATA G. STERNI 3/2', 'VAZZOLA', 'TV', NULL),
(127, 'NICOLAS', 'BOTTOLI', NULL, '', '', '', 'bottoli.st.nicolas@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'bottoli.st.nicolas@maxplanck.edu.it', 'PIAZZA PAPA RONCALLI 2', 'MASERADA SUL PIAVE', 'TV', NULL),
(128, 'MIRCO', 'BRANCHER', NULL, '', '', '', 'brancher.st.mirco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31010', '', 'brancher.st.mirco@maxplanck.edu.it', 'Via Ungheresca Sud n. 28', 'MARENO DI PIAVE', 'TV', NULL),
(130, 'DAVIDE', 'BRUGNOTTO', NULL, '', '', '', 'brugnotto.st.davide1@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'brugnotto.st.davide1@maxplanck.edu.it', 'VIA PAPA RONCALLI  32', 'CARBONERA', 'TV', NULL),
(131, 'ALFONSO', 'BUONOCORE', NULL, '', '', '', 'buonocore.st.alfonso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31058', '', 'buonocore.st.alfonso@maxplanck.edu.it', 'via papa luciani', 'SUSEGANA', 'TV', NULL),
(132, 'MICHELE IVO', 'CACCIATORE', NULL, '', '', '', 'cacciatore.st.micheleivo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'cacciatore.st.micheleivo@maxplanck.edu.it', 'VICOLO MURER, 21', 'QUINTO DI TREVISO', 'TV', NULL),
(133, 'ALBERTO', 'CANCIAN', NULL, '', '', '', 'cancian.st.alberto@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'cancian.st.alberto@maxplanck.edu.it', 'VIA CADORE, 1', 'MASERADA SUL PIAVE', 'TV', NULL),
(134, 'ANDREI', 'CANTEA', NULL, '', '', '', 'cantea.st.andrei@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31010', '', 'cantea.st.andrei@maxplanck.edu.it', 'Via Tezze 6/A', 'CIMADOLMO', 'TV', NULL),
(135, 'ALESSANDRO', 'CAPUTO', NULL, '', '', '', 'caputo.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'caputo.st.alessandro@maxplanck.edu.it', 'VICOLO PASUBIO 9', 'SAN VENDEMIANO', 'TV', NULL),
(136, 'LUCA', 'CARNIEL', NULL, '', '', '', 'carniel.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'carniel.st.luca@maxplanck.edu.it', 'VIA DON BOVO, 7', 'PONZANO', 'TV', NULL),
(137, 'MICHAEL', 'CASAGRANDE', NULL, '', '', '', 'casagrande.st.michael@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'casagrande.st.michael@maxplanck.edu.it', 'VIA Baden Powell, 79', 'CASALE SUL SILE', 'TV', NULL),
(138, 'AVANI', 'CASELLA', NULL, '', '', '', 'casella.st.avani@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'casella.st.avani@maxplanck.edu.it', 'VIA GALILEO GALILEI 10', 'PONZANO', 'TV', NULL),
(139, 'GIACOMO', 'CASTELLAN', NULL, '', '', '', 'castellan.st.giacomo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31056', '', 'castellan.st.giacomo@maxplanck.edu.it', 'VIA C.A. RADAELLI 12A', 'RONCADE', 'TV', NULL),
(140, 'RICCARDO', 'CECCHETTI', NULL, '', '', '', 'cecchetti.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31058', '', 'cecchetti.st.riccardo@maxplanck.edu.it', 'VIA COLONNA 46', 'SUSEGANA', 'TV', NULL),
(141, 'RICCARDO', 'CENEDESE', NULL, '', '', '', 'cenedese.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'cenedese.st.riccardo@maxplanck.edu.it', 'Via Pastro 32/7', 'VILLORBA', 'TV', NULL),
(142, 'MARCO', 'CERON', NULL, '', '', '', 'ceron.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'ceron.st.marco@maxplanck.edu.it', 'VIA FILIPPO TURATI 42/B', 'PAESE', 'TV', NULL),
(143, 'QIANG', 'CHEN', NULL, '', '', '', 'chen.st.qiang@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'chen.st.qiang@maxplanck.edu.it', 'BOTTENIGA, 19', 'TREVISO', 'TV', NULL),
(144, 'FABIO', 'CIPRIOTTO', NULL, '', '', '', 'cipriotto.st.fabio@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'cipriotto.st.fabio@maxplanck.edu.it', 'Via Divisione Alpina Taurinense ', 'ZERO BRANCO', 'TV', NULL),
(145, 'SEBASTIANO', 'CISIOLA', NULL, '', '', '', 'cisiola.st.sebastiano@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31021', '', 'cisiola.st.sebastiano@maxplanck.edu.it', 'Via Guglielmo Marconi, 103/B', 'MOGLIANO VENETO', 'TV', NULL),
(146, 'ALESSANDRO', 'COLMELET', NULL, '', '', '', 'colmelet.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'colmelet.st.alessandro@maxplanck.edu.it', 'Via Don G. Minzoni  n.18', 'CARBONERA', 'TV', NULL),
(147, 'DAVIDE', 'CORRO', NULL, '', '', '', 'corro.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'corro.st.davide@maxplanck.edu.it', 'VIA DEI BRILLI,2/D INT. 2', 'QUINTO DI TREVISO', 'TV', NULL),
(148, 'ALESSANDRO', 'CORTESE', NULL, '', '', '', 'cortese.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'cortese.st.alessandro@maxplanck.edu.it', 'Via DEI BOTTERI, 6', 'SPRESIANO', 'TV', NULL),
(149, 'GIULIO', 'CURTI', NULL, '', '', '', 'curti.st.giulio@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'curti.st.giulio@maxplanck.edu.it', 'Via Della Resistenza 59/5', 'PAESE', 'TV', NULL),
(150, 'ALINA', 'CUTINOVA', NULL, '', '', '', 'cutinova.st.alina@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'cutinova.st.alina@maxplanck.edu.it', 'largo tre venezie, 1', 'TREVISO', 'TV', NULL),
(151, 'LUCA', 'DAL BIANCO', NULL, '', '', '', 'dalbianco.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31010', '', 'dalbianco.st.luca@maxplanck.edu.it', 'via vittoria 4/b', 'CIMADOLMO', 'TV', NULL),
(152, 'GIACOMO', 'DAL MOLIN', NULL, '', '', '', 'dalmolin.st.giacomo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31056', '', 'dalmolin.st.giacomo@maxplanck.edu.it', 'via longhin 128/a', 'RONCADE', 'TV', NULL),
(153, 'SAMUELE', 'DALLAVA', '2004-10-10', 'wrge', 'F', '', 'dallava.st.samuele@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'dallava.st.samuele@maxplanck.edu.it', 'VIA CRISTOFORO COLOMBO,8', 'MASERADA SUL PIAVE', 'TV', NULL),
(154, 'LUCA', 'DE LAZZARI', NULL, '', '', '', 'delazzari.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'delazzari.st.luca@maxplanck.edu.it', 'VIA G. BENZI, 43', 'TREVISO', 'TV', NULL),
(155, 'GIACOMO', 'DE MARCHI', NULL, '', '', '', 'demarchi.st.giacomo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31015', '', 'demarchi.st.giacomo@maxplanck.edu.it', 'F. Cristofoli 7', 'CONEGLIANO', 'TV', NULL),
(156, 'RICCARDO', 'DE NINNO', NULL, '', '', '', 'deninno.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'deninno.st.riccardo@maxplanck.edu.it', 'VIA ZERMANESE SUPERIORE 43', 'CASIER', 'TV', NULL),
(157, 'DENNIS', 'DE VECCHI', NULL, '', '', '', 'devecchi.st.dennis@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'devecchi.st.dennis@maxplanck.edu.it', 'VIA SAMBUGHE\' 118', 'PREGANZIOL', 'TV', NULL),
(158, 'RICCARDO', 'DELLANNA', NULL, '', '', '', 'dellanna.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'dellanna.st.riccardo@maxplanck.edu.it', 'VIA FONDERIA 10/B', 'TREVISO', 'TV', NULL),
(159, 'ALESSANDRO', 'DEREVYTSKYY', NULL, '', '', '', 'derevytskyy.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'derevytskyy.st.alessandro@maxplanck.edu.it', 'CORTE D\'ASSISE, 6', 'CASIER', 'TV', NULL),
(160, 'DAVIDE', 'DI GATI', NULL, '', '', '', 'digati.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '86100', '', 'digati.st.davide@maxplanck.edu.it', 'VIA TIBERIO 95', 'CAMPOBASSO', 'CB', NULL),
(161, 'MARCO', 'DOGAO', NULL, '', '', '', 'dogao.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'dogao.st.marco@maxplanck.edu.it', 'VIA SAMBUGHE\' 141/a', 'PREGANZIOL', 'TV', NULL),
(162, 'SIMONE ALFONSO', 'DONA', NULL, '', '', '', 'dona.st.simonealfonso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'dona.st.simonealfonso@maxplanck.edu.it', 'CARDUCCI 7', 'ZERO BRANCO', 'TV', NULL),
(163, 'RICCARDO', 'DUSE', NULL, '', '', '', 'duse.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'duse.st.riccardo@maxplanck.edu.it', 'VIA Spalato 1', 'TREVISO', 'TV', NULL),
(164, 'DJENIS', 'EJUPI', NULL, '', '', '', 'ejupi.st.djenis@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'ejupi.st.djenis@maxplanck.edu.it', 'Via tommaso salsa 84/A', 'TREVISO', 'TV', NULL),
(165, 'ALESSIO', 'FABIANO', NULL, '', '', '', 'fabiano.st.alessio@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'fabiano.st.alessio@maxplanck.edu.it', 'VIA GRANDE DI MIGNAGOLA, 24/4', 'CARBONERA', 'TV', NULL),
(166, 'PIETRO', 'FAVARATO', NULL, '', '', '', 'favarato.st.pietro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'favarato.st.pietro@maxplanck.edu.it', 'VIA CIARDI 38', 'QUINTO DI TREVISO', 'TV', NULL),
(167, 'MARCO', 'FAVERO', NULL, '', '', '', 'favero.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'favero.st.marco@maxplanck.edu.it', 'VIA ANTONIO GENTILIN N. 4', 'TREVISO', 'TV', NULL),
(168, 'ARDIAN', 'FERATI', NULL, '', '', '', 'ferati.st.ardian@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'ferati.st.ardian@maxplanck.edu.it', 'via tezze', 'SAN POLO DI PIAVE', 'TV', NULL),
(169, 'MATTEO', 'FIOROTTO', NULL, '', '', '', 'fiorotto.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'fiorotto.st.matteo@maxplanck.edu.it', 'VIA P.A. SACCARDO 49', 'TREVISO', 'TV', NULL),
(170, 'GABRIEL REMUS', 'FLOREA', NULL, '', '', '', 'florea.st.gabrielremus@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31021', '', 'florea.st.gabrielremus@maxplanck.edu.it', 'via Rimini 16', 'MOGLIANO VENETO', 'TV', NULL),
(171, 'CHRISTIAN RICCARDO', 'FOGALE', NULL, '', '', '', 'fogale.st.christianriccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'fogale.st.christianriccardo@maxplanck.edu.it', 'Via del preve 2/I', 'POVEGLIANO', 'TV', NULL),
(172, 'ANDREA', 'FONTANA', NULL, '', '', '', 'fontana.st.andrea@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'fontana.st.andrea@maxplanck.edu.it', 'via morer n4', 'MORGANO', 'TV', NULL),
(173, 'MIRKO', 'FORCOLIN', NULL, '', '', '', 'forcolin.st.mirko@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31056', '', 'forcolin.st.mirko@maxplanck.edu.it', 'via Paris Bordone 115', 'RONCADE', 'TV', NULL),
(174, 'TOMMASO', 'FRANCESCHET', NULL, '', '', '', 'franceschet.st.tommaso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'franceschet.st.tommaso@maxplanck.edu.it', 'Via Roma, 107/03', 'CARBONERA', 'TV', NULL),
(175, 'MICHAL', 'GAMBATO', NULL, '', '', '', 'gambato.st.michal@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31056', '', 'gambato.st.michal@maxplanck.edu.it', 'via Principe 88', 'RONCADE', 'TV', NULL),
(176, 'EDOARDO', 'GARI', NULL, '', '', '', 'gari.st.edoardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31057', '', 'gari.st.edoardo@maxplanck.edu.it', 'VIA MADONNA DELLA SALUTE, 46', 'SILEA', 'TV', NULL),
(177, 'TOMAS', 'GEGA', NULL, '', '', '', 'gega.st.tomas@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'gega.st.tomas@maxplanck.edu.it', 'Vicolo G Marconi 8/1', 'QUINTO DI TREVISO', 'TV', NULL),
(178, 'ENRICO', 'GIACALONE', NULL, '', '', '', 'giacalone.st.enrico@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'giacalone.st.enrico@maxplanck.edu.it', 'via turati 7', 'PREGANZIOL', 'TV', NULL),
(179, 'GIULIA', 'GIROTTO', NULL, '', '', '', 'girotto.st.giulia@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'girotto.st.giulia@maxplanck.edu.it', 'via Julia n.42', 'MASERADA SUL PIAVE', 'TV', NULL),
(180, 'ALESSANDRO', 'GIUSTI', NULL, '', '', '', 'giusti.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'giusti.st.alessandro@maxplanck.edu.it', 'Via Degli Alpini 3', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(181, 'MANUEL', 'GOLINO', NULL, '', '', '', 'golino.st.manuel@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'golino.st.manuel@maxplanck.edu.it', 'VIA VITTORIO VENETO 23', 'MASERADA SUL PIAVE', 'TV', NULL),
(182, 'THOMAS', 'GRANZOTTO', NULL, '', '', '', 'granzotto.st.thomas@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'granzotto.st.thomas@maxplanck.edu.it', 'Gasparotto Vecellio 68', 'SPRESIANO', 'TV', NULL),
(183, 'ETTORE', 'GRECO', NULL, '', '', '', 'greco.st.ettore@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'greco.st.ettore@maxplanck.edu.it', 'VIA DON LUIGI STURZO, 10', 'TREVISO', 'TV', NULL),
(184, 'MATTEO', 'HU', NULL, '', '', '', 'hu.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'hu.st.matteo@maxplanck.edu.it', 'Luigi Pastro, 128', 'VOLPAGO DEL MONTELLO', 'TV', NULL),
(185, 'ETTORE', 'INGARGIOLA', NULL, '', '', '', 'ingargiola.st.ettore@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'ingargiola.st.ettore@maxplanck.edu.it', 'VIALE NAZIONI UNITE 130', 'TREVISO', 'TV', NULL),
(186, 'GIULIO', 'KASTRATI', NULL, '', '', '', 'kastrati.st.giulio@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'kastrati.st.giulio@maxplanck.edu.it', 'via risorgiment nr 3', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(187, 'NICOLO', 'KRYSHTAL', NULL, '', '', '', 'kryshtal.st.nicolo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'kryshtal.st.nicolo@maxplanck.edu.it', 'VICOLO FONTANE, 2A', 'TREVISO', 'TV', NULL),
(188, 'MARCO', 'LA SCALA', NULL, '', '', '', 'lascala.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'lascala.st.marco@maxplanck.edu.it', 'VIA E. DE AMICIS 2', 'CASIER', 'TV', NULL),
(189, 'LORENZO', 'LASHKIBA', NULL, '', '', '', 'lashkiba.st.lorenzo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'lashkiba.st.lorenzo@maxplanck.edu.it', 'Via bortolozzi 1, fagare della b', 'ROMA', 'RM', NULL),
(190, 'BRIAN', 'LAZZARIS', NULL, '', '', '', 'lazzaris.st.brian@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'lazzaris.st.brian@maxplanck.edu.it', 'Via Cesare Battisti', 'SPRESIANO', 'TV', NULL),
(191, 'SIMONE', 'LINGUANOTTO', NULL, '', '', '', 'linguanotto.st.simone@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'linguanotto.st.simone@maxplanck.edu.it', 'VIA MOZART 30', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(192, 'DANILO', 'LONGO', NULL, '', '', '', 'longo.st.danilo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'longo.st.danilo@maxplanck.edu.it', 'via della Liberta\' 1', 'CASALE SUL SILE', 'TV', NULL),
(193, 'ARJEL', 'LOSHI', NULL, '', '', '', 'loshi.st.arjel@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31021', '', 'loshi.st.arjel@maxplanck.edu.it', 'via toni benetton 3/9', 'MOGLIANO VENETO', 'TV', NULL),
(194, 'MAOXIN FRANCESCO', 'LUO', NULL, '', '', '', 'luo.st.maoxinfrancesco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'luo.st.maoxinfrancesco@maxplanck.edu.it', 'VIA PARRI 4', 'PAESE', 'TV', NULL),
(195, 'JOEL', 'MACCARI', NULL, '', '', '', 'maccari.st.joel@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'maccari.st.joel@maxplanck.edu.it', 'via code n. 10', 'BREDA DI PIAVE', 'TV', NULL),
(196, 'ALESSANDRO', 'MACUGLIA', NULL, '', '', '', 'macuglia.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'macuglia.st.alessandro@maxplanck.edu.it', 'VIA DEL DONATORE 37/A', 'ARCADE', 'TV', NULL),
(197, 'JACOPO', 'MAGUOLO', NULL, '', '', '', 'maguolo.st.jacopo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'maguolo.st.jacopo@maxplanck.edu.it', 'VIA ALBERA 7/3', 'ZERO BRANCO', 'TV', NULL),
(198, 'SILVIA', 'MARCHESIN', NULL, '', '', '', 'marchesin.st.silvia@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'marchesin.st.silvia@maxplanck.edu.it', 'Via Roma, 22', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(199, 'DAVIDE', 'MARCON', NULL, '', '', '', 'marcon.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'marcon.st.davide@maxplanck.edu.it', 'via Bosco,43/A', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(200, 'DARIO', 'MARTINELLI', NULL, '', '', '', 'martinelli.st.dario@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'martinelli.st.dario@maxplanck.edu.it', 'via Fam.Alberghetti n 08', 'TREVISO', 'TV', NULL),
(201, 'LUCA', 'MASANEO', NULL, '', '', '', 'masaneo.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'masaneo.st.luca@maxplanck.edu.it', 'Via Trevisana 48 Varago', 'MASERADA SUL PIAVE', 'TV', NULL),
(202, 'LEO', 'MATIA', NULL, '', '', '', 'matia.st.leo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'matia.st.leo@maxplanck.edu.it', 'VIA TREFORNI 76', 'PAESE', 'TV', NULL),
(203, 'MARCO', 'MATTEI', NULL, '', '', '', 'mattei.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31058', '', 'mattei.st.marco@maxplanck.edu.it', 'VIA I MAGGIO 18 B', 'SUSEGANA', 'TV', NULL),
(204, 'MARCO', 'MATTIUZ', NULL, '', '', '', 'mattiuz.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'mattiuz.st.marco@maxplanck.edu.it', 'Via Ca\' Polverin 24', 'CASALE SUL SILE', 'TV', NULL),
(205, 'GIACOMO', 'MATTIUZZO', NULL, '', '', '', 'mattiuzzo.st.giacomo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'mattiuzzo.st.giacomo@maxplanck.edu.it', 'VIA PIO VI N.3B LOVADINA', 'SPRESIANO', 'TV', NULL),
(206, 'MATTEO', 'MAZZARO', NULL, '', '', '', 'mazzaro.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'mazzaro.st.matteo@maxplanck.edu.it', 'Guidini, 27', 'ZERO BRANCO', 'TV', NULL),
(207, 'NATALY CHRIS', 'MEDINA ARIAS', NULL, '', '', '', 'medinaarias.st.natalychris@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'medinaarias.st.natalychris@maxplanck.edu.it', 'VIA PIAVESELLA  4', 'VILLORBA', 'TV', NULL),
(208, 'SIMONE', 'MEGGIATO', NULL, '', '', '', 'meggiato.st.simone@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'meggiato.st.simone@maxplanck.edu.it', 'via poli 12/2', 'CASALE SUL SILE', 'TV', NULL),
(209, 'EMMANUEL', 'MELONI', NULL, '', '', '', 'meloni.st.emmanuel@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'meloni.st.emmanuel@maxplanck.edu.it', 'Via Madonna delle Vittorie 6/1', 'MASERADA SUL PIAVE', 'TV', NULL),
(210, 'LUCA', 'MENEGHETTI', NULL, '', '', '', 'meneghetti.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'meneghetti.st.luca@maxplanck.edu.it', 'Via C. Battisti, 15', 'SPRESIANO', 'TV', NULL),
(211, 'ALESSANDRO', 'MIATELLO', NULL, '', '', '', 'miatello.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'miatello.st.alessandro@maxplanck.edu.it', 'Via G. Marconi 101 B', 'MORGANO', 'TV', NULL),
(212, 'MATTEO', 'MICHIELETTO', NULL, '', '', '', 'michieletto.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'michieletto.st.matteo@maxplanck.edu.it', 'VIA MARTIRI DI CEFALONIA 4/3', 'PREGANZIOL', 'TV', NULL),
(213, 'LEONARDO', 'MIGLIORANZA', NULL, '', '', '', 'miglioranza.st.leonardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'miglioranza.st.leonardo@maxplanck.edu.it', 'via pietro sola 38/a', 'ZERO BRANCO', 'TV', NULL),
(214, 'NICOLA', 'MIGLIORANZA', NULL, '', '', '', 'miglioranza.st.nicola@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'miglioranza.st.nicola@maxplanck.edu.it', 'VICOLO CANIZZANO 9', 'TREVISO', 'TV', NULL),
(215, 'MATTEO', 'MODOLO', NULL, '', '', '', 'modolo.st.matteo1@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'modolo.st.matteo1@maxplanck.edu.it', 'Vicolo San Giuseppe, 9', 'SPRESIANO', 'TV', NULL),
(216, 'VALENTINO', 'MORAO', NULL, '', '', '', 'morao.st.valentino@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'morao.st.valentino@maxplanck.edu.it', 'Via Fratelli Bianchin 38/A', 'PAESE', 'TV', NULL),
(217, 'MICHELE', 'MURGIA', NULL, '', '', '', 'murgia.st.michele@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'murgia.st.michele@maxplanck.edu.it', 'Viale Giovanni XXIII     N16', 'CASIER', 'TV', NULL),
(218, 'FRANCESCO', 'NARDER', NULL, '', '', '', 'narder.st.francesco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31046', '', 'narder.st.francesco@maxplanck.edu.it', 'ANZANEL 3', 'ODERZO', 'TV', NULL),
(219, 'MATTIA', 'NASATO', NULL, '', '', '', 'nasato.st.mattia@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'nasato.st.mattia@maxplanck.edu.it', 'via Masetto 5A', 'PONZANO', 'TV', NULL),
(220, 'TOMMASO', 'NOCCHI', NULL, '', '', '', 'nocchi.st.tommaso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31057', '', 'nocchi.st.tommaso@maxplanck.edu.it', 'via Tiepolo 77', 'SILEA', 'TV', NULL),
(221, 'CAMILLA', 'OLIVOTTO', NULL, '', '', '', 'olivotto.st.camilla@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'olivotto.st.camilla@maxplanck.edu.it', 'Via Arche, 1', 'SPRESIANO', 'TV', NULL),
(222, 'ALESSANDRO', 'ONORATO', NULL, '', '', '', 'onorato.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'onorato.st.alessandro@maxplanck.edu.it', 'via Mameli, 10', 'PREGANZIOL', 'TV', NULL),
(223, 'JOEL', 'OSMANI', NULL, '', '', '', 'osmani.st.joel@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'osmani.st.joel@maxplanck.edu.it', 'Via San Michele 85', 'CASALE SUL SILE', 'TV', NULL),
(224, 'FILIPPO', 'PAGURA', NULL, '', '', '', 'pagura.st.filippo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'pagura.st.filippo@maxplanck.edu.it', 'Via Molino Soligon 7/A', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(225, 'MATTEO', 'PANIGHEL', NULL, '', '', '', 'panighel.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'panighel.st.matteo@maxplanck.edu.it', 'VIA FORLANI 42', 'CASALE SUL SILE', 'TV', NULL),
(226, 'FILIPPO', 'PAROVEL', NULL, '', '', '', 'parovel.st.filippo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'parovel.st.filippo@maxplanck.edu.it', 'PIAZZA DELLE ISTITUZIONI, 22', 'TREVISO', 'TV', NULL),
(227, 'DAVIDE', 'PAVAN', NULL, '', '', '', 'pavan.st.davide1@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'pavan.st.davide1@maxplanck.edu.it', 'VIA MOLIN CAPPELLO, 16/A', 'MORGANO', 'TV', NULL),
(228, 'JACOPO', 'PAVAN', NULL, '', '', '', 'pavan.st.jacopo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'pavan.st.jacopo@maxplanck.edu.it', 'via Don Giovanni Minzoni 27', 'CASALE SUL SILE', 'TV', NULL),
(229, 'MATTIA', 'PAVAN', NULL, '', '', '', 'pavan.st.mattia@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'pavan.st.mattia@maxplanck.edu.it', 'via A.Manzoni, 3/2', 'ZERO BRANCO', 'TV', NULL),
(230, 'RICCARDO', 'PAVAN', NULL, '', '', '', 'pavan.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'pavan.st.riccardo@maxplanck.edu.it', 'Via Demetrio Rossi, 54/B', 'MASERADA SUL PIAVE', 'TV', NULL),
(231, 'SEBASTIANO', 'PAVAN', NULL, '', '', '', 'pavan.st.sebastiano@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'pavan.st.sebastiano@maxplanck.edu.it', 'ALESSANDRINI 6', 'TREVISO', 'TV', NULL),
(232, 'TOMMASO', 'PAVANELLO', NULL, '', '', '', 'pavanello.st.tommaso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'pavanello.st.tommaso@maxplanck.edu.it', 'Via Boffi 1', 'QUINTO DI TREVISO', 'TV', NULL),
(233, 'CRISTIAN', 'PEPAJ', NULL, '', '', '', 'pepaj.st.cristian@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'pepaj.st.cristian@maxplanck.edu.it', 'VIA DON MINZONI,5', 'QUINTO DI TREVISO', 'TV', NULL),
(234, 'THOMAS', 'PESCE', NULL, '', '', '', 'pesce.st.thomas@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'pesce.st.thomas@maxplanck.edu.it', 'via bertoneria 30/m', 'ZERO BRANCO', 'TV', NULL),
(235, 'ENRICO', 'PETRILLO', NULL, '', '', '', 'petrillo.st.enrico@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31021', '', 'petrillo.st.enrico@maxplanck.edu.it', 'Via Carlo Pisacane 26a', 'MOGLIANO VENETO', 'TV', NULL),
(236, 'SEBASTIANO', 'PIOVESAN', NULL, '', '', '', 'piovesan.st.sebastiano@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'piovesan.st.sebastiano@maxplanck.edu.it', 'P. DE COUBERTIN 7', 'TREVISO', 'TV', NULL),
(237, 'ANDREA', 'PIVETTA', NULL, '', '', '', 'pivetta.st.andrea@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '33077', '', 'pivetta.st.andrea@maxplanck.edu.it', 'STRADA VISTORTA 11', 'SACILE', 'PN', NULL),
(238, 'FILIPPO', 'POLO DAMBROSIO', NULL, '', '', '', 'polodambrosio.st.filippo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '', '', 'polodambrosio.st.filippo@maxplanck.edu.it', 'Togliatti, 5', 'MOGLIANO VENETO', 'TV', NULL),
(239, 'GIOVANNI', 'QUACCHIA', NULL, '', '', '', 'quacchia.st.giovanni@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'quacchia.st.giovanni@maxplanck.edu.it', 'Via A. Gramsci n. 14', 'PAESE', 'TV', NULL),
(240, 'RICCARDO', 'RISATO', NULL, '', '', '', 'risato.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31048', '', 'risato.st.riccardo@maxplanck.edu.it', 'Via Dante, 11 ,Spercenigo', 'SAN BIAGIO DI CALLALTA', 'TV', NULL),
(241, 'FRANCESCO', 'ROMANO', NULL, '', '', '', 'romano.st.francesco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31053', '', 'romano.st.francesco@maxplanck.edu.it', 'Via Del Piantaletto, 16', 'PIEVE DI SOLIGO', 'TV', NULL),
(242, 'LUCA', 'RONCHIN', NULL, '', '', '', 'ronchin.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'ronchin.st.luca@maxplanck.edu.it', 'VICOLO POLI 64', 'CASALE SUL SILE', 'TV', NULL),
(243, 'HICHAM', 'SADKI', NULL, '', '', '', 'sadki.st.hicham@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'sadki.st.hicham@maxplanck.edu.it', 'viale francia 26', 'TREVISO', 'TV', NULL),
(244, 'ALESSANDRO', 'SALAMONE', NULL, '', '', '', 'salamone.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31056', '', 'salamone.st.alessandro@maxplanck.edu.it', 'Via Morosini 37', 'RONCADE', 'TV', NULL),
(245, 'ALESSANDRO', 'SANNA', NULL, '', '', '', 'sanna.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31015', '', 'sanna.st.alessandro@maxplanck.edu.it', 'VIA ARNALDO PIUTTI, 13', 'CONEGLIANO', 'TV', NULL),
(246, 'DAVIDE', 'SCHIAVONE', NULL, '', '', '', 'schiavone.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'schiavone.st.davide@maxplanck.edu.it', 'VIA DELLE MUNEGHE, 4/V', 'TREVISO', 'TV', NULL),
(247, 'LEONARDO', 'SERAFIN', NULL, '', '', '', 'serafin.st.leonardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31013', '', 'serafin.st.leonardo@maxplanck.edu.it', 'via cavour, 60', 'CODOGNE\'', 'TV', NULL),
(248, 'DAVIDE', 'SEVERIN', NULL, '', '', '', 'severin.st.davide@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'severin.st.davide@maxplanck.edu.it', 'Via B. Rossato 7/A', 'PAESE', 'TV', NULL),
(249, 'SHEFIK', 'SHERA', NULL, '', '', '', 'shera.st.shefik@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'shera.st.shefik@maxplanck.edu.it', 'Via Marche 2/3', 'BREDA DI PIAVE', 'TV', NULL),
(250, 'FRANCESCO', 'SIMIONATO', NULL, '', '', '', 'simionato.st.francesco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'simionato.st.francesco@maxplanck.edu.it', 'VIA FIANDRE 2', 'PREGANZIOL', 'TV', NULL),
(251, 'MATTEO EMANUELE', 'SOLDAN', NULL, '', '', '', 'soldan.st.matteoemanuele@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'soldan.st.matteoemanuele@maxplanck.edu.it', 'VIA ARTIGLIERIA ALPINA, 17', 'ZERO BRANCO', 'TV', NULL),
(252, 'ELIA', 'SOLIMAN', NULL, '', '', '', 'soliman.st.elia@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'soliman.st.elia@maxplanck.edu.it', 'VIA DANTE, 41A', 'VILLORBA', 'TV', NULL),
(253, 'LUCA', 'SONG', NULL, '', '', '', 'song.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'song.st.luca@maxplanck.edu.it', 'VIA GIOSUE\' CARDUCCI 1A', 'SPRESIANO', 'TV', NULL),
(254, 'MOUHAMADOU MOUSTAPHA', 'SOW', NULL, '', '', '', 'sow.st.mouhamadou@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'sow.st.mouhamadou@maxplanck.edu.it', 'Via Granze 11/B', 'NERVESA DELLA BATTAGLIA', 'TV', NULL),
(255, 'LORENZO', 'SPERANDIO', NULL, '', '', '', 'sperandio.st.lorenzo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31052', '', 'sperandio.st.lorenzo@maxplanck.edu.it', 'VIALE CACCIANIGA 66', 'MASERADA SUL PIAVE', 'TV', NULL),
(256, 'ROBERTO ANTONIO', 'SPINA', NULL, '', '', '', 'spina.st.robertoantonio@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'spina.st.robertoantonio@maxplanck.edu.it', 'Via Luisello 1/B', 'PREGANZIOL', 'TV', NULL),
(257, 'LUCA', 'STEFANI', NULL, '', '', '', 'stefani.st.luca@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31057', '', 'stefani.st.luca@maxplanck.edu.it', 'VIA POZZETTO, 39', 'SILEA', 'TV', NULL),
(258, 'ZE YANG', 'SUN ', NULL, '', '', '', 'sun.st.zeyang@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'sun.st.zeyang@maxplanck.edu.it', 'LIBIA 15/B', 'TREVISO', 'TV', NULL),
(259, 'ENRICO', 'TEMPESTIN', NULL, '', '', '', 'tempestin.st.enrico@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31047', '', 'tempestin.st.enrico@maxplanck.edu.it', 'via Calderba 40', 'PONTE DI PIAVE', 'TV', NULL),
(260, 'MATTEO', 'TOFFOLETTO', NULL, '', '', '', 'toffoletto.st.matteo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'toffoletto.st.matteo@maxplanck.edu.it', 'via granze 16 a', 'NERVESA DELLA BATTAGLIA', 'TV', NULL),
(261, 'ALBERTO', 'TONETTO', NULL, '', '', '', 'tonetto.st.alberto@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31022', '', 'tonetto.st.alberto@maxplanck.edu.it', 'VIA UMBERTO NOBILE N.11', 'PREGANZIOL', 'TV', NULL),
(262, 'VLADYSLAV', 'TSYMBALENKO', NULL, '', '', '', 'tsymbalenko.st.vladyslav@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'tsymbalenko.st.vladyslav@maxplanck.edu.it', 'vicolo ROMA 4E', 'ARCADE', 'TV', NULL),
(263, 'LINDA', 'ULIANA', NULL, '', '', '', 'uliana.st.linda@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31021', '', 'uliana.st.linda@maxplanck.edu.it', 'VIA RONZINELLA, 208', 'MOGLIANO VENETO', 'TV', NULL),
(264, 'RUBEN', 'VERDI', NULL, '', '', '', 'verdi.st.ruben@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '38054', '', 'verdi.st.ruben@maxplanck.edu.it', 'Via Caspeda,27', 'PRIMIERO SAN MARTINO DI CASTROZZA', 'TN', NULL),
(265, 'GIACOMO', 'VERGARI', NULL, '', '', '', 'vergari.st.giacomo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'vergari.st.giacomo@maxplanck.edu.it', 'Via Grande di Mignagola 114/a', 'CARBONERA', 'TV', NULL),
(266, 'ALEX', 'VERONESE', NULL, '', '', '', 'veronese.st.alex@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'veronese.st.alex@maxplanck.edu.it', 'Dell\'Artigliere, 1A/4', 'ARCADE', 'TV', NULL),
(267, 'RICCARDO', 'VERRI', NULL, '', '', '', 'verri.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31055', '', 'verri.st.riccardo@maxplanck.edu.it', 'VIA ZAGARIA 16', 'QUINTO DI TREVISO', 'TV', NULL),
(268, 'MARCO', 'VIOLA', NULL, '', '', '', 'viola.st.marco@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31018', '', 'viola.st.marco@maxplanck.edu.it', 'VIA G. MAZZINI, 14', 'GAIARINE', 'TV', NULL),
(269, 'LORENZO', 'VITAGLIANO', NULL, '', '', '', 'vitagliano.st.lorenzo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31010', '', 'vitagliano.st.lorenzo@maxplanck.edu.it', 'Via Conti Agosti 24/C', 'MARENO DI PIAVE', 'TV', NULL),
(270, 'TIZIANO', 'VOLPATO', NULL, '', '', '', 'volpato.st.tiziano@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'volpato.st.tiziano@maxplanck.edu.it', 'Via S.Schiavon 32', 'ZERO BRANCO', 'TV', NULL),
(271, 'LEONARDO', 'ZAGO', NULL, '', '', '', 'zago.st.leonardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'zago.st.leonardo@maxplanck.edu.it', 'VIA MARMOLADA 18/3', 'POVEGLIANO', 'TV', NULL),
(272, 'RADOSLAW JAKUB', 'ZAK', NULL, '', '', '', 'zak.st.radoslawjakub@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'zak.st.radoslawjakub@maxplanck.edu.it', 'Via Tommaso Salsa, 38', 'TREVISO', 'TV', NULL),
(273, 'MATTEO', 'ZAMBON', NULL, '', '', '', 'zambon.st.matteo2@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'zambon.st.matteo2@maxplanck.edu.it', 'VIA VICINALE MARCHE 7/A PERO', 'BREDA DI PIAVE', 'TV', NULL),
(274, 'ENRICO', 'ZAMPOLLI', NULL, '', '', '', 'zampolli.st.enrico@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31015', '', 'zampolli.st.enrico@maxplanck.edu.it', 'Via Papa Giovanni XXIII 39', 'CONEGLIANO', 'TV', NULL),
(275, 'RICCARDO', 'ZAMUNER', NULL, '', '', '', 'zamuner.st.riccardo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31059', '', 'zamuner.st.riccardo@maxplanck.edu.it', 'via binati  28', 'ZERO BRANCO', 'TV', NULL),
(276, 'ALEX', 'ZANATTA', NULL, '', '', '', 'zanatta.st.alex@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31040', '', 'zanatta.st.alex@maxplanck.edu.it', 'via G. Toniolo 16', 'GIAVERA DEL MONTELLO', 'TV', NULL),
(277, 'RICCARDO', 'ZANATTA', NULL, '', '', '', 'zanatta.st.riccardo1@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31027', '', 'zanatta.st.riccardo1@maxplanck.edu.it', 'VIA IRTI ISAIA 16 C/2', 'SPRESIANO', 'TV', NULL),
(278, 'TOMMASO', 'ZANATTA_', NULL, '', '', '', 'zanatta.st.tommaso1@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'zanatta.st.tommaso1@maxplanck.edu.it', 'VIA PIAVE, 23', 'PAESE', 'TV', NULL),
(279, 'TOMMASO', 'ZANATTA', NULL, '', '', '', 'zanatta.st.tommaso2@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31038', '', 'zanatta.st.tommaso2@maxplanck.edu.it', 'VIA PIAVE, 16', 'PAESE', 'TV', NULL),
(280, 'IACOPO', 'ZANDALI', NULL, '', '', '', 'zandali.st.iacopo@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31021', '', 'zandali.st.iacopo@maxplanck.edu.it', 'VIA OLME 43/B', 'MOGLIANO VENETO', 'TV', NULL),
(281, 'TOMMASO', 'ZANETTE', NULL, '', '', '', 'zanette.st.tommaso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31030', '', 'zanette.st.tommaso@maxplanck.edu.it', 'via grande di S.Giacomo n82', 'CARBONERA', 'TV', NULL),
(282, 'ALEX', 'ZANETTIN', NULL, '', '', '', 'zanettin.st.alex@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31032', '', 'zanettin.st.alex@maxplanck.edu.it', 'VIA ISONZO , N 34', 'CASALE SUL SILE', 'TV', NULL),
(283, 'ALESSANDRO', 'ZANINI', NULL, '', '', '', 'zanini.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31050', '', 'zanini.st.alessandro@maxplanck.edu.it', 'VIA BOMBEN  7/A', 'MORGANO', 'TV', NULL),
(284, 'TOMMASO', 'ZAVARISE', NULL, '', '', '', 'zavarise.st.tommaso@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'zavarise.st.tommaso@maxplanck.edu.it', 'VIA S. ANTONINO 263/A', 'TREVISO', 'TV', NULL),
(285, 'AYOUB', 'ZOUGGAGH', NULL, '', '', '', 'zouggagh.st.ayoub@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31100', '', 'zouggagh.st.ayoub@maxplanck.edu.it', 'Strada per castagnole n.40', 'TREVISO', 'TV', NULL),
(286, 'ALESSANDRO', 'ZUCCARELLO', NULL, '', '', '', 'zuccarello.st.alessandro@maxplanck.edu.it', '5f4dcc3b5aa765d61d8327deb882cf99', '', '', '31020', '', 'zuccarello.st.alessandro@maxplanck.edu.it', 'VIA G. MARCONI 261/A', 'VILLORBA', 'TV', NULL),
(290, 'Salvatore', 'Pace', '1999-12-12', 'sazxa', 'm', '234', NULL, NULL, NULL, NULL, '', '', '', '', 'crotone', NULL, NULL),
(291, 'Luca', 'Sommavilla', '2005-05-24', 'smmlcu05e24c111d', 'M', '3921187606', NULL, NULL, NULL, NULL, '', '', 'lucasomma7@gmail.com', '', 'Treviso', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `persona_ruolo`
--

CREATE TABLE `persona_ruolo` (
  `idruolo` int NOT NULL,
  `idpersona` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `persona_ruolo`
--

INSERT INTO `persona_ruolo` (`idruolo`, `idpersona`) VALUES
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(2, 0),
(2, 13),
(2, 290),
(3, 4),
(3, 242),
(3, 291);

-- --------------------------------------------------------

--
-- Struttura della tabella `ruolo`
--

CREATE TABLE `ruolo` (
  `id` int NOT NULL,
  `dsruolo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `ruolo`
--

INSERT INTO `ruolo` (`id`, `dsruolo`) VALUES
(1, 'dirigente'),
(2, 'docente'),
(3, 'alunno'),
(4, 'Segretario'),
(5, 'Tutor aziendale');

-- --------------------------------------------------------

--
-- Struttura della tabella `tutor_azienda`
--

CREATE TABLE `tutor_azienda` (
  `id_persona` int NOT NULL,
  `id_azienda` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struttura per vista `attestato`
--
DROP TABLE IF EXISTS `attestato`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `attestato`  AS SELECT `al`.`nome` AS `nome_al`, `al`.`cognome` AS `cognome_al`, `al`.`datanascita` AS `data_nascita`, `al`.`codicefiscale` AS `cod_fiscale_al`, `al`.`cellulare` AS `telefono_al`, `al`.`email` AS `mail_al`, `al`.`cap` AS `cap_res_al`, `al`.`indirizzo` AS `indirizzo_res_al`, `al`.`residenza` AS `residenza_al`, `cl`.`sezione` AS `sezione`, `cl`.`anno` AS `anno`, `az`.`denominazione_azienda` AS `nome_az`, `az`.`indirizzo` AS `indirizzo_az`, `az`.`cap` AS `cap_az`, `az`.`comune` AS `comune_az`, `az`.`leg_via` AS `leg_indirizzo_az`, `az`.`leg_comune` AS `leg_comune_az`, `az`.`rapleg_codicefiscale` AS `codice_fiscale_az`, `az`.`referente_aziendale` AS `nome_cognome_ta`, `az`.`telefono` AS `telefono_az`, `az`.`email` AS `mail_az`, `az`.`rapleg_convenzionedata` AS `data_conv`, `az`.`rapleg_convenzioneprotocolo` AS `conv_protocollo`, `az`.`inizioam` AS `inizio_mattina`, `az`.`fineam` AS `fine_mattina`, `az`.`iniziopm` AS `inizio_pomeriggio`, `az`.`finepm` AS `fine_pomeriggio`, `a`.`data_inizio` AS `data_inizio`, `a`.`data_fine` AS `data_fine`, `ts`.`nome` AS `nome_ts`, `ts`.`cognome` AS `cognome_ts`, `ts`.`cellulare` AS `telefono_ts`, `ts`.`email` AS `mail_ts`, `ta`.`nome` AS `nome_ta`, `ta`.`cognome` AS `cognome_ta`, `ta`.`cellulare` AS `telefono_ta`, `ta`.`email` AS `mail_ta`, `a`.`id` AS `id_assegnazione` FROM ((((((`assegnazione` `a` join `persona` `al` on((`a`.`id_alunno` = `al`.`id`))) join `classe_studente` `cs` on((`a`.`id_alunno` = `cs`.`idpersona`))) join `classe` `cl` on((`cs`.`idclasse` = `cl`.`id`))) join `azienda` `az` on((`az`.`id` = `a`.`id_azienda`))) join `persona` `ts` on((`ts`.`id` = `a`.`id_docente_tutor`))) join `persona` `ta` on((`ta`.`id` = `a`.`id_azienda_tutor`))) ;

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
  ADD KEY `id_docente` (`id_docente`);

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
  ADD PRIMARY KEY (`idclasse`,`idpersona`),
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
-- Indici per le tabelle `periodo_stage`
--
ALTER TABLE `periodo_stage`
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
-- Indici per le tabelle `tutor_azienda`
--
ALTER TABLE `tutor_azienda`
  ADD PRIMARY KEY (`id_persona`,`id_azienda`),
  ADD KEY `tutor_azienda_ibfk_1` (`id_azienda`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `assegnazione`
--
ALTER TABLE `assegnazione`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `classe`
--
ALTER TABLE `classe`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `periodo_stage`
--
ALTER TABLE `periodo_stage`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=293;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
