-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2023 at 05:58 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ba3101`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

DROP TABLE IF EXISTS `tbadmin`;
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `adminno` varchar(50) NOT NULL,
  `adminpass` varchar(255) DEFAULT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`adminno`),
  KEY `fk_tbadmin_empid` (`empid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`adminno`, `adminpass`, `empid`) VALUES
('1', 'adminpass1', 1),
('2', 'adminpass2', 2),
('3', 'adminpass3', 3),
('4', 'adminpass4', 4),
('5', 'adminpass5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbcoun`
--

DROP TABLE IF EXISTS `tbcoun`;
CREATE TABLE IF NOT EXISTS `tbcoun` (
  `counno` varchar(50) NOT NULL,
  `counpass` varchar(255) DEFAULT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`counno`),
  KEY `fk_tbcoun_empid` (`empid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbcoun`
--

INSERT INTO `tbcoun` (`counno`, `counpass`, `empid`) VALUES
('1', 'counselorpass1', 1),
('2', 'counselorpass2', 2),
('3', 'counselorpass3', 3),
('4', 'counselorpass4', 4),
('5', 'counselorpass5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbempinfo`
--

DROP TABLE IF EXISTS `tbempinfo`;
CREATE TABLE IF NOT EXISTS `tbempinfo` (
  `empid` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'aguila', 'nina', 'cics');

-- --------------------------------------------------------

--
-- Table structure for table `tbreports`
--

DROP TABLE IF EXISTS `tbreports`;
CREATE TABLE IF NOT EXISTS `tbreports` (
  `reportno` int NOT NULL AUTO_INCREMENT,
  `reporttype` varchar(255) DEFAULT NULL,
  `report` text,
  `studno` varchar(50) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `datefiled` datetime DEFAULT NULL,
  `dateresolved` datetime DEFAULT NULL,
  PRIMARY KEY (`reportno`),
  KEY `studno` (`studno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbstud`
--

DROP TABLE IF EXISTS `tbstud`;
CREATE TABLE IF NOT EXISTS `tbstud` (
  `studno` varchar(50) NOT NULL,
  `studpass` varchar(255) NOT NULL,
  `studid` int DEFAULT NULL,
  PRIMARY KEY (`studno`),
  KEY `fk_tbstud_studid` (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstud`
--

INSERT INTO `tbstud` (`studno`, `studpass`, `studid`) VALUES
('21-34780', 'bonjlaygo', 2134780),
('21-39414', 'ivanrubion', 2139414),
('21-30073', 'belletrayfalgar', 2130073),
('21-39325', 'johnronaldlopez', 2139325),
('21-31054', 'sethtada', 2131054);

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

DROP TABLE IF EXISTS `tbstudinfo`;
CREATE TABLE IF NOT EXISTS `tbstudinfo` (
  `studid` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=2139415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(2139325, 'Lopez', 'John Ronald', 'BSIT-BA-3101'),
(2130073, 'Trayfalgar', 'Belle Colleen', 'BSIT-BA-3101'),
(2131054, 'Tada', 'Seth Aldous', 'BSIT-BA-3101'),
(2139414, 'Rubion', 'Ivan Gabriel', 'BSIT-BA-3101'),
(2134780, 'Laygo', 'Bonjohn Benedict', 'BSIT-BA-3101');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
