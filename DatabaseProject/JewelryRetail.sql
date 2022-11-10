-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 04:15 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jems`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `choker_necklace_purchasers`
-- (See below for the actual view)
--
CREATE TABLE `choker_necklace_purchasers` (
`Customer_name` varchar(40)
,`Phone` char(16)
,`Amount_Payed` double(19,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` char(6) NOT NULL,
  `Preference` varchar(20) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_id`, `Preference`, `Name`) VALUES
('AL0323', 'Express', 'Anthony Le'),
('CS1000', 'Express', 'Christopher Ryu'),
('DA0332', 'Mid-Tier', 'Dave Garcia-Gomez'),
('KE0131', 'Normal', 'Kevin Wortman'),
('PA0121', 'Express', 'Paul Inventado'),
('SA1874', 'Express', 'Sam Smith'),
('YU0240', 'Normal', 'Yu Bai');

-- --------------------------------------------------------

--
-- Table structure for table `exclusive_products`
--

CREATE TABLE `exclusive_products` (
  `MID` char(6) NOT NULL,
  `Pname` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exclusive_products`
--

INSERT INTO `exclusive_products` (`MID`, `Pname`) VALUES
('123456', 'Choker Necklace'),
('987654', 'Emerald Ring');

-- --------------------------------------------------------

--
-- Table structure for table `makes_order`
--

CREATE TABLE `makes_order` (
  `CID` char(6) NOT NULL,
  `TID` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `makes_order`
--

INSERT INTO `makes_order` (`CID`, `TID`) VALUES
('AL0323', 'ID-9812551'),
('CS1000', 'ID-5670981'),
('DA0332', 'ID-9473216'),
('KE0131', 'ID-9529904'),
('PA0121', 'ID-4597292'),
('SA1874', 'ID-8492857'),
('YU0240', 'ID-1791294');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Membership_id` char(6) NOT NULL,
  `Discount` float NOT NULL,
  `CID` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Membership_id`, `Discount`, `CID`) VALUES
('123456', 0.15, 'SA1874'),
('987654', 0.2, 'DA0332');

-- --------------------------------------------------------

--
-- Stand-in structure for view `nosparkle_ruby_necklace_members`
-- (See below for the actual view)
--
CREATE TABLE `nosparkle_ruby_necklace_members` (
`Name` varchar(40)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Transaction_id` char(10) NOT NULL,
  `Qty_of_product` int(11) NOT NULL,
  `Tax` decimal(2,2) NOT NULL,
  `Total_cost` decimal(10,2) NOT NULL,
  `Customer_name` varchar(40) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Estimated_date` varchar(40) NOT NULL,
  `Phone` char(16) NOT NULL,
  `Shipping_address` varchar(70) NOT NULL,
  `Shipping_choice` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Transaction_id`, `Qty_of_product`, `Tax`, `Total_cost`, `Customer_name`, `Email`, `Estimated_date`, `Phone`, `Shipping_address`, `Shipping_choice`) VALUES
('ID-1791294', 1, '0.08', '66.78', 'Yu Bai', 'ybai@csu.fullerton.edu', 'Thursday May 13th', '1-(714)-444-9834', '2810 E Imperial Hwy Fullerton CA 92835', 'Normal'),
('ID-4597292', 2, '0.08', '284.78', 'Paul Inventado', 'pinventado@csu.fullerton.edu', 'Wednesday May 12th', '1-(714)-543-1134', '1061 N State College Blvd Anaheim CA 92806', 'Express'),
('ID-5670981', 1, '0.08', '68.78', 'Christopher Ryu', 'cryu@csu.fullerton.edu', 'Tuesday May 9th', '1-(714)-790-1234', '800 N State College Blvd, Fullerton, CA 92831', 'Express'),
('ID-8492857', 2, '0.10', '261.02', 'Sam Smith', 'samsmith777@gmail.com', 'Monday May 10th', '1-(714)-395-2964', '1061 N State College Blvd Anaheim CA 92806', 'Express'),
('ID-9473216', 3, '0.08', '537.65', 'Dave Garcia-Gomez', 'dgarciagomez@csu.fullerton.edu', 'Monday May 10th', '1-(714)-738-3879', '2403 E Chapman Ave Fullerton CA 92831', 'Mid-Tier'),
('ID-9529904', 1, '0.08', '66.78', 'Kevin Wortman', 'kwortman@csu.fullerton.edu', 'Tuesday May 11th', '1-(714)-395-2964', '770 W Chapman Ave Placentia CA 92870', 'Normal'),
('ID-9812551', 6, '0.08', '392.73', 'Anthony Le', 'ale@csu.fullerton.edu', 'Friday May 13th', '1-(714)-482-6645', '805 W State College Blvd, Fullerton, CA 92831', 'Express');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `CID` char(6) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Expiration_date` varchar(5) NOT NULL,
  `Card_number` char(16) NOT NULL,
  `Verification_code` char(3) NOT NULL,
  `Payment_type` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`CID`, `Description`, `Expiration_date`, `Card_number`, `Verification_code`, `Payment_type`) VALUES
('AL0323', 'Discover', '08/25', '4897123456618845', '542', 'Debit Card'),
('CS1000', 'Visa', '01/25', '1111222233334444', '909', 'Credit Card'),
('DA0332', 'Visa', '07/25', '7746385594837295', '897', 'Debit Card'),
('KE0131', 'Chase', '02/25', '4386039286947381', '231', 'Credit Card'),
('PA0121', 'MasterCard', '06/25', '9987456356560012', '901', 'Credit Card'),
('SA1874', 'American Express', '11/25', '8371869205728548', '456', 'Credit Card'),
('SA1874', 'Visa', '11/25', '9285730291857483', '124', 'Debit Card'),
('YU0240', 'Discover', '03/25', '3286749385068277', '882', 'Debit Card');

-- --------------------------------------------------------

--
-- Table structure for table `procurement`
--

CREATE TABLE `procurement` (
  `Product_Name` varchar(40) NOT NULL,
  `Product_Manufacturer` varchar(40) NOT NULL,
  `Action` varchar(40) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Date_of_Request` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `procurement`
--

INSERT INTO `procurement` (`Product_Name`, `Product_Manufacturer`, `Action`, `Quantity`, `Date_of_Request`) VALUES
('Platinum Bracelet', 'Style Manufacturing', 'Order', 10, '2021-05-10'),
('Sapphire Earring', 'Fashion Manufacturing', 'Order', 2, '2021-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PName` varchar(40) NOT NULL,
  `Supplier_name` varchar(20) NOT NULL,
  `Cost` decimal(10,2) NOT NULL,
  `Manufacturer` varchar(40) NOT NULL,
  `Reorder_limit` int(11) NOT NULL,
  `Customer_price` decimal(10,2) NOT NULL,
  `Amount_in_stock` int(11) NOT NULL,
  `Karats` int(11) NOT NULL,
  `Metal_classification` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Size` int(11) NOT NULL,
  `Exclusivity` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PName`, `Supplier_name`, `Cost`, `Manufacturer`, `Reorder_limit`, `Customer_price`, `Amount_in_stock`, `Karats`, `Metal_classification`, `Type`, `Size`, `Exclusivity`) VALUES
('Choker Necklace', 'Cheapo Manufacturing', '49.99', 'Cheapo Manufacturing', 10, '200.00', 200, 0, 'Gold', 'Necklace', 14, 1),
('Emerald Ring', 'Halqa Inc.', '89.99', 'Alliance Manufacturing', 2, '359.99', 50, 3, 'Gold', 'Ring', 7, 1),
('NoSparkle Ruby Necklace', 'Plastic Gem Inc.', '39.99', 'Plastic Gem Inc.', 10, '79.99', 200, 0, 'Bronze', 'Necklace', 12, 0),
('Platinum Bracelet', 'Tekubi Inc.', '39.99', 'Style Manufacturing', 10, '59.99', 2, 0, 'Platinum', 'Bracelet', 7, 0),
('Sapphire Earring', 'Kostbaar Inc.', '39.99', 'Fashion Manufacturing', 2, '89.99', 2, 2, 'Silver', 'Earring', 1, 0);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `Below_2` AFTER UPDATE ON `product` FOR EACH ROW IF (NEW.Amount_in_Stock = 2 ) THEN
INSERT INTO Procurement VALUES ( OLD.Pname, 
OLD.Manufacturer, 
'Order', 
OLD.Reorder_limit, 
CURDATE());
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `products_contained`
--

CREATE TABLE `products_contained` (
  `PrName` varchar(40) NOT NULL,
  `TID` char(10) NOT NULL,
  `Number_of_products` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_contained`
--

INSERT INTO `products_contained` (`PrName`, `TID`, `Number_of_products`) VALUES
('Choker Necklace', 'ID-8492857', 1),
('Choker Necklace', 'ID-9473216', 1),
('Emerald Ring', 'ID-9473216', 1),
('NoSparkle Ruby Necklace', 'ID-8492857', 1),
('Platinum Bracelet', 'ID-1791294', 1),
('Platinum Bracelet', 'ID-4597292', 1),
('Platinum Bracelet', 'ID-5670981', 1),
('Platinum Bracelet', 'ID-9473216', 1),
('Platinum Bracelet', 'ID-9529904', 1),
('Platinum Bracelet', 'ID-9812551', 6),
('Sapphire Earring', 'ID-4597292', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_with_gt10_sold`
-- (See below for the actual view)
--
CREATE TABLE `products_with_gt10_sold` (
`Pname` varchar(40)
,`Manufacturer` varchar(40)
);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_method`
--

CREATE TABLE `shipping_method` (
  `Shipping_type` varchar(20) NOT NULL,
  `Delivery_days` int(11) NOT NULL,
  `Shipping_cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shipping_method`
--

INSERT INTO `shipping_method` (`Shipping_type`, `Delivery_days`, `Shipping_cost`) VALUES
('Express', 2, '3.99'),
('Mid-Tier', 5, '1.99'),
('Normal', 7, '0.99');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SName` varchar(20) NOT NULL,
  `Address` varchar(120) NOT NULL,
  `PHONE` char(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SName`, `Address`, `PHONE`) VALUES
('Cheapo Manufacturing', '89 Elizabeth Court Frankfort, KY 40601', '1-(714)-888-3828'),
('Halqa Inc.', '72 Placentia CA 45331', '1-(714)-921-8790'),
('Kostbaar Inc.', '54 Fullerton CA 88213', '1-(562)-800-0090'),
('Plastic Gem Inc.', '32 Casper WY 15379', '1-(307)-180-0227'),
('Tekubi Inc.', '93 Chino CA 67980', '1-(909)-487-6345');

-- --------------------------------------------------------

--
-- Structure for view `choker_necklace_purchasers`
--
DROP TABLE IF EXISTS `choker_necklace_purchasers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `choker_necklace_purchasers`  AS SELECT `o`.`Customer_name` AS `Customer_name`, `o`.`Phone` AS `Phone`, round(`p`.`Customer_price` * (1 - `m`.`Discount`) * (1 + `o`.`Tax`),2) AS `Amount_Payed` FROM ((((`orders` `o` join `products_contained` `pc`) join `product` `p`) join `exclusive_products` `ep`) join `member` `m`) WHERE `o`.`Transaction_id` = `pc`.`TID` AND `pc`.`PrName` = `p`.`PName` AND `p`.`PName` = `ep`.`Pname` AND `ep`.`MID` = `m`.`Membership_id` AND `pc`.`PrName` = 'Choker Necklace' AND `p`.`Size` = 14 ;

-- --------------------------------------------------------

--
-- Structure for view `nosparkle_ruby_necklace_members`
--
DROP TABLE IF EXISTS `nosparkle_ruby_necklace_members`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `nosparkle_ruby_necklace_members`  AS SELECT `c`.`Name` AS `Name` FROM (((`customer` `c` join `member` `m`) join `makes_order` `mo`) join `products_contained` `pc`) WHERE `c`.`Customer_id` = `m`.`CID` AND `c`.`Customer_id` = `mo`.`CID` AND `mo`.`TID` = `pc`.`TID` AND `pc`.`PrName` = 'NoSparkle Ruby Necklace' ;

-- --------------------------------------------------------

--
-- Structure for view `products_with_gt10_sold`
--
DROP TABLE IF EXISTS `products_with_gt10_sold`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_with_gt10_sold`  AS SELECT `p`.`PName` AS `Pname`, `p`.`Manufacturer` AS `Manufacturer` FROM (`product` `p` join `products_contained` `pc`) WHERE `p`.`PName` = `pc`.`PrName` GROUP BY `p`.`PName` HAVING count(0) > 10 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`,`Preference`),
  ADD KEY `Preference` (`Preference`);

--
-- Indexes for table `exclusive_products`
--
ALTER TABLE `exclusive_products`
  ADD PRIMARY KEY (`MID`,`Pname`),
  ADD KEY `Pname` (`Pname`);

--
-- Indexes for table `makes_order`
--
ALTER TABLE `makes_order`
  ADD PRIMARY KEY (`CID`,`TID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Membership_id`),
  ADD KEY `CID` (`CID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Transaction_id`),
  ADD KEY `Shipping_choice` (`Shipping_choice`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`CID`,`Description`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PName`),
  ADD KEY `Supplier_name` (`Supplier_name`);

--
-- Indexes for table `products_contained`
--
ALTER TABLE `products_contained`
  ADD PRIMARY KEY (`PrName`,`TID`),
  ADD KEY `TID` (`TID`);

--
-- Indexes for table `shipping_method`
--
ALTER TABLE `shipping_method`
  ADD PRIMARY KEY (`Shipping_type`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SName`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Preference`) REFERENCES `shipping_method` (`Shipping_type`);

--
-- Constraints for table `exclusive_products`
--
ALTER TABLE `exclusive_products`
  ADD CONSTRAINT `exclusive_products_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `member` (`Membership_id`),
  ADD CONSTRAINT `exclusive_products_ibfk_2` FOREIGN KEY (`Pname`) REFERENCES `product` (`PName`);

--
-- Constraints for table `makes_order`
--
ALTER TABLE `makes_order`
  ADD CONSTRAINT `makes_order_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`),
  ADD CONSTRAINT `makes_order_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `orders` (`Transaction_id`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Shipping_choice`) REFERENCES `shipping_method` (`Shipping_type`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_name`) REFERENCES `supplier` (`SName`);

--
-- Constraints for table `products_contained`
--
ALTER TABLE `products_contained`
  ADD CONSTRAINT `products_contained_ibfk_1` FOREIGN KEY (`PrName`) REFERENCES `product` (`PName`),
  ADD CONSTRAINT `products_contained_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `orders` (`Transaction_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
