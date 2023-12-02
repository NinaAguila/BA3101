-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 01, 2023 at 06:37 AM
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

DROP TABLE IF EXISTS `tbadmin`;
CREATE TABLE IF NOT EXISTS `tbadmin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `adminno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `adminpass` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empid` int NOT NULL,
  PRIMARY KEY (`adminID`),
  KEY `empid` (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`adminID`, `adminno`, `adminpass`, `empid`) VALUES
(4, 'Cruzy', 'oisdahfeuw', 2),
(5, 'heyo', 'dgfregher', 4),
(6, '1', 'adminpass1', 0),
(7, '2', 'adminpass2', 0);

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
-- Table structure for table `tbclient`
--

DROP TABLE IF EXISTS `tbclient`;
CREATE TABLE IF NOT EXISTS `tbclient` (
  `plate_Number` varchar(50) NOT NULL,
  `vehicle_Type` char(50) DEFAULT NULL,
  `student_ID` int DEFAULT NULL,
  `emp_ID` int DEFAULT NULL,
  `guest_ID` int DEFAULT NULL,
  `Contact` varchar(11) NOT NULL,
  `type` char(50) DEFAULT NULL,
  `fileName` varchar(50) NOT NULL,
  `filePath` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
-- Table structure for table `tbempaccount`
--

DROP TABLE IF EXISTS `tbempaccount`;
CREATE TABLE IF NOT EXISTS `tbempaccount` (
  `empaccountId` int NOT NULL AUTO_INCREMENT,
  `empid` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_profile` longblob,
  `emp_password` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`empaccountId`),
  KEY `fk_empinfo_changes` (`empid`),
  KEY `fk_department_emp` (`department_id`),
  KEY `fk_emp_roles` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `tbguestinfo`
--

DROP TABLE IF EXISTS `tbguestinfo`;
CREATE TABLE IF NOT EXISTS `tbguestinfo` (
  `guest_ID` int NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tblogs`
--

DROP TABLE IF EXISTS `tblogs`;
CREATE TABLE IF NOT EXISTS `tblogs` (
  `plate_Number` varchar(50) NOT NULL,
  `recordDate` date DEFAULT NULL,
  `time_In` time DEFAULT NULL,
  `time_Out` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`userID`, `userImg`, `userName`, `userDept`, `userEmail`, `userPass`, `userType`) VALUES
(7, '', 'Tech IS', 'CICS', 'techis@gmail.com', 'asd', 'organization');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employeeaccount`
--

DROP TABLE IF EXISTS `tbl_employeeaccount`;
CREATE TABLE IF NOT EXISTS `tbl_employeeaccount` (
  `employeeCount` int NOT NULL AUTO_INCREMENT,
  `employeeID` varchar(50) NOT NULL,
  `employeePassword` varchar(255) NOT NULL,
  `employeeEmail` varchar(255) NOT NULL,
  `employeeRole` enum('Admin','Stock In','Stock Out') DEFAULT NULL,
  `resetCode` int DEFAULT NULL,
  PRIMARY KEY (`employeeCount`),
  KEY `employeeID` (`employeeID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_employeeaccount`
--

INSERT INTO `tbl_employeeaccount` (`employeeCount`, `employeeID`, `employeePassword`, `employeeEmail`, `employeeRole`, `resetCode`) VALUES
(1, '21-34994', 'admin', '21-34994@g.batstate-u.edu.ph', 'Admin', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_office`
--

INSERT INTO `tbl_office` (`officeAccID`, `officeImg`, `designation`, `officeEmail`, `officePass`, `employeeID`) VALUES
(6, '', 'Program Chair', 'progchair@gmail.com', 'asd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `productImage` blob NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_requests`
--

INSERT INTO `tbl_requests` (`reqID`, `reqEventName`, `reqLetter`, `reqEventDate`, `reqDeadline`, `userID`, `currentOffice`) VALUES
(12, 'hi', 0x255044462d312e340a25d3ebe9e10a312030206f626a0a3c3c2f5469746c65202843494353204f7269656e746174696f6e290a2f50726f64756365722028536b69612f504446206d31323120476f6f676c6520446f63732052656e6465726572293e3e0a656e646f626a0a332030206f626a0a3c3c2f636120310a2f424d202f4e6f726d616c3e3e0a656e646f626a0a342030206f626a0a3c3c2f4c656e6774682038343e3e2073747265616d0a3120302030202d3120302037393220636d0a710a2e373520302030202e37352030203020636d0a31203120312052472031203120312072670a2f47332067730a3020302038313620313035362072650a660a510a0a656e6473747265616d0a656e646f626a0a322030206f626a0a3c3c2f54797065202f506167650a2f5265736f7572636573203c3c2f50726f63536574205b2f504446202f54657874202f496d61676542202f496d61676543202f496d616765495d0a2f457874475374617465203c3c2f47332033203020523e3e3e3e0a2f4d65646961426f78205b30203020363132203739325d0a2f436f6e74656e74732034203020520a2f537472756374506172656e747320300a2f506172656e742035203020523e3e0a656e646f626a0a352030206f626a0a3c3c2f54797065202f50616765730a2f436f756e7420310a2f4b696473205b32203020525d3e3e0a656e646f626a0a362030206f626a0a3c3c2f54797065202f436174616c6f670a2f50616765732035203020523e3e0a656e646f626a0a787265660a3020370a303030303030303030302036353533352066200a30303030303030303135203030303030206e200a30303030303030323736203030303030206e200a30303030303030313037203030303030206e200a30303030303030313434203030303030206e200a30303030303030343634203030303030206e200a30303030303030353139203030303030206e200a747261696c65720a3c3c2f53697a6520370a2f526f6f742036203020520a2f496e666f2031203020523e3e0a7374617274787265660a3536360a2525454f460a, '2023-12-23', '2023-12-16', 7, 'Program Chair');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

DROP TABLE IF EXISTS `tbl_size`;
CREATE TABLE IF NOT EXISTS `tbl_size` (
  `sizeID` int NOT NULL AUTO_INCREMENT,
  `productID` int NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sizeID`),
  KEY `productID` (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockin`
--

DROP TABLE IF EXISTS `tbl_stockin`;
CREATE TABLE IF NOT EXISTS `tbl_stockin` (
  `stockInID` int NOT NULL AUTO_INCREMENT,
  `recordDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `employeeID` varchar(50) NOT NULL,
  `productID` int NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `quantityIn` int NOT NULL,
  PRIMARY KEY (`stockInID`),
  KEY `employeeID` (`employeeID`),
  KEY `productID` (`productID`),
  KEY `productSize` (`productSize`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_stockin`
--

INSERT INTO `tbl_stockin` (`stockInID`, `recordDate`, `employeeID`, `productID`, `productSize`, `quantityIn`) VALUES
(1, '0000-00-00 00:00:00', '21-34994', 1, 'Medium', 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockout`
--

DROP TABLE IF EXISTS `tbl_stockout`;
CREATE TABLE IF NOT EXISTS `tbl_stockout` (
  `stockOutID` int NOT NULL AUTO_INCREMENT,
  `recordDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `employeeID` varchar(50) NOT NULL,
  `productID` int NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `quantityOut` int NOT NULL,
  PRIMARY KEY (`stockOutID`),
  KEY `employeeID` (`employeeID`),
  KEY `productID` (`productID`),
  KEY `productSize` (`productSize`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `tbstudentaccount`
--

DROP TABLE IF EXISTS `tbstudentaccount`;
CREATE TABLE IF NOT EXISTS `tbstudentaccount` (
  `studaccountid` int NOT NULL AUTO_INCREMENT,
  `studid` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_profile` longblob,
  `student_password` varchar(255) NOT NULL,
  PRIMARY KEY (`studaccountid`),
  KEY `fk_department_student` (`department_id`),
  KEY `fk_studinfo_changes` (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `sr_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=2139415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`, `sr_code`) VALUES
(2139414, 'Rubion', 'Ivan Gabriel', 'BSIT-BA-3101', NULL),
(2131054, 'Tada', 'Seth Aldous', 'BSIT-BA-3101', NULL),
(2130073, 'Trayfalgar', 'Belle Colleen', 'BSIT-BA-3101', NULL),
(2139325, 'Lopez', 'John Ronald', 'BSIT-BA-3101', NULL),
(2134780, 'Laygo', 'Bonjohn Benedict', 'BSIT-BA-3101', NULL),
(1, 'parker', 'peter', 'bsit', '21-39032'),
(2, 'kent', 'clark', 'bscs', '29-76854'),
(3, 'Valencia', 'Arnold', 'bscs', '21-34256'),
(4, 'Reyes', 'Marvin', 'bsit', '23-98765'),
(5, 'Dela Cruz', 'Leomar', 'bsba', '15-98126'),
(6, 'manalo', 'zeus', 'bsit', '21-39828'),
(7, 'Macalla', 'Dorothy', 'bsit', '21-32471'),
(8, 'De Chavez', 'Jhuncen', 'bsit', '21-35519');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `Admin_ID` int NOT NULL,
  `Admin_User` varchar(50) NOT NULL,
  `Admin_Password` varchar(50) NOT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`),
  KEY `fk_tb_admin_empid` (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`Admin_ID`, `Admin_User`, `Admin_Password`, `empid`) VALUES
(1, 'adm_user', 'adm_pass', 1),
(16, 'testadm', 'testadm', 16);

-- --------------------------------------------------------

--
-- Table structure for table `tb_attendees`
--

DROP TABLE IF EXISTS `tb_attendees`;
CREATE TABLE IF NOT EXISTS `tb_attendees` (
  `attendee_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`attendee_id`),
  KEY `event_id` (`event_id`),
  KEY `student_id` (`student_id`),
  KEY `empid` (`empid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_department`
--

DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE IF NOT EXISTS `tb_department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_department`
--

INSERT INTO `tb_department` (`department_id`, `department_name`) VALUES
(1, 'CICS'),
(2, 'CABE'),
(3, 'CAS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_event`
--

DROP TABLE IF EXISTS `tb_event`;
CREATE TABLE IF NOT EXISTS `tb_event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `event_title` varchar(255) NOT NULL,
  `event_detail` text NOT NULL,
  `event_date` date NOT NULL,
  `header_image` longblob,
  `department_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `department_id` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_event_images`
--

DROP TABLE IF EXISTS `tb_event_images`;
CREATE TABLE IF NOT EXISTS `tb_event_images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `event_id` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_guidance`
--

DROP TABLE IF EXISTS `tb_guidance`;
CREATE TABLE IF NOT EXISTS `tb_guidance` (
  `Guidance_ID` int NOT NULL,
  `Guidance_User` varchar(50) NOT NULL,
  `Guidance_Password` varchar(50) NOT NULL,
  `empid` int DEFAULT NULL,
  PRIMARY KEY (`Guidance_ID`),
  KEY `fk_tb_guidance_empid` (`empid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_guidance`
--

INSERT INTO `tb_guidance` (`Guidance_ID`, `Guidance_User`, `Guidance_Password`, `empid`) VALUES
(1, 'gui_user', 'gui_pass', 2),
(17, 'testgui', 'testgui', 17);

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE IF NOT EXISTS `tb_roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `unique_role_name` (`role_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rso`
--

DROP TABLE IF EXISTS `tb_rso`;
CREATE TABLE IF NOT EXISTS `tb_rso` (
  `rso_id` int NOT NULL AUTO_INCREMENT,
  `rso_name` varchar(50) NOT NULL,
  `rso_password` varchar(20) NOT NULL,
  `department_id` int DEFAULT NULL,
  `rso_email` varchar(50) NOT NULL,
  `rso_profile` longblob,
  PRIMARY KEY (`rso_id`),
  UNIQUE KEY `unique_rso_email` (`rso_email`),
  KEY `department_id` (`department_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentacc`
--

DROP TABLE IF EXISTS `tb_studentacc`;
CREATE TABLE IF NOT EXISTS `tb_studentacc` (
  `Student_Acc_ID` int NOT NULL AUTO_INCREMENT,
  `Student_User` varchar(50) NOT NULL,
  `Student_Password` varchar(50) NOT NULL,
  `studid` int DEFAULT NULL,
  PRIMARY KEY (`Student_Acc_ID`),
  KEY `fk_tb_studentacc_studid` (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_studentacc`
--

INSERT INTO `tb_studentacc` (`Student_Acc_ID`, `Student_User`, `Student_Password`, `studid`) VALUES
(1, 'test_user', 'test_pass', 1),
(2, 'raz', 'raz_pass', 2),
(3, 'solis', 'solis_pass', 3),
(4, 'niel', 'niel_pass', 4),
(5, 'alvin', 'alvin_pass', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentinfo`
--

DROP TABLE IF EXISTS `tb_studentinfo`;
CREATE TABLE IF NOT EXISTS `tb_studentinfo` (
  `SR_Code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Student_Year` varchar(25) NOT NULL,
  `Student_Acc_ID` int NOT NULL,
  `Student_Picture` longblob,
  `studid` int DEFAULT NULL,
  PRIMARY KEY (`SR_Code`),
  KEY `FK_Student_Acc` (`Student_Acc_ID`),
  KEY `FK_studid` (`studid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_studentinfo`
--

INSERT INTO `tb_studentinfo` (`SR_Code`, `Student_Year`, `Student_Acc_ID`, `Student_Picture`, `studid`) VALUES
('21-20002', '3rd year', 3, NULL, 3),
('21-20003', '3rd year', 4, NULL, 4),
('21-20004', '3rd year', 5, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_violation`
--

DROP TABLE IF EXISTS `tb_violation`;
CREATE TABLE IF NOT EXISTS `tb_violation` (
  `Violation_ID` int NOT NULL AUTO_INCREMENT,
  `Violation_Date` datetime NOT NULL,
  `Violation_Description` varchar(200) NOT NULL,
  `Violation_Status` varchar(25) NOT NULL,
  `Admin_ID` varchar(50) NOT NULL,
  `Guidance_ID` varchar(50) NOT NULL,
  `SR_Code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Violation_Offense` varchar(50) NOT NULL,
  `Violation_Penalties` varchar(250) NOT NULL,
  PRIMARY KEY (`Violation_ID`),
  KEY `FK_StudentInfo_Violation` (`SR_Code`),
  KEY `FK_Admin_Violation` (`Admin_ID`),
  KEY `FK_Guidance_Violation` (`Guidance_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_violation`
--

INSERT INTO `tb_violation` (`Violation_ID`, `Violation_Date`, `Violation_Description`, `Violation_Status`, `Admin_ID`, `Guidance_ID`, `SR_Code`, `Violation_Offense`, `Violation_Penalties`) VALUES
(1, '2023-07-06 09:46:08', 'Wearing Earing ', 'Done', '1', '1', '21-20000', 'Minor', '5 days suspension'),
(4, '2023-08-12 09:56:23', 'Not in proper uniform', 'pending ', '1', '1', '21-20001', 'Minor', '3 days suspension'),
(5, '2023-08-20 09:58:34', 'Not in a proper haircut', 'Done', '1', '1', '21-20002', 'Major', '2 days community service'),
(6, '2023-09-02 10:00:09', 'Not in a proper uniform', 'pending ', '1', '1', '21-20003', 'Minor', '3 days community service'),
(7, '2023-10-02 10:01:04', 'No ID', 'pending ', '1', '1', '21-20004', 'Major', 'NBA draft for kick out');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_office`
--
ALTER TABLE `tbl_office`
  ADD CONSTRAINT `empID` FOREIGN KEY (`employeeID`) REFERENCES `tbempinfo` (`empid`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_reqhistory`
--
ALTER TABLE `tbl_reqhistory`
  ADD CONSTRAINT `officeID` FOREIGN KEY (`officeID`) REFERENCES `tbl_office` (`officeAccID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orgID` FOREIGN KEY (`orgID`) REFERENCES `tbl_account` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reqID` FOREIGN KEY (`reqID`) REFERENCES `tbl_requests` (`reqID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `tbl_account` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

DELIMITER $$
--
-- Events
--
DROP EVENT IF EXISTS `update_event_status`$$
CREATE DEFINER=`root`@`localhost` EVENT `update_event_status` ON SCHEDULE EVERY 1 SECOND STARTS '2023-11-20 12:35:58' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE `tb_event` SET `status` = 'upcoming' WHERE `event_date` > CURDATE();
    UPDATE `tb_event` SET `status` = 'ongoing' WHERE `event_date` = CURDATE();
    UPDATE `tb_event` SET `status` = 'ended' WHERE `event_date` < CURDATE();
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
