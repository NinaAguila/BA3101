-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 29, 2023 at 05:30 AM
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `empid` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `email` (`email`),
  KEY `empid` (`empid`)
) ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `empid`, `email`, `password`) VALUES
(2, 1, 'dreipurio@gmail.com', 'dey');

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

DROP TABLE IF EXISTS `applicant`;
CREATE TABLE IF NOT EXISTS `applicant` (
  `applicantID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`applicantID`),
  UNIQUE KEY `email` (`email`)
) ;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`applicantID`, `email`, `password`, `name`) VALUES
(1, 'mark@gmail.com', 'mark', 'Mark Joseph Fruelda');

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `applicationID` int NOT NULL AUTO_INCREMENT,
  `jobID` int NOT NULL,
  `applicantID` int NOT NULL,
  `hrID` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`applicationID`),
  KEY `jobID` (`jobID`),
  KEY `applicantID` (`applicantID`),
  KEY `hrID` (`hrID`)
) ;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`applicationID`, `jobID`, `applicantID`, `hrID`, `name`, `address`, `email`, `contact`, `resume`, `status`) VALUES
(11, 4, 1, 1, 'Mark Joseph Fruelda', 'Lipa', 'dreipurio@gmail.com', '09378352157', 'uploads/Admission Result.pdf', 'Pending'),
(12, 5, 1, 1, 'John Andrei Purio', 'Lipa', 'dreipurio@gmail.com', '09459732833', 'uploads/Admission Result.pdf', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

DROP TABLE IF EXISTS `hr`;
CREATE TABLE IF NOT EXISTS `hr` (
  `HRID` int NOT NULL AUTO_INCREMENT,
  `empid` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`HRID`),
  UNIQUE KEY `email` (`email`),
  KEY `empid` (`empid`)
) ;

--
-- Dumping data for table `hr`
--

INSERT INTO `hr` (`HRID`, `empid`, `email`, `password`, `name`) VALUES
(1, 1, 'jake@gmail.com', 'jake', 'Jake Darren Olan');

-- --------------------------------------------------------

--
-- Table structure for table `jobpost`
--

DROP TABLE IF EXISTS `jobpost`;
CREATE TABLE IF NOT EXISTS `jobpost` (
  `jobID` int NOT NULL AUTO_INCREMENT,
  `adminID` int NOT NULL,
  `jobType` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`jobID`),
  KEY `adminID` (`adminID`)
) ;

--
-- Dumping data for table `jobpost`
--

INSERT INTO `jobpost` (`jobID`, `adminID`, `jobType`, `department`, `description`, `requirement`, `salary`) VALUES
(4, 2, 'Professor', 'CICS', 'Description', 'Requirement', '10000.00'),
(5, 2, 'Professor', 'CICS', 'Description', 'Requirement', '21000.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbempinfo`
--

DROP TABLE IF EXISTS `tbempinfo`;
CREATE TABLE IF NOT EXISTS `tbempinfo` (
  `empid` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'parker', 'peter', 'bsit'),
(2, 'kent', 'clark', 'bscs');

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

DROP TABLE IF EXISTS `tbstudinfo`;
CREATE TABLE IF NOT EXISTS `tbstudinfo` (
  `studid` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`);

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`jobID`) REFERENCES `jobpost` (`jobID`),
  ADD CONSTRAINT `application_ibfk_2` FOREIGN KEY (`applicantID`) REFERENCES `applicant` (`applicantID`),
  ADD CONSTRAINT `application_ibfk_3` FOREIGN KEY (`hrID`) REFERENCES `hr` (`HRID`);

--
-- Constraints for table `hr`
--
ALTER TABLE `hr`
  ADD CONSTRAINT `hr_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`);

--
-- Constraints for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD CONSTRAINT `jobpost_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
