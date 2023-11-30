-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 23, 2023 at 02:35 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

DROP TABLE IF EXISTS `tbadmin`;
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `adminno` varchar(50) NOT NULL,
  `adminpass` varchar(255) DEFAULT NULL,
  `empid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminno`),
  KEY `fk_tbadmin_empid` (`empid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`adminno`, `adminpass`, `empid`) VALUES
('1', 'adminpass1', '1'),
('2', 'adminpass2', '2'),
('3', 'adminpass3', '3'),
('4', 'adminpass4', '4'),
('5', 'adminpass5', '5');

-- --------------------------------------------------------

--
-- Table structure for table `tbcoun`
--

DROP TABLE IF EXISTS `tbcoun`;
CREATE TABLE IF NOT EXISTS `tbcoun` (
  `counno` varchar(50) NOT NULL,
  `counpass` varchar(255) DEFAULT NULL,
  `empid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`counno`),
  KEY `fk_tbcoun_empid` (`empid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbcoun`
--

INSERT INTO `tbcoun` (`counno`, `counpass`, `empid`) VALUES
('1', 'counselorpass1', '1'),
('2', 'counselorpass2', '2'),
('3', 'counselorpass3', '3'),
('4', 'counselorpass4', '4'),
('5', 'counselorpass5', '5');

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
(1, 'aguila', 'nina', 'cics');

-- --------------------------------------------------------

--
-- Table structure for table `tbreports`
--

DROP TABLE IF EXISTS `tbreports`;
CREATE TABLE IF NOT EXISTS `tbreports` (
  `reportno` int NOT NULL AUTO_INCREMENT,
  `reporttype` varchar(255) DEFAULT NULL,
  `report` text,
  `studno` varchar(50) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `datefiled` datetime DEFAULT NULL,
  `dateresolved` datetime DEFAULT NULL,
  PRIMARY KEY (`reportno`),
  KEY `studno` (`studno`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbreports`
--

INSERT INTO `tbreports` (`reportno`, `reporttype`, `report`, `studno`, `status`, `remarks`, `datefiled`, `dateresolved`) VALUES
(1, 'Bullying', 'I was bullied by a blockmate.', '21-39325', 'Pending', NULL, '2023-11-22 20:45:44', NULL),
(2, 'Academic Appeal', 'I received a failing grade in my class, is there something I can do about it?', '21-39325', 'Pending', NULL, '2023-11-22 20:46:10', NULL),
(3, 'Harassment & Discrimination', 'I was harassed.', '21-39325', 'Pending', NULL, '2023-11-22 20:46:44', NULL),
(4, 'Course Availability & Scheduling', 'No professor in 1 subject.', '21-39325', 'Resolved', 'Done.', '2023-11-22 20:46:55', '2023-11-22 20:49:14'),
(5, 'Harassment & Discrimination', 'I was harassed.', '21-39325', 'Pending', NULL, '2023-11-22 20:47:08', NULL),
(6, 'Course Availability & Scheduling', 'No professor in 1 subject.', '21-30073', 'In Progress', 'Will look into this, thanks.', '2023-11-22 20:48:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbstud`
--

DROP TABLE IF EXISTS `tbstud`;
CREATE TABLE IF NOT EXISTS `tbstud` (
  `studno` varchar(50) NOT NULL,
  `studpass` varchar(255) NOT NULL,
  `studid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studno`),
  KEY `fk_tbstud_studid` (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstud`
--

INSERT INTO `tbstud` (`studno`, `studpass`, `studid`) VALUES
('21-34780', 'bonjlaygo', '2134780'),
('21-39414', 'ivanrubion', '2139414'),
('21-30073', 'belletrayfalgar', '2130073'),
('21-39325', 'johnronaldlopez', '2139325'),
('21-31054', 'sethtada', '2131054');

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
) ENGINE=MyISAM AUTO_INCREMENT=2139415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(2139325, 'Lopez', 'John Ronald', 'BSIT-BA-3101'),
(2130073, 'Trayfalgar', 'Belle Colleen', 'BSIT-BA-3101'),
(2131054, 'Tada', 'Seth Aldous', 'BSIT-BA-3101'),
(2139414, 'Rubion', 'Ivan Gabriel', 'BSIT-BA-3101'),
(2134780, 'Laygo', 'Bonjohn Benedict', 'BSIT-BA-3101');
COMMIT;

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
-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

DROP TABLE IF EXISTS `tbl_account`;
CREATE TABLE IF NOT EXISTS `tbl_account` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userImg` longblob NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userDept` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `userType` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_office`
--

DROP TABLE IF EXISTS `tbl_office`;
CREATE TABLE IF NOT EXISTS `tbl_office` (
  `officeAccID` int NOT NULL AUTO_INCREMENT,
  `officeImg` longblob NOT NULL,
  `designation` varchar(255) NOT NULL,
  `officeEmail` varchar(255) NOT NULL,
  `officePass` varchar(255) NOT NULL,
  `employeeID` int NOT NULL,
  PRIMARY KEY (`officeAccID`),
  KEY `empID(FK)` (`employeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `currentOffice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'Program Chair',
  PRIMARY KEY (`reqID`),
  KEY `userID(tbl_req)` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

DROP TABLE IF EXISTS `tbstudinfo`;
CREATE TABLE IF NOT EXISTS `tbstudinfo` (
  `studid` int NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_office`
--
ALTER TABLE `tbl_office`
  ADD CONSTRAINT `empID(FK)` FOREIGN KEY (`employeeID`) REFERENCES `tbempinfo` (`empid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_reqhistory`
--
ALTER TABLE `tbl_reqhistory`
  ADD CONSTRAINT `officeID(tbl_reqH)` FOREIGN KEY (`officeID`) REFERENCES `tbl_office` (`officeAccID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
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
-- --------------------------------------------------------

--
-- Table structure for table `tbclient`
--

CREATE TABLE `tbclient` (
  `plate_Number` varchar(50) NOT NULL,
  `vehicle_Type` char(50) DEFAULT NULL,
  `student_ID` int(11) DEFAULT NULL,
  `emp_ID` int(11) DEFAULT NULL,
  `guest_ID` int(11) DEFAULT NULL,
  `Contact` varchar(11) NOT NULL,
  `type` char(50) DEFAULT NULL,
  `fileName` varchar(50) NOT NULL,
  `filePath` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

CREATE TABLE `tbadmin` (
  `emp_ID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbguestinfo`
--

CREATE TABLE `tbguestinfo` (
  `guest_ID` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblogs`
--

CREATE TABLE `tblogs` (
  `plate_Number` varchar(50) NOT NULL,
  `recordDate` date DEFAULT NULL,
  `time_In` time DEFAULT NULL,
  `time_Out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbstaff`
--

CREATE TABLE `tbstaff` (
  `emp_ID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- --------------------------------------------------------
--
-- Indexes for dumped tables
--
--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD KEY `emp_ID` (`emp_ID`);

--
-- Indexes for table `tbclient`
--
ALTER TABLE `tbclient`
  ADD PRIMARY KEY (`plate_Number`),
  ADD KEY `student_ID` (`student_ID`),
  ADD KEY `emp_ID` (`emp_ID`),
  ADD KEY `guest_ID` (`guest_ID`);

--
-- Indexes for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `tbguestinfo`
--
ALTER TABLE `tbguestinfo`
  ADD PRIMARY KEY (`guest_ID`);

--
-- Indexes for table `tblogs`
--
ALTER TABLE `tblogs`
  ADD KEY `plate_Number` (`plate_Number`);

--
-- Indexes for table `tbstaff`
--
ALTER TABLE `tbstaff`
  ADD KEY `emp_ID` (`emp_ID`);

--
-- Indexes for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  ADD PRIMARY KEY (`studid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbguestinfo`
--
ALTER TABLE `tbguestinfo`
  MODIFY `guest_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD CONSTRAINT `empID(admin)` FOREIGN KEY (`emp_ID`) REFERENCES `tbempinfo` (`empid`);

--
-- Constraints for table `tbclient`
--
ALTER TABLE `tbclient`
  ADD CONSTRAINT `empID` FOREIGN KEY (`emp_ID`) REFERENCES `tbempinfo` (`empid`),
  ADD CONSTRAINT `guestID` FOREIGN KEY (`guest_ID`) REFERENCES `tbguestinfo` (`guest_ID`),
  ADD CONSTRAINT `student_ID` FOREIGN KEY (`student_ID`) REFERENCES `tbstudinfo` (`studid`);

--
-- Constraints for table `tblogs`
--
ALTER TABLE `tblogs`
  ADD CONSTRAINT `plateNo` FOREIGN KEY (`plate_Number`) REFERENCES `tbclient` (`plate_Number`);

--
-- Constraints for table `tbstaff`
--
ALTER TABLE `tbstaff`
  ADD CONSTRAINT `empID(staff)` FOREIGN KEY (`emp_ID`) REFERENCES `tbempinfo` (`empid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
