-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 11:53 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
-- Table structure for table `tbl_addproduct`
--

CREATE TABLE `tbl_addproduct` (
  `employeeid` int(255) NOT NULL,
  `adminid` int(255) NOT NULL,
  `productType` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_addproduct`
--

INSERT INTO `tbl_addproduct` (`employeeid`, `adminid`, `productType`, `size`, `quantity`) VALUES
(2132, 192, 'Polo', 'Medium', 1),
(2133, 192, 'Pants', '32', 2),
(2132788, 192, 'Polo', 'Small', 5),
(2132789, 192, 'Polo', 'XXL', 3),
(2132790, 193, 'Polo', 'Large', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `employeeid` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`employeeid`, `username`, `password`) VALUES
(21232, 'LiaquenOdlanyer@gmail.com', '123456'),
(2132531, 'Novicionicko@gmail.com', '123456'),
(2132612, 'Cerezoezekiel@gmail.com', '123456'),
(2132788, 'BacongOliver@gmail.com', '123456'),
(2132976, 'Marasiganharvey@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventoryproductin`
--

CREATE TABLE `tbl_inventoryproductin` (
  `emplyeeid` int(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantityReceived` int(255) NOT NULL,
  `dateReceived` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_inventoryproductin`
--

INSERT INTO `tbl_inventoryproductin` (`emplyeeid`, `product`, `quantityReceived`, `dateReceived`) VALUES
(2132000, 'Skirt', 200, '2023-10-23 09:37:06'),
(2132098, 'P.E Uniform', 250, '2023-10-23 09:37:35'),
(2132124, 'Polo', 100, '2023-10-23 09:36:12'),
(2132624, 'Blouse', 100, '2023-10-23 09:37:06'),
(2132651, 'Pants', 200, '2023-10-23 09:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventoryproductout`
--

CREATE TABLE `tbl_inventoryproductout` (
  `employeeid` int(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `quantityReceived` int(255) NOT NULL,
  `dateReceived` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_inventoryproductout`
--

INSERT INTO `tbl_inventoryproductout` (`employeeid`, `product`, `quantityReceived`, `dateReceived`) VALUES
(2100527, 'Pants', 250, '2023-10-23 09:39:36'),
(2107112, 'Blouse', 80, '2023-10-23 09:39:55'),
(2124512, 'Polo', 150, '2023-10-23 09:38:59'),
(2156313, 'Skirt', 150, '2023-10-23 09:38:59'),
(2165782, 'P.E Uniform', 50, '2023-10-23 09:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`username`, `password`, `designation`) VALUES
('BacongOli', '123456', 'Officer'),
('LiaquenOd', '123456', 'Inspector'),
('MarasiganHarvey', '123456', 'Officer'),
('Novicionicko', '123456', 'Manager'),
('CarilloKeyo', '123456', 'Analyst');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productid` int(255) NOT NULL,
  `adminid` int(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `productType` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`productid`, `adminid`, `productName`, `productDescription`, `productType`, `size`) VALUES
(2154782, 192, 'School Uniform', 'Durable Quality', 'P.E Uniform', 'Small'),
(2163672, 193, 'School Uniform', 'Durable Quality', 'Pants', 'XXL'),
(2192745, 192, 'School Uniform', 'Durable Quality', 'Skirt', 'Large'),
(2197241, 193, 'School Uniform', 'Durable Quality', 'Blouse', 'Medium'),
(2197864, 199, 'School Uniform', 'Durable Quality', 'Polo - Shirt', 'Small');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_removeofficer`
--

CREATE TABLE `tbl_removeofficer` (
  `employeeid` int(255) NOT NULL,
  `adminid` int(255) NOT NULL,
  `designation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_addproduct`
--
ALTER TABLE `tbl_addproduct`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `tbl_inventoryproductin`
--
ALTER TABLE `tbl_inventoryproductin`
  ADD PRIMARY KEY (`emplyeeid`);

--
-- Indexes for table `tbl_inventoryproductout`
--
ALTER TABLE `tbl_inventoryproductout`
  ADD PRIMARY KEY (`employeeid`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `tbl_removeofficer`
--
ALTER TABLE `tbl_removeofficer`
  ADD PRIMARY KEY (`employeeid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
