-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 06:22 PM
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
(198, 6, 1, 19, '2023-11-30');

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
  `is_active` tinyint(1) DEFAULT 1,
  `date_arrived` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbequipment`
--

INSERT INTO `tbequipment` (`equipment_ID`, `equipment_name`, `equipment_quantity`, `equipment_description`, `equip_photos`, `is_active`, `date_arrived`) VALUES
(19, 'Futsal Ball', 10, 'small, typically low-bounce ball used in the sport of futsal', 0x2e2e2f696d616765732f696d6167652d6571702f53656e64615f5265636966655f46757473616c5f55535f596f7574685f46757473616c5f4261636b5f6c617267652d72656d6f766562672d707265766965772e706e67, 1, '2023-11-28'),
(20, 'Ping Pong Table', 15, 'specialized surface used for playing the sport of table tennis', 0x2e2e2f696d616765732f696d6167652d6571702f363536343337316464356564355f70696e672d706f6e672d7461626c652d586c654e4c39432d3630302d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-11-16'),
(22, 'Volleyball', 9, 'a spherical ball made of leather or synthetic leather and inflated with air', 0x2e2e2f696d616765732f696d6167652d6571702f363536343331353134386438335f706e67747265652d636f6d70657469746976652d7370686572652d636f6f7065726174696f6e2d766f6c6c657962616c6c2d706e672d696d6167655f333235363837342d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-11-03'),
(23, 'Shuttlecock', 7, ' also known as a birdie, is a small, feathered projectile used in the sport of badminton.', 0x2e2e2f696d616765732f696d6167652d6571702f706e672d7472616e73706172656e742d77686974652d73687574746c65636f636b2d696c6c757374726174696f6e2d626c61636b2d616e642d77686974652d73687574746c65636f636b2d67616d652d77686974652d73706f72745f5f315f2d72656d6f766562672d707265766965772e706e67, 1, '2023-11-04'),
(24, 'Basketball', 6, 'spherical ball used in basketball games, orange in color, 29.5 (749 mm) inches in circumference and weighs 22 ounces (624 g) (size 7)', 0x2e2e2f696d616765732f696d6167652d6571702f363536343330643137383033645f706e672d7472616e73706172656e742d6261736b657462616c6c2d696c6c757374726174696f6e2d6261736b657462616c6c2d73706f7274732d65717569706d656e742d73706f7274732d6c65616775652d776f6f6476696c6c652d746f6d706b696e732d696e737469747574652d6261736b657462616c6c2d73706f72742d6f72616e67652d7465616d2d7468756d626e61696c2d72656d6f7665202832292e706e67, 1, '2023-11-01'),
(25, 'Ping Pong', 15, 'spherical and hollow, was once made of white celluloid, may be coloured white, yellow, or orange, weighs about 0.09 ounce (2.7 grams) and has a diameter of about 1.6 inches (4 cm).', 0x2e2e2f696d616765732f696d6167652d6571702f363536343330666238333964615f65616561646362626566666334313933386439373663653534663736323331342d72656d6f766562672d707265766965772e706e67, 1, '2023-10-26'),
(33, 'Table Tennis Racket', 7, 'usually made from laminated wood covered with rubber on one or two sides depending on the player\'s grip', 0x2e2e2f696d616765732f696d6167652d6571702f37315a6139304e4f71374c2d72656d6f766562672d70726576696577202831292e706e67, 1, '2023-11-29');

-- --------------------------------------------------------

--
-- Table structure for table `tbreturned`
--

CREATE TABLE `tbreturned` (
  `return_ID` int(11) NOT NULL,
  `borrow_ID` int(11) NOT NULL,
  `returned_date` date NOT NULL,
  `returned_quantity` int(30) NOT NULL,
  `equipment_damaged` int(30) NOT NULL,
  `equipment_missing` int(30) NOT NULL,
  `studid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbreturned`
--

INSERT INTO `tbreturned` (`return_ID`, `borrow_ID`, `returned_date`, `returned_quantity`, `equipment_damaged`, `equipment_missing`, `studid`) VALUES
(139, 198, '2023-11-30', 1, 0, 0, 6),
(138, 196, '2023-11-30', 1, 1, 0, 7),
(137, 196, '2023-11-30', 1, 0, 1, 7),
(136, 196, '2023-11-30', 2, 0, 0, 7),
(135, 196, '2023-11-30', 2, 0, 0, 7),
(134, 196, '2023-11-30', 2, 0, 0, 7),
(133, 196, '2023-11-30', 1, 0, 1, 7),
(132, 197, '2023-11-30', 2, 0, 0, 7),
(131, 196, '2023-11-30', 1, 1, 1, 7),
(130, 196, '2023-11-30', 1, 0, 1, 7),
(129, 196, '2023-11-30', 1, 0, 1, 7),
(128, 196, '0000-00-00', 0, 0, 0, 7),
(127, 195, '2023-11-30', 2, 0, 1, 8),
(126, 179, '2023-11-29', 3, 1, 2, 7);

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
(6, 'dowothy', 'gg', 'OUT', 6);

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
(1, '32-10987', 'Parker', 'Peter', 'bsit'),
(2, '29-76854', 'Kent', 'Clark', 'bscs'),
(3, '21-34256', 'Valencia', 'Arnold', 'bscs'),
(4, '23-98765', 'Reyes', 'Marvin', 'bsit'),
(5, '15-98126', 'Dela Cruz', 'Leomar', 'bsba'),
(6, '21-39828', 'Manalo', 'Zeus', 'bsit'),
(7, '21-32471', 'Macalla', 'Dorothy', 'bsit'),
(8, '21-35519', 'De Chavez', 'Jhuncen', 'bsit'),
(9, '21-34175', 'Fabellon', 'Jan Patrick', 'bsit');

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
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbborrow`
--
ALTER TABLE `tbborrow`
  MODIFY `borrow_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `tbempinfo`
--
ALTER TABLE `tbempinfo`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbequipment`
--
ALTER TABLE `tbequipment`
  MODIFY `equipment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbreturned`
--
ALTER TABLE `tbreturned`
  MODIFY `return_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `tbstaff`
--
ALTER TABLE `tbstaff`
  MODIFY `staff_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbstudinfo`
--
ALTER TABLE `tbstudinfo`
  MODIFY `studid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
