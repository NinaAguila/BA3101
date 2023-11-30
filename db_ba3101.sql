-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2023 at 03:41 AM
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
  `admin_ID` int NOT NULL AUTO_INCREMENT,
  `admin_user` varchar(30) NOT NULL,
  `admin_pass` varchar(30) NOT NULL,
  `empid` int NOT NULL,
  PRIMARY KEY (`admin_ID`),
  KEY `empid` (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`admin_ID`, `admin_user`, `admin_pass`, `empid`) VALUES
(4, 'Cruzy', 'oisdahfeuw', 2),
(5, 'heyo', 'dgfregher', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbborrow`
--

DROP TABLE IF EXISTS `tbborrow`;
CREATE TABLE IF NOT EXISTS `tbborrow` (
  `borrow_ID` int NOT NULL AUTO_INCREMENT,
  `studid` int NOT NULL,
  `equipment_quantity` int NOT NULL,
  `equipment_ID` int NOT NULL,
  `date_borrowed` date NOT NULL,
  PRIMARY KEY (`borrow_ID`),
  KEY `studid` (`studid`),
  KEY `equipment_ID` (`equipment_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbborrow`
--

INSERT INTO `tbborrow` (`borrow_ID`, `studid`, `equipment_quantity`, `equipment_ID`, `date_borrowed`) VALUES
(140, 7, 5, 19, '2023-11-29'),
(141, 6, 5, 20, '2023-11-30'),
(142, 7, 5, 22, '2023-11-29'),
(143, 8, 2, 22, '2023-11-30');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'aguila', 'nina', 'cics'),
(2, 'Cruz', 'Mark', 'cics'),
(3, 'Miranda', 'Rocky', 'cics'),
(4, 'Peloramas', 'Angela', 'cics'),
(5, 'Dela Pena', 'Leo', 'cics'),
(6, 'Macalla', 'Dorothy', 'cics');

-- --------------------------------------------------------

--
-- Table structure for table `tbequipment`
--

DROP TABLE IF EXISTS `tbequipment`;
CREATE TABLE IF NOT EXISTS `tbequipment` (
  `equipment_ID` int NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(30) NOT NULL,
  `equipment_quantity` int NOT NULL,
  `equipment_description` varchar(200) NOT NULL,
  `equip_photos` blob NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_arrived` date DEFAULT NULL,
  PRIMARY KEY (`equipment_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`, `equip_photos`, `is_active`, `date_arrived`) VALUES
(19, 'Futsal Ball', 7, 'small, typically low-bounce ball used in the sport of futsal', 0x2e2e2f696d616765732f696d6167652d6571702f363536366361333336633636395f62616c6c2e6a7067, 1, '2023-11-29'),
(20, 'Ping Pong Table', 8, 'specialized surface used for playing the sport of table tennis', 0x2e2e2f696d616765732f696d6167652d6571702f70696e672d706f6e672d7461626c652d586c654e4c39432d3630302d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-11-12'),
(22, 'Volleyball', 7, 'a spherical ball made of leather or synthetic leather and inflated with air', 0x363536323233333332363261655f62616c6c5f322e6a666966, 1, '2023-11-11'),
(23, 'Shuttlecock', 10, ' also known as a birdie, is a small, feathered projectile used in the sport of badminton.', 0x2e2e2f696d616765732f696d6167652d6571702f706e672d7472616e73706172656e742d77686974652d73687574746c65636f636b2d696c6c757374726174696f6e2d626c61636b2d616e642d77686974652d73687574746c65636f636b2d67616d652d77686974652d73706f72745f5f315f2d72656d6f766562672d707265766965772e706e67, 1, '2023-11-09'),
(24, 'Piwjegurwh', 2, 'ewgr', 0x2e2e2f696d616765732f696d6167652d6571702f37315a6139304e4f71374c2d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbreturned`
--

DROP TABLE IF EXISTS `tbreturned`;
CREATE TABLE IF NOT EXISTS `tbreturned` (
  `return_ID` int NOT NULL AUTO_INCREMENT,
  `borrow_ID` int NOT NULL,
  `returned_date` date NOT NULL,
  `studid` int NOT NULL,
  `returned_quantity` int NOT NULL,
  `equipment_damaged` int NOT NULL,
  `equipment_missing` int NOT NULL,
  PRIMARY KEY (`return_ID`),
  KEY `borrow_ID` (`borrow_ID`),
  KEY `studid` (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbreturned`
--

INSERT INTO `tbreturned` (`return_ID`, `borrow_ID`, `returned_date`, `studid`, `returned_quantity`, `equipment_damaged`, `equipment_missing`) VALUES
(53, 143, '2023-11-30', 8, 1, 0, 13);

-- --------------------------------------------------------

--
-- Table structure for table `tbstaff`
--

DROP TABLE IF EXISTS `tbstaff`;
CREATE TABLE IF NOT EXISTS `tbstaff` (
  `staff_ID` int NOT NULL AUTO_INCREMENT,
  `staff_user` varchar(30) NOT NULL,
  `staff_pass` varchar(30) NOT NULL,
  `staff_position` varchar(30) NOT NULL,
  `empid` int NOT NULL,
  PRIMARY KEY (`staff_ID`),
  KEY `empid` (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`staff_ID`, `staff_user`, `staff_pass`, `staff_position`, `empid`) VALUES
(1, 'dfberfb', 'ewfgrwgwr', 'IN', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

DROP TABLE IF EXISTS `tbstudinfo`;
CREATE TABLE IF NOT EXISTS `tbstudinfo` (
  `studid` int NOT NULL AUTO_INCREMENT,
  `sr_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `sr_code`, `lastname`, `firstname`, `course`) VALUES
(1, '32-10987', 'parker', 'peter', 'bsit'),
(2, '29-76854', 'kent', 'clark', 'bscs'),
(3, '21-34256', 'Valencia', 'Arnold', 'bscs'),
(4, '23-98765', 'Reyes', 'Marvin', 'bsit'),
(5, '15-98126', 'Dela Cruz', 'Leomar', 'bsba'),
(6, '21-39828', 'manalo', 'zeus', 'bsit'),
(7, '21-32471', 'Macalla', 'Dorothy', 'bsit'),
(8, '21-35519', 'De Chavez', 'Jhuncen', 'bsit');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
