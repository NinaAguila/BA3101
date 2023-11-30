-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 08:59 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

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

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `applicantID` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `applicationID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `applicantID` int(11) NOT NULL,
  `hrID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `HRID` int(11) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobpost`
--

CREATE TABLE `jobpost` (
  `jobID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `jobType` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbadmin`
--

CREATE TABLE `tbadmin` (
  `admin_ID` int(11) NOT NULL,
  `admin_user` varchar(30) NOT NULL,
  `admin_pass` varchar(30) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`admin_ID`, `admin_user`, `admin_pass`, `empid`) VALUES
(1, 'egfewrg', 'wergre', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbborrow`
--

CREATE TABLE `tbborrow` (
  `borrow_ID` int(11) NOT NULL,
  `studid` int(11) NOT NULL,
  `equipment_quantity` int(11) NOT NULL,
  `equipment_ID` int(11) NOT NULL,
  `date_borrowed` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbborrow`
--

INSERT INTO `tbborrow` (`borrow_ID`, `studid`, `equipment_quantity`, `equipment_ID`, `date_borrowed`) VALUES
(1, 7, 2, 4, '2023-11-30'),
(2, 7, 3, 5, '2023-11-30'),
(3, 7, 1, 4, '2023-11-30'),
(4, 7, 5, 4, '2023-11-30'),
(5, 2, 1, 6, '2023-12-01');

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
-- Table structure for table `tbcoun`
--

CREATE TABLE `tbcoun` (
  `counno` varchar(50) NOT NULL,
  `counpass` varchar(255) DEFAULT NULL,
  `empid` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tbempaccount` (
  `empaccountId` int(11) NOT NULL,
  `empid` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_profile` longblob DEFAULT NULL,
  `emp_password` varchar(255) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbempinfo`
--

CREATE TABLE `tbempinfo` (
  `empid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'aguila', 'nina', 'cics'),
(7, 'De La Pena', 'Loui', 'cics'),
(8, 'Malaluan', 'Becky', 'cics'),
(9, 'Macaraig', 'Kevin', 'cics'),
(10, 'Galvero', 'Shaina', 'cics');

-- --------------------------------------------------------

--
-- Table structure for table `tbequipment`
--

CREATE TABLE `tbequipment` (
  `equipment_ID` int(11) NOT NULL,
  `equipment_name` varchar(30) NOT NULL,
  `equipment_quantity` int(11) NOT NULL,
  `equipment_description` varchar(200) NOT NULL,
  `equip_photos` blob NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `date_arrived` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`, `equip_photos`, `is_active`, `date_arrived`) VALUES
(4, 'Soccer', 2, 'qwefds', 0x2e2e2f696d616765732f696d6167652d6571702f62616c6c5f322e6a666966, 1, '2023-11-30'),
(5, 'Futsal', 7, 'asiug', 0x2e2e2f696d616765732f696d6167652d6571702f62616c6c2e6a7067, 1, '2023-11-30'),
(6, 'Evgfuyv', 4, 'fewgwrgrgre', 0x2e2e2f696d616765732f696d6167652d6571702f7177712e6a7067, 1, '2023-11-30'),
(7, 'Volleyball', 19, 'dsfvweq', 0x2e2e2f696d616765732f696d6167652d6571702f37315a6139304e4f71374c2d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-12-01'),
(8, 'Er23gttr4h', 2, '3rgre3ge', 0x2e2e2f696d616765732f696d6167652d6571702f37315a6139304e4f71374c2d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-12-01');

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
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `userID` int(11) NOT NULL,
  `userImg` longblob NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userDept` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPass` varchar(255) NOT NULL,
  `userType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employeeaccount`
--

CREATE TABLE `tbl_employeeaccount` (
  `employeeCount` int(11) NOT NULL,
  `employeeID` varchar(50) NOT NULL,
  `employeePassword` varchar(255) NOT NULL,
  `employeeEmail` varchar(255) NOT NULL,
  `employeeRole` enum('Admin','Stock In','Stock Out') DEFAULT NULL,
  `resetCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_employeeaccount`
--

INSERT INTO `tbl_employeeaccount` (`employeeCount`, `employeeID`, `employeePassword`, `employeeEmail`, `employeeRole`, `resetCode`) VALUES
(1, '21-34994', 'admin', '21-34994@g.batstate-u.edu.ph', 'Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_office`
--

CREATE TABLE `tbl_office` (
  `officeAccID` int(11) NOT NULL,
  `officeImg` longblob NOT NULL,
  `designation` varchar(255) NOT NULL,
  `officeEmail` varchar(255) NOT NULL,
  `officePass` varchar(255) NOT NULL,
  `employeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE `tbl_products` (
  `productID` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productImage` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reqhistory`
--

CREATE TABLE `tbl_reqhistory` (
  `histID` int(11) NOT NULL,
  `reqStatus` varchar(255) NOT NULL,
  `statusDate` date NOT NULL,
  `orgID` int(11) NOT NULL,
  `reqID` int(11) NOT NULL,
  `officeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_requests`
--

CREATE TABLE `tbl_requests` (
  `reqID` int(11) NOT NULL,
  `reqEventName` varchar(255) NOT NULL,
  `reqLetter` longblob NOT NULL,
  `reqEventDate` date NOT NULL,
  `reqDeadline` date NOT NULL,
  `userID` int(11) NOT NULL,
  `currentOffice` varchar(255) NOT NULL DEFAULT 'Program Chair'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

CREATE TABLE `tbl_size` (
  `sizeID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `productPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockin`
--

CREATE TABLE `tbl_stockin` (
  `stockInID` int(11) NOT NULL,
  `recordDate` timestamp NULL DEFAULT current_timestamp(),
  `employeeID` varchar(50) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `quantityIn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_stockin`
--

INSERT INTO `tbl_stockin` (`stockInID`, `recordDate`, `employeeID`, `productID`, `productSize`, `quantityIn`) VALUES
(1, '0000-00-00 00:00:00', '21-34994', 1, 'Medium', 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockout`
--

CREATE TABLE `tbl_stockout` (
  `stockOutID` int(11) NOT NULL,
  `recordDate` timestamp NULL DEFAULT current_timestamp(),
  `employeeID` varchar(50) NOT NULL,
  `productID` int(11) NOT NULL,
  `productSize` varchar(20) NOT NULL,
  `quantityOut` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbreports`
--

CREATE TABLE `tbreports` (
  `reportno` int(11) NOT NULL,
  `reporttype` varchar(255) DEFAULT NULL,
  `report` text DEFAULT NULL,
  `studno` varchar(50) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `datefiled` datetime DEFAULT NULL,
  `dateresolved` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tbreturned` (
  `return_ID` int(11) NOT NULL,
  `borrow_ID` int(11) NOT NULL,
  `returned_date` date NOT NULL,
  `studid` int(11) NOT NULL,
  `returned_quantity` int(11) NOT NULL,
  `equipment_damaged` int(11) NOT NULL,
  `equipment_missing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbreturned`
--

INSERT INTO `tbreturned` (`return_ID`, `borrow_ID`, `returned_date`, `studid`, `returned_quantity`, `equipment_damaged`, `equipment_missing`) VALUES
(1, 5, '2023-12-01', 2, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbstaff`
--

CREATE TABLE `tbstaff` (
  `staff_ID` int(11) NOT NULL,
  `staff_user` varchar(30) NOT NULL,
  `staff_pass` varchar(30) NOT NULL,
  `staff_position` varchar(30) NOT NULL,
  `empid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`staff_ID`, `staff_user`, `staff_pass`, `staff_position`, `empid`) VALUES
(4, 'rockyy', '1234mnb', 'OUT', 7),
(5, 'dorodogs', 'top', 'IN', 6),
(6, 'ftiytc', '98gyg', 'OUT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbstud`
--

CREATE TABLE `tbstud` (
  `studno` varchar(50) NOT NULL,
  `studpass` varchar(255) NOT NULL,
  `studid` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `tbstudent`
--

CREATE TABLE `tbstudent` (
  `sr_ID` int(11) NOT NULL,
  `sr_code` varchar(30) NOT NULL,
  `studid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbstudent`
--

INSERT INTO `tbstudent` (`sr_ID`, `sr_code`, `studid`) VALUES
(1, '21-32471', 1),
(2, '21-35519', 2),
(3, '21-39828', 3),
(4, '21-39105', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbstudentaccount`
--

CREATE TABLE `tbstudentaccount` (
  `studaccountid` int(11) NOT NULL,
  `studid` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_profile` longblob DEFAULT NULL,
  `student_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

CREATE TABLE `tbstudinfo` (
  `studid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit'),
(2, 'kent', 'clark', 'bscs'),
(3, 'Martin', 'Clay', 'bsit'),
(4, 'Fabellon', 'Jan Patrick', 'bsit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_User` varchar(50) NOT NULL,
  `Admin_Password` varchar(50) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tb_attendees` (
  `attendee_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_department`
--

CREATE TABLE `tb_department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `tb_event` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(255) NOT NULL,
  `event_detail` text NOT NULL,
  `event_date` date NOT NULL,
  `header_image` longblob DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_event_images`
--

CREATE TABLE `tb_event_images` (
  `image_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_guidance`
--

CREATE TABLE `tb_guidance` (
  `Guidance_ID` int(11) NOT NULL,
  `Guidance_User` varchar(50) NOT NULL,
  `Guidance_Password` varchar(50) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tb_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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

CREATE TABLE `tb_rso` (
  `rso_id` int(11) NOT NULL,
  `rso_name` varchar(255) NOT NULL,
  `rso_password` varchar(20) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `rso_email` varchar(255) NOT NULL,
  `rso_profile` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_studentacc`
--

CREATE TABLE `tb_studentacc` (
  `Student_Acc_ID` int(11) NOT NULL,
  `Student_User` varchar(50) NOT NULL,
  `Student_Password` varchar(50) NOT NULL,
  `studid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tb_studentinfo` (
  `SR_Code` varchar(25) NOT NULL,
  `Student_Year` varchar(25) NOT NULL,
  `Student_Acc_ID` int(11) NOT NULL,
  `Student_Picture` longblob DEFAULT NULL,
  `studid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `tb_violation` (
  `Violation_ID` int(11) NOT NULL,
  `Violation_Date` datetime NOT NULL,
  `Violation_Description` varchar(200) NOT NULL,
  `Violation_Status` varchar(25) NOT NULL,
  `Admin_ID` varchar(50) NOT NULL,
  `Guidance_ID` varchar(50) NOT NULL,
  `SR_Code` varchar(25) NOT NULL,
  `Violation_Offense` varchar(50) NOT NULL,
  `Violation_Penalties` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`applicantID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`applicationID`),
  ADD KEY `jobID` (`jobID`),
  ADD KEY `applicantID` (`applicantID`),
  ADD KEY `hrID` (`hrID`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`HRID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `jobpost`
--
ALTER TABLE `jobpost`
  ADD PRIMARY KEY (`jobID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`admin_ID`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `tbborrow`
--
ALTER TABLE `tbborrow`
  ADD PRIMARY KEY (`borrow_ID`),
  ADD KEY `studid` (`studid`),
  ADD KEY `equipment_ID` (`equipment_ID`);

--
-- Indexes for table `tbclient`
--
ALTER TABLE `tbclient`
  ADD PRIMARY KEY (`plate_Number`),
  ADD KEY `student_ID` (`student_ID`),
  ADD KEY `emp_ID` (`emp_ID`),
  ADD KEY `guest_ID` (`guest_ID`);

--
-- Indexes for table `tbcoun`
--
ALTER TABLE `tbcoun`
  ADD PRIMARY KEY (`counno`),
  ADD KEY `fk_tbcoun_empid` (`empid`);

--
-- Indexes for table `tbempaccount`
--
ALTER TABLE `tbempaccount`
  ADD PRIMARY KEY (`empaccountId`),
  ADD KEY `fk_empinfo_changes` (`empid`),
  ADD KEY `fk_department_emp` (`department_id`),
  ADD KEY `fk_emp_roles` (`role_id`);

--
-- Indexes for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `tbequipment`
--
ALTER TABLE `tbequipment`
  ADD PRIMARY KEY (`equipment_ID`);

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
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `tbl_employeeaccount`
--
ALTER TABLE `tbl_employeeaccount`
  ADD PRIMARY KEY (`employeeCount`),
  ADD KEY `employeeID` (`employeeID`);

--
-- Indexes for table `tbl_office`
--
ALTER TABLE `tbl_office`
  ADD PRIMARY KEY (`officeAccID`),
  ADD KEY `empID(FK)` (`employeeID`);

--
-- Indexes for table `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `tbl_reqhistory`
--
ALTER TABLE `tbl_reqhistory`
  ADD PRIMARY KEY (`histID`),
  ADD KEY `userID_FK(tbl_reqH)` (`orgID`),
  ADD KEY `reqID_FK(tbl_reqH)` (`reqID`),
  ADD KEY `officeID(tbl_reqH)` (`officeID`);

--
-- Indexes for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD PRIMARY KEY (`reqID`),
  ADD KEY `userID(tbl_req)` (`userID`);

--
-- Indexes for table `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`sizeID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `tbl_stockin`
--
ALTER TABLE `tbl_stockin`
  ADD PRIMARY KEY (`stockInID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `productSize` (`productSize`);

--
-- Indexes for table `tbl_stockout`
--
ALTER TABLE `tbl_stockout`
  ADD PRIMARY KEY (`stockOutID`),
  ADD KEY `employeeID` (`employeeID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `productSize` (`productSize`);

--
-- Indexes for table `tbreports`
--
ALTER TABLE `tbreports`
  ADD PRIMARY KEY (`reportno`),
  ADD KEY `studno` (`studno`);

--
-- Indexes for table `tbreturned`
--
ALTER TABLE `tbreturned`
  ADD PRIMARY KEY (`return_ID`),
  ADD KEY `borrow_ID` (`borrow_ID`),
  ADD KEY `studid` (`studid`);

--
-- Indexes for table `tbstaff`
--
ALTER TABLE `tbstaff`
  ADD PRIMARY KEY (`staff_ID`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `tbstud`
--
ALTER TABLE `tbstud`
  ADD PRIMARY KEY (`studno`),
  ADD KEY `fk_tbstud_studid` (`studid`);

--
-- Indexes for table `tbstudent`
--
ALTER TABLE `tbstudent`
  ADD PRIMARY KEY (`sr_ID`),
  ADD KEY `studid` (`studid`);

--
-- Indexes for table `tbstudentaccount`
--
ALTER TABLE `tbstudentaccount`
  ADD PRIMARY KEY (`studaccountid`),
  ADD KEY `fk_department_student` (`department_id`),
  ADD KEY `fk_studinfo_changes` (`studid`);

--
-- Indexes for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  ADD PRIMARY KEY (`studid`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD KEY `fk_tb_admin_empid` (`empid`);

--
-- Indexes for table `tb_attendees`
--
ALTER TABLE `tb_attendees`
  ADD PRIMARY KEY (`attendee_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `empid` (`empid`);

--
-- Indexes for table `tb_department`
--
ALTER TABLE `tb_department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `tb_event`
--
ALTER TABLE `tb_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `tb_event_images`
--
ALTER TABLE `tb_event_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `tb_guidance`
--
ALTER TABLE `tb_guidance`
  ADD PRIMARY KEY (`Guidance_ID`),
  ADD KEY `fk_tb_guidance_empid` (`empid`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `unique_role_name` (`role_name`);

--
-- Indexes for table `tb_rso`
--
ALTER TABLE `tb_rso`
  ADD PRIMARY KEY (`rso_id`),
  ADD UNIQUE KEY `unique_rso_email` (`rso_email`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `tb_studentacc`
--
ALTER TABLE `tb_studentacc`
  ADD PRIMARY KEY (`Student_Acc_ID`),
  ADD KEY `fk_tb_studentacc_studid` (`studid`);

--
-- Indexes for table `tb_studentinfo`
--
ALTER TABLE `tb_studentinfo`
  ADD PRIMARY KEY (`SR_Code`),
  ADD KEY `FK_Student_Acc` (`Student_Acc_ID`),
  ADD KEY `FK_studid` (`studid`);

--
-- Indexes for table `tb_violation`
--
ALTER TABLE `tb_violation`
  ADD PRIMARY KEY (`Violation_ID`),
  ADD KEY `FK_StudentInfo_Violation` (`SR_Code`),
  ADD KEY `FK_Admin_Violation` (`Admin_ID`),
  ADD KEY `FK_Guidance_Violation` (`Guidance_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant`
--
ALTER TABLE `applicant`
  MODIFY `applicantID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `application`
--
ALTER TABLE `application`
  MODIFY `applicationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr`
--
ALTER TABLE `hr`
  MODIFY `HRID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobpost`
--
ALTER TABLE `jobpost`
  MODIFY `jobID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbadmin`
--
ALTER TABLE `tbadmin`
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbborrow`
--
ALTER TABLE `tbborrow`
  MODIFY `borrow_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbempaccount`
--
ALTER TABLE `tbempaccount`
  MODIFY `empaccountId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbequipment`
--
ALTER TABLE `tbequipment`
  MODIFY `equipment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbguestinfo`
--
ALTER TABLE `tbguestinfo`
  MODIFY `guest_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_employeeaccount`
--
ALTER TABLE `tbl_employeeaccount`
  MODIFY `employeeCount` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_office`
--
ALTER TABLE `tbl_office`
  MODIFY `officeAccID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_reqhistory`
--
ALTER TABLE `tbl_reqhistory`
  MODIFY `histID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  MODIFY `reqID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `sizeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_stockin`
--
ALTER TABLE `tbl_stockin`
  MODIFY `stockInID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_stockout`
--
ALTER TABLE `tbl_stockout`
  MODIFY `stockOutID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbreports`
--
ALTER TABLE `tbreports`
  MODIFY `reportno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbreturned`
--
ALTER TABLE `tbreturned`
  MODIFY `return_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbstaff`
--
ALTER TABLE `tbstaff`
  MODIFY `staff_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbstudent`
--
ALTER TABLE `tbstudent`
  MODIFY `sr_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbstudentaccount`
--
ALTER TABLE `tbstudentaccount`
  MODIFY `studaccountid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_attendees`
--
ALTER TABLE `tb_attendees`
  MODIFY `attendee_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_department`
--
ALTER TABLE `tb_department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_event`
--
ALTER TABLE `tb_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_event_images`
--
ALTER TABLE `tb_event_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_rso`
--
ALTER TABLE `tb_rso`
  MODIFY `rso_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_studentacc`
--
ALTER TABLE `tb_studentacc`
  MODIFY `Student_Acc_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_violation`
--
ALTER TABLE `tb_violation`
  MODIFY `Violation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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

--
-- Constraints for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD CONSTRAINT `tbadmin_ibfk_1` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`);

--
-- Constraints for table `tbclient`
--
ALTER TABLE `tbclient`
  ADD CONSTRAINT `empID` FOREIGN KEY (`emp_ID`) REFERENCES `tbempinfo` (`empid`),
  ADD CONSTRAINT `guestID` FOREIGN KEY (`guest_ID`) REFERENCES `tbguestinfo` (`guest_ID`),
  ADD CONSTRAINT `student_ID` FOREIGN KEY (`student_ID`) REFERENCES `tbstudinfo` (`studid`);

--
-- Constraints for table `tbempaccount`
--
ALTER TABLE `tbempaccount`
  ADD CONSTRAINT `fk_department_emp` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_emp_roles` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empinfo_changes` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tblogs`
--
ALTER TABLE `tblogs`
  ADD CONSTRAINT `plateNo` FOREIGN KEY (`plate_Number`) REFERENCES `tbclient` (`plate_Number`);

--
-- Constraints for table `tbl_office`
--
ALTER TABLE `tbl_office`
  ADD CONSTRAINT `empID(FK)` FOREIGN KEY (`employeeID`) REFERENCES `tbempinfo` (`empid`);

--
-- Constraints for table `tbl_reqhistory`
--
ALTER TABLE `tbl_reqhistory`
  ADD CONSTRAINT `officeID(tbl_reqH)` FOREIGN KEY (`officeID`) REFERENCES `tbl_office` (`officeAccID`),
  ADD CONSTRAINT `reqID_FK(tbl_reqH)` FOREIGN KEY (`reqID`) REFERENCES `tbl_requests` (`reqID`),
  ADD CONSTRAINT `userID_FK(tbl_reqH)` FOREIGN KEY (`orgID`) REFERENCES `tbl_account` (`userID`);

--
-- Constraints for table `tbl_requests`
--
ALTER TABLE `tbl_requests`
  ADD CONSTRAINT `userID(tbl_req)` FOREIGN KEY (`userID`) REFERENCES `tbl_account` (`userID`);

--
-- Constraints for table `tbstudentaccount`
--
ALTER TABLE `tbstudentaccount`
  ADD CONSTRAINT `fk_department_student` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_studinfo_changes` FOREIGN KEY (`studid`) REFERENCES `tbstudinfo` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_attendees`
--
ALTER TABLE `tb_attendees`
  ADD CONSTRAINT `fk_employee_attendee` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_attendee` FOREIGN KEY (`event_id`) REFERENCES `tb_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_student_attendee` FOREIGN KEY (`student_id`) REFERENCES `tbstudinfo` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_event`
--
ALTER TABLE `tb_event`
  ADD CONSTRAINT `fk_event_department` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_event_images`
--
ALTER TABLE `tb_event_images`
  ADD CONSTRAINT `fk_image_event` FOREIGN KEY (`event_id`) REFERENCES `tb_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rso`
--
ALTER TABLE `tb_rso`
  ADD CONSTRAINT `fk_rso_department` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
