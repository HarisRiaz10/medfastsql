-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 06, 2022 at 09:33 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medfast`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` int(11) NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `OrderNumber` (`OrderNumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

DROP TABLE IF EXISTS `buyers`;
CREATE TABLE IF NOT EXISTS `buyers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`id`, `name`, `pass`, `email`, `phoneNo`, `createdAt`, `updatedAt`) VALUES
(1, 'iosa', '2222', 'email', '2100', '2022-05-06 18:18:51', '2022-05-06 18:18:51'),
(2, 'mimi', '11111', 'email', '2100', '2022-05-06 18:21:17', '2022-05-06 18:21:17'),
(3, 'asd', 'qerqr', 'wefq', '1234', '2022-05-06 21:08:32', '2022-05-06 21:08:32'),
(4, 'uzma', 'hotdogs', 'islu', '00013141', '2022-05-06 21:10:03', '2022-05-06 21:10:03'),
(5, 'yousuf', '123444', 'yusu@gmail', '02141251512', '2022-05-06 21:11:39', '2022-05-06 21:11:39');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `productID` (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `productID` int(11) NOT NULL,
  `stocks` int(11) DEFAULT NULL,
  KEY `productID` (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `cartID` int(11) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `orderdate` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `cartID` (`cartID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders_history`
--

DROP TABLE IF EXISTS `orders_history`;
CREATE TABLE IF NOT EXISTS `orders_history` (
  `OrderID` int(11) NOT NULL,
  `paymentID` int(11) NOT NULL,
  KEY `OrderID` (`OrderID`),
  KEY `paymentID` (`paymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `billID` int(11) NOT NULL,
  `method` enum('credit card','jazzCash/Easypaisa','Cash on delivery') NOT NULL,
  `status` enum('True','False') NOT NULL,
  PRIMARY KEY (`paymentID`),
  KEY `billID` (`billID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `prdname` varchar(255) DEFAULT NULL,
  `type` enum('ointment','syrup','tablets','gel') DEFAULT NULL,
  `dosage` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `ratings` enum('1','2','3','4','5') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `prdname`, `type`, `dosage`, `price`, `details`, `ratings`, `createdAt`, `updatedAt`) VALUES
(1, 'panadol', 'tablets', '250mg', 250, 'none', '3', '2020-12-12 23:00:00', '2020-12-12 23:00:00'),
(2, 'mimi', 'gel', '2g', 150.5, 'new product', '4', '2022-05-06 19:06:51', '2022-05-06 19:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
CREATE TABLE IF NOT EXISTS `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
CREATE TABLE IF NOT EXISTS `sells` (
  `SellerID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  KEY `SellerID` (`SellerID`),
  KEY `productID` (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
