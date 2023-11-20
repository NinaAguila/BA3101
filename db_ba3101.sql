-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2023 at 09:52 AM
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
  `emp_ID` int NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL,
  KEY `emp_ID` (`emp_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`emp_ID`, `Password`, `Role`) VALUES
(1, '123', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbclient`
--

DROP TABLE IF EXISTS `tbclient`;
CREATE TABLE IF NOT EXISTS `tbclient` (
  `plate_Number` varchar(50) NOT NULL,
  `vehicle_Type` char(50) DEFAULT NULL,
  `student_ID` int DEFAULT NULL,
  `emp_ID` int DEFAULT NULL,
  `Contact` varchar(11) NOT NULL,
  `type` char(50) DEFAULT NULL,
  `fileName` varchar(50) NOT NULL,
  `filePath` varchar(50) NOT NULL,
  PRIMARY KEY (`plate_Number`),
  KEY `student_ID` (`student_ID`),
  KEY `emp_ID` (`emp_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbclient`
--

INSERT INTO `tbclient` (`plate_Number`, `vehicle_Type`, `student_ID`, `emp_ID`, `Contact`, `type`, `fileName`, `filePath`) VALUES
('BAV-163', 'Coupe', NULL, 2, '09931254621', 'Professor', '', ''),
('BAK-875', 'Crossover', NULL, 3, '09919134636', 'Professor', '', ''),
('BAT-347', 'Hatchback', NULL, 4, '09944701129', 'Professor', '', ''),
('DAD-808', 'Micro', NULL, 5, '09556312349', 'Professor', '', ''),
('IDF-891', 'MUX', 2135588, NULL, '09877361128', 'Student', '', ''),
('VFA-175', 'Mazda 3', 2137452, NULL, '09053127397', 'Student', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'aguila', 'nina', 'cics'),
(2, 'dioneces', 'alimoren', 'cics'),
(3, 'balazon', 'francis', 'cics'),
(4, 'melo', 'jonnah', 'cics'),
(5, 'amorado', 'ryndel', 'cics');

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

--
-- Dumping data for table `tblogs`
--

INSERT INTO `tblogs` (`plate_Number`, `recordDate`, `time_In`, `time_Out`) VALUES
('VFA-175', '2023-11-06', '08:00:00', '17:00:00'),
('BAK-875', '2023-11-08', '10:08:52', '10:08:54'),
('BAV-163', '2023-11-09', '09:34:18', '09:35:25'),
('VFA-175', '2023-11-09', '09:34:12', '08:33:03'),
('BAT-347', '2023-11-08', '10:06:20', '13:34:39'),
('BAK-875', '2023-11-08', '10:06:15', '10:08:40'),
('DAD-808', '2023-11-08', '10:06:07', '10:06:29'),
('BAV-163', '2023-11-08', '10:06:05', '13:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbstaff`
--

DROP TABLE IF EXISTS `tbstaff`;
CREATE TABLE IF NOT EXISTS `tbstaff` (
  `user_ID` int NOT NULL AUTO_INCREMENT,
  `last_Name` char(50) DEFAULT NULL,
  `first_Name` char(50) DEFAULT NULL,
  `Contact` varchar(11) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` char(50) DEFAULT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`user_ID`, `last_Name`, `first_Name`, `Contact`, `Email`, `Password`) VALUES
(16, 'Castillo', 'Dianne', '09063524024', 'dayan@gmail.com', 'dayan'),
(17, 'Alday', 'Keon', '09012356792', 'keon@gmail.com', 'keon'),
(18, 'Caniete', 'Cristel', '09446531859', 'cristel@gmail.com', 'cristel'),
(19, 'Cuya', 'Lester', '09877361128', 'lester@gmail.com', 'lester'),
(20, 'Acda', 'Rafael', '09053127397', 'rafael@gmail.com', 'rafael'),
(25, 'Acda', 'Ryan', '09053127397', 'ryan@gmail.com', 'ryan');

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
) ENGINE=MyISAM AUTO_INCREMENT=2137453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(2135588, 'Cuya', 'Lester', 'BSIT'),
(2137452, 'Acda', 'Rafael', 'BSIT'),
(2133057, 'Alday', 'Keon', 'BSIT');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
