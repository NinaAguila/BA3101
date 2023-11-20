-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2023 at 09:09 AM
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
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
CREATE TABLE IF NOT EXISTS `tbl_account` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userImg` mediumblob NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userDept` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `userType` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reqhistory`
--

DROP TABLE IF EXISTS `tbl_reqhistory`;
CREATE TABLE IF NOT EXISTS `tbl_reqhistory` (
  `histID` int NOT NULL AUTO_INCREMENT,
  `reqStatus` varchar(255) NOT NULL,
  `statusDate` date NOT NULL,
  `orgID` int NOT NULL,
  `reqID` int NOT NULL,
  `officeID` int NOT NULL,
  PRIMARY KEY (`histID`),
  KEY `userID_FK(tbl_reqH)` (`orgID`),
  KEY `reqID_FK(tbl_reqH)` (`reqID`),
  KEY `officeID(tbl_reqH)` (`officeID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requests`
--

DROP TABLE IF EXISTS `tbl_requests`;
CREATE TABLE IF NOT EXISTS `tbl_requests` (
  `reqID` int NOT NULL AUTO_INCREMENT,
  `reqEventName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reqLetter` longblob NOT NULL,
  `reqEventDate` date NOT NULL,
  `reqDeadline` date NOT NULL,
  `userID` int NOT NULL,
  `currentOffice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`reqID`),
  KEY `userID(tbl_req)` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_reqhistory`
--
ALTER TABLE `tbl_reqhistory`
  ADD CONSTRAINT `officeID(tbl_reqH)` FOREIGN KEY (`officeID`) REFERENCES `tbl_account` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reqID_FK(tbl_reqH)` FOREIGN KEY (`reqID`) REFERENCES `tbl_requests` (`reqID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `userID_FK(tbl_reqH)` FOREIGN KEY (`orgID`) REFERENCES `tbl_account` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD CONSTRAINT `userID(tbl_req)` FOREIGN KEY (`userID`) REFERENCES `tbl_account` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
