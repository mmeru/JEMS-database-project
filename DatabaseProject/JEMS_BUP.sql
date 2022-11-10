-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: JEMS
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `choker_necklace_purchasers`
--

DROP TABLE IF EXISTS `choker_necklace_purchasers`;
/*!50001 DROP VIEW IF EXISTS `choker_necklace_purchasers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `choker_necklace_purchasers` (
  `Customer_name` tinyint NOT NULL,
  `Phone` tinyint NOT NULL,
  `Amount_Payed` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_id` char(6) NOT NULL,
  `Preference` varchar(20) NOT NULL,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Customer_id`,`Preference`),
  KEY `Preference` (`Preference`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Preference`) REFERENCES `shipping_method` (`Shipping_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('AL0323','Express','Anthony Le'),('CS1000','Express','Christopher Ryu'),('DA0332','Mid-Tier','Dave Garcia-Gomez'),('KE0131','Normal','Kevin Wortman'),('PA0121','Express','Paul Inventado'),('SA1874','Express','Sam Smith'),('YU0240','Normal','Yu Bai');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exclusive_products`
--

DROP TABLE IF EXISTS `exclusive_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exclusive_products` (
  `MID` char(6) NOT NULL,
  `Pname` varchar(40) NOT NULL,
  PRIMARY KEY (`MID`,`Pname`),
  KEY `Pname` (`Pname`),
  CONSTRAINT `exclusive_products_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `member` (`Membership_id`),
  CONSTRAINT `exclusive_products_ibfk_2` FOREIGN KEY (`Pname`) REFERENCES `product` (`PName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exclusive_products`
--

LOCK TABLES `exclusive_products` WRITE;
/*!40000 ALTER TABLE `exclusive_products` DISABLE KEYS */;
INSERT INTO `exclusive_products` VALUES ('123456','Choker Necklace'),('987654','Emerald Ring');
/*!40000 ALTER TABLE `exclusive_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makes_order`
--

DROP TABLE IF EXISTS `makes_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `makes_order` (
  `CID` char(6) NOT NULL,
  `TID` char(10) NOT NULL,
  PRIMARY KEY (`CID`,`TID`),
  KEY `TID` (`TID`),
  CONSTRAINT `makes_order_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`),
  CONSTRAINT `makes_order_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `orders` (`Transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makes_order`
--

LOCK TABLES `makes_order` WRITE;
/*!40000 ALTER TABLE `makes_order` DISABLE KEYS */;
INSERT INTO `makes_order` VALUES ('AL0323','ID-9812551'),('CS1000','ID-5670981'),('DA0332','ID-9473216'),('KE0131','ID-9529904'),('PA0121','ID-4597292'),('SA1874','ID-8492857'),('YU0240','ID-1791294');
/*!40000 ALTER TABLE `makes_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `Membership_id` char(6) NOT NULL,
  `Discount` float NOT NULL,
  `CID` char(6) NOT NULL,
  PRIMARY KEY (`Membership_id`),
  KEY `CID` (`CID`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('123456',0.15,'SA1874'),('987654',0.2,'DA0332');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `nosparkle_ruby_necklace_members`
--

DROP TABLE IF EXISTS `nosparkle_ruby_necklace_members`;
/*!50001 DROP VIEW IF EXISTS `nosparkle_ruby_necklace_members`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `nosparkle_ruby_necklace_members` (
  `Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `Shipping_choice` varchar(40) NOT NULL,
  PRIMARY KEY (`Transaction_id`),
  KEY `Shipping_choice` (`Shipping_choice`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Shipping_choice`) REFERENCES `shipping_method` (`Shipping_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ID-1791294',1,0.08,66.78,'Yu Bai','ybai@csu.fullerton.edu','Thursday May 13th','1-(714)-444-9834','2810 E Imperial Hwy Fullerton CA 92835','Normal'),('ID-4597292',2,0.08,284.78,'Paul Inventado','pinventado@csu.fullerton.edu','Wednesday May 12th','1-(714)-543-1134','1061 N State College Blvd Anaheim CA 92806','Express'),('ID-5670981',1,0.08,68.78,'Christopher Ryu','cryu@csu.fullerton.edu','Tuesday May 9th','1-(714)-790-1234','800 N State College Blvd, Fullerton, CA 92831','Express'),('ID-8492857',2,0.10,261.02,'Sam Smith','samsmith777@gmail.com','Monday May 10th','1-(714)-395-2964','1061 N State College Blvd Anaheim CA 92806','Express'),('ID-9473216',3,0.08,537.65,'Dave Garcia-Gomez','dgarciagomez@csu.fullerton.edu','Monday May 10th','1-(714)-738-3879','2403 E Chapman Ave Fullerton CA 92831','Mid-Tier'),('ID-9529904',1,0.08,66.78,'Kevin Wortman','kwortman@csu.fullerton.edu','Tuesday May 11th','1-(714)-395-2964','770 W Chapman Ave Placentia CA 92870','Normal'),('ID-9812551',6,0.08,392.73,'Anthony Le','ale@csu.fullerton.edu','Friday May 13th','1-(714)-482-6645','805 W State College Blvd, Fullerton, CA 92831','Express');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `CID` char(6) NOT NULL,
  `Description` varchar(30) NOT NULL,
  `Expiration_date` varchar(5) NOT NULL,
  `Card_number` char(16) NOT NULL,
  `Verification_code` char(3) NOT NULL,
  `Payment_type` varchar(10) NOT NULL,
  PRIMARY KEY (`CID`,`Description`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('AL0323','Discover','08/25','4897123456618845','542','Debit Card'),('CS1000','Vise','01/25','1111222233334444','909','Credit Car'),('DA0332','Visa','07/25','7746385594837295','897','Debit Card'),('KE0131','Chase','02/25','4386039286947381','231','Credit Car'),('PA0121','MasterCard','06/25','9987456356560012','901','Credit Car'),('SA1874','American Express','11/25','8371869205728548','456','Credit Car'),('SA1874','Visa','11/25','9285730291857483','124','Debit Card'),('YU0240','Discover','03/25','3286749385068277','882','Debit Card');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procurement`
--

DROP TABLE IF EXISTS `procurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procurement` (
  `Product_Name` varchar(40) NOT NULL,
  `Product_Manufacturer` varchar(40) NOT NULL,
  `Action` varchar(40) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Date_of_Request` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procurement`
--

LOCK TABLES `procurement` WRITE;
/*!40000 ALTER TABLE `procurement` DISABLE KEYS */;
INSERT INTO `procurement` VALUES ('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-10'),('Sapphire Earring','Fashion Manufacturing','Order',2,'2021-05-10'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16'),('Platinum Bracelet','Style Manufacturing','Order',10,'2021-05-16');
/*!40000 ALTER TABLE `procurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `Exclusivity` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`PName`),
  KEY `Supplier_name` (`Supplier_name`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_name`) REFERENCES `supplier` (`SName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Choker Necklace','Cheapo Manufacturing',49.99,'Cheapo Manufacturing',10,200.00,200,0,'Gold','Necklace',14,1),('Emerald Ring','Halqa Inc.',89.99,'Alliance Manufacturing',2,359.99,50,3,'Gold','Ring',7,1),('NoSparkle Ruby Necklace','Plastic Gem Inc.',39.99,'Plastic Gem Inc.',10,79.99,200,0,'Bronze','Necklace',12,0),('Platinum Bracelet','Tekubi Inc.',39.99,'Style Manufacturing',10,59.99,2,0,'Platinum','Bracelet',7,0),('Sapphire Earring','Kostbaar Inc.',39.99,'Fashion Manufacturing',2,89.99,2,2,'Silver','Earring',1,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Below_2` AFTER UPDATE ON `product` FOR EACH ROW IF (NEW.Amount_in_Stock = 2 ) THEN
INSERT INTO Procurement VALUES ( OLD.Pname, 
OLD.Manufacturer, 
'Order', 
OLD.Reorder_limit, 
CURDATE());
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `products_contained`
--

DROP TABLE IF EXISTS `products_contained`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_contained` (
  `PrName` varchar(40) NOT NULL,
  `TID` char(10) NOT NULL,
  `Number_of_products` int(11) NOT NULL,
  PRIMARY KEY (`PrName`,`TID`),
  KEY `TID` (`TID`),
  CONSTRAINT `products_contained_ibfk_1` FOREIGN KEY (`PrName`) REFERENCES `product` (`PName`),
  CONSTRAINT `products_contained_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `orders` (`Transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_contained`
--

LOCK TABLES `products_contained` WRITE;
/*!40000 ALTER TABLE `products_contained` DISABLE KEYS */;
INSERT INTO `products_contained` VALUES ('Choker Necklace','ID-8492857',1),('Choker Necklace','ID-9473216',1),('Emerald Ring','ID-9473216',1),('NoSparkle Ruby Necklace','ID-8492857',1),('Platinum Bracelet','ID-1791294',1),('Platinum Bracelet','ID-4597292',1),('Platinum Bracelet','ID-5670981',1),('Platinum Bracelet','ID-9473216',1),('Platinum Bracelet','ID-9529904',1),('Platinum Bracelet','ID-9812551',6),('Sapphire Earring','ID-4597292',1);
/*!40000 ALTER TABLE `products_contained` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `products_with_gt10_sold`
--

DROP TABLE IF EXISTS `products_with_gt10_sold`;
/*!50001 DROP VIEW IF EXISTS `products_with_gt10_sold`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `products_with_gt10_sold` (
  `Pname` tinyint NOT NULL,
  `Manufacturer` tinyint NOT NULL,
  `UNITS_SOLD` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method` (
  `Shipping_type` varchar(20) NOT NULL,
  `Delivery_days` int(11) NOT NULL,
  `Shipping_cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Shipping_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES ('Express',2,3.99),('Mid-Tier',5,1.99),('Normal',7,0.99);
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SName` varchar(20) NOT NULL,
  `Address` varchar(120) NOT NULL,
  `PHONE` char(16) DEFAULT NULL,
  PRIMARY KEY (`SName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('Cheapo Manufacturing','89 Elizabeth Court Frankfort, KY 40601','1-(714)-888-3828'),('Halqa Inc.','72 Placentia CA 45331','1-(714)-921-8790'),('Kostbaar Inc.','54 Fullerton CA 88213','1-(562)-800-0090'),('Plastic Gem Inc.','32 Casper WY 15379','1-(307)-180-0227'),('Tekubi Inc.','93 Chino CA 67980','1-(909)-487-6345');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `choker_necklace_purchasers`
--

/*!50001 DROP TABLE IF EXISTS `choker_necklace_purchasers`*/;
/*!50001 DROP VIEW IF EXISTS `choker_necklace_purchasers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `choker_necklace_purchasers` AS select `o`.`Customer_name` AS `Customer_name`,`o`.`Phone` AS `Phone`,round(`p`.`Customer_price` * (1 - `m`.`Discount`) * (1 + `o`.`Tax`),2) AS `Amount_Payed` from ((((`orders` `o` join `products_contained` `pc`) join `product` `p`) join `exclusive_products` `ep`) join `member` `m`) where `o`.`Transaction_id` = `pc`.`TID` and `pc`.`PrName` = `p`.`PName` and `p`.`PName` = `ep`.`Pname` and `ep`.`MID` = `m`.`Membership_id` and `pc`.`PrName` = 'Choker Necklace' and `p`.`Size` = 14 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nosparkle_ruby_necklace_members`
--

/*!50001 DROP TABLE IF EXISTS `nosparkle_ruby_necklace_members`*/;
/*!50001 DROP VIEW IF EXISTS `nosparkle_ruby_necklace_members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nosparkle_ruby_necklace_members` AS select `c`.`Name` AS `Name` from (((`customer` `c` join `member` `m`) join `makes_order` `mo`) join `products_contained` `pc`) where `c`.`Customer_id` = `m`.`CID` and `c`.`Customer_id` = `mo`.`CID` and `mo`.`TID` = `pc`.`TID` and `pc`.`PrName` = 'NoSparkle Ruby Necklace' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products_with_gt10_sold`
--

/*!50001 DROP TABLE IF EXISTS `products_with_gt10_sold`*/;
/*!50001 DROP VIEW IF EXISTS `products_with_gt10_sold`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_with_gt10_sold` AS select `p`.`PName` AS `Pname`,`p`.`Manufacturer` AS `Manufacturer`,sum(`pc`.`Number_of_products`) AS `UNITS_SOLD` from (`product` `p` join `products_contained` `pc`) where `p`.`PName` = `pc`.`PrName` group by `p`.`PName` having sum(`pc`.`Number_of_products`) > 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-16 17:41:07
