-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 06, 2023 at 01:38 AM
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
  PRIMARY KEY (`adminno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`adminno`, `adminpass`) VALUES
('1', 'adminpass1'),
('2', 'adminpass2'),
('3', 'adminpass3'),
('4', 'adminpass4'),
('5', 'adminpass5');

-- --------------------------------------------------------

--
-- Table structure for table `tbcoun`
--

DROP TABLE IF EXISTS `tbcoun`;
CREATE TABLE IF NOT EXISTS `tbcoun` (
  `counno` varchar(50) NOT NULL,
  `counpass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`counno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbcoun`
--

INSERT INTO `tbcoun` (`counno`, `counpass`) VALUES
('1', 'counselorpass1'),
('2', 'counselorpass2'),
('3', 'counselorpass3'),
('4', 'counselorpass4'),
('5', 'counselorpass5');

-- --------------------------------------------------------

--
-- Table structure for table `tbreports`
--

DROP TABLE IF EXISTS `tbreports`;
CREATE TABLE IF NOT EXISTS `tbreports` (
  `reportno` int NOT NULL,
  `reporttype` varchar(255) DEFAULT NULL,
  `report` text,
  `studno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reportno`),
  KEY `studno` (`studno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbreports`
--

INSERT INTO `tbreports` (`reportno`, `reporttype`, `report`, `studno`) VALUES
(101, 'Academic Grievance', 'I have a concern about the grading in my History course.', '1'),
(102, 'Campus Facilities Grievance', 'There is a problem with the heating in my dormitory room.', '2'),
(103, 'Discrimination Grievance', 'I believe I have experienced discrimination in the workplace.', '3'),
(104, 'Housing Grievance', 'I would like to request a room change due to noisy neighbors.', '4'),
(105, 'Financial Aid Grievance', 'I am experiencing issues with my financial aid application.', '5');

-- --------------------------------------------------------

--
-- Table structure for table `tbstud`
--

DROP TABLE IF EXISTS `tbstud`;
CREATE TABLE IF NOT EXISTS `tbstud` (
  `studno` varchar(50) NOT NULL,
  `studpass` varchar(255) NOT NULL,
  PRIMARY KEY (`studno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstud`
--

INSERT INTO `tbstud` (`studno`, `studpass`) VALUES
('1', 'password1'),
('2', 'password2'),
('3', 'password3'),
('4', 'password4'),
('5', 'password5');

-- --------------------------------------------------------

--
-- Table structure for table `tbtracker`
--

DROP TABLE IF EXISTS `tbtracker`;
CREATE TABLE IF NOT EXISTS `tbtracker` (
  `status` varchar(255) DEFAULT NULL,
  `reportno` int DEFAULT NULL,
  `studno` varchar(50) DEFAULT NULL,
  `counno` varchar(50) DEFAULT NULL,
  KEY `reportno` (`reportno`),
  KEY `studno` (`studno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbtracker`
--

INSERT INTO `tbtracker` (`status`, `reportno`, `studno`, `counno`) VALUES
('1', 301, '1', '1'),
('2', 302, '2', '2'),
('3', 303, '3', '3'),
('1', 304, '4', '4'),
('2', 305, '5', '5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
