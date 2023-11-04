ALTER TABLE `persona` CHANGE `tut_idazienda` `tut_idazienda` INT(11) NULL;


INSERT INTO `persona` (`id`, `nome`, `cognome`, `datanascita`, `codicefiscale`, `sesso`, `cellulare`, `login`, `password`, `al_matricola`, `al_cittadinanza`, `cap`, `telefono`, `email`, `indirizzo`, `residenza`, `tut_idazienda`) VALUES
(4, 'andrea', 'cestaro', '2002-09-21', '', '', '', 'cestaro.andrea', 'password', '', '', '', '', '', '', '', NULL),
(5, 'nicholas', 'darisi', '2022-02-17', '', 'm', '', 'darisi.nicholas', 'password', '', '', '', '', '', '', '', NULL),
(6, 'ruize', 'lin', '2022-02-14', '', 'm', '', 'lin.ruize', 'password', '', '', '', '', '', '', '', NULL),
(7, 'davide', 'marin', '2022-02-17', '', 'm', '', 'marin.davide', 'password', '', '', '', '', '', '', '', NULL),
(8, 'francesco', 'mariotto', '2022-02-21', '', 'm', '', 'mariotto.francesco', 'password', '', '', '', '', '', '', '', NULL),
(9, 'francesco', 'marsura', '2022-02-14', '', '', '', 'marsura.francesco', 'password', '', '', '', '', '', '', '', NULL),
(10, 'matteo', 'pretto', '2022-02-01', '', 'm', '', 'pretto.matteo', 'password', '', '', '', '', '', '', '', NULL),
(11, 'manuele', 'saccon', '2022-02-10', '', 'm', '', 'saccon.manuele', 'password', '', '', '', '', '', '', '', NULL),
(12, 'alessio', 'sartoretto', '2022-02-05', '', 'm', '', 'sartoretto.alessio', 'password', '', '', '', '', '', '', '', NULL),
(13, 'fabio ', 'biscaro', '1822-02-02', '', 'm', '', 'biscaro.fabio', 'password', '', '', '', '', '', '', '', NULL),
(14, 'roberto', 'olivotto', '1823-02-08', '', 'm', '', 'olivotto.roberto', 'password', '', '', '', '', '', '', '', NULL);

UPDATE persona set `password` = md5("password")

