-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 26, 2023 at 01:39 AM
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
  `admin_ID` varchar(30) NOT NULL,
  `admin_user` varchar(30) NOT NULL,
  `admin_pass` varchar(30) NOT NULL,
  PRIMARY KEY (`admin_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`admin_ID`, `admin_user`, `admin_pass`) VALUES
('ADM-001', 'AdminUser1_Jon', 'Pass123!'),
('ADM-002', 'AdminUser2_Josh', 'SecurePass456'),
('ADM-003 ', 'AdminUser3_Sally ', 'Password789'),
('ADM-004', 'AdminUser4_Chris', 'AccessGranted!'),
('ADM-005 ', 'AdminUser5_Ron', 'SecretPass123');

-- --------------------------------------------------------

--
-- Table structure for table `tbborrow`
--

DROP TABLE IF EXISTS `tbborrow`;
CREATE TABLE IF NOT EXISTS `tbborrow` (
  `borrow_ID` varchar(30) NOT NULL,
  `borrow_quantity` int NOT NULL,
  `equipment_borrow` varchar(50) NOT NULL,
  PRIMARY KEY (`borrow_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbborrow`
--

INSERT INTO `tbborrow` (`borrow_ID`, `borrow_quantity`, `equipment_borrow`) VALUES
('1001', 2, 'Baseball Gloves , Shuttlecocks '),
('1002', 1, 'Soccer Ball '),
('1003', 1, 'Volleyball '),
('1004', 3, 'Soccer Ball, Badminton Rackets, Shuttlecocks '),
('1005', 1, 'Basketball');

-- --------------------------------------------------------

--
-- Table structure for table `tbdate`
--

DROP TABLE IF EXISTS `tbdate`;
CREATE TABLE IF NOT EXISTS `tbdate` (
  `borrow_ID` varchar(30) NOT NULL,
  `date_borrowed` date NOT NULL,
  `date_returned` date NOT NULL,
  PRIMARY KEY (`borrow_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbdate`
--

INSERT INTO `tbdate` (`borrow_ID`, `date_borrowed`, `date_returned`) VALUES
('23-244', '2023-02-02', '2023-02-02'),
('23-352', '2023-02-03', '2023-02-04'),
('21-648', '2023-02-03', '2023-02-04'),
('23-423', '2023-03-03', '2023-03-03'),
('23-453', '2023-04-05', '2023-04-05');

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
-- Table structure for table `tbequipment`
--

DROP TABLE IF EXISTS `tbequipment`;
CREATE TABLE IF NOT EXISTS `tbequipment` (
  `equipment_ID` varchar(30) NOT NULL,
  `equipment_name` varchar(30) NOT NULL,
  `equipment_quantity` int NOT NULL,
  `equipment_description` varchar(200) NOT NULL,
  PRIMARY KEY (`equipment_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`) VALUES
('EQP-001  ', 'Basketball  ', 10, 'Official size and weight basketball suitable for indoor and outdoor play.'),
('EQP-002  ', 'Ping Pong Table ', 3, 'Regulation-size ping pong table with a net and paddles.'),
('EQP-003  ', 'Volleyball', 8, 'Premium leather volleyball for competitive matches.'),
('EQP-004 ', ' Badminton Rackets ', 12, 'Lightweight badminton rackets with durable strings.'),
('EQP-005  ', 'Shuttlecocks ', 30, 'Feathered shuttlecocks for badminton games.');

-- --------------------------------------------------------

--
-- Table structure for table `tbstaffin`
--

DROP TABLE IF EXISTS `tbstaffin`;
CREATE TABLE IF NOT EXISTS `tbstaffin` (
  `staff_ID` varchar(30) NOT NULL,
  `staff_user` varchar(30) NOT NULL,
  `staff_pass` varchar(30) NOT NULL,
  `staffin_description` varchar(30) NOT NULL,
  PRIMARY KEY (`staff_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstaffin`
--

INSERT INTO `tbstaffin` (`staff_ID`, `staff_user`, `staff_pass`, `staffin_description`) VALUES
('23-441', 'pinkfly', 'hsag34', 'IN'),
('23-981', 'ghrw73', 'sgdfyuf32', 'IN'),
('23-193', 'BNDS32', 'BNSDF4', 'IN'),
('23-840', 'ub7BG', 'bf37g', 'IN'),
('23-816', 'yuib78', 'BVUYV78', 'IN');

-- --------------------------------------------------------

--
-- Table structure for table `tbstaffout`
--

DROP TABLE IF EXISTS `tbstaffout`;
CREATE TABLE IF NOT EXISTS `tbstaffout` (
  `staff_ID` varchar(30) NOT NULL,
  `staff_user` varchar(30) NOT NULL,
  `staff_pass` varchar(30) NOT NULL,
  `staffout_description` varchar(30) NOT NULL,
  PRIMARY KEY (`staff_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstaffout`
--

INSERT INTO `tbstaffout` (`staff_ID`, `staff_user`, `staff_pass`, `staffout_description`) VALUES
('21-199', 'OutUser1_Kier', 'Asj87n2', 'OUT'),
('18-354', 'OutUser2_Jam', 'A23hsyaN', 'OUT'),
('18-224', 'OutUser3_Tina', 'MNia0we', 'OUT'),
('19-003', 'OutUser4_Pol', 'Pol2345L', 'OUT'),
('21-556', 'OutUser5_Nate', 'Lsh89pl1', 'OUT');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
