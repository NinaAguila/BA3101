-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 26, 2023 at 01:33 AM
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
  `Username` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`Username`, `Password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbclient`
--

DROP TABLE IF EXISTS `tbclient`;
CREATE TABLE IF NOT EXISTS `tbclient` (
  `plate_Number` varchar(50) NOT NULL,
  `vehicle_Type` char(50) DEFAULT NULL,
  `first_Name` char(50) DEFAULT NULL,
  `last_Name` char(50) DEFAULT NULL,
  `sr_Code` varchar(50) DEFAULT NULL,
  `Department` char(50) DEFAULT NULL,
  `type` char(50) DEFAULT NULL,
  PRIMARY KEY (`plate_Number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbclient`
--

INSERT INTO `tbclient` (`plate_Number`, `vehicle_Type`, `first_Name`, `last_Name`, `sr_Code`, `Department`, `type`) VALUES
('VFA-175', 'Car', 'Rafael', 'Acda', '21-37452', NULL, 'Student'),
('BAV-163', 'Car', 'Dioneces', 'Alimoren', NULL, 'CICS', 'Professor'),
('BAK-875', 'Car', 'Francis', 'Balazon', NULL, 'CICS', 'Professor'),
('BAT-347', 'Car', 'Jonnah', 'Melo', NULL, 'CICS', 'Professor'),
('DAD-808', 'Car', 'Ryndel', 'Amorado', NULL, 'CICS', 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `tblogs`
--

DROP TABLE IF EXISTS `tblogs`;
CREATE TABLE IF NOT EXISTS `tblogs` (
  `plate_Number` varchar(50) NOT NULL,
  `recordDate` date DEFAULT NULL,
  `time_In` time DEFAULT NULL,
  `time_Out` time DEFAULT NULL,
  KEY `plate_Number` (`plate_Number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbstaff`
--

DROP TABLE IF EXISTS `tbstaff`;
CREATE TABLE IF NOT EXISTS `tbstaff` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `last_Name` char(50) DEFAULT NULL,
  `first_Name` char(50) DEFAULT NULL,
  `Gender` char(50) DEFAULT NULL,
  `Contact` varchar(11) DEFAULT NULL,
  `Address` char(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` char(50) DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`user_ID`, `last_Name`, `first_Name`, `Gender`, `Contact`, `Address`, `Email`, `Password`) VALUES
(16, 'Castillo', 'Dianne', 'Female', '09063524024', 'San Lucas Lipa City', 'dayan@gmail.com,', 'dayan'),
(17, 'Alday', 'Keon', 'Male', '09012356792', 'Brgy. Dos Lipa City', 'keon@gmail.com', 'keon'),
(18, 'Caniete', 'Cristel', 'Female', '09446531859', 'San Juan Batangas', 'cristel@gmail.com', 'cristel'),
(19, 'Cuya', 'Lester', 'Male', '09877361128', 'San Juan Batangas', 'lester@gmail.com', 'lester'),
(20, 'Acda', 'Rafael', 'Male', '09053127397', 'Cumba Lipa City', 'rafael@gmail.com', 'rafael');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
