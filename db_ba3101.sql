-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 05:24 AM
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
  `admin_ID` int(11) NOT NULL,
  `admin_user` varchar(30) NOT NULL,
  `admin_pass` varchar(30) NOT NULL,
  `empid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbadmin`
--

INSERT INTO `tbadmin` (`admin_ID`, `admin_user`, `admin_pass`, `empid`) VALUES
(4, 'Cruzy', 'oisdahfeuw', 2),
(5, 'heyo', 'dgfregher', 4);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbborrow`
--

INSERT INTO `tbborrow` (`borrow_ID`, `studid`, `equipment_quantity`, `equipment_ID`, `date_borrowed`) VALUES
(121, 8, 1, 20, '2023-11-20'),
(122, 8, 2, 22, '2023-11-21'),
(123, 6, 2, 19, '2023-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `tbempinfo`
--

CREATE TABLE `tbempinfo` (
  `empid` int(11) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `department` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbempinfo`
--

INSERT INTO `tbempinfo` (`empid`, `lastname`, `firstname`, `department`) VALUES
(1, 'Aguila', 'Nina', 'cics'),
(2, 'Cruz', 'Mark', 'cics'),
(3, 'Miranda', 'Rocky', 'cics'),
(4, 'Peloramas', 'Angela', 'cics'),
(5, 'Dela Pena', 'Leo', 'cics'),
(6, 'Macalla', 'Dorothy', 'cics');

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
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`, `equip_photos`, `is_active`) VALUES
(19, 'Futsal Ball', 4, 'small, typically low-bounce ball used in the sport of futsal', 0x2e2e2f696d616765732f696d6167652d6571702f53656e64615f5265636966655f46757473616c5f55535f596f7574685f46757473616c5f4261636b5f6c617267652d72656d6f766562672d707265766965772e706e67, 1),
(20, 'Ping Pong Table', 11, 'specialized surface used for playing the sport of table tennis', 0x2e2e2f696d616765732f696d6167652d6571702f70696e672d706f6e672d7461626c652d586c654e4c39432d3630302d72656d6f766562672d70726576696577202831292e706e67, 1),
(22, 'Volleyball', 3, 'a spherical ball made of leather or synthetic leather and inflated with air', 0x2e2e2f696d616765732f696d6167652d6571702f706e67747265652d636f6d70657469746976652d7370686572652d636f6f7065726174696f6e2d766f6c6c657962616c6c2d706e672d696d6167655f333235363837342d72656d6f766562672d70726576696577202831292e706e67, 1),
(23, 'Shuttlecock', 5, ' also known as a birdie, is a small, feathered projectile used in the sport of badminton.', 0x2e2e2f696d616765732f696d6167652d6571702f706e672d7472616e73706172656e742d77686974652d73687574746c65636f636b2d696c6c757374726174696f6e2d626c61636b2d616e642d77686974652d73687574746c65636f636b2d67616d652d77686974652d73706f72745f5f315f2d72656d6f766562672d707265766965772e706e67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbreturned`
--

CREATE TABLE `tbreturned` (
  `return_ID` int(11) NOT NULL,
  `borrow_ID` int(11) NOT NULL,
  `returned_date` date NOT NULL,
  `studid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbreturned`
--

INSERT INTO `tbreturned` (`return_ID`, `borrow_ID`, `returned_date`, `studid`) VALUES
(32, 123, '2023-11-21', 6),
(31, 122, '2023-11-21', 8),
(30, 121, '2023-11-20', 8);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbstaff`
--

INSERT INTO `tbstaff` (`staff_ID`, `staff_user`, `staff_pass`, `staff_position`, `empid`) VALUES
(1, 'dfberfb', 'ewfgrwgwr', 'IN', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbstudinfo`
--

CREATE TABLE `tbstudinfo` (
  `studid` int(11) NOT NULL,
  `sr_code` varchar(30) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `course` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbstudinfo`
--

INSERT INTO `tbstudinfo` (`studid`, `sr_code`, `lastname`, `firstname`, `course`) VALUES
(1, '32-10987', 'parker', 'peter', 'bsit'),
(2, '29-76854', 'kent', 'clark', 'bscs'),
(3, '21-34256', 'Valencia', 'Arnold', 'bscs'),
(4, '23-98765', 'Reyes', 'Marvin', 'bsit'),
(5, '15-98126', 'Dela Cruz', 'Leomar', 'bsba'),
(6, '21-39828', 'manalo', 'zeus', 'bsit'),
(7, '21-32471', 'Macalla', 'Dorothy', 'bsit'),
(8, '21-35519', 'De Chavez', 'Jhuncen', 'bsit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbadmin`
--
ALTER TABLE `tbadmin`
  ADD PRIMARY KEY (`admin_ID`),
  ADD KEY `empid_fk` (`empid`);

--
-- Indexes for table `tbborrow`
--
ALTER TABLE `tbborrow`
  ADD PRIMARY KEY (`borrow_ID`),
  ADD KEY `equipment_name` (`equipment_ID`),
  ADD KEY `equipment_ID` (`equipment_ID`);

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
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbborrow`
--
ALTER TABLE `tbborrow`
  MODIFY `borrow_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbequipment`
--
ALTER TABLE `tbequipment`
  MODIFY `equipment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbreturned`
--
ALTER TABLE `tbreturned`
  MODIFY `return_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbstaff`
--
ALTER TABLE `tbstaff`
  MODIFY `staff_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbborrow`
--
ALTER TABLE `tbborrow`
  ADD CONSTRAINT `tbborrow_ibfk_1` FOREIGN KEY (`equipment_ID`) REFERENCES `tbequipment` (`equipment_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
