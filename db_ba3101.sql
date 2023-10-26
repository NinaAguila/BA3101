-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 26, 2023 at 03:05 AM
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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `adminno` int NOT NULL,
  `adminpass` varchar(255) DEFAULT NULL,
  `counno` int DEFAULT NULL,
  PRIMARY KEY (`adminno`),
  KEY `counno` (`counno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminno`, `adminpass`, `counno`) VALUES
(1, 'adminpass1', 1),
(2, 'adminpass2', 2),
(3, 'adminpass3', 3),
(4, 'adminpass4', 4),
(5, 'adminpass5', 5);

-- --------------------------------------------------------

--
-- Table structure for table `counselors`
--

DROP TABLE IF EXISTS `counselors`;
CREATE TABLE IF NOT EXISTS `counselors` (
  `counno` int NOT NULL,
  `counpass` varchar(255) DEFAULT NULL,
  `reportno` int DEFAULT NULL,
  PRIMARY KEY (`counno`),
  KEY `reportno` (`reportno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `counselors`
--

INSERT INTO `counselors` (`counno`, `counpass`, `reportno`) VALUES
(1, 'counselorpass1', 201),
(2, 'counselorpass2', 202),
(3, 'counselorpass3', 203),
(4, 'counselorpass4', 204),
(5, 'counselorpass5', 205);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `reportno` int NOT NULL,
  `reporttype` varchar(255) DEFAULT NULL,
  `report` text,
  `studno` int DEFAULT NULL,
  PRIMARY KEY (`reportno`),
  KEY `studno` (`studno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`reportno`, `reporttype`, `report`, `studno`) VALUES
(101, 'Academic Grievance', 'I have a concern about the grading in my History course.', 1),
(102, 'Campus Facilities Grievance', 'There is a problem with the heating in my dormitory room.', 2),
(103, 'Discrimination Grievance', 'I believe I have experienced discrimination in the workplace.', 3),
(104, 'Housing Grievance', 'I would like to request a room change due to noisy neighbors.', 4),
(105, 'Financial Aid Grievance', 'I am experiencing issues with my financial aid application.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `studno` int NOT NULL,
  `studpass` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `reportno` int NOT NULL,
  PRIMARY KEY (`studno`),
  KEY `reportno` (`reportno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studno`, `studpass`, `status`, `reportno`) VALUES
(1, 'password1', '1', 101),
(2, 'password2', '2', 102),
(3, 'password3', '3', 103),
(4, 'password4', '1', 104),
(5, 'password5', '2', 105);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
