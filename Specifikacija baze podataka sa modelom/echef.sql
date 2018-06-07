-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 07, 2018 at 01:06 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `echef`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `idK` int(11) NOT NULL,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `knjiga`
--

DROP TABLE IF EXISTS `knjiga`;
CREATE TABLE IF NOT EXISTS `knjiga` (
  `idK` int(11) NOT NULL AUTO_INCREMENT,
  `idKorisnika` int(11) DEFAULT NULL,
  PRIMARY KEY (`idK`),
  KEY `R_15` (`idKorisnika`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `knjiga`
--

INSERT INTO `knjiga` (`idK`, `idKorisnika`) VALUES
(12, 1),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
CREATE TABLE IF NOT EXISTS `komentar` (
  `idK` int(11) NOT NULL AUTO_INCREMENT,
  `idKorisnika` int(11) DEFAULT NULL,
  `sadrzaj` text,
  `idR` int(11) DEFAULT NULL,
  `vreme` date NOT NULL,
  PRIMARY KEY (`idK`),
  KEY `R_14` (`idKorisnika`),
  KEY `R_13` (`idR`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`idK`, `idKorisnika`, `sadrzaj`, `idR`, `vreme`) VALUES
(1, 1, 'cool', 1, '2018-05-12'),
(2, 2, 'bolje', 1, '2018-05-02'),
(4, 1, 'extra', 2, '2018-06-06'),
(5, 1, 'ssss', 2, '2018-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `idK` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  `oznaka` char(1) NOT NULL,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idK`, `username`, `password`, `ime`, `prezime`, `mail`, `oznaka`) VALUES
(1, 'janis', 'asdas', 'asfasf', 'asfas', 'asdas', 'R'),
(2, 'vuk', 'asdas', 'asdasx', 'saxs', 'xgax', 'R'),
(3, 'jelena', 'asdasf', 'fssaf', 'afs', 'dasa', 'R'),
(4, 'Ivana', 'asda', 'saf', 'xx', 'asx', 'R'),
(6, 'jeca', 'jeca', 'jelena', 'savic', 'asfjas@gasdas.com', 'K');

-- --------------------------------------------------------

--
-- Table structure for table `kuvar`
--

DROP TABLE IF EXISTS `kuvar`;
CREATE TABLE IF NOT EXISTS `kuvar` (
  `idK` int(11) NOT NULL,
  `cv` blob,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `meni`
--

DROP TABLE IF EXISTS `meni`;
CREATE TABLE IF NOT EXISTS `meni` (
  `idM` int(11) NOT NULL AUTO_INCREMENT,
  `idK` int(11) DEFAULT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`idM`),
  KEY `R_10` (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ocenjuje`
--

DROP TABLE IF EXISTS `ocenjuje`;
CREATE TABLE IF NOT EXISTS `ocenjuje` (
  `idK` int(11) NOT NULL,
  `idR` int(11) NOT NULL,
  `ocena` int(11) NOT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`idK`,`idR`),
  KEY `R_20` (`idR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ocenjuje`
--

INSERT INTO `ocenjuje` (`idK`, `idR`, `ocena`, `datum`) VALUES
(1, 1, 2, '2018-06-06'),
(2, 1, 1, '2018-05-14'),
(3, 1, 2, '2018-05-20'),
(4, 1, 4, '2018-05-17'),
(1, 2, 1, '2018-06-07'),
(1, 4, 5, '2018-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `omiljeni`
--

DROP TABLE IF EXISTS `omiljeni`;
CREATE TABLE IF NOT EXISTS `omiljeni` (
  `idS` int(11) NOT NULL,
  `idK` int(11) NOT NULL,
  PRIMARY KEY (`idS`,`idK`),
  KEY `R_34` (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `omiljeni`
--

INSERT INTO `omiljeni` (`idS`, `idK`) VALUES
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recepti`
--

DROP TABLE IF EXISTS `recepti`;
CREATE TABLE IF NOT EXISTS `recepti` (
  `idR` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) NOT NULL,
  `sadrzaj` text NOT NULL,
  `obrok` varchar(20) NOT NULL,
  `kategorija` varchar(20) NOT NULL,
  `spec_prilika` varchar(20) DEFAULT NULL,
  `slika` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idR`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recepti`
--

INSERT INTO `recepti` (`idR`, `naziv`, `sadrzaj`, `obrok`, `kategorija`, `spec_prilika`, `slika`) VALUES
(2, 'pizza', '1)sir\r\n2)paradajz\r\n3)kecap\r\n4)sunka', 'vecera', 'Pasta', 'Christmas', '/images/pizza.jpg'),
(3, 'torta', 'ima secera', 'Dinner', 'Chocolate', 'valentines day', '/images/pasta.jpg'),
(4, 'keks', 'ima brasna', 'Breakfast', 'Chocolate', 'valentines day', '/images/pasta.jpg'),
(1, 'pasta', 'ma ima razno sta sad da ti pisem', 'Lunch', 'neka', 'neka', '/images/pasta.jpg'),
(5, 'nesto', 'passa ovako pa onkao akaksoda\r\nasdkaskdaks\r\nasdkaskdas\r\nlasdlasld\r\nasaldas\r\ndasld\r\nasdlas\r\ndasld\r\naslda\r\nsd;as;da;sdasd\r\n\r\nasldalsd\r\nas\r\n', 'Dessert', 'turkey', 'Valentines Day', '/images/pasta.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registrovani`
--

DROP TABLE IF EXISTS `registrovani`;
CREATE TABLE IF NOT EXISTS `registrovani` (
  `idK` int(11) NOT NULL,
  `pol` char(1) NOT NULL,
  PRIMARY KEY (`idK`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sastojci`
--

DROP TABLE IF EXISTS `sastojci`;
CREATE TABLE IF NOT EXISTS `sastojci` (
  `idS` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) NOT NULL,
  `opis` text,
  `kategorija` varchar(20) NOT NULL,
  PRIMARY KEY (`idS`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sastojci`
--

INSERT INTO `sastojci` (`idS`, `naziv`, `opis`, `kategorija`) VALUES
(1, 'makarone', 'testo mnogo goji', 'pasta'),
(2, 'paradajz', 'crveno', 'povrce'),
(3, 'Potato', 'slano,zuto', 'povrce'),
(4, 'Pork', 'masno, bljuc', 'meso'),
(5, 'Chocolate', 'slatko', 'desert');

-- --------------------------------------------------------

--
-- Table structure for table `veza_meni_recepti`
--

DROP TABLE IF EXISTS `veza_meni_recepti`;
CREATE TABLE IF NOT EXISTS `veza_meni_recepti` (
  `idM` int(11) NOT NULL,
  `idR` int(11) NOT NULL,
  PRIMARY KEY (`idM`,`idR`),
  KEY `R_26` (`idR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `veza_recepti_knjiga`
--

DROP TABLE IF EXISTS `veza_recepti_knjiga`;
CREATE TABLE IF NOT EXISTS `veza_recepti_knjiga` (
  `idK` int(11) NOT NULL,
  `idR` int(11) NOT NULL,
  PRIMARY KEY (`idK`,`idR`),
  KEY `R_30` (`idR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veza_recepti_knjiga`
--

INSERT INTO `veza_recepti_knjiga` (`idK`, `idR`) VALUES
(9, 2),
(10, 2),
(11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `veza_sastojci_recepti`
--

DROP TABLE IF EXISTS `veza_sastojci_recepti`;
CREATE TABLE IF NOT EXISTS `veza_sastojci_recepti` (
  `idR` int(11) NOT NULL,
  `idS` int(11) NOT NULL,
  PRIMARY KEY (`idR`,`idS`),
  KEY `R_27` (`idS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `veza_sastojci_recepti`
--

INSERT INTO `veza_sastojci_recepti` (`idR`, `idS`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 3),
(5, 3),
(5, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `zahtev`
--

DROP TABLE IF EXISTS `zahtev`;
CREATE TABLE IF NOT EXISTS `zahtev` (
  `idZ` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `cv` blob,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `mail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idZ`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
