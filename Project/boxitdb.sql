-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2017 at 04:29 PM
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
  `ycoord` decimal(5,1) NOT NULL,
  `zone` int(1) NOT NULL,
  `north` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`name`, `country`, `islandlocked`, `xcoord`, `ycoord`, `zone`, `north`) VALUES
('Anchorage', 'Alaska', 0, '168.5', '217.0', 1, 1),
('Bangkok', 'Thailand', 0, '1014.5', '441.5', 5, 1),
('Beijing', 'China', 1, '1079.5', '329.5', 6, 1),
('Berlin', 'Germany', 1, '710.5', '281.5', 4, 1),
('Bogota', 'Colombia', 0, '417.5', '472.5', 2, 0),
('Buenos Aires', 'Spain', 0, '472.5', '617.0', 3, 0),
('Cairo', 'Egypt', 1, '778.0', '384.5', 4, 1),
('Calcutta', 'India', 0, '975.5', '416.5', 5, 1),
('Cape Town', 'South Africa', 0, '736.0', '609.5', 4, 0),
('Casablanca', 'Morocco', 0, '640.0', '379.5', 4, 1),
('Chicago', 'USA', 1, '370.0', '333.5', 2, 1),
('Churchill', 'Canada', 1, '353.5', '239.5', 2, 1),
('Delhi', 'India', 1, '936.0', '381.5', 5, 1),
('Durban', 'South Africa', 0, '780.5', '593.0', 4, 0),
('Guangzhou', 'China', 0, '1061.0', '410.0', 6, 1),
('Istanbul', 'Turkey', 1, '772.0', '344.0', 4, 1),
('Jakarta', 'Indonesia', 0, '1043.5', '517.5', 5, 0),
('Karachi', 'Pakistan', 0, '901.0', '399.0', 5, 1),
('Lagos', 'Nigeria', 0, '688.0', '470.0', 4, 0),
('Lima', 'Peru', 0, '409.0', '529.5', 2, 0),
('London', 'England', 0, '665.0', '280.5', 4, 1),
('Los Angeles', 'USA', 0, '262.0', '363.5', 1, 1),
('Mexico City', 'Mexico', 0, '334.5', '422.5', 1, 1),
('Moscow', 'Russia', 1, '803.5', '261.5', 4, 1),
('Mumbai', 'India', 0, '923.5', '422.0', 5, 1),
('New York', 'USA', 0, '421.0', '341.5', 2, 1),
('Paris', 'France', 1, '676.5', '306.0', 4, 1),
('Rio De Janeiro', 'Brazil', 0, '533.5', '561.0', 3, 0),
('Riyadh', 'Saudi Arabia', 1, '829.0', '406.0', 5, 1),
('Rome', 'Italy', 1, '721.0', '335.5', 4, 1),
('Sao Paulo', 'Brazil', 0, '522.0', '574.5', 3, 0),
('Seoul', 'South Korea', 0, '1112.0', '357.5', 6, 1),
('Shanghai', 'China', 0, '1086.0', '386.5', 6, 1),
('Singapore', 'Singapore', 0, '1027.5', '484.0', 5, 0),
('Sydney', 'New South Wales', 0, '1179.5', '617.5', 6, 0),
('Tokyo', 'Japan', 0, '1144.0', '363.5', 6, 1),
('Toronto', 'Canada', 1, '407.5', '317.5', 2, 1);

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
