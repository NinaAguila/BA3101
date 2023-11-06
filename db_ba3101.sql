-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 06, 2023 at 06:34 AM
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
-- Table structure for table `tblapplicant`
--

DROP TABLE IF EXISTS `tblapplicant`;
CREATE TABLE IF NOT EXISTS `tblapplicant` (
  `applicationID` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblapplicant`
--

INSERT INTO `tblapplicant` (`applicationID`, `username`, `password`) VALUES
('101', 'dey', 'drei'),
('102', 'chi', 'che'),
('103', 'gez', 'lasin'),
('104', 'mark', 'makmak'),
('105', 'jake', 'rain');

-- --------------------------------------------------------

--
-- Table structure for table `tblapplication`
--

DROP TABLE IF EXISTS `tblapplication`;
CREATE TABLE IF NOT EXISTS `tblapplication` (
  `ApplicationID` varchar(25) NOT NULL,
  `jobID` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL,
  `resume` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblapplication`
--

INSERT INTO `tblapplication` (`ApplicationID`, `jobID`, `status`, `resume`) VALUES
('101', '1', 'pending', 'submitted'),
('102', '2', 'pending', 'submitted'),
('103', '3', 'pending', 'submitted'),
('104', '1', 'pending ', 'submitted'),
('105', '2', 'pending', 'submitted');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

DROP TABLE IF EXISTS `tbldepartment`;
CREATE TABLE IF NOT EXISTS `tbldepartment` (
  `departmentID` varchar(25) NOT NULL,
  `departmentName` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`departmentID`, `departmentName`) VALUES
('BSU01', 'CICS'),
('BSU02', 'CAS'),
('BSU03', 'CABE'),
('BSU04', 'CIT'),
('BSU01', 'CICS');

-- --------------------------------------------------------

--
-- Table structure for table `tblhr`
--

DROP TABLE IF EXISTS `tblhr`;
CREATE TABLE IF NOT EXISTS `tblhr` (
  `adminID` varchar(25) NOT NULL,
  `adminName` varchar(25) NOT NULL,
  `applicationID` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblhr`
--

INSERT INTO `tblhr` (`adminID`, `adminName`, `applicationID`) VALUES
('HR1001', 'John', '101'),
('HR1002', 'Doey', '102'),
('HR1003', 'Mike', '103'),
('HR1004', 'Thomas', '104'),
('HR1005', 'Ruby', '105');

-- --------------------------------------------------------

--
-- Table structure for table `tbljob`
--

DROP TABLE IF EXISTS `tbljob`;
CREATE TABLE IF NOT EXISTS `tbljob` (
  `jobID` varchar(25) NOT NULL,
  `jobType` varchar(25) NOT NULL,
  `description` varchar(25) NOT NULL,
  `requirement` varchar(25) NOT NULL,
  `salary` varchar(25) NOT NULL,
  `departmentID` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbljob`
--

INSERT INTO `tbljob` (`jobID`, `jobType`, `description`, `requirement`, `salary`, `departmentID`) VALUES
('1', 'Professor', 'Teaching college students', 'Work experience and educa', '15000', 'BSU01'),
('2', 'Maintenance', 'To maintain the cleanline', 'Work experience and educa', '5000', 'BSU02'),
('3', 'Security', 'Responsible for protectin', 'Work experience and educa', '7500', 'BSU05'),
('2', 'Professor', 'Teaching college students', 'Work experience and educa', '15000', 'BSU04'),
('1', 'Professor', 'Teaching college students', 'Work experience and educa', '15000', 'BSU03');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
