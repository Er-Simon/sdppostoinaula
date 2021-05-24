-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Mag 24, 2021 alle 15:19
-- Versione del server: 10.3.16-MariaDB
-- Versione PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id16360004_sdppia`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `assegnazioni`
--

CREATE TABLE `assegnazioni` (
  `aula` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `edificio` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `insegnamento` int(11) NOT NULL,
  `giorno` enum('Lunedì','Martedì','Mercoledì','Giovedì','Venerdì') COLLATE utf8_unicode_ci NOT NULL,
  `oraInizio` enum('8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00') COLLATE utf8_unicode_ci NOT NULL,
  `oraFine` enum('9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `assegnazioni`
--

INSERT INTO `assegnazioni` (`aula`, `edificio`, `insegnamento`, `giorno`, `oraInizio`, `oraFine`) VALUES
('I', 'CU002', 101133, 'Lunedì', '8:00', '10:00'),
('P2', 'CU037', 1015883, 'Lunedì', '8:00', '9:00'),
('P2', 'CU037', 1015883, 'Giovedì', '16:00', '19:00'),
('V', 'CU002', 101226, 'Martedì', '10:00', '13:00'),
('V', 'CU002', 101226, 'Venerdì', '14:00', '16:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `aule`
--

CREATE TABLE `aule` (
  `denominazione` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `ubicazione` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `numeroDiPostiPerFila` tinyint(4) NOT NULL,
  `numeroDiFile` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `aule`
--

INSERT INTO `aule` (`denominazione`, `ubicazione`, `numeroDiPostiPerFila`, `numeroDiFile`) VALUES
('I', 'CU002', 9, 27),
('P2', 'CU037', 8, 24),
('V', 'CU002', 10, 15);

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

CREATE TABLE `corsi` (
  `codice` int(11) NOT NULL,
  `denominazione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facoltà` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tipologia` enum('triennale','magistrale') COLLATE utf8_unicode_ci NOT NULL,
  `lingua` enum('italiano','inglese') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`codice`, `denominazione`, `facoltà`, `tipologia`, `lingua`) VALUES
(29923, 'Informatica', 'Ingegneria dell\'informazione, informatica e statistica', 'triennale', 'italiano'),
(29931, 'Ingegneria Informatica e Automatica', 'Ingegneria dell\'informazione, informatica e statistica', 'triennale', 'italiano');

-- --------------------------------------------------------

--
-- Struttura della tabella `edifici`
--

CREATE TABLE `edifici` (
  `codice` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `indirizzo` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `edifici`
--

INSERT INTO `edifici` (`codice`, `indirizzo`) VALUES
('CU002', 'Piazzale Aldo Moro, 5'),
('CU037', 'Piazzale Aldo Moro, 5');

-- --------------------------------------------------------

--
-- Struttura della tabella `insegnamenti`
--

CREATE TABLE `insegnamenti` (
  `codice` int(11) NOT NULL,
  `denominazione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `docente` int(11) NOT NULL,
  `corso` int(11) NOT NULL,
  `semestre` enum('primo','secondo') COLLATE utf8_unicode_ci NOT NULL,
  `lingua` enum('italiano','inglese') COLLATE utf8_unicode_ci NOT NULL,
  `cfu` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `insegnamenti`
--

INSERT INTO `insegnamenti` (`codice`, `denominazione`, `docente`, `corso`, `semestre`, `lingua`, `cfu`) VALUES
(101133, 'FONDAMENTI DI INFORMATICA I', 637823, 29931, 'secondo', 'italiano', 9),
(101226, 'CALCOLO DIFFERENZIALE', 785634, 29923, 'secondo', 'italiano', 6),
(1015883, 'FONDAMENTI DI PROGRAMMAZIONE ', 637823, 29923, 'secondo', 'italiano', 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `persone`
--

CREATE TABLE `persone` (
  `matricola` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cognome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `codiceFiscale` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `corsoDiStudi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `persone`
--

INSERT INTO `persone` (`matricola`, `nome`, `cognome`, `codiceFiscale`, `corsoDiStudi`) VALUES
(637823, 'Andea', 'Stella', 'ADESEL87M11H501U', NULL),
(785634, 'Lorenzo', 'Rossi', 'RSILRN73M03H501U', 29923),
(1345644, 'Riccardo', 'Zagarolo', 'ZGRRCR96D03M141D', 29931),
(1845772, 'Simone', 'Ruberto', 'RBRSMN99M16H501U', 29923),
(1860601, 'Riccardo', 'Ruberto', 'RBRCR98D04H501E', 29923),
(1860609, 'Riccardo', 'Ruberto', 'RBRCR98D04H501R', 29931);

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni`
--

CREATE TABLE `prenotazioni` (
  `id` int(11) NOT NULL,
  `aula` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `edificio` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `giorno` enum('Lunedì','Martedì','Mercoledì','Giovedì','Venerdì') COLLATE utf8_unicode_ci NOT NULL,
  `oraInizio` enum('8:00','9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00') COLLATE utf8_unicode_ci NOT NULL,
  `oraFine` enum('9:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00') COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL,
  `posto` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `insegnamento` int(11) NOT NULL,
  `studente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `prenotazioni`
--

INSERT INTO `prenotazioni` (`id`, `aula`, `edificio`, `giorno`, `oraInizio`, `oraFine`, `data`, `posto`, `insegnamento`, `studente`) VALUES
(25, 'I', 'CU002', 'Lunedì', '8:00', '10:00', '2021-04-05', '15.1', 101133, 1845772),
(28, 'P2', 'CU037', 'Lunedì', '8:00', '9:00', '2021-04-05', '11.5', 1015883, 1845772),
(34, 'V', 'CU002', 'Martedì', '10:00', '13:00', '2021-04-06', '9.5', 101226, 1345644),
(45, 'P2', 'CU037', 'Lunedì', '8:00', '9:00', '2021-04-12', '13.1', 1015883, 1845772),
(50, 'V', 'CU002', 'Martedì', '10:00', '13:00', '2021-04-06', '8.4', 101226, 1845772),
(56, 'I', 'CU002', 'Lunedì', '8:00', '10:00', '2021-04-12', '19.1', 101133, 1845772),
(57, 'P2', 'CU037', 'Giovedì', '16:00', '19:00', '2021-04-08', '15.1', 1015883, 1345644),
(59, 'V', 'CU002', 'Martedì', '10:00', '13:00', '2021-04-13', '9.1', 101226, 1345644),
(60, 'V', 'CU002', 'Venerdì', '14:00', '16:00', '2021-04-09', '9.1', 101226, 1345644),
(62, 'V', 'CU002', 'Venerdì', '14:00', '16:00', '2021-04-16', '9.1', 101226, 1845772),
(63, 'I', 'CU002', 'Lunedì', '8:00', '10:00', '2021-04-19', '14.2', 101133, 1845772),
(64, 'I', 'CU002', 'Lunedì', '8:00', '10:00', '2021-04-26', '13.1', 101133, 1345644),
(67, 'P2', 'CU037', 'Giovedì', '16:00', '19:00', '2021-05-20', '15.1', 1015883, 1345644),
(68, 'P2', 'CU037', 'Lunedì', '8:00', '9:00', '2021-05-24', '15.1', 1015883, 1345644),
(73, 'I', 'CU002', 'Lunedì', '8:00', '10:00', '2021-05-24', '7.9', 101133, 1345644),
(75, 'I', 'CU002', 'Lunedì', '8:00', '10:00', '2021-05-24', '18.2', 101133, 1860601),
(76, 'P2', 'CU037', 'Giovedì', '16:00', '19:00', '2021-05-27', '14.2', 1015883, 1345644);

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazioni_spazi_studio`
--

CREATE TABLE `prenotazioni_spazi_studio` (
  `id` int(11) NOT NULL,
  `spazio_studio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `persona` int(11) NOT NULL,
  `data` date NOT NULL,
  `ora` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `prenotazioni_spazi_studio`
--

INSERT INTO `prenotazioni_spazi_studio` (`id`, `spazio_studio`, `persona`, `data`, `ora`) VALUES
(1, 'Facoltà: GIURISPRUDENZA - SALA STUDIO Isola A Piano 3 -- CU002-L133A', 1345644, '2021-04-02', '8:00'),
(2, 'Facoltà: GIURISPRUDENZA - SALA STUDIO Isola A Piano 3 -- CU002-L133A', 1845772, '2021-04-05', '8:00'),
(24, 'Facoltà: LETTERE E FILOSOFIA - SALA STUDIO Isola A Piano Terra -- RM021-L028', 1845772, '2021-04-12', '10:00'),
(28, 'Facoltà: SCIENZE POLITICHE, SOCIOLOGIA, COMUNICAZIONE - SALA STUDIO Piano 2 -- CU002-L028', 1845772, '2021-04-09', '18:00'),
(30, 'Facoltà: LETTERE E FILOSOFIA - SALA STUDIO Isola A Piano Terra -- RM021-L028', 1845772, '2021-04-09', '19:00'),
(31, 'Facoltà: SCIENZE POLITICHE, SOCIOLOGIA, COMUNICAZIONE - SALA STUDIO Piano 2 -- CU002-L028', 1345644, '2021-04-08', '12:00'),
(32, 'Facoltà: SCIENZE POLITICHE, SOCIOLOGIA, COMUNICAZIONE - SALA STUDIO Piano 2 -- CU002-L028', 1345644, '2021-04-14', '9:00'),
(34, 'Facoltà: SCIENZE POLITICHE, SOCIOLOGIA, COMUNICAZIONE - SALA STUDIO Piano 2 -- CU002-L028', 1845772, '2021-04-21', '13:00'),
(35, 'Facoltà: LETTERE E FILOSOFIA - SALA STUDIO Isola A Piano Terra -- RM021-L028', 1845772, '2021-04-20', '9:00'),
(36, 'Facoltà: GIURISPRUDENZA - SALA STUDIO Isola A Piano 3 -- CU002-L133A', 1845772, '2021-04-23', '15:00'),
(38, 'Facoltà: GIURISPRUDENZA - SALA STUDIO Isola A Piano 3 -- CU002-L133A', 1345644, '2021-05-25', '11:00'),
(39, 'Facoltà: SCIENZE POLITICHE, SOCIOLOGIA, COMUNICAZIONE - SALA STUDIO Piano 2 -- CU002-L028', 1345644, '2021-05-25', '19:00'),
(44, 'Facoltà: LETTERE E FILOSOFIA - SALA STUDIO Isola A Piano Terra -- RM021-L028', 1845772, '2021-05-28', '16:00'),
(45, 'Facoltà: GIURISPRUDENZA - SALA STUDIO Isola A Piano 3 -- CU002-L133A', 1845772, '2021-05-27', '17:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `spazi_studio`
--

CREATE TABLE `spazi_studio` (
  `denominazione` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `capienza` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `spazi_studio`
--

INSERT INTO `spazi_studio` (`denominazione`, `capienza`) VALUES
('Facoltà: GIURISPRUDENZA - SALA STUDIO Isola A Piano 3 -- CU002-L133A', 10),
('Facoltà: LETTERE E FILOSOFIA - SALA STUDIO Isola A Piano Terra -- RM021-L028', 12),
('Facoltà: SCIENZE POLITICHE, SOCIOLOGIA, COMUNICAZIONE - SALA STUDIO Piano 2 -- CU002-L028', 20);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `matricola` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ruolo` enum('Studente','Docente') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`matricola`, `password`, `ruolo`) VALUES
(637823, '$2y$10$0/QH8dn8NRFzi4agKamDfu5bnjS6sx.IInPrhKKW.RGSGtsfFnUhK', 'Docente'),
(1345644, '$2y$10$WGzngXCF.QeRu9pg7XYkGeCuAH8WqvkGR33Lvo6OC.9ScUPcBWWTa', 'Studente'),
(1845772, '$2y$10$eWjj7dXvdzp01S4vk41qcu8rrzV4F5h.MGj3tAOWRN0OV4AAqyMs2', 'Studente'),
(1860601, '$2y$10$nem8uc0wuO8sa9zyO7A8V.pVoY5zi.ViAEal/rmXqtpPnwlsIC67K', 'Studente'),
(1860609, '', 'Docente');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `assegnazioni`
--
ALTER TABLE `assegnazioni`
  ADD PRIMARY KEY (`aula`,`edificio`,`giorno`,`oraInizio`),
  ADD KEY `insegnamento` (`insegnamento`);

--
-- Indici per le tabelle `aule`
--
ALTER TABLE `aule`
  ADD PRIMARY KEY (`denominazione`,`ubicazione`),
  ADD KEY `ubicazione` (`ubicazione`);

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `edifici`
--
ALTER TABLE `edifici`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `insegnamenti`
--
ALTER TABLE `insegnamenti`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `corso` (`corso`),
  ADD KEY `docente` (`docente`);

--
-- Indici per le tabelle `persone`
--
ALTER TABLE `persone`
  ADD PRIMARY KEY (`matricola`),
  ADD KEY `corsoDiStudi` (`corsoDiStudi`);

--
-- Indici per le tabelle `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `insegnamento` (`insegnamento`),
  ADD KEY `aula` (`aula`,`edificio`,`giorno`,`oraInizio`),
  ADD KEY `studente` (`studente`);

--
-- Indici per le tabelle `prenotazioni_spazi_studio`
--
ALTER TABLE `prenotazioni_spazi_studio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spazio_studio` (`spazio_studio`),
  ADD KEY `persona` (`persona`);

--
-- Indici per le tabelle `spazi_studio`
--
ALTER TABLE `spazi_studio`
  ADD PRIMARY KEY (`denominazione`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`matricola`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29932;

--
-- AUTO_INCREMENT per la tabella `insegnamenti`
--
ALTER TABLE `insegnamenti`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1015884;

--
-- AUTO_INCREMENT per la tabella `persone`
--
ALTER TABLE `persone`
  MODIFY `matricola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1860610;

--
-- AUTO_INCREMENT per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT per la tabella `prenotazioni_spazi_studio`
--
ALTER TABLE `prenotazioni_spazi_studio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `assegnazioni`
--
ALTER TABLE `assegnazioni`
  ADD CONSTRAINT `assegnazioni_ibfk_1` FOREIGN KEY (`insegnamento`) REFERENCES `insegnamenti` (`codice`),
  ADD CONSTRAINT `assegnazioni_ibfk_2` FOREIGN KEY (`aula`,`edificio`) REFERENCES `aule` (`denominazione`, `ubicazione`);

--
-- Limiti per la tabella `aule`
--
ALTER TABLE `aule`
  ADD CONSTRAINT `aule_ibfk_1` FOREIGN KEY (`ubicazione`) REFERENCES `edifici` (`codice`);

--
-- Limiti per la tabella `insegnamenti`
--
ALTER TABLE `insegnamenti`
  ADD CONSTRAINT `insegnamenti_ibfk_1` FOREIGN KEY (`corso`) REFERENCES `corsi` (`codice`),
  ADD CONSTRAINT `insegnamenti_ibfk_2` FOREIGN KEY (`docente`) REFERENCES `persone` (`matricola`);

--
-- Limiti per la tabella `persone`
--
ALTER TABLE `persone`
  ADD CONSTRAINT `persone_ibfk_1` FOREIGN KEY (`corsoDiStudi`) REFERENCES `corsi` (`codice`);

--
-- Limiti per la tabella `prenotazioni`
--
ALTER TABLE `prenotazioni`
  ADD CONSTRAINT `prenotazioni_ibfk_1` FOREIGN KEY (`insegnamento`) REFERENCES `insegnamenti` (`codice`),
  ADD CONSTRAINT `prenotazioni_ibfk_2` FOREIGN KEY (`aula`,`edificio`,`giorno`,`oraInizio`) REFERENCES `assegnazioni` (`aula`, `edificio`, `giorno`, `oraInizio`),
  ADD CONSTRAINT `prenotazioni_ibfk_3` FOREIGN KEY (`studente`) REFERENCES `persone` (`matricola`);

--
-- Limiti per la tabella `prenotazioni_spazi_studio`
--
ALTER TABLE `prenotazioni_spazi_studio`
  ADD CONSTRAINT `prenotazioni_spazi_studio_ibfk_1` FOREIGN KEY (`spazio_studio`) REFERENCES `spazi_studio` (`denominazione`),
  ADD CONSTRAINT `prenotazioni_spazi_studio_ibfk_2` FOREIGN KEY (`persona`) REFERENCES `persone` (`matricola`);

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`matricola`) REFERENCES `persone` (`matricola`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
