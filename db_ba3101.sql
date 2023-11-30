-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2023 at 08:38 AM
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
-- Database: `db_ba3101a`
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbborrow`
--

INSERT INTO `tbborrow` (`borrow_ID`, `studid`, `equipment_quantity`, `equipment_ID`, `date_borrowed`) VALUES
(1, 7, 2, 4, '2023-11-30'),
(2, 7, 3, 5, '2023-11-30'),
(3, 7, 1, 4, '2023-11-30'),
(4, 7, 5, 4, '2023-11-30');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`, `equip_photos`, `is_active`, `date_arrived`) VALUES
(4, 'Soccer', 2, 'qwefds', 0x2e2e2f696d616765732f696d6167652d6571702f62616c6c5f322e6a666966, 1, '2023-11-30'),
(6, 'Evgfuyv', 2, 'fewgwrgrgre', 0x2e2e2f696d616765732f696d6167652d6571702f7177712e6a7067, 1, '2023-11-30'),
(5, 'Futsal', 7, 'asiug', 0x2e2e2f696d616765732f696d6167652d6571702f62616c6c2e6a7067, 1, '2023-11-30');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`staff_ID`, `staff_user`, `staff_pass`, `staff_position`, `empid`) VALUES
(1, 'Marky', 'poiuy', 'OUT', 2),
(2, 'gelapeloramas', '1234mnb', 'IN', 4),
(3, 'gelapeloramas', '1234mnb', 'IN', 4),
(4, 'rockyy', '1234mnb', 'OUT', 3),
(5, 'dorodogs', 'top', 'IN', 6),
(6, 'ftiytc', '98gyg', 'OUT', 1),
(7, 'dthrth', 'rtsjsrt', 'OUT', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbstudent`
--

DROP TABLE IF EXISTS `tbstudent`;
CREATE TABLE IF NOT EXISTS `tbstudent` (
  `sr_ID` int NOT NULL AUTO_INCREMENT,
  `sr_code` varchar(30) NOT NULL,
  `studid` int NOT NULL,
  PRIMARY KEY (`sr_ID`),
  KEY `studid` (`studid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbstudent`
--

INSERT INTO `tbstudent` (`sr_ID`, `sr_code`, `studid`) VALUES
(1, '21-32471', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tb_department`
--

CREATE TABLE `tb_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
);

--
-- Dumping data for table `tb_department`
--

INSERT INTO `tb_department` (`department_id`, `department_name`) VALUES
(1, 'CICS'),
(2, 'CABE'),
(3, 'CAS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `unique_role_name` (`role_name`)
);


--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `tbempaccount`
--

CREATE TABLE `tbempaccount` (
  `empaccountId` int(11) NOT NULL AUTO_INCREMENT,
  `empid` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_profile` longblob DEFAULT NULL,
  `emp_password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`empaccountId`),
  KEY `fk_empinfo_changes` (`empid`),
  KEY `fk_department_emp` (`department_id`),
  KEY `fk_emp_roles` (`role_id`),
  CONSTRAINT `fk_department_emp` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_emp_roles` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_empinfo_changes` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE
);

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
-- Table structure for table `tbstudentaccount`
--

CREATE TABLE `tbstudentaccount` (
  `studaccountid` int(11) NOT NULL AUTO_INCREMENT,
  `studid` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_profile` longblob DEFAULT NULL,
  `student_password` varchar(255) NOT NULL,
  PRIMARY KEY (`studaccountid`),
  KEY `fk_department_student` (`department_id`),
  CONSTRAINT `fk_studinfo_changes` FOREIGN KEY (`studid`) REFERENCES `tbstudinfo` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_department_student` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE
);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rso`
--

CREATE TABLE `tb_rso` (
  `rso_id` int(11) NOT NULL AUTO_INCREMENT,
  `rso_name` varchar(255) NOT NULL,
  `rso_password` varchar(20) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `rso_email` varchar(255) NOT NULL,
  `rso_profile` longblob DEFAULT NULL,
  PRIMARY KEY (`rso_id`),
  UNIQUE KEY `unique_rso_email` (`rso_email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `fk_rso_department` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- --------------------------------------------------------

--
-- Table structure for table `tb_event`
--

CREATE TABLE `tb_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(255) NOT NULL,
  `event_detail` text NOT NULL,
  `event_date` date NOT NULL,
  `header_image` longblob DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `fk_event_department` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- --------------------------------------------------------

--
-- Table structure for table `tb_event_images`
--

CREATE TABLE `tb_event_images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `fk_image_event` FOREIGN KEY (`event_id`) REFERENCES `tb_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- --------------------------------------------------------

--
-- Table structure for table `tb_attendees`
--

CREATE TABLE `tb_attendees` (
  `attendee_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL,
  PRIMARY KEY (`attendee_id`),
  KEY `event_id` (`event_id`),
  KEY `student_id` (`student_id`),
  KEY `empid` (`empid`),
  CONSTRAINT `fk_event_attendee` FOREIGN KEY (`event_id`) REFERENCES `tb_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_attendee` FOREIGN KEY (`student_id`) REFERENCES `tbstudinfo` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_employee_attendee` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE
);


DELIMITER $$
--
-- Events
--
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
