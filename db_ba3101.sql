-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2023 at 02:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `tbempaccount`
--

CREATE TABLE `tbempaccount` (
  `empid` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_profile` longblob DEFAULT NULL,
  `emp_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbempinfo`
--

CREATE TABLE `tbempinfo` (
  `empid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'aguila', 'nina', 'cics');

-- --------------------------------------------------------

--
-- Table structure for table `tbstudentaccount`
--

CREATE TABLE `tbstudentaccount` (
  `studid` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_profile` longblob DEFAULT NULL,
  `student_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbstudentaccount`
--

INSERT INTO `tbstudentaccount` (`studid`, `department_id`, `student_email`, `student_profile`, `student_password`) VALUES
(2, 2, 'kent@gmail.com', NULL, '123');

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

CREATE TABLE `tbstudinfo` (
  `studid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit'),
(2, 'kent', 'clark', 'bscs'),
(3, 'morales', 'verlon', 'bsit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_ID` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(20) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_profile` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_ID`, `admin_name`, `admin_password`, `admin_email`, `admin_profile`) VALUES
(1, 'admin', '123', 'admin@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_attendees`
--

CREATE TABLE `tb_attendees` (
  `attendee_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `empid` int(11) DEFAULT NULL,
  `rso_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_department`
--

CREATE TABLE `tb_department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_department`
--

INSERT INTO `tb_department` (`department_id`, `department_name`) VALUES
(1, 'CICS'),
(2, 'CABE'),
(3, 'CE');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_event_images`
--

CREATE TABLE `tb_event_images` (
  `image_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_rso`
--

INSERT INTO `tb_rso` (`rso_id`, `rso_name`, `rso_password`, `department_id`, `rso_email`, `rso_profile`) VALUES
(1, 'rso', '123', 2, 'rso@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbempaccount`
--
ALTER TABLE `tbempaccount`
  ADD PRIMARY KEY (`empid`),
  ADD KEY `fk_department_emp` (`department_id`);

--
-- Indexes for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `tbstudentaccount`
--
ALTER TABLE `tbstudentaccount`
  ADD PRIMARY KEY (`studid`),
  ADD KEY `fk_department_student` (`department_id`);

--
-- Indexes for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  ADD PRIMARY KEY (`studid`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_ID`),
  ADD UNIQUE KEY `unique_admin_email` (`admin_email`);

--
-- Indexes for table `tb_attendees`
--
ALTER TABLE `tb_attendees`
  ADD PRIMARY KEY (`attendee_id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `empid` (`empid`),
  ADD KEY `rso_id` (`rso_id`);

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
-- Indexes for table `tb_rso`
--
ALTER TABLE `tb_rso`
  ADD PRIMARY KEY (`rso_id`),
  ADD UNIQUE KEY `unique_rso_email` (`rso_email`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT for table `tb_rso`
--
ALTER TABLE `tb_rso`
  MODIFY `rso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbempaccount`
--
ALTER TABLE `tbempaccount`
  ADD CONSTRAINT `fk_department_emp` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empinfo_changes` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `tb_attendees_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tb_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_attendees_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `tbstudinfo` (`studid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_attendees_ibfk_3` FOREIGN KEY (`empid`) REFERENCES `tbempinfo` (`empid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_attendees_ibfk_4` FOREIGN KEY (`rso_id`) REFERENCES `tb_rso` (`rso_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_event`
--
ALTER TABLE `tb_event`
  ADD CONSTRAINT `tb_event_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_event_images`
--
ALTER TABLE `tb_event_images`
  ADD CONSTRAINT `tb_event_images_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `tb_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_rso`
--
ALTER TABLE `tb_rso`
  ADD CONSTRAINT `tb_rso_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `tb_department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `update_event_status` ON SCHEDULE EVERY 1 SECOND STARTS '2023-11-23 01:52:27' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE tb_event SET status = 'upcoming' WHERE event_date > CURRENT_TIMESTAMP;
    UPDATE tb_event SET status = 'ongoing' WHERE DATE(event_date) = CURDATE();
    UPDATE tb_event SET status = 'ended' WHERE event_date < CURRENT_TIMESTAMP;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
