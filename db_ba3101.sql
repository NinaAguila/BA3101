-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 26, 2023 at 02:18 AM
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
-- Table structure for table `tbstudinfo`
--

DROP TABLE IF EXISTS `tbstudinfo`;
CREATE TABLE IF NOT EXISTS `tbstudinfo` (
  `studid` int NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit'),
(2, 'kent', 'clark', 'bscs');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `Admin_ID` varchar(50) NOT NULL,
  `Admin_User` varchar(50) NOT NULL,
  `Admin_Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`Admin_ID`, `Admin_User`, `Admin_Password`) VALUES
('1', 'adm_user', 'adm_pass');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guidance`
--

DROP TABLE IF EXISTS `tb_guidance`;
CREATE TABLE IF NOT EXISTS `tb_guidance` (
  `Guidance_ID` varchar(50) NOT NULL,
  `Guidance_User` varchar(50) NOT NULL,
  `Guidance_Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Guidance_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_guidance`
--

INSERT INTO `tb_guidance` (`Guidance_ID`, `Guidance_User`, `Guidance_Password`) VALUES
('1', 'gui_user', 'gui_pass');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentacc`
--

DROP TABLE IF EXISTS `tb_studentacc`;
CREATE TABLE IF NOT EXISTS `tb_studentacc` (
  `Student_Acc_ID` int NOT NULL AUTO_INCREMENT,
  `Student_User` varchar(50) NOT NULL,
  `Student_Password` varchar(50) NOT NULL,
  PRIMARY KEY (`Student_Acc_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_studentacc`
--

INSERT INTO `tb_studentacc` (`Student_Acc_ID`, `Student_User`, `Student_Password`) VALUES
(1, 'test_user', 'test_pass'),
(2, 'raz', 'raz_pass'),
(3, 'solis', 'solis_pass'),
(4, 'niel', 'niel_pass'),
(5, 'alvin', 'alvin_pass');

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `SR-Code` varchar(25) NOT NULL,
  `Student_Name` varchar(50) NOT NULL,
  `Student_Course` varchar(50) NOT NULL,
  `Student_Year` varchar(25) NOT NULL,
  `Student_Acc_ID` int NOT NULL,
  PRIMARY KEY (`SR-Code`),
  KEY `FK_Student_Acc` (`Student_Acc_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_studentinfo`
--

INSERT INTO `tb_studentinfo` (`SR-Code`, `Student_Name`, `Student_Course`, `Student_Year`, `Student_Acc_ID`) VALUES
('21-20000', 'James Poblete', 'BSIT-BA', '3rd year', 1),
('21-20001', 'David Raz', 'BSIT-BA', '3rd year', 2),
('21-20002', 'Robi Solis', 'BSIT-BA', '3rd year', 3),
('21-20003', 'Niel Macaraig', 'BSIT-BA', '3rd year', 4),
('21-20004', 'Alvin Hombre', 'BSIT-BA', '3rd year', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_violation`
--

DROP TABLE IF EXISTS `tb_violation`;
CREATE TABLE IF NOT EXISTS `tb_violation` (
  `Violation_ID` int NOT NULL AUTO_INCREMENT,
  `Student_Name` varchar(50) NOT NULL,
  `Student_Course` varchar(50) DEFAULT NULL,
  `Student_Year` varchar(25) NOT NULL,
  `Violation_Date` datetime NOT NULL,
  `Violation_Description` varchar(200) NOT NULL,
  `Violation_Status` varchar(25) NOT NULL,
  `Admin_ID` varchar(50) NOT NULL,
  `Guidance_ID` varchar(50) NOT NULL,
  `SR-Code` varchar(25) NOT NULL,
  PRIMARY KEY (`Violation_ID`),
  KEY `FK_StudentInfo_Violation` (`SR-Code`),
  KEY `FK_Admin_Violation` (`Admin_ID`),
  KEY `FK_Guidance_Violation` (`Guidance_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_violation`
--

INSERT INTO `tb_violation` (`Violation_ID`, `Student_Name`, `Student_Course`, `Student_Year`, `Violation_Date`, `Violation_Description`, `Violation_Status`, `Admin_ID`, `Guidance_ID`, `SR-Code`) VALUES
(1, 'James Poblete', 'BSIT-BA', '3rd year', '2023-07-06 09:46:08', 'Wearing Earing ', 'Done', '1', '1', '21-20000'),
(4, 'David Raz', 'BSIT-BA', '3rd year', '2023-08-12 09:56:23', 'Not in proper uniform', 'pending ', '1', '1', '21-20001'),
(5, 'Robi Solis', 'BSIT-BA', '3rd year', '2023-08-20 09:58:34', 'Not in a proper haircut', 'Done', '1', '1', '21-20002'),
(6, 'Niel Macaraig', 'BSIT-BA', '3rd year', '2023-09-02 10:00:09', 'Not in a proper uniform', 'pending ', '1', '1', '21-20003'),
(7, 'Alvin Hombre', 'BSIT-BA', '3rd year', '2023-10-02 10:01:04', 'No ID', 'pending ', '1', '1', '21-20004');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
