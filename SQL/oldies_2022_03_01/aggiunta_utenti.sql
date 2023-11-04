ALTER TABLE `persona` CHANGE `tut_idazienda` `tut_idazienda` INT(11) NULL;


INSERT INTO `persona` (`nome`, `cognome`, `datanascita`, `codicefiscale`, `sesso`, `cellulare`, `login`, `password`, `al_matricola`, `al_cittadinanza`, `cap`, `telefono`, `email`, `indirizzo`, `residenza`, `tut_idazienda`) VALUES
('andrea', 'cestaro', '2002-09-21', '', 'm', '', 'cestaro.andrea', 'password', '', '', '', '', '', '', '', NULL),
('nicholas', 'darisi', '2022-02-17', '', 'm', '', 'darisi.nicholas', 'password', '', '', '', '', '', '', '', NULL),
('ruize', 'lin', '2022-02-14', '', 'm', '', 'lin.ruize', 'password', '', '', '', '', '', '', '', NULL),
('davide', 'marin', '2022-02-17', '', 'm', '', 'marin.davide', 'password', '', '', '', '', '', '', '', NULL),
('francesco', 'mariotto', '2022-02-21', '', 'm', '', 'mariotto.francesco', 'password', '', '', '', '', '', '', '', NULL),
('francesco', 'marsura', '2022-02-14', '', 'm', '', 'marsura.francesco', 'password', '', '', '', '', '', '', '', NULL),
('matteo', 'pretto', '2022-02-01', '', 'm', '', 'pretto.matteo', 'password', '', '', '', '', '', '', '', NULL),
('manuele', 'saccon', '2022-02-10', '', 'm', '', 'saccon.manuele', 'password', '', '', '', '', '', '', '', NULL),
('alessio', 'sartoretto', '2022-02-05', '', 'm', '', 'sartoretto.alessio', 'password', '', '', '', '', '', '', '', NULL),
('fabio ', 'biscaro', '1822-02-02', '', 'm', '', 'biscaro.fabio', 'password', '', '', '', '', '', '', '', NULL),
('roberto', 'olivotto', '1823-02-08', '', 'm', '', 'olivotto.roberto', 'password', '', '', '', '', '', '', '', NULL);

UPDATE persona set `password` = md5("password")

