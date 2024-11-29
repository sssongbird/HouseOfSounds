-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Nov 2024 um 15:47
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `houseofsounds`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `abteilung`
--

CREATE TABLE `abteilung` (
  `Abteilung_ID` int(2) NOT NULL,
  `Beschreibung` text NOT NULL,
  `Aufgaben` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `abteilung`
--

INSERT INTO `abteilung` (`Abteilung_ID`, `Beschreibung`, `Aufgaben`) VALUES
(1, 'Lagerist', 'Waren annehmen, lagern, überwachen'),
(2, 'Verkäufer', 'Kunden beraten und verkaufen'),
(3, 'Berater', 'Kundenanfragen bearbeiten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `Bestellung_ID` int(11) NOT NULL,
  `Kunden_ID` int(11) NOT NULL,
  `Zahlungsart_ID` int(11) NOT NULL,
  `Produkt_ID` int(11) NOT NULL,
  `Anzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`Bestellung_ID`, `Kunden_ID`, `Zahlungsart_ID`, `Produkt_ID`, `Anzahl`) VALUES
(127, 5, 12, 3, 2),
(128, 7, 8, 5, 1),
(129, 3, 15, 2, 4),
(130, 11, 20, 1, 3),
(131, 9, 4, 7, 2),
(132, 1, 25, 8, 1),
(133, 12, 3, 6, 3),
(134, 14, 10, 4, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firmenrechnung`
--

CREATE TABLE `firmenrechnung` (
  `Firmenrechnungen_ID` int(11) NOT NULL,
  `Nachbestellung_ID` int(11) NOT NULL,
  `Zahlungsart_ID` int(11) NOT NULL,
  `Mitarbeiter_ID` int(3) NOT NULL,
  `Datum_der_Rechnung` date NOT NULL,
  `Reklame` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `firmenrechnung`
--

INSERT INTO `firmenrechnung` (`Firmenrechnungen_ID`, `Nachbestellung_ID`, `Zahlungsart_ID`, `Mitarbeiter_ID`, `Datum_der_Rechnung`, `Reklame`) VALUES
(13, 4, 4, 3, '2024-08-28', 'Nein'),
(14, 5, 6, 1, '2024-09-01', 'Ja'),
(15, 6, 8, 4, '2024-08-22', 'Nein'),
(18, 9, 1, 4, '2024-09-18', 'Ja');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hersteller`
--

CREATE TABLE `hersteller` (
  `Hersteller_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Straße` varchar(50) NOT NULL,
  `Hausnummer` varchar(4) DEFAULT NULL,
  `PLZ_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `hersteller`
--

INSERT INTO `hersteller` (`Hersteller_ID`, `Name`, `Straße`, `Hausnummer`, `PLZ_ID`) VALUES
(1, 'Yamaha', 'Beethovenstraße', '45', 20),
(2, 'Fender', 'Am Wasserturm', '23', 2),
(3, 'Roland', 'Rosenstraße', '9', 23),
(4, 'Gibson', 'Königstraße', '72', 39),
(5, 'Korg', 'Seestraße', '18', 27),
(6, 'Ibanez', 'Friedrichstraße', '37', 32),
(7, 'Casio', 'Hafenstraße', '88', 21),
(8, 'Pearl', 'Marktgasse', '7', 31),
(9, 'DW Drums', 'Alte Bahnhofstraße', '19', 16),
(10, 'Martin', 'Goetheplatz', '10', 3),
(11, 'Canton', 'Bergstraße', '58', 16),
(12, 'Denon', 'Hauptstraße', '12', 15),
(13, 'JBL', 'Friedrich-Ebert-Straße', '5', 22),
(14, 'Magnat', 'Steinweg', '25', 17),
(15, 'Onkyo', 'Alte Gasse', '30', 28),
(16, 'Pioneer', 'Zeil', '48', 25),
(17, 'Sony', 'Landsberger Straße', '76', 4),
(18, 'Bang & Olufsen', 'Promenadenstraße', '2', 10),
(19, 'Blaupunkt', 'Am Wall', '60', 28),
(20, 'Bose', 'Lindenallee', '5', 40),
(21, 'Creative', 'Nordstraße', '22', 32),
(22, 'Elac', 'Gartenstraße', '15', 8),
(23, 'Harman Kardon', 'Hochstraße', '47', 21),
(24, 'Teufel', 'Berliner Straße', '55', 8),
(25, 'Klipsch', 'Kaiserstraße', '14', 13),
(26, 'Lenco', 'Mozartstraße', '6', 3),
(27, 'Audio-Technica', 'Augustinerstraße', '9', 6),
(28, 'Logitech', 'Marktplatz', '4', 19),
(29, 'Fresh \'n Rebel', 'Bergstraße', '20', 17),
(30, 'Beats', 'Zirkusstraße', '32', 34),
(31, 'Chord', 'Rheinstraße', '70', 2),
(32, 'RME', 'Bahnhofstraße', '16', 7),
(33, 'Steinberg', 'Bismarckstraße', '11', 16),
(34, 'RODE', 'Erbprinzenstraße', '13', 31),
(35, 'Quad', 'Marktstraße', '42', 18),
(36, 'Teac', 'Blumenstraße', '28', 19),
(37, 'Marshall', 'Schillerstraße', '29', 15),
(38, 'RCA Records', 'Theaterplatz', '3', 33),
(39, 'Warner Records', 'Prinzenstraße', '21', 20),
(40, 'Four Music', 'Urbanstraße', '42', 1),
(41, 'Selbstverlag', 'Breitscheidstraße', '42', 16);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `instrumentart`
--

CREATE TABLE `instrumentart` (
  `Instrumentart_ID` int(11) NOT NULL,
  `Art` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `instrumentart`
--

INSERT INTO `instrumentart` (`Instrumentart_ID`, `Art`) VALUES
(1, 'E-Gitarre'),
(2, 'Akustikgitarre'),
(3, 'Bassgitarre'),
(4, 'Schlagzeug'),
(5, 'Keyboard'),
(6, 'Synthesizer'),
(7, 'E-Piano'),
(8, 'Mikrofon'),
(9, 'Saxophon'),
(10, 'Ukulele'),
(11, 'Mandoline'),
(12, 'Percussion'),
(13, 'Banjo'),
(14, 'Cajón'),
(15, 'MIDI-Controller');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `instrumente`
--

CREATE TABLE `instrumente` (
  `Instrumente_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Beschreibung` text NOT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Hersteller_ID` int(11) NOT NULL,
  `Produkte_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `instrumente`
--

INSERT INTO `instrumente` (`Instrumente_ID`, `Name`, `Beschreibung`, `Preis`, `Hersteller_ID`, `Produkte_ID`) VALUES
(1, 'Acoustic Guitar', 'Standard-Akustikgitarre', 399.00, 1, 45),
(2, 'Electric Guitar', 'Hochwertige E-Gitarre', 699.00, 2, 46),
(3, 'Digital Piano', '88 Tasten, hammermechanisch', 1200.00, 3, 47),
(4, 'Drum Set', 'Komplettes Schlagzeug', 800.00, 8, 48),
(5, 'Synthesizer', 'Analog-Synthesizer', 600.00, 5, 49),
(6, 'Bass Guitar', '4-saitiger Bass', 450.00, 4, 50),
(7, 'Keyboard', 'Kompaktes Keyboard mit 61 Tasten', 300.00, 6, 51),
(8, 'Violin', 'Hochwertige Geige', 500.00, 10, 52),
(9, 'Saxophone', 'Altsaxophon für Profis', 1100.00, 7, 53),
(10, 'Trumpet', 'Standard Trompete', 700.00, 12, 54),
(11, 'Flute', 'Klassische Querflöte', 200.00, 9, 55),
(12, 'Cello', 'Cello mit warmem Klang', 1500.00, 11, 56),
(13, 'Marimba', 'Konzertmarimba', 2500.00, 8, 57),
(14, 'Harmonium', 'Tragbares Harmonium', 350.00, 1, 58),
(15, 'Double Bass', 'Klassischer Kontrabass', 900.00, 10, 59),
(16, 'Electric Violin', 'Moderne E-Geige', 750.00, 2, 60),
(17, 'Oboe', 'Handgefertigte Oboe', 800.00, 5, 61),
(18, 'Harp', 'Konzertharfe', 3000.00, 4, 62),
(19, 'Recorder', 'Sopran-Blockflöte', 50.00, 3, 63),
(20, 'Banjo', '5-saitiges Banjo', 400.00, 7, 64),
(21, 'Ukulele', 'Standard-Ukulele', 100.00, 6, 65),
(22, 'Cajón', 'Percussion-Kiste', 120.00, 9, 66),
(23, 'Mandolin', 'Klassische Mandoline', 550.00, 2, 67),
(24, 'Bagpipe', 'Schottischer Dudelsack', 800.00, 12, 68),
(25, 'Clarinet', 'Klassische Klarinette', 450.00, 3, 69),
(26, 'Bongos', 'Bongo-Paar mit warmem Klang', 250.00, 8, 70),
(27, 'Timpani', 'Professionelles Pauken-Set', 1500.00, 5, 71),
(28, 'Harmonica', 'Mundharmonika in C-Dur', 30.00, 11, 72),
(29, 'Synth Pad', 'Digitaler Synthesizer mit Pads', 700.00, 1, 73),
(30, 'Electric Drum Kit', 'Elektronisches Schlagzeug für Einsteiger', 1200.00, 4, 74);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kabel_details`
--

CREATE TABLE `kabel_details` (
  `Kabel_ID` int(11) NOT NULL,
  `Kabeltyp` varchar(50) NOT NULL,
  `Kabellänge` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kabel_details`
--

INSERT INTO `kabel_details` (`Kabel_ID`, `Kabeltyp`, `Kabellänge`) VALUES
(1, 'Gitarrenkabel', '3m'),
(2, 'Gitarrenkabel', '5m'),
(3, 'XLR-Kabel', '10m'),
(4, 'Klinkenkabel 6.3mm', '1.5m'),
(5, 'Klinkenkabel 3.5mm', '1m'),
(6, 'Mikrofonkabel', '8m'),
(7, 'Patchkabel', '0.5m'),
(8, 'Instrumentenkabel', '6m'),
(9, 'Lautsprecherkabel', '15m'),
(10, 'MIDI-Kabel', '2m');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--

CREATE TABLE `kunden` (
  `Kunden_ID` int(11) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `Straße` varchar(75) NOT NULL,
  `Hausnummer` text NOT NULL,
  `PLZ_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kunden`
--

INSERT INTO `kunden` (`Kunden_ID`, `Vorname`, `Nachname`, `Straße`, `Hausnummer`, `PLZ_ID`) VALUES
(1, 'Max', 'Mustermann', 'Hauptstrasse', '1', 3),
(2, 'Ana', 'Schmidt', 'Seitenweg', '13', 3),
(3, 'Peter', 'Meier', 'Parkstra?e', '22', 3),
(4, 'Laura ', 'Schneider', 'Fliederweg', '3', 3),
(5, 'Tom', 'Timon', 'Teichstrasse', '3', 7),
(6, 'Julia', 'Hanse', 'Blumenweg', '1', 2),
(7, 'David', 'Endgegner', 'Am Berg', '16', 6),
(8, 'Lena', 'Lana', 'Lindenstrasse', '7', 3),
(9, 'Paul', 'Wagner', 'Poststrasse', '4', 5),
(10, 'Emma', 'Rammbock', 'Schillerstrasse', '65', 4),
(11, 'Johann', 'Svensen', 'Kichstrasse', '113', 3),
(12, 'Sophie', 'Lehmann', 'Heidestrasse', '2', 2),
(13, 'Tim', 'Igel', 'Muehlenweg', '7', 6),
(14, 'Mia', 'Habicht', 'Alleeweg', '93', 5),
(17, 'Robobbert', 'Fröstlich', 'Honiger Weg', '420', 1),
(18, 'BeispielBeispiel', 'NachnameBeispiel', 'Beispielstraße', '10', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kundenrechnungen`
--

CREATE TABLE `kundenrechnungen` (
  `Kundenrechnungen_ID` int(11) NOT NULL,
  `Warenkorb_ID` int(11) NOT NULL,
  `Kunden_ID` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Zahlungsart_ID` int(11) NOT NULL,
  `Reklame` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kundenrechnungen`
--

INSERT INTO `kundenrechnungen` (`Kundenrechnungen_ID`, `Warenkorb_ID`, `Kunden_ID`, `Datum`, `Zahlungsart_ID`, `Reklame`) VALUES
(8, 1, 5, '2024-08-15', 3, 'Ja'),
(9, 2, 7, '2024-09-01', 5, 'Nein'),
(10, 3, 3, '2024-10-10', 2, 'Ja'),
(11, 4, 11, '2024-10-20', 1, 'Nein'),
(12, 5, 9, '2024-08-30', 7, 'Ja'),
(13, 6, 1, '2024-09-25', 8, 'Ja'),
(14, 7, 12, '2024-08-28', 6, 'Nein');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `künstler`
--

CREATE TABLE `künstler` (
  `Künstler_ID` int(11) NOT NULL,
  `Beschreibung` varchar(200) DEFAULT NULL,
  `Genre` varchar(200) NOT NULL,
  `künstlername` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `künstler`
--

INSERT INTO `künstler` (`Künstler_ID`, `Beschreibung`, `Genre`, `künstlername`) VALUES
(1, 'Künstler', 'Darkpop', 'Ari Abdul'),
(2, 'Künstler', 'Pop', 'Dua Lipa'),
(3, 'Künstler', 'Pop', 'Paula Hartmann'),
(4, 'Künstler', 'Hip-Hop', '01099');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lager`
--

CREATE TABLE `lager` (
  `Lager_ID` varchar(10) NOT NULL,
  `Anzahl_Produkte_im_Lager` int(11) NOT NULL,
  `Standort_ID` int(2) NOT NULL,
  `Produkt_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `lager`
--

INSERT INTO `lager` (`Lager_ID`, `Anzahl_Produkte_im_Lager`, `Standort_ID`, `Produkt_ID`) VALUES
('BA01', 11, 1, 31),
('BA02', 7, 1, 32),
('BA03', 5, 1, 33),
('BA04', 21, 1, 34),
('BA05', 6, 1, 35),
('BA06', 3, 1, 36),
('BA07', 3, 1, 37),
('BA08', 7, 1, 38),
('BA09', 9, 1, 39),
('BA10', 10, 1, 40),
('BB01', 18, 1, 1),
('BB02', 23, 1, 2),
('BB03', 14, 1, 3),
('BB04', 31, 1, 4),
('BB05', 27, 1, 5),
('BB06', 16, 1, 6),
('BB07', 22, 1, 7),
('BB08', 19, 1, 8),
('BB09', 25, 1, 9),
('BB10', 20, 1, 10),
('BC01', 28, 1, 11),
('BC02', 33, 1, 12),
('BC03', 17, 1, 13),
('BC04', 24, 1, 14),
('BC05', 29, 1, 15),
('BC06', 21, 1, 16),
('BC07', 26, 1, 17),
('BC08', 30, 1, 18),
('BC09', 15, 1, 19),
('BC10', 22, 1, 20),
('BD01', 19, 1, 21),
('BD02', 27, 1, 22),
('BD03', 31, 1, 23),
('BD04', 16, 1, 24),
('BD05', 24, 1, 25),
('BD06', 28, 1, 26),
('BD07', 20, 1, 27),
('BD08', 25, 1, 28),
('BD09', 32, 1, 29),
('BD10', 18, 1, 30),
('DA01', 25, 2, 41),
('DA02', 35, 2, 42),
('DA03', 12, 2, 43),
('DA04', 8, 2, 44),
('DA05', 65, 2, 45),
('DA06', 15, 2, 46),
('DA07', 4, 2, 47),
('DA08', 3, 2, 48),
('DA09', 3, 2, 49),
('DA10', 10, 2, 50);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mitarbeiter`
--

CREATE TABLE `mitarbeiter` (
  `Mitarbeiter_ID` int(3) NOT NULL,
  `Vorname` varchar(50) NOT NULL,
  `Nachname` varchar(50) NOT NULL,
  `Urlaubstage` int(2) NOT NULL,
  `Gehalt` float NOT NULL,
  `Krankheitstage` int(3) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `Wochenstunden` int(3) NOT NULL,
  `Eintrittsdatum` date NOT NULL,
  `Straße` varchar(75) NOT NULL,
  `Hausnummer` varchar(5) NOT NULL,
  `Abteilung_ID` int(2) NOT NULL,
  `PLZ_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `mitarbeiter`
--

INSERT INTO `mitarbeiter` (`Mitarbeiter_ID`, `Vorname`, `Nachname`, `Urlaubstage`, `Gehalt`, `Krankheitstage`, `Geburtsdatum`, `Wochenstunden`, `Eintrittsdatum`, `Straße`, `Hausnummer`, `Abteilung_ID`, `PLZ_ID`) VALUES
(1, 'Maximlian', 'Matzke', 50, 8700, 0, '2008-03-07', 20, '2008-04-12', 'Malochenstraße', '24/7', 1, 10),
(2, 'Luis', 'Rennert', 30, 3500, 0, '2006-11-22', 38, '2019-03-15', 'Bahnhofstraße', '5', 2, 20),
(3, 'Robert', 'Frost', 37, 1, 0, '1988-12-30', 40, '2021-06-01', 'Gartenweg', '8', 3, 30),
(4, 'Ricardo', 'Tschirch', 30, 4200, 3, '1992-03-10', 40, '2018-05-20', 'Wiesenweg', '15', 1, 25),
(5, 'Justin', 'Mildner', 30, 3200, 0, '2006-11-22', 38, '2020-09-01', 'Feldstraße', '3', 2, 35),
(6, 'Elias', 'Mücklich', 30, 2800, 0, '1995-07-18', 40, '2021-02-15', 'Birkenweg', '7', 3, 40);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nachbestellung`
--

CREATE TABLE `nachbestellung` (
  `Nachbestellung_ID` int(11) NOT NULL,
  `Standort_ID` int(2) NOT NULL,
  `Produkte_ID` int(5) NOT NULL,
  `Anzahl_Produkte` int(11) NOT NULL,
  `Zulieferer_ID` int(2) NOT NULL,
  `Gesamtpreis` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `nachbestellung`
--

INSERT INTO `nachbestellung` (`Nachbestellung_ID`, `Standort_ID`, `Produkte_ID`, `Anzahl_Produkte`, `Zulieferer_ID`, `Gesamtpreis`) VALUES
(4, 1, 3, 150, 3, 2499.99),
(5, 2, 4, 50, 4, 749.99),
(6, 1, 5, 200, 5, 1999.99),
(9, 2, 3, 175, 2, 2899.99);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `plz`
--

CREATE TABLE `plz` (
  `PLZ_ID` int(11) NOT NULL,
  `PLZ` varchar(10) NOT NULL,
  `ORT` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `plz`
--

INSERT INTO `plz` (`PLZ_ID`, `PLZ`, `ORT`) VALUES
(1, '45127', 'Essen'),
(2, '02625', 'Bautzen'),
(3, '01067', 'Dresden'),
(4, '39104', 'Magdeburg'),
(5, '02826', 'Görlitz'),
(6, '10115', 'Berlin'),
(7, '80331', 'München'),
(8, '50667', 'Köln'),
(9, '60311', 'Frankfurt am Main'),
(10, '70173', 'Stuttgart'),
(11, '40210', 'Düsseldorf'),
(12, '04103', 'Leipzig'),
(13, '44135', 'Dortmund'),
(14, '28195', 'Bremen'),
(15, '22083', 'Hamburg'),
(16, '48143', 'Münster'),
(17, '52062', 'Aachen'),
(18, '76131', 'Karlsruhe'),
(19, '86150', 'Augsburg'),
(20, '97070', 'Würzburg'),
(21, '14467', 'Potsdam'),
(22, '18055', 'Rostock'),
(23, '99084', 'Erfurt'),
(24, '56068', 'Koblenz'),
(25, '47051', 'Mönchengladbach'),
(26, '47051', 'Gelsenkirchen'),
(27, '26121', 'Oldenburg'),
(28, '28203', 'Bielefeld'),
(29, '33602', 'Bielefeld'),
(30, '47051', 'Hagen'),
(31, '47051', 'Halle (Saale)'),
(32, '47051', 'Lübeck'),
(33, '47051', 'Mannheim'),
(34, '47051', 'Duisburg'),
(35, '47051', 'Wuppertal'),
(36, '47051', 'Bochum'),
(37, '47051', 'Bonn'),
(38, '47051', 'Darmstadt'),
(39, '47051', 'Regensburg'),
(40, '47051', 'Heidelberg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkte`
--

CREATE TABLE `produkte` (
  `Produkte_ID` int(11) NOT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Rabatt_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `produkte`
--

INSERT INTO `produkte` (`Produkte_ID`, `Preis`, `Rabatt_ID`) VALUES
(3, 20.00, NULL),
(4, 10.00, NULL),
(5, 5.00, 5),
(6, 20.00, 6),
(7, 100.00, 7),
(8, 30.00, 8),
(9, 50.00, 9),
(10, 10.00, 10),
(11, 20.00, 1),
(12, 15.50, NULL),
(13, 10.00, 3),
(14, 7.00, 3),
(15, 20.00, 5),
(16, 8.00, NULL),
(17, 5.00, NULL),
(18, 12.00, NULL),
(19, 80.00, 1),
(20, 77.99, 8),
(21, 35.30, 7),
(22, 81.00, NULL),
(23, 42.00, 9),
(24, 12.99, 9),
(25, 111.00, NULL),
(26, 63.78, 1),
(27, 19.89, 3),
(28, 142.00, 2),
(29, 23.58, NULL),
(30, 74.55, NULL),
(31, 100.00, NULL),
(32, 125.54, NULL),
(33, 81.18, NULL),
(34, 15.55, NULL),
(35, 55.00, 5),
(36, 20.00, 6),
(37, 100.00, 7),
(38, 250.00, 8),
(39, 75.56, 9),
(40, 99.99, 10),
(41, 28.75, 1),
(42, 15.50, NULL),
(43, 18.41, 3),
(44, 87.25, 3),
(45, 20.00, 5),
(46, 41.00, NULL),
(47, 52.20, NULL),
(48, 12.70, NULL),
(49, 30.71, 1),
(50, 52.99, 8),
(51, 38.20, 7),
(52, 76.25, NULL),
(53, 45.00, 9),
(54, 15.99, 9),
(55, 101.00, NULL),
(56, 63.78, 1),
(57, 19.89, 3),
(58, 142.00, 2),
(59, 23.58, NULL),
(60, 74.55, NULL),
(61, 249.99, 3),
(62, 29.50, NULL),
(63, 199.99, 7),
(64, 19.99, 1),
(65, 299.00, 4),
(66, 25.99, NULL),
(67, 289.99, 2),
(68, 15.50, 9),
(69, 199.99, NULL),
(70, 249.99, 5),
(71, 35.99, 8),
(72, 179.99, NULL),
(73, 22.50, 6),
(74, 229.99, 3),
(75, 259.99, NULL),
(76, 27.99, 10),
(77, 149.99, 4),
(78, 19.99, NULL),
(79, 239.99, 7),
(80, 24.50, 2),
(81, 289.99, NULL),
(82, 279.99, 5),
(83, 29.50, 8),
(84, 129.99, NULL),
(85, 17.99, 1),
(86, 279.99, 6),
(87, 22.50, NULL),
(88, 259.99, 9),
(89, 35.99, 3),
(90, 219.99, NULL),
(91, 25.50, 7),
(92, 269.99, 4),
(93, 19.99, NULL),
(94, 179.50, 10),
(95, 299.99, 2),
(96, 24.99, NULL),
(97, 279.99, 5),
(98, 29.50, 8),
(99, 32.99, NULL),
(100, 169.99, 6),
(101, 47.56, 4),
(102, 25.77, 8),
(103, 89.99, 2),
(104, 50.00, 7),
(105, 65.44, 1),
(106, 35.70, 1),
(107, 45.00, 3),
(108, 20.00, NULL),
(109, 9.90, 2),
(110, 85.88, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rabatt`
--

CREATE TABLE `rabatt` (
  `Rabatt_ID` int(11) NOT NULL,
  `Rabattcode` varchar(50) NOT NULL,
  `Hoehe_Rabatt` decimal(5,2) NOT NULL,
  `Dauer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `rabatt`
--

INSERT INTO `rabatt` (`Rabatt_ID`, `Rabattcode`, `Hoehe_Rabatt`, `Dauer`) VALUES
(1, 'WINTER2024', 10.00, 30),
(2, 'SPRINGSALE', 15.50, 45),
(3, 'SUMMERFUN', 20.00, 60),
(4, 'AUTUMN2024', 25.00, 30),
(5, 'NEWCUSTOMER', 5.00, 10),
(6, 'HOLIDAY20', 20.00, 15),
(7, 'FREESHIP', 0.00, 90),
(8, 'VIP30', 30.00, 365),
(9, 'FLASH50', 50.00, 1),
(10, 'BIRTHDAY15', 15.00, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `soundsystemart`
--

CREATE TABLE `soundsystemart` (
  `Soundsystemart_ID` int(11) NOT NULL,
  `Art` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `soundsystemart`
--

INSERT INTO `soundsystemart` (`Soundsystemart_ID`, `Art`) VALUES
(1, 'Hifi-Receiver'),
(2, 'Sorroundsysteme'),
(3, 'Lautsprecher'),
(4, 'Subwoofer'),
(5, 'Plattenspieler'),
(6, 'Headsets'),
(7, 'DAC'),
(8, 'Audio Interface'),
(9, 'CD-Player'),
(10, 'Tape-Deck'),
(11, 'Gitarrenverstärker');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `soundsysteme`
--

CREATE TABLE `soundsysteme` (
  `Soundsysteme_ID` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Hersteller_ID` int(11) NOT NULL,
  `Geräteart` varchar(30) NOT NULL,
  `Produkte_ID` int(11) DEFAULT NULL,
  `Beschreibung` varchar(255) DEFAULT NULL,
  `Soundsystemart_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `soundsysteme`
--

INSERT INTO `soundsysteme` (`Soundsysteme_ID`, `Name`, `Preis`, `Hersteller_ID`, `Geräteart`, `Produkte_ID`, `Beschreibung`, `Soundsystemart_ID`) VALUES
(3, 'JBL MA710', 999.00, 13, '', 3, 'Receiver von JBL', 1),
(4, 'Magnat MR 750', 419.00, 14, '', 4, 'Receiver von Magnat', 1),
(5, 'Onkyo TX-8270', 697.00, 15, '', 5, 'Receiver von Onkyo ist beste', 1),
(6, 'Pioneer VSX-835', 397.00, 16, '', 6, 'Receiver von Pioneer', 1),
(7, 'Sony TA-AN1000', 773.90, 17, '', 7, 'Receiver von Sony', 1),
(8, 'Yamaha RX-V6A', 549.00, 1, '', 8, 'Receiver von Yamaha', 1),
(9, 'Bang & Olufsen Beosound Stage', 1589.00, 18, '', 9, 'Soundbar von B&B', 2),
(10, 'Blaupunkt LS 1825', 79.99, 19, '', 10, 'Soundbar von Blaupunkt', 2),
(11, 'Bose Smart Soundbar 600', 414.29, 20, '', 11, 'Soundbar von Bose', 2),
(12, 'Creative SXFI Carrier', 749.49, 21, '', 12, 'Soundbar von Creative', 2),
(13, 'Elac Cinema 5', 399.00, 22, '', 13, 'Lautsprecherset von Elac', 2),
(14, 'Harmon Kardon Citation', 599.00, 23, '', 14, 'Surroundsound von H/K', 2),
(15, 'Teufel Ultima 40', 699.99, 24, '', 15, 'Surroundsound von Teufel', 2),
(16, 'Bose 251', 479.95, 20, '', 16, 'Lautsprecherpaar von Bose', 3),
(17, 'Elac Debut 2', 199.00, 22, '', 17, 'Lautsprecherpaar von Elac', 3),
(18, 'Klipsch RP-500M II', 398.00, 25, '', 18, 'Lautsprecherpaar von Klipsch', 3),
(19, 'Yamaha NS-SW050', 148.00, 1, '', 19, 'Sub von Yamaha', 4),
(20, 'Harman Kardon Citation Sub S', 239.95, 23, '', 20, 'Sub von H/K', 4),
(21, 'Klipsch RP-1600SW', 1440.00, 25, '', 21, 'Sub von Klipsch', 4),
(22, 'JBL Stage 200P', 560.00, 13, '', 22, 'Sub von JBL', 4),
(23, 'Lenco TT-110', 63.49, 26, '', 23, 'Plattenspieler von Lenco', 5),
(24, 'Audio-Technica AT-LP60X', 129.00, 27, '', 24, 'Plattenspieler von Audio-Technica', 5),
(25, 'JBL Spinner TT350', 990.00, 13, '', 25, 'Plattenspieler von JBL', 5),
(26, 'Elac Miracord 90 Anniversary', 2440.00, 22, '', 26, 'Plattenspieler von Elac', 5),
(27, 'Creative Zen Hybrid 2', 30.24, 21, '', 27, 'Headset von Creative', 6),
(28, 'Logitech G733', 99.98, 28, '', 28, 'Wireless-Headset von Logitech', 6),
(29, 'Fresh \'n Rebel Calm Core Dream', 49.99, 29, '', 29, 'Wireless-Headset von FnR', 6),
(30, 'Beats Studio 3', 200.49, 30, '', 30, 'Wireless-Headset von Beats', 6),
(31, 'Bang & Olufsen BeoPlay Portal', 209.90, 18, '', 31, 'Wireless-Headset von B&O', 6),
(32, 'JBL Everest Elite 750NC', 299.00, 13, '', 32, 'Wireless-Headset von JBL', 6),
(33, 'Chord Mojo 2', 489.00, 31, '', 33, 'The Maracker Cracker', 7),
(34, 'Creative Sound Blaster X5', 299.99, 21, '', 34, 'Portabler DAC', 7),
(35, 'RME ADI-2 Pro FS R', 1545.00, 32, '', 35, 'Non-Portabler DAC', 7),
(36, 'Yamaha ZG01', 69.00, 1, '', 36, 'Interface von Yamaha', 8),
(37, 'Steinberg UR816C', 567.00, 33, '', 37, 'Rack-Interface von Steinberg', 8),
(38, 'RODE RODECASTER Video', 1190.00, 34, '', 38, 'Interface von RODE', 8),
(39, 'Pioneer PD-10AE', 258.00, 16, '', 39, 'CD-Player von Pioneer', 9),
(40, 'Yamaha CD-S603', 498.00, 1, '', 40, 'CD-Player von Yamaha', 9),
(41, 'Quad Artera Play', 1444.00, 35, '', 41, 'CD-Player von Quad', 9),
(42, 'Teac W-1200', 402.00, 36, '', 42, 'Tape-Deck von Teac', 10),
(43, 'Marshall MG101CFX', 420.01, 37, '', 43, 'Verstärker von Marshall', 11),
(44, 'Yamaha', 536.00, 1, '', 44, 'Verstärker von Yamaha', 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `standort`
--

CREATE TABLE `standort` (
  `Standort_ID` int(2) NOT NULL,
  `Standortname` varchar(50) NOT NULL,
  `PLZ_ID` int(5) NOT NULL,
  `Straße` varchar(75) NOT NULL,
  `Hausnummer` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `standort`
--

INSERT INTO `standort` (`Standort_ID`, `Standortname`, `PLZ_ID`, `Straße`, `Hausnummer`) VALUES
(1, 'House of Sounds Bautzen', 2, 'Am Stadtwall', '16a'),
(2, 'House of Sounds Dresden', 3, 'An der Zitadelle', '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tonträger`
--

CREATE TABLE `tonträger` (
  `Tonträger_ID` int(11) NOT NULL,
  `Album` varchar(100) NOT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Hersteller_ID` int(11) DEFAULT NULL,
  `Trägerart` varchar(30) NOT NULL,
  `Produkte_ID` int(11) DEFAULT NULL,
  `Beschreibung` varchar(255) DEFAULT NULL,
  `Künstler_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tonträger`
--

INSERT INTO `tonträger` (`Tonträger_ID`, `Album`, `Preis`, `Hersteller_ID`, `Trägerart`, `Produkte_ID`, `Beschreibung`, `Künstler_ID`) VALUES
(1, 'Fallen Angel', 20.00, 38, '1', 10, 'Album', 1),
(2, 'Future Nostalgia', 25.00, 39, '2', 18, 'Album', 2),
(3, 'Kleine Feuer', 22.00, 40, '1', 22, 'Album', 3),
(4, 'Blaue Stunden', 18.00, 41, '3', 8, 'Album', 4),
(5, 'CCTV', 20.00, 38, '2', 8, 'Album', 1),
(7, 'Nie Verliebt', 20.00, 40, '2', 25, 'Album', 3),
(8, 'Kinder der Nacht', 18.00, 41, '1', 5, 'Album', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tonträgerart`
--

CREATE TABLE `tonträgerart` (
  `Tonträgerart_ID` int(11) NOT NULL,
  `Tonträgerart` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tonträgerart`
--

INSERT INTO `tonträgerart` (`Tonträgerart_ID`, `Tonträgerart`) VALUES
(1, 'Vinyl'),
(2, 'CD'),
(3, 'Tape');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warenkorb`
--

CREATE TABLE `warenkorb` (
  `Warenkorb_ID` int(11) NOT NULL,
  `Bestellung_ID` int(11) NOT NULL,
  `Kundenrechnungen_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `warenkorb`
--

INSERT INTO `warenkorb` (`Warenkorb_ID`, `Bestellung_ID`, `Kundenrechnungen_ID`) VALUES
(1, 127, 127),
(2, 128, 128),
(3, 129, 129),
(4, 130, 130),
(5, 131, 131),
(6, 132, 132),
(7, 133, 133);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zahlungsart`
--

CREATE TABLE `zahlungsart` (
  `Zahlungsart_ID` int(11) NOT NULL,
  `Zahlungsmethode` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zahlungsart`
--

INSERT INTO `zahlungsart` (`Zahlungsart_ID`, `Zahlungsmethode`) VALUES
(1, 'PayPal'),
(2, 'ApplePay'),
(3, 'GooglePay'),
(4, 'Debitcard'),
(5, 'Kreditcard'),
(6, 'Bargeld'),
(7, 'Gutschein'),
(8, 'Sofortüberweisung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zubehör`
--

CREATE TABLE `zubehör` (
  `Zubehör_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Hersteller_ID` int(11) NOT NULL,
  `Produkte_ID` int(11) NOT NULL,
  `Beschreibung` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zubehör`
--

INSERT INTO `zubehör` (`Zubehör_ID`, `Name`, `Preis`, `Hersteller_ID`, `Produkte_ID`, `Beschreibung`) VALUES
(31, 'Guitar Amp Cable', 29.00, 2, 76, 'Gitarrenverstärkerkabel, Fender Performance Kabel'),
(32, 'Bass Amp Cable', 25.00, 6, 77, 'Robustes Kabel für Bassverstärker, Ibanez Deluxe Kabel'),
(33, 'Microphone Cable', 20.00, 34, 78, 'Profikabel für Bühnenmikrofone, RODE XLR Kabel'),
(34, 'Synth Patch Cable', 10.00, 1, 79, 'Patchkabel für Synthesizer, Yamaha Patch Kabel'),
(35, 'Speaker Cable', 40.00, 37, 80, 'Lautsprecherkabel, Marshall Lautsprecher Kabel'),
(36, 'Pro Instrument Cable', 35.00, 5, 81, 'Extra langes Instrumentenkabel, Korg Pro Instrumentenkabel'),
(37, 'MIDI Cable', 16.00, 3, 82, 'Verbindungskabel für MIDI-Geräte, Roland MIDI Kabel'),
(38, 'Audio Cable 6.3mm', 13.00, 13, 83, 'Klinkenkabel für Verstärker, JBL Klinkenkabel 6.3mm'),
(39, 'Audio Cable 3.5mm', 9.00, 17, 84, 'Klinkenkabel für Audio-Systeme, Sony Klinkenkabel 3.5mm'),
(40, 'Keyboard Charger', 15.00, 7, 85, 'Ladegerät für Casio Keyboards, Casio Ladekabel'),
(41, 'Electric Guitar Cable', 29.00, 2, 86, 'Kabel für E-Gitarre, Fender Performance Kabel'),
(42, 'Bass Guitar Cable', 25.00, 6, 87, 'Robustes Kabel für Bass, Ibanez Deluxe Kabel'),
(43, 'Studio Microphone Cable', 20.00, 34, 88, 'XLR-Kabel für Studiomikrofone, RODE XLR Kabel'),
(44, 'Effect Patch Cable', 10.00, 1, 89, 'Patchkabel für Effekte, Yamaha Patch Kabel'),
(45, 'Speaker Connection Cable', 40.00, 37, 90, 'Kabel für Lautsprecher, Marshall Lautsprecher Kabel'),
(46, 'Extended Instrument Cable', 35.00, 5, 91, 'Langes Kabel für Instrumente, Korg Pro Instrumentenkabel'),
(47, 'Professional MIDI Cable', 16.00, 3, 92, 'MIDI-Verbindung für Profis, Roland MIDI Kabel'),
(48, 'High-Quality Audio Cable 6.3mm', 13.00, 13, 93, 'Klinkenkabel für Soundverstärker, JBL Klinkenkabel 6.3mm'),
(49, 'Compact Audio Cable 3.5mm', 9.00, 17, 94, '3.5mm Kabel für Audio, Sony Klinkenkabel 3.5mm'),
(50, 'Casio Keyboard Charger', 15.00, 7, 95, 'Ladegerät für Casio Keyboards, Casio Ladekabel'),
(51, 'Stage Guitar Cable', 29.00, 2, 96, 'Gitarrenkabel für Bühne, Fender Performance Kabel'),
(52, 'Bass Stage Cable', 25.00, 6, 97, 'Robustes Kabel für Bühne, Ibanez Deluxe Kabel'),
(53, 'Broadcast Microphone Cable', 20.00, 34, 98, 'XLR-Kabel für Broadcast, RODE XLR Kabel'),
(54, 'Synthesizer Patch Cable', 10.00, 1, 99, 'Patchkabel für Synthesizer, Yamaha Patch Kabel'),
(55, 'Heavy Duty Speaker Cable', 40.00, 37, 100, 'Verstärktes Lautsprecherkabel, Marshall Lautsprecher Kabel');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zubehörart`
--

CREATE TABLE `zubehörart` (
  `Zubehörart_ID` int(11) NOT NULL,
  `Bezeichnung` varchar(100) DEFAULT NULL,
  `Beschreibung` varchar(100) NOT NULL,
  `Preis` decimal(10,2) NOT NULL,
  `Kabel_ID` int(11) NOT NULL,
  `Hersteller_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zubehörart`
--

INSERT INTO `zubehörart` (`Zubehörart_ID`, `Bezeichnung`, `Beschreibung`, `Preis`, `Kabel_ID`, `Hersteller_ID`) VALUES
(1, 'Fender Performance Kabel', 'Hochwertiges Gitarrenkabel für klaren Sound', 29.99, 1, 2),
(2, 'Ibanez Deluxe Kabel', 'Robustes Kabel für Gitarre und Bass', 24.99, 2, 6),
(3, 'RODE XLR Kabel', 'Profikabel für Studio- und Bühnenmikrofone', 19.99, 3, 34),
(4, 'Yamaha Patch Kabel', 'Kompaktes Patchkabel für Synthesizer und Effektgeräte', 9.99, 7, 1),
(5, 'Marshall Lautsprecher Kabel', 'Verstärktes Kabel für Lautsprecher', 39.99, 9, 37),
(6, 'Korg Pro Instrumentenkabel', 'Extra langes Kabel für Instrumente', 34.99, 8, 5),
(7, 'Roland MIDI Kabel', 'Verbindungskabel für MIDI-Geräte', 15.99, 10, 3),
(8, 'JBL Klinkenkabel 6.3mm', 'Für Soundverstärker und Instrumente', 12.99, 4, 13),
(9, 'Sony Klinkenkabel 3.5mm', 'Kompatibel mit Audio-Systemen', 8.99, 5, 17),
(10, 'Casio Ladekabel', 'Ladegerät für Casio Keyboards', 14.99, 9, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zulieferer`
--

CREATE TABLE `zulieferer` (
  `Zulieferer_ID` int(2) NOT NULL,
  `Standort_ID` int(2) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Versandart` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zulieferer`
--

INSERT INTO `zulieferer` (`Zulieferer_ID`, `Standort_ID`, `Name`, `Versandart`) VALUES
(1, 1, 'Schmidt Handels GmbH', 'Standardversand'),
(2, 1, 'Müller Logistik AG', 'Expressversand'),
(3, 1, 'GrüneWelt Versorgung', 'Overnight'),
(4, 2, 'Lagerhaus Direkt', 'Standardversand'),
(5, 2, 'SchnellTeile GmbH', 'Expressversand'),
(6, 2, 'ÖkoLogistik AG', 'Overnight');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `abteilung`
--
ALTER TABLE `abteilung`
  ADD PRIMARY KEY (`Abteilung_ID`);

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`Bestellung_ID`),
  ADD KEY `Kunde-Bestellung_ID` (`Kunden_ID`);

--
-- Indizes für die Tabelle `firmenrechnung`
--
ALTER TABLE `firmenrechnung`
  ADD PRIMARY KEY (`Firmenrechnungen_ID`),
  ADD KEY `Mitarbeiter-FR_ID` (`Mitarbeiter_ID`),
  ADD KEY `Nachbestellung-FR_ID` (`Nachbestellung_ID`),
  ADD KEY `Zahlungsart-FR_ID` (`Zahlungsart_ID`);

--
-- Indizes für die Tabelle `hersteller`
--
ALTER TABLE `hersteller`
  ADD PRIMARY KEY (`Hersteller_ID`),
  ADD KEY `fk_plz` (`PLZ_ID`);

--
-- Indizes für die Tabelle `instrumentart`
--
ALTER TABLE `instrumentart`
  ADD PRIMARY KEY (`Instrumentart_ID`);

--
-- Indizes für die Tabelle `instrumente`
--
ALTER TABLE `instrumente`
  ADD PRIMARY KEY (`Instrumente_ID`),
  ADD KEY `fk_hersteller_instrument` (`Hersteller_ID`),
  ADD KEY `fk_produkte_instrument` (`Produkte_ID`);

--
-- Indizes für die Tabelle `kabel_details`
--
ALTER TABLE `kabel_details`
  ADD PRIMARY KEY (`Kabel_ID`);

--
-- Indizes für die Tabelle `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`Kunden_ID`),
  ADD KEY `PLZ-Kunden_ID` (`PLZ_ID`);

--
-- Indizes für die Tabelle `kundenrechnungen`
--
ALTER TABLE `kundenrechnungen`
  ADD PRIMARY KEY (`Kundenrechnungen_ID`),
  ADD KEY `Kunden-KR_ID` (`Kunden_ID`),
  ADD KEY `Warenkorb-KR` (`Warenkorb_ID`),
  ADD KEY `Zahlungsart-KR` (`Zahlungsart_ID`);

--
-- Indizes für die Tabelle `künstler`
--
ALTER TABLE `künstler`
  ADD PRIMARY KEY (`Künstler_ID`);

--
-- Indizes für die Tabelle `lager`
--
ALTER TABLE `lager`
  ADD PRIMARY KEY (`Lager_ID`);

--
-- Indizes für die Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD PRIMARY KEY (`Mitarbeiter_ID`),
  ADD KEY `PLZ-Mitarbeiter_ID` (`PLZ_ID`),
  ADD KEY `Abteilung-Mitarbeiter_ID` (`Abteilung_ID`);

--
-- Indizes für die Tabelle `nachbestellung`
--
ALTER TABLE `nachbestellung`
  ADD PRIMARY KEY (`Nachbestellung_ID`),
  ADD KEY `Standort-Nachbestellung_ID` (`Standort_ID`),
  ADD KEY `Zulieferer-Nachbestellung_ID` (`Zulieferer_ID`),
  ADD KEY `Produkt-Nachbestellung_ID` (`Produkte_ID`);

--
-- Indizes für die Tabelle `plz`
--
ALTER TABLE `plz`
  ADD PRIMARY KEY (`PLZ_ID`);

--
-- Indizes für die Tabelle `produkte`
--
ALTER TABLE `produkte`
  ADD PRIMARY KEY (`Produkte_ID`),
  ADD KEY `fk_rabatt` (`Rabatt_ID`);

--
-- Indizes für die Tabelle `rabatt`
--
ALTER TABLE `rabatt`
  ADD PRIMARY KEY (`Rabatt_ID`);

--
-- Indizes für die Tabelle `soundsystemart`
--
ALTER TABLE `soundsystemart`
  ADD PRIMARY KEY (`Soundsystemart_ID`);

--
-- Indizes für die Tabelle `soundsysteme`
--
ALTER TABLE `soundsysteme`
  ADD PRIMARY KEY (`Soundsysteme_ID`),
  ADD KEY `fk_hersteller_soundsysteme` (`Hersteller_ID`),
  ADD KEY `fk_soundsystemart_soundsysteme` (`Soundsystemart_ID`),
  ADD KEY `fk_produkte` (`Produkte_ID`);

--
-- Indizes für die Tabelle `standort`
--
ALTER TABLE `standort`
  ADD PRIMARY KEY (`Standort_ID`),
  ADD KEY `PLZ-Standort_ID` (`PLZ_ID`);

--
-- Indizes für die Tabelle `tonträger`
--
ALTER TABLE `tonträger`
  ADD PRIMARY KEY (`Tonträger_ID`),
  ADD KEY `fk_hersteller` (`Hersteller_ID`),
  ADD KEY `fk_produkte_tonträger` (`Produkte_ID`);

--
-- Indizes für die Tabelle `tonträgerart`
--
ALTER TABLE `tonträgerart`
  ADD PRIMARY KEY (`Tonträgerart_ID`);

--
-- Indizes für die Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD PRIMARY KEY (`Warenkorb_ID`),
  ADD KEY `fk_bestellung_warenkorb` (`Bestellung_ID`);

--
-- Indizes für die Tabelle `zahlungsart`
--
ALTER TABLE `zahlungsart`
  ADD PRIMARY KEY (`Zahlungsart_ID`);

--
-- Indizes für die Tabelle `zubehör`
--
ALTER TABLE `zubehör`
  ADD PRIMARY KEY (`Zubehör_ID`),
  ADD KEY `Hersteller_ID` (`Hersteller_ID`),
  ADD KEY `Produkte_ID` (`Produkte_ID`);

--
-- Indizes für die Tabelle `zubehörart`
--
ALTER TABLE `zubehörart`
  ADD PRIMARY KEY (`Zubehörart_ID`),
  ADD KEY `fk_kabel_zubehörart` (`Kabel_ID`),
  ADD KEY `fk_hersteller_zubehörart` (`Hersteller_ID`);

--
-- Indizes für die Tabelle `zulieferer`
--
ALTER TABLE `zulieferer`
  ADD PRIMARY KEY (`Zulieferer_ID`),
  ADD KEY `Standort-Zulieferer_ID` (`Standort_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `abteilung`
--
ALTER TABLE `abteilung`
  MODIFY `Abteilung_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `Bestellung_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT für Tabelle `firmenrechnung`
--
ALTER TABLE `firmenrechnung`
  MODIFY `Firmenrechnungen_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `hersteller`
--
ALTER TABLE `hersteller`
  MODIFY `Hersteller_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT für Tabelle `instrumente`
--
ALTER TABLE `instrumente`
  MODIFY `Instrumente_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `kabel_details`
--
ALTER TABLE `kabel_details`
  MODIFY `Kabel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `kunden`
--
ALTER TABLE `kunden`
  MODIFY `Kunden_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `kundenrechnungen`
--
ALTER TABLE `kundenrechnungen`
  MODIFY `Kundenrechnungen_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `künstler`
--
ALTER TABLE `künstler`
  MODIFY `Künstler_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  MODIFY `Mitarbeiter_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `nachbestellung`
--
ALTER TABLE `nachbestellung`
  MODIFY `Nachbestellung_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `plz`
--
ALTER TABLE `plz`
  MODIFY `PLZ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT für Tabelle `produkte`
--
ALTER TABLE `produkte`
  MODIFY `Produkte_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT für Tabelle `rabatt`
--
ALTER TABLE `rabatt`
  MODIFY `Rabatt_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `soundsystemart`
--
ALTER TABLE `soundsystemart`
  MODIFY `Soundsystemart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `soundsysteme`
--
ALTER TABLE `soundsysteme`
  MODIFY `Soundsysteme_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT für Tabelle `standort`
--
ALTER TABLE `standort`
  MODIFY `Standort_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `tonträger`
--
ALTER TABLE `tonträger`
  MODIFY `Tonträger_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `tonträgerart`
--
ALTER TABLE `tonträgerart`
  MODIFY `Tonträgerart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  MODIFY `Warenkorb_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT für Tabelle `zahlungsart`
--
ALTER TABLE `zahlungsart`
  MODIFY `Zahlungsart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `zubehörart`
--
ALTER TABLE `zubehörart`
  MODIFY `Zubehörart_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `zulieferer`
--
ALTER TABLE `zulieferer`
  MODIFY `Zulieferer_ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD CONSTRAINT `Kunde-Bestellung_ID` FOREIGN KEY (`Kunden_ID`) REFERENCES `kunden` (`Kunden_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `firmenrechnung`
--
ALTER TABLE `firmenrechnung`
  ADD CONSTRAINT `Mitarbeiter-FR_ID` FOREIGN KEY (`Mitarbeiter_ID`) REFERENCES `mitarbeiter` (`Mitarbeiter_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Nachbestellung-FR_ID` FOREIGN KEY (`Nachbestellung_ID`) REFERENCES `nachbestellung` (`Nachbestellung_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Zahlungsart-FR_ID` FOREIGN KEY (`Zahlungsart_ID`) REFERENCES `zahlungsart` (`Zahlungsart_ID`);

--
-- Constraints der Tabelle `hersteller`
--
ALTER TABLE `hersteller`
  ADD CONSTRAINT `fk_plz` FOREIGN KEY (`PLZ_ID`) REFERENCES `plz` (`PLZ_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `instrumente`
--
ALTER TABLE `instrumente`
  ADD CONSTRAINT `fk_hersteller_instrument` FOREIGN KEY (`Hersteller_ID`) REFERENCES `hersteller` (`Hersteller_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produkte_instrument` FOREIGN KEY (`Produkte_ID`) REFERENCES `produkte` (`Produkte_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `kunden`
--
ALTER TABLE `kunden`
  ADD CONSTRAINT `PLZ-Kunden_ID` FOREIGN KEY (`PLZ_ID`) REFERENCES `plz` (`PLZ_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `kundenrechnungen`
--
ALTER TABLE `kundenrechnungen`
  ADD CONSTRAINT `Kunden-KR_ID` FOREIGN KEY (`Kunden_ID`) REFERENCES `kunden` (`Kunden_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Warenkorb-KR` FOREIGN KEY (`Warenkorb_ID`) REFERENCES `warenkorb` (`Warenkorb_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Zahlungsart-KR` FOREIGN KEY (`Zahlungsart_ID`) REFERENCES `zahlungsart` (`Zahlungsart_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
  ADD CONSTRAINT `Abteilung-Mitarbeiter_ID` FOREIGN KEY (`Abteilung_ID`) REFERENCES `abteilung` (`Abteilung_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `PLZ-Mitarbeiter_ID` FOREIGN KEY (`PLZ_ID`) REFERENCES `plz` (`PLZ_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `nachbestellung`
--
ALTER TABLE `nachbestellung`
  ADD CONSTRAINT `Produkt-Nachbestellung_ID` FOREIGN KEY (`Produkte_ID`) REFERENCES `produkte` (`Produkte_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Standort-Nachbestellung_ID` FOREIGN KEY (`Standort_ID`) REFERENCES `standort` (`Standort_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Zulieferer-Nachbestellung_ID` FOREIGN KEY (`Zulieferer_ID`) REFERENCES `zulieferer` (`Zulieferer_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `produkte`
--
ALTER TABLE `produkte`
  ADD CONSTRAINT `fk_rabatt` FOREIGN KEY (`Rabatt_ID`) REFERENCES `rabatt` (`Rabatt_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `soundsysteme`
--
ALTER TABLE `soundsysteme`
  ADD CONSTRAINT `fk_hersteller_soundsysteme` FOREIGN KEY (`Hersteller_ID`) REFERENCES `hersteller` (`Hersteller_ID`),
  ADD CONSTRAINT `fk_produkte` FOREIGN KEY (`Produkte_ID`) REFERENCES `produkte` (`Produkte_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_soundsystemart_soundsysteme` FOREIGN KEY (`Soundsystemart_ID`) REFERENCES `soundsystemart` (`Soundsystemart_ID`);

--
-- Constraints der Tabelle `standort`
--
ALTER TABLE `standort`
  ADD CONSTRAINT `PLZ-Standort_ID` FOREIGN KEY (`PLZ_ID`) REFERENCES `plz` (`PLZ_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `tonträger`
--
ALTER TABLE `tonträger`
  ADD CONSTRAINT `fk_hersteller` FOREIGN KEY (`Hersteller_ID`) REFERENCES `hersteller` (`Hersteller_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produkte_tonträger` FOREIGN KEY (`Produkte_ID`) REFERENCES `produkte` (`Produkte_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `warenkorb`
--
ALTER TABLE `warenkorb`
  ADD CONSTRAINT `fk_bestellung_warenkorb` FOREIGN KEY (`Bestellung_ID`) REFERENCES `bestellung` (`Bestellung_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `zubehör`
--
ALTER TABLE `zubehör`
  ADD CONSTRAINT `zubehör_ibfk_1` FOREIGN KEY (`Hersteller_ID`) REFERENCES `hersteller` (`Hersteller_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `zubehör_ibfk_2` FOREIGN KEY (`Produkte_ID`) REFERENCES `produkte` (`Produkte_ID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `zubehörart`
--
ALTER TABLE `zubehörart`
  ADD CONSTRAINT `fk_hersteller_zubehörart` FOREIGN KEY (`Hersteller_ID`) REFERENCES `hersteller` (`Hersteller_ID`),
  ADD CONSTRAINT `fk_kabel_zubehörart` FOREIGN KEY (`Kabel_ID`) REFERENCES `kabel_details` (`Kabel_ID`);

--
-- Constraints der Tabelle `zulieferer`
--
ALTER TABLE `zulieferer`
  ADD CONSTRAINT `Standort-Zulieferer_ID` FOREIGN KEY (`Standort_ID`) REFERENCES `standort` (`Standort_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
