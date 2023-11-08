-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2023 at 08:45 AM
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
-- Table structure for table `tbadmin`
--

CREATE TABLE `tbadmin` (
  `admin_ID` int(30) NOT NULL,
  `admin_name` varchar(30) NOT NULL,
  `admin_user` varchar(30) NOT NULL,
  `admin_pass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`admin_ID`, `admin_name`, `admin_user`, `admin_pass`) VALUES
(1, 'Juan Dela Cruz', 'AdminUser1_Jon', 'Pass123!'),
(2, 'Shelly Cruz', 'AdminUser2_Josh', 'SecurePass456'),
(3, 'Mark Reyes', 'AdminUser3_Sally ', 'Password789'),
(4, 'Patrick Coach', 'AdminUser4_Chris', 'AccessGranted!'),
(5, 'Kimberly Malaluan', 'AdminUser5_Ron', 'SecretPass123');

-- --------------------------------------------------------

--
-- Table structure for table `tbborrow`
--

CREATE TABLE `tbborrow` (
  `borrow_ID` int(30) NOT NULL,
  `studid` int(30) NOT NULL,
  `borrow_quantity` int(11) NOT NULL,
  `equipment_borrow` varchar(50) NOT NULL,
  `date_borrowed` date NOT NULL,
  `date_returned` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbborrow`
--

INSERT INTO `tbborrow` (`borrow_ID`, `studid`, `borrow_quantity`, `equipment_borrow`, `date_borrowed`, `date_returned`) VALUES
(1, 1, 2, 'Baseball Gloves , Shuttlecocks ', '2023-04-05', '2023-04-05'),
(2, 2, 1, 'Soccer Ball ', '2023-04-05', '2023-04-05'),
(3, 3, 1, 'Volleyball ', '2023-04-05', '2023-04-05'),
(4, 4, 3, 'Soccer Ball, Badminton Rackets, Shuttlecocks ', '2023-04-05', '2023-04-05'),
(5, 5, 1, 'Basketball', '2023-04-05', '2023-04-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbequipment`
--

CREATE TABLE `tbequipment` (
  `equipment_ID` int(30) NOT NULL,
  `equipment_name` varchar(30) NOT NULL,
  `equipment_quantity` int(11) NOT NULL,
  `equipment_description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`) VALUES
(1, 'Basketball  ', 10, 'Official size and weight basketball suitable for indoor and outdoor play.'),
(2, 'Ping Pong Table ', 3, 'Regulation-size ping pong table with a net and paddles.'),
(3, 'Volleyball', 8, 'Premium leather volleyball for competitive matches.'),
(4, ' Badminton Rackets ', 12, 'Lightweight badminton rackets with durable strings.'),
(5, 'Shuttlecocks ', 30, 'Feathered shuttlecocks for badminton games.');

-- --------------------------------------------------------

--
-- Table structure for table `tbstaff`
--

CREATE TABLE `tbstaff` (
  `staff_ID` int(30) NOT NULL,
  `staff_user` varchar(30) NOT NULL,
  `staff_pass` varchar(30) NOT NULL,
  `staff_position` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`staff_ID`, `staff_user`, `staff_pass`, `staff_position`) VALUES
(1, 'pinkfly', 'hsag34', 'IN'),
(2, 'ghrw73', 'sgdfyuf32', 'OUT'),
(3, 'BNDS32', 'BNSDF4', 'IN'),
(4, 'ub7BG', 'bf37g', 'OUT'),
(5, 'yuib78', 'BVUYV78', 'IN');

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

CREATE TABLE `tbstudinfo` (
  `studid` int(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `course` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `lastname`, `firstname`, `course`) VALUES
(1, 'parker', 'peter', 'bsit'),
(2, 'kenta', 'clark', 'bscs'),
(3, 'kentso', 'clark', 'bscs'),
(4, 'kento', 'clark', 'bscs'),
(5, 'kenty', 'clark', 'bscs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `tbborrow`
--
ALTER TABLE `tbborrow`
  ADD PRIMARY KEY (`borrow_ID`),
  ADD KEY `studid` (`studid`);

--
-- Indexes for table `tbequipment`
--
ALTER TABLE `tbequipment`
  ADD PRIMARY KEY (`equipment_ID`);

--
-- Indexes for table `tbstaff`
--
ALTER TABLE `tbstaff`
  ADD PRIMARY KEY (`staff_ID`);

--
-- Indexes for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  ADD PRIMARY KEY (`studid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbadmin`
--
ALTER TABLE `tbadmin`
  MODIFY `admin_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbborrow`
--
ALTER TABLE `tbborrow`
  MODIFY `borrow_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbequipment`
--
ALTER TABLE `tbequipment`
  MODIFY `equipment_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbstaff`
--
ALTER TABLE `tbstaff`
  MODIFY `staff_ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  MODIFY `studid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbborrow`
--
ALTER TABLE `tbborrow`
  ADD CONSTRAINT `tbborrow_ibfk_1` FOREIGN KEY (`studid`) REFERENCES `tbstudinfo` (`studid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
