-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2017 at 06:32 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boxitdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `islandlocked` tinyint(1) NOT NULL,
  `xcoord` decimal(5,1) NOT NULL,
  `ycoord` decimal(5,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`name`, `country`, `islandlocked`, `xcoord`, `ycoord`) VALUES
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
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('abcd', 'abcd'),
('root', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `orderaddr`
--

CREATE TABLE `orderaddr` (
  `orderid` varchar(20) NOT NULL,
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

--
-- Dumping data for table `orderaddr`
--

INSERT INTO `orderaddr` (`orderid`, `fromname`, `frommobno`, `fromemail`, `fromaddr`, `fromlandmark`, `fromcity`, `frompincode`, `toname`, `tomobno`, `toemail`, `toaddr`, `tolandmark`, `tocity`, `topincode`) VALUES
('1', 'Abc', 95282, 'abc@bcd.com', 'ass', 'ABC', 'Anchorage', 521321, 'sdarf', 56532, 'def@bcd.com', 'sdf', 'sdrtyu', 'Berlin', 632922);

-- --------------------------------------------------------

--
-- Table structure for table `ordertb`
--

CREATE TABLE `ordertb` (
  `orderid` varchar(20) NOT NULL,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `custname` varchar(20) NOT NULL,
  `pickupdt` datetime NOT NULL,
  `content` varchar(30) NOT NULL,
  `weight` int(3) NOT NULL,
  `quantity` int(2) NOT NULL,
  `method` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertb`
--

INSERT INTO `ordertb` (`orderid`, `ordertime`, `custname`, `pickupdt`, `content`, `weight`, `quantity`, `method`) VALUES
('1', '2017-10-29 14:24:16', 'root', '2017-10-29 01:59:00', 'a', 1, 2, 'air');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobno` int(10) NOT NULL,
  `paddr` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `name`, `email`, `mobno`, `paddr`) VALUES
('abcd', 'abcd', 'abcd@example.com', 123456789, 'localhost2'),
('root', 'root', 'admin@example.com', 123456789, 'localhost');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `orderaddr`
--
ALTER TABLE `orderaddr`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `fromcity` (`fromcity`),
  ADD KEY `tocity` (`tocity`);

--
-- Indexes for table `ordertb`
--
ALTER TABLE `ordertb`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `custname` (`custname`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `LOGIN_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `orderaddr`
--
ALTER TABLE `orderaddr`
  ADD CONSTRAINT `ORDERADDR_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `ordertb` (`orderid`),
  ADD CONSTRAINT `ORDERADDR_ibfk_2` FOREIGN KEY (`fromcity`) REFERENCES `city` (`name`),
  ADD CONSTRAINT `ORDERADDR_ibfk_3` FOREIGN KEY (`tocity`) REFERENCES `city` (`name`);

--
-- Constraints for table `ordertb`
--
ALTER TABLE `ordertb`
  ADD CONSTRAINT `ORDERTB_ibfk_1` FOREIGN KEY (`custname`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
