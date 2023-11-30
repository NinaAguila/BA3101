-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Oct 23, 2023 at 08:29 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit'),
(2, 'kent', 'clark', 'bscs');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- --------------------------------------------------------

-- Group-1
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
=======
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
(1, 'Cerezo', 'Ezekiel Eisen', 'CICS');

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
--- Group-4
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
