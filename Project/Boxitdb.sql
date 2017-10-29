-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 28, 2017 at 09:34 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Boxitdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `CITY`
--

CREATE TABLE `CITY` (
  `name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `islandlocked` tinyint(1) NOT NULL,
  `xcoord` decimal(5,1) NOT NULL,
  `ycoord` decimal(5,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CITY`
--

INSERT INTO `CITY` (`name`, `country`, `islandlocked`, `xcoord`, `ycoord`) VALUES
('Anchorage', 'Alaska', 0, '188.0', '197.5'),
('Bangkok', 'Thailand', 0, '723.0', '733.0'),
('Beijing', 'China', 1, '699.0', '710.0'),
('Berlin', 'Germany', 1, '491.5', '500.5'),
('Bogota', 'Colombia', 0, '440.0', '450.0'),
('Buenos', 'Spain', 0, '540.5', '549.0'),
('Cairo', 'Egypt', 1, '576.5', '586.0'),
('Calcutta', 'India', 0, '691.5', '700.5'),
('Cape', 'South Africa', 0, '669.0', '676.5'),
('Casablanca', 'Morocco', 0, '505.5', '514.0'),
('Chicago', 'USA', 1, '346.0', '357.5'),
('Churchill', 'Canada', 1, '290.5', '302.5'),
('Delhi', 'India', 1, '655.5', '662.0'),
('Durban', 'South Africa', 0, '683.0', '690.5'),
('Guangzhou', 'China', 0, '731.0', '740.0'),
('Istanbul', 'Turkey', 1, '554.5', '561.5'),
('Jakarta', 'Indonesia', 0, '776.0', '785.0'),
('Karachi', 'Pakistan', 0, '646.0', '654.0'),
('Lagos', 'Nigeria', 0, '574.5', '583.5'),
('Lima', 'Peru', 0, '464.5', '474.0'),
('London', 'England', 0, '467.5', '478.0'),
('Los', 'USA', 0, '307.5', '318.0'),
('Mexico', 'Mexico', 0, '374.0', '383.0'),
('Moscow', 'Russia', 1, '527.0', '538.0'),
('Mumbai', 'India', 0, '669.0', '676.5'),
('New', 'USA', 0, '377.0', '385.5'),
('Paris', 'France', 1, '486.0', '496.5'),
('Rio', 'Brazil', 0, '542.0', '552.5'),
('Riyadh', 'Saudi Arabia', 1, '613.5', '621.5'),
('Rome', 'Italy', 1, '524.0', '532.5'),
('Sao', 'Brazil', 0, '543.5', '553.0'),
('Seoul', 'South Korea', 0, '730.5', '739.0'),
('Shanghai', 'China', 0, '732.5', '740.0'),
('Singapore', 'Singapore', 0, '751.5', '760.0'),
('Sydney', 'New South Wales', 0, '894.0', '903.0'),
('Tokyo', 'Japan', 0, '749.5', '758.0'),
('Toronto', 'Canada', 1, '358.5', '366.5');

-- --------------------------------------------------------

--
-- Table structure for table `LOGIN`
--

CREATE TABLE `LOGIN` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LOGIN`
--

INSERT INTO `LOGIN` (`username`, `password`) VALUES
('abcd', 'abcd'),
('root', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `ORDERADDR`
--

CREATE TABLE `ORDERADDR` (
  `orderid` int AUTOINCREMENT NOT NULL,
  `fromname` varchar(30) NOT NULL,
  `frommobno` int(10) NOT NULL,
  `fromemail` varchar(50) NOT NULL,
  `fromaddr` varchar(100) NOT NULL,
  `fromlandmark` varchar(30) NOT NULL,
  `fromcity` varchar(30) NOT NULL,
  `frompincode` int(10) NOT NULL,
  `toname` varchar(30) NOT NULL,
  `tomobno` int(10) NOT NULL,
  `toemail` varchar(50) NOT NULL,
  `toaddr` varchar(100) NOT NULL,
  `tolandmark` varchar(30) NOT NULL,
  `tocity` varchar(30) NOT NULL,
  `topincode` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ORDERTB`
--

CREATE TABLE `ORDERTB` (
  `orderid` int IDENTITY(1,1) NOT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `custname` varchar(20) NOT NULL,
  `pickupdt` datetime NOT NULL,
  `content` varchar(30) NOT NULL,
  `weight` int(3) NOT NULL,
  `quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `username` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobno` int(10) NOT NULL,
  `paddr` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`username`, `name`, `email`, `mobno`, `paddr`) VALUES
('abcd', 'abcd', 'abcd@example.com', 123456789, 'localhost2'),
('root', 'root', 'admin@example.com', 123456789, 'localhost');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CITY`
--
ALTER TABLE `CITY`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `LOGIN`
--
ALTER TABLE `LOGIN`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ORDERADDR`
--
ALTER TABLE `ORDERADDR`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `fromcity` (`fromcity`),
  ADD KEY `tocity` (`tocity`);

--
-- Indexes for table `ORDERTB`
--
ALTER TABLE `ORDERTB`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `custname` (`custname`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `LOGIN`
--
ALTER TABLE `LOGIN`
  ADD CONSTRAINT `LOGIN_ibfk_1` FOREIGN KEY (`username`) REFERENCES `USER` (`username`);

--
-- Constraints for table `ORDERADDR`
--
ALTER TABLE `ORDERADDR`
  ADD CONSTRAINT `ORDERADDR_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `ORDERTB` (`orderid`),
  ADD CONSTRAINT `ORDERADDR_ibfk_2` FOREIGN KEY (`fromcity`) REFERENCES `CITY` (`name`),
  ADD CONSTRAINT `ORDERADDR_ibfk_3` FOREIGN KEY (`tocity`) REFERENCES `CITY` (`name`);

--
-- Constraints for table `ORDERTB`
--
ALTER TABLE `ORDERTB`
  ADD CONSTRAINT `ORDERTB_ibfk_1` FOREIGN KEY (`custname`) REFERENCES `USER` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
