-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 20, 2023 at 08:34 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_addnewproduct`
--

DROP TABLE IF EXISTS `tbl_addnewproduct`;
CREATE TABLE IF NOT EXISTS `tbl_addnewproduct` (
  `prodid` int NOT NULL,
  `Product_Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `Price` decimal(10,0) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_addnewproduct`
--

INSERT INTO `tbl_addnewproduct` (`prodid`, `Product_Name`, `description`, `size`, `quantity`, `Price`) VALUES
(21211, 'wrqfas', 'fasfasfa', 'large', 141, '24141'),
(111111, 'polol', 'bsu lipa polo', 'small', 10, '500'),
(22222, 'polo', 'bsu', 'large', 1, '600'),
(55555, 'pants', 'bsu pants', 'small', 2, '100'),
(7, 'polo', 'dasd', 'XL', 47, '500'),
(7878, 'pants', 'weqweqe', 'XXL', 8, '500');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_createemp`
--

DROP TABLE IF EXISTS `tbl_createemp`;
CREATE TABLE IF NOT EXISTS `tbl_createemp` (
  `empID` int NOT NULL,
  `role` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_createemp`
--

INSERT INTO `tbl_createemp` (`empID`, `role`, `username`, `password`) VALUES
(0, 'employee_in', 'kenenth', '$2y$10$LjtoqnY0whTPiQoPDjkbt.QCqVm/EHkhvfq5bEUJuEM5DLe2egPQO'),
(0, 'employee_in', 'kenneth ilong', '$2y$10$3gEiPUvsbtAW/pvHGv7lO.Cy0EuF/nD5Hm118rq8TFgiDp7tDBopi'),
(0, 'employee_out', 'kenneth mabaho', '$2y$10$ij/z/1PN/t.NHZphgrzuN.FQPXOyhqJoEsCSHep7IArOnEQnBBMnq'),
(0, 'employee_out', 'sdadsad', '$2y$10$hYluug4VtIrNYXaU.i5HPepTDPXBPbc6WvzhvpYzDMqVyR8j5/zCq'),
(0, 'employee_out', 'Harbiii Nikol', '$2y$10$fN8Gj4zJ2VzsAqDI.n7o1ObQy7zMSuPW8nIrsKLoTxFEewmYFFFmm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockin`
--

DROP TABLE IF EXISTS `tbl_stockin`;
CREATE TABLE IF NOT EXISTS `tbl_stockin` (
  `numRecords` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `productId` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `quantityout` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numRecords`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_stockin`
--

INSERT INTO `tbl_stockin` (`numRecords`, `employeeId`, `productId`, `description`, `size`, `quantity`, `quantityout`, `date`) VALUES
(11, 1, 3, 'Blouse', 'medium', 55555, 0, '2023-11-20 16:00:00'),
(10, 1, 2, 'Pants', 'small', 2444444, 0, '2023-11-18 16:00:00'),
(9, 1, 1, 'Pants', 'small', 1111, 0, '2023-11-20 16:00:00'),
(8, 2, 1, 'Polo', 'small', 6, 0, '2023-11-19 16:00:00'),
(7, 1, 1, 'Polo', 'small', 104, 0, '2023-11-19 16:00:00'),
(12, 1, 2, 'Polo', 'medium', 100, 0, '2023-11-19 16:00:00'),
(13, 1, 2, 'Polo', 'medium', 100, 0, '2023-11-19 16:00:00'),
(14, 1, 2, 'Polo', 'medium', 20, 0, '2023-11-22 16:00:00'),
(15, 1, 21211, 'Polo', 'small', 1000, 0, '2023-11-18 16:00:00'),
(16, 1, 21211, 'Polo', 'small', 1000, 0, '2023-11-19 16:00:00'),
(17, 1, 22222, 'Polo', '2xl', 100, 0, '2023-11-18 16:00:00'),
(18, 1, 7, 'Skirt', 'medium', 100, 0, '2023-11-19 16:00:00'),
(19, 1, 7, 'Skirt', 'medium', 100, 0, '2023-11-19 16:00:00'),
(20, 1, 7, 'Polo', 'xl', 100, 0, '2023-11-19 16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockout`
--

DROP TABLE IF EXISTS `tbl_stockout`;
CREATE TABLE IF NOT EXISTS `tbl_stockout` (
  `numRecords` int NOT NULL DEFAULT '0',
  `employeeId` int NOT NULL,
  `productId` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `quantityout` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_stockout`
--

INSERT INTO `tbl_stockout` (`numRecords`, `employeeId`, `productId`, `description`, `size`, `quantity`, `quantityout`, `date`) VALUES
(11, 1, 3, 'Blouse', 'medium', 55555, 0, '2023-11-20 16:00:00'),
(10, 1, 2, 'Pants', 'small', 2444444, 0, '2023-11-18 16:00:00'),
(9, 1, 1, 'Pants', 'small', 1111, 0, '2023-11-20 16:00:00'),
(8, 2, 1, 'Polo', 'small', 6, 0, '2023-11-19 16:00:00'),
(7, 1, 1, 'Polo', 'small', 104, 0, '2023-11-19 16:00:00'),
(0, 1, 2, 'Polo', 'medium', 100, 0, '2023-11-27 16:00:00'),
(0, 1, 21211, 'Polo', 'small', 222, 0, '2023-11-19 16:00:00');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
