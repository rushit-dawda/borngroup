-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2017 at 02:49 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brongroup`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `id` int(10) NOT NULL,
  `product_code` varchar(150) NOT NULL,
  `product_unit_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`id`, `product_code`, `product_unit_price`) VALUES
(1, 'A', 2),
(2, 'B', 12),
(3, 'C', 1.25),
(4, 'D', 0.15);

-- --------------------------------------------------------

--
-- Table structure for table `product_table_special_price`
--

CREATE TABLE `product_table_special_price` (
  `id` int(10) NOT NULL,
  `pid` int(10) NOT NULL,
  `bulk_qty` int(10) NOT NULL,
  `bulk_qty_price` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_table_special_price`
--

INSERT INTO `product_table_special_price` (`id`, `pid`, `bulk_qty`, `bulk_qty_price`) VALUES
(1, 1, 4, 7),
(2, 3, 6, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_table_special_price`
--
ALTER TABLE `product_table_special_price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `product_table_special_price`
--
ALTER TABLE `product_table_special_price`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_table_special_price`
--
ALTER TABLE `product_table_special_price`
  ADD CONSTRAINT `product_table_special_price_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product_table` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
