-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ample
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `catagory`
--

DROP TABLE IF EXISTS `catagory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catagory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catagory`
--

LOCK TABLES `catagory` WRITE;
/*!40000 ALTER TABLE `catagory` DISABLE KEYS */;
INSERT INTO `catagory` VALUES (1,'Processors','A processor (CPU) is the logic circuitry that responds to and processes the basic instructions that drive a computer. The CPU is seen as the main and most crucial integrated circuitry (IC) chip in a c',1,NULL,'2023-07-21 12:29:08'),(2,'Motherboards','A motherboard (also called mainboard, main circuit board, MB, mboard, backplane board, base board, system board, mobo; or in Apple computers logic board)',1,NULL,'2023-07-21 12:29:35'),(3,'RAM (Memory)','Random-access memory is a form of computer memory that can be read and changed in any order, typically used to store working data and machine code.',1,NULL,'2023-07-21 12:37:27');
/*!40000 ALTER TABLE `catagory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ex_date` date NOT NULL,
  `expense_for` varchar(50) NOT NULL,
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `expense_cat` int NOT NULL,
  `ex_description` text NOT NULL,
  `added_by` int DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense`
--

LOCK TABLES `expense` WRITE;
/*!40000 ALTER TABLE `expense` DISABLE KEYS */;
INSERT INTO `expense` VALUES (1,'2023-07-19','Transport',500.00,1,'order delivery',1,'2023-07-21 12:35:30');
/*!40000 ALTER TABLE `expense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_catagory`
--

DROP TABLE IF EXISTS `expense_catagory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_catagory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `added_by` int NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_catagory`
--

LOCK TABLES `expense_catagory` WRITE;
/*!40000 ALTER TABLE `expense_catagory` DISABLE KEYS */;
INSERT INTO `expense_catagory` VALUES (1,'Petrol','Petrol for transport',1,'2023-07-21 12:34:59');
/*!40000 ALTER TABLE `expense_catagory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factory_products`
--

DROP TABLE IF EXISTS `factory_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factory_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `catagory_id` int NOT NULL,
  `catagory_name` varchar(100) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `alert_quantity` int NOT NULL,
  `product_expense` float(15,2) NOT NULL DEFAULT '0.00',
  `sell_price` float(15,2) NOT NULL DEFAULT '0.00',
  `added_by` int NOT NULL,
  `last_update_at` date NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factory_products`
--

LOCK TABLES `factory_products` WRITE;
/*!40000 ALTER TABLE `factory_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `factory_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_number` varchar(100) DEFAULT NULL,
  `customer_id` int NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `sub_total` float(15,2) NOT NULL DEFAULT '0.00',
  `discount` float(15,2) NOT NULL DEFAULT '0.00',
  `pre_cus_due` float(15,2) NOT NULL DEFAULT '0.00',
  `net_total` float(15,2) NOT NULL DEFAULT '0.00',
  `paid_amount` float(15,2) NOT NULL DEFAULT '0.00',
  `due_amount` float(15,2) NOT NULL DEFAULT '0.00',
  `payment_type` varchar(20) NOT NULL,
  `return_status` varchar(30) NOT NULL DEFAULT 'no',
  `last_update` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'S1689942866',1,'Nilesh Pandit','2023-07-28',9000.00,0.00,0.00,9000.00,9000.00,0.00,'Bank Transfer','no',NULL),(2,'S1689943248',1,'Nilesh Pandit','2023-07-27',10000.00,0.00,0.00,10000.00,10000.00,0.00,'Debit Card','no',NULL),(3,'S1718689527',2,'Ranjeet Kumar','2024-06-12',4500.00,0.00,2000.00,6500.00,5000.00,1004.00,'PhonePe','no',NULL);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_details`
--

DROP TABLE IF EXISTS `invoice_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_no` int NOT NULL,
  `pid` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_no` (`invoice_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_details`
--

LOCK TABLES `invoice_details` WRITE;
/*!40000 ALTER TABLE `invoice_details` DISABLE KEYS */;
INSERT INTO `invoice_details` VALUES (1,1,1,'AMD Ryzen 9 5900X Processor','9000',2),(2,2,3,'Adata XPG Gammix D30 8GB 3200MHz DDR4 CL16 RAM Memory Module','10000',5),(3,3,1,'AMD Ryzen 9 5900X Processor','4500',1);
/*!40000 ALTER TABLE `invoice_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `con_num` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `total_buy` float(15,2) NOT NULL DEFAULT '0.00',
  `total_paid` float(15,2) NOT NULL DEFAULT '0.00',
  `total_due` float(15,2) NOT NULL DEFAULT '0.00',
  `reg_date` date NOT NULL,
  `update_by` int DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'C1689940620','Nilesh Pandit','Nilesh Pandit Pvt Ltd','2nd floor, Nikhil Pride Building, Lokmanya Bal Gangadhar Tilak Rd, near Kaka Halwai, Pune, Maharasht','9090909090','nilesh@gmail.com',19000.00,19000.00,0.00,'2023-07-21',1,NULL,'2023-07-21 11:57:00'),(2,'C1717767322','Ranjeet Kumar','TEST COMPANY','Pocket 8, Plot No 1, Sector 44, Noida','1234567890','test@gmail.com',4500.00,5000.00,1004.00,'1970-01-01',1,NULL,'2024-06-07 13:35:22');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymethode`
--

DROP TABLE IF EXISTS `paymethode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymethode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymethode`
--

LOCK TABLES `paymethode` WRITE;
/*!40000 ALTER TABLE `paymethode` DISABLE KEYS */;
INSERT INTO `paymethode` VALUES (1,'PhonePe',NULL,'2023-06-27 04:28:58'),(2,'Gpay',NULL,'2023-06-27 04:29:29'),(3,'Bank Transfer',NULL,'2023-06-27 04:29:29'),(4,'Credit Card',NULL,'2023-06-27 04:30:08'),(5,'Debit Card',NULL,'2023-06-27 04:30:08');
/*!40000 ALTER TABLE `paymethode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `catagory_id` int NOT NULL,
  `catagory_name` varchar(100) DEFAULT NULL,
  `product_source` varchar(20) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `alert_quanttity` int DEFAULT NULL,
  `buy_price` varchar(10) DEFAULT NULL,
  `sell_price` varchar(10) DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `last_update_at` date NOT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'AMD Ryzen 9 5900X Processor','P1689942626','Ryzen',1,'Processors','factory','456AD5S',47,5,'3653','4500',1,'2023-07-27','2023-07-21 12:30:26'),(2,'Intel Core I5-10400 Processor','P1689942673','Intel',1,'Processors','factory','SDS55S',0,5,NULL,NULL,1,'0000-00-00','2023-07-21 12:31:13'),(3,'Adata XPG Gammix D30 8GB 3200MHz DDR4 CL16 RAM Memory Module','P1689943120','XPG',3,'RAM (Memory)','factory','2365SDSV',0,160,'1839','2000',1,'2023-07-19','2023-07-21 12:38:40');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_payment`
--

DROP TABLE IF EXISTS `purchase_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suppliar_id` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` float(15,2) NOT NULL DEFAULT '0.00',
  `payment_type` varchar(20) DEFAULT NULL,
  `pay_description` text NOT NULL,
  `added_by` int DEFAULT NULL,
  `last_update` date DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_payment`
--

LOCK TABLES `purchase_payment` WRITE;
/*!40000 ALTER TABLE `purchase_payment` DISABLE KEYS */;
INSERT INTO `purchase_payment` VALUES (1,1,'2023-07-27',180000.00,'Gpay','',1,NULL,'2023-07-21 12:34:03'),(2,1,'2023-07-19',9195.00,'Debit Card','',1,NULL,'2023-07-21 12:40:07'),(3,2,'2024-06-18',100000.00,'PhonePe','payment done on phonepe',1,NULL,'2024-06-18 05:48:54');
/*!40000 ALTER TABLE `purchase_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_products`
--

DROP TABLE IF EXISTS `purchase_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_suppliar` int DEFAULT NULL,
  `suppliar_name` varchar(255) DEFAULT NULL,
  `prev_quantity` int DEFAULT NULL,
  `purchase_quantity` int DEFAULT NULL,
  `purchase_price` float(15,2) DEFAULT '0.00',
  `purchase_sell_price` float(15,2) DEFAULT '0.00',
  `purchase_subtotal` float(15,2) DEFAULT '0.00',
  `prev_total_due` float(15,2) DEFAULT '0.00',
  `purchase_net_total` float(15,2) DEFAULT '0.00',
  `purchase_paid_bill` float(15,2) DEFAULT '0.00',
  `purchase_due_bill` float(15,2) DEFAULT '0.00',
  `purchase_pamyent_by` varchar(20) DEFAULT NULL,
  `return_status` varchar(50) NOT NULL DEFAULT 'no',
  `added_by` int DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_products`
--

LOCK TABLES `purchase_products` WRITE;
/*!40000 ALTER TABLE `purchase_products` DISABLE KEYS */;
INSERT INTO `purchase_products` VALUES (1,1,'AMD Ryzen 9 5900X Processor','2023-07-27',1,'Rakesh Jadhav',0,50,3653.00,4500.00,182650.00,500.00,183150.00,180000.00,3150.00,'Gpay','no',1,'2023-07-21 12:34:03'),(2,3,'Adata XPG Gammix D30 8GB 3200MHz DDR4 CL16 RAM Memory Module','2023-07-19',1,'Rakesh Jadhav',0,5,1839.00,2000.00,9195.00,3150.00,12345.00,9195.00,3150.00,'Debit Card','no',1,'2023-07-21 12:40:07');
/*!40000 ALTER TABLE `purchase_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_return`
--

DROP TABLE IF EXISTS `purchase_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_return` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sell_id` int DEFAULT NULL,
  `suppliar_id` int DEFAULT NULL,
  `suppliar_name` varchar(50) NOT NULL,
  `return_date` date NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `return_quantity` int NOT NULL,
  `subtotal` float(15,2) NOT NULL DEFAULT '0.00',
  `discount` float(15,2) NOT NULL DEFAULT '0.00',
  `netTotal` float(15,2) NOT NULL DEFAULT '0.00',
  `create_by` int NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_return`
--

LOCK TABLES `purchase_return` WRITE;
/*!40000 ALTER TABLE `purchase_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_payment`
--

DROP TABLE IF EXISTS `sell_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` float(15,2) NOT NULL DEFAULT '0.00',
  `payment_type` varchar(20) NOT NULL,
  `pay_description` text NOT NULL,
  `added_by` int NOT NULL,
  `last_update` date DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_payment`
--

LOCK TABLES `sell_payment` WRITE;
/*!40000 ALTER TABLE `sell_payment` DISABLE KEYS */;
INSERT INTO `sell_payment` VALUES (1,1,'2023-07-28',9000.00,'Bank Transfer','',1,NULL,'2023-07-21 12:34:26'),(2,1,'2023-07-27',10000.00,'Debit Card','',1,NULL,'2023-07-21 12:40:48');
/*!40000 ALTER TABLE `sell_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_return`
--

DROP TABLE IF EXISTS `sell_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_return` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `amount` float(15,2) NOT NULL DEFAULT '0.00',
  `added_by` int DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_return`
--

LOCK TABLES `sell_return` WRITE;
/*!40000 ALTER TABLE `sell_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `con_no` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text,
  `added_by` int DEFAULT NULL,
  `added_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Sushant Kolhe','Manager','8708708702','sushant@gmail.com','besides maruti temple, Shahupuri 5th Ln, E Ward, Shahupuri, Kolhapur, Maharashtra 416001',1,'2023-07-21 12:36:40'),(2,'Mohan Das','Manager','8987848484','mohan.test@test.com','House No 384, Jang Pura, New Delhi 110033',1,'2024-06-07 13:44:13');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliar`
--

DROP TABLE IF EXISTS `suppliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suppliar_id` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `address` text,
  `con_num` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `total_buy` float(15,2) NOT NULL DEFAULT '0.00',
  `total_paid` float(15,2) NOT NULL DEFAULT '0.00',
  `total_due` float(15,2) NOT NULL DEFAULT '0.00',
  `reg_date` date DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_at` date DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliar`
--

LOCK TABLES `suppliar` WRITE;
/*!40000 ALTER TABLE `suppliar` DISABLE KEYS */;
INSERT INTO `suppliar` VALUES (1,'S1689942181','Rakesh Jadhav','Rakesh Jadhav Pvt Ltd.','Level 2, Hermes Palazzo, opposite St Anne\'s School, Camp, Pune, Maharashtra 411001','7070707070','rakesh@gmail.com',191845.00,189195.00,3150.00,'2023-07-21',1,NULL,'2023-07-21 12:23:01'),(2,'S1718689686','Raman Jha','TDM PVT. LTD','Nehru Place New Delhi test','8494849484','tdm.pht@tdm.com',0.00,100000.00,0.00,'2024-02-15',1,NULL,'2024-06-18 05:48:06');
/*!40000 ALTER TABLE `suppliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_role` varchar(10) DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `last_update_at` int DEFAULT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'inventory@admin.com','21232f297a57a5a743894a0e4a801fc3','admin',1,0,'2023-08-24 18:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 11:24:11
