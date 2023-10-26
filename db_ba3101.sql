-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 26, 2023 at 02:15 AM
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
-- Table structure for table `tblapplicantlogin`
--

DROP TABLE IF EXISTS `tblapplicantlogin`;
CREATE TABLE IF NOT EXISTS `tblapplicantlogin` (
  `New Applicant ID` int NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblapplicantlogin`
--

INSERT INTO `tblapplicantlogin` (`New Applicant ID`, `Username`, `Password`) VALUES
(1, 'dey', 'drei'),
(2, 'mark', 'makmak'),
(3, 'gez', 'lasin'),
(4, 'jake', 'rain'),
(5, 'seth', 'aldous');

-- --------------------------------------------------------

--
-- Table structure for table `tblapplicationform`
--

DROP TABLE IF EXISTS `tblapplicationform`;
CREATE TABLE IF NOT EXISTS `tblapplicationform` (
  `ApplicationID` int NOT NULL,
  `First Name` varchar(20) NOT NULL,
  `Middle Name` varchar(20) NOT NULL,
  `Last Name` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Number` varchar(20) NOT NULL,
  `Job Position` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblapplicationform`
--

INSERT INTO `tblapplicationform` (`ApplicationID`, `First Name`, `Middle Name`, `Last Name`, `Email`, `Number`, `Job Position`) VALUES
(1, 'John', 'D', 'Doey', '222@gmail.com', '09485784652', 'Maintenance'),
(2, 'Seth', 'D', 'Dog', '111@gmail.com', '09824563871', 'Professor'),
(3, 'Russel', 'V', 'Wayne', '333@gmail.com', '09874626451', 'Maintenance'),
(4, 'Michael', 'S', 'Luffy', '444@gmail.com', '09837465836', 'Staff'),
(5, 'Chi', 'P', 'Liz', '555@gmail.com', '09658327562', 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `tbldept`
--

DROP TABLE IF EXISTS `tbldept`;
CREATE TABLE IF NOT EXISTS `tbldept` (
  `Job Position` varchar(25) NOT NULL,
  `Department Name` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbldept`
--

INSERT INTO `tbldept` (`Job Position`, `Department Name`) VALUES
('Maintenance', 'CICS'),
('Professor', 'CIT'),
('Staff', 'CAS'),
('Professor', 'CABE'),
('Staff', 'CICS');

-- --------------------------------------------------------

--
-- Table structure for table `tblhr`
--

DROP TABLE IF EXISTS `tblhr`;
CREATE TABLE IF NOT EXISTS `tblhr` (
  `ApplicationID` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblhr`
--

INSERT INTO `tblhr` (`ApplicationID`) VALUES
(1),
(2),
(3),
(4),
(5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
