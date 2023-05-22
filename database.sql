-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `AccountName` varchar(255) DEFAULT NULL,
  `Balance` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'Kevin',7998.58),(2,2,'Nicole',6628.56);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Income'),(2,'Groceries'),(3,'Transport'),(4,'Dineout'),(5,'Beauty'),(6,'Furniture'),(7,'Household'),(8,'Kitchen'),(9,'Rent'),(10,'Entertainment'),(11,'Miscellaneous');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Amount` decimal(12,2) DEFAULT NULL,
  `TransactionDate` date DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `UserID` (`UserID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,2,3,'Uber',80.00,'2023-01-29'),(2,1,4,'Dinner',44.00,'2023-01-29'),(3,2,2,'Metro',82.85,'2023-01-29'),(4,2,2,'Metro',121.64,'2023-01-30'),(5,2,2,'Dollarama',11.30,'2023-01-30'),(6,1,2,'H Mart',18.77,'2023-01-30'),(7,2,1,'Salary',2920.00,'2023-01-31'),(8,1,2,'Metro',4.65,'2023-01-31'),(9,1,1,'Salary',2920.00,'2023-01-31'),(10,1,4,'Ramen',42.00,'2023-01-31'),(11,1,2,'Loblaws',11.30,'2023-01-31'),(12,2,4,'Ramen',69.51,'2023-02-02'),(13,1,2,'Loblaws',111.07,'2023-02-03'),(14,2,2,'H Mart',32.29,'2023-02-03'),(15,2,2,'Dollarama',7.06,'2023-02-03'),(16,1,6,'Pillows and Cover',264.42,'2023-02-03'),(17,1,6,'Mattress',115.00,'2023-02-03'),(18,1,2,'Metro',10.97,'2023-02-04'),(19,2,5,'Skincare',23.93,'2023-02-04'),(20,2,4,'Coffee and Cake',17.47,'2023-02-04'),(21,1,6,'Cups',17.97,'2023-02-04'),(22,2,4,'Korean Food',95.00,'2023-02-05'),(23,2,5,'Skincare',15.24,'2023-02-06'),(24,1,11,'Tenant Insurance',420.12,'2023-02-07'),(25,2,3,'Car Rental',150.00,'2023-02-07'),(26,1,3,'Car Rental',437.60,'2023-02-07'),(27,1,7,'Canadian Tire',35.01,'2023-02-07'),(28,1,6,'Ikea',70.01,'2023-02-07'),(29,2,4,'Hotpot',110.00,'2023-02-07'),(30,1,2,'T&T',78.98,'2023-02-07'),(31,1,2,'Metro',52.71,'2023-02-08'),(32,1,2,'Metro',5.64,'2023-02-08'),(33,2,11,'Bank Draft Fee',19.90,'2023-02-09'),(34,2,6,'Mattress ',986.75,'2023-02-09'),(35,2,6,'Duvet and Cover',580.82,'2023-02-09'),(36,2,6,'Dinning Table',313.00,'2023-02-09'),(37,2,6,'Coffee Table',264.41,'2023-02-09'),(38,1,6,'Sofa',1015.87,'2023-02-09'),(39,1,6,'Bed Frame',450.87,'2023-02-09'),(40,2,2,'Costco',300.00,'2023-02-10'),(41,2,6,'TV',1249.99,'2023-02-10'),(42,2,6,'Bed Sheet',374.00,'2023-02-10'),(43,2,6,'Hair Dryer',259.89,'2023-02-10'),(44,2,6,'Rice Cooker',101.68,'2023-02-10'),(45,1,6,'Ikea',49.70,'2023-02-11'),(46,2,7,'Candian Tire',152.48,'2023-02-11'),(47,1,2,'Metro',14.10,'2023-02-11'),(48,1,7,'Canadian Tire',297.10,'2023-02-12'),(49,1,6,'Ikea',670.15,'2023-02-12'),(50,1,9,'Rent',1375.00,'2023-02-12'),(51,2,9,'Rent',1375.00,'2023-02-12'),(52,1,7,'Loblows',143.25,'2023-02-12'),(53,2,4,'Lunch',50.68,'2023-02-12'),(54,1,7,'Loblaws',16.94,'2023-02-12'),(55,1,4,'Mcdonald\'s',35.67,'2023-02-12'),(56,1,6,'Structube',352.56,'2023-02-13'),(57,1,7,'Canadian Tire',38.41,'2023-02-13'),(58,1,6,'Ikea',575.10,'2023-02-13'),(59,1,4,'Lunch',27.28,'2023-02-13'),(60,2,4,'Dinner',70.60,'2023-02-14'),(61,1,6,'Ikea',381.75,'2023-02-14'),(62,2,8,'Cooking Pot',308.48,'2023-02-14'),(63,2,6,'Office Chairs',524.85,'2023-02-14'),(64,2,6,'TV Stand',203.60,'2023-02-14'),(65,1,6,'Table Top',56.50,'2023-02-14'),(66,2,1,'Salary',2920.00,'2023-02-15'),(67,1,1,'Salary',2920.00,'2023-02-15'),(68,2,3,'Gas',37.56,'2023-02-15'),(69,2,3,'Parking Fee',16.00,'2023-02-16'),(70,1,2,'Loblaws ',168.02,'2023-02-16'),(71,2,4,'Dessert',28.60,'2023-02-18'),(72,1,2,'Dollarama',7.91,'2023-02-18'),(73,1,2,'Loblaws ',155.42,'2023-02-21'),(74,2,11,'Amazon Purchase',219.75,'2023-02-21'),(75,2,3,'Uber',50.29,'2023-02-22'),(76,1,7,'Shoppers ',28.53,'2023-02-23'),(77,1,2,'Loblaws ',53.44,'2023-02-23'),(78,2,11,'Amazon Purchase',58.74,'2023-02-24'),(79,2,2,'Loblaws',65.49,'2023-02-25'),(80,2,2,'LCBO',22.95,'2023-02-25'),(81,1,6,'Printer',154.23,'2023-02-26'),(82,1,10,'Movie Tickets',22.04,'2023-02-27'),(83,2,4,'Lunch',44.63,'2023-02-27'),(84,2,4,'Smoothie',8.46,'2023-02-28'),(85,1,1,'Salary',2920.00,'2023-02-28'),(86,2,1,'Salary',2920.00,'2023-02-28'),(87,1,4,'Fried Chicken',41.22,'2023-02-28'),(88,2,3,'Highway Tolls',46.34,'2023-02-28'),(89,1,2,'Loblaws',150.85,'2023-03-01'),(90,2,7,'Amazon Purchase',425.98,'2023-03-05'),(91,2,2,'LCBO',10.10,'2023-03-06'),(92,2,2,'Loblaws',173.63,'2023-03-06'),(93,1,7,'Loblaws',5.64,'2023-03-08'),(94,1,7,'Shoppers',30.81,'2023-03-08'),(95,1,4,'Lunch',79.26,'2023-03-08'),(96,2,2,'Loblaws',6.99,'2023-03-09'),(97,1,2,'Pusateri\'s',62.24,'2023-03-10'),(98,1,2,'LCBO',11.50,'2023-03-10'),(99,1,8,'Hotpot Pot',37.27,'2023-03-11'),(100,2,9,'Rent',1375.00,'2023-03-12'),(101,1,9,'Rent',1375.00,'2023-03-12'),(102,1,7,'Canadian Tire',119.95,'2023-03-12'),(103,2,2,'Coffee Bean',48.65,'2023-03-13'),(104,2,6,'Ikea ',132.24,'2023-03-13'),(105,2,2,'Loblaws',80.91,'2023-03-14'),(106,2,3,'Uber',44.08,'2023-03-14'),(107,1,1,'Salary',2920.00,'2023-03-15'),(108,2,1,'Salary',2920.00,'2023-03-15'),(109,1,2,'FreshCo',64.73,'2023-03-17'),(110,2,4,'Forest CafÃ©',25.43,'2023-03-17'),(111,2,2,'Loblaws',64.00,'2023-03-19'),(112,2,2,'Coffee Bean',99.00,'2023-03-20'),(113,2,6,'Ikea ',201.65,'2023-03-22'),(114,2,7,'Canadian Tire',34.78,'2023-03-22'),(115,1,2,'Loblaws',159.62,'2023-03-23'),(116,2,4,'Lunch',134.00,'2023-03-25'),(117,1,2,'Loblaws',113.50,'2023-03-28'),(118,1,1,'Salary',2920.00,'2023-03-31'),(119,1,4,'Lunch',40.00,'2023-03-31'),(120,1,4,'Dinner',13.11,'2023-03-31'),(121,2,1,'Salary',2920.00,'2023-03-31'),(122,2,2,'Loblaws',35.14,'2023-04-02'),(123,1,2,'Dollarama',9.04,'2023-04-04'),(124,1,10,'Movie Tickets',22.04,'2023-04-04'),(125,2,4,'Lunch',30.00,'2023-04-04'),(126,2,2,'Loblaws',12.29,'2023-04-04'),(127,1,4,'Lunch',206.62,'2023-04-07'),(128,2,2,'Loblaws',175.34,'2023-04-08'),(129,1,9,'Rent',1375.00,'2023-04-12'),(130,2,9,'Rent',1375.00,'2023-04-12'),(131,1,2,'Loblaws',104.98,'2023-04-14'),(132,1,7,'Canadian Tire',48.09,'2023-04-14'),(133,2,1,'Salary',2920.00,'2023-04-15'),(134,1,1,'Salary',2920.00,'2023-04-15'),(135,2,11,'Costco Membership',135.60,'2023-04-17'),(136,2,2,'Costco',219.07,'2023-04-18'),(137,1,2,'T&T',105.67,'2023-04-18'),(138,2,4,'Lunch',34.00,'2023-04-18'),(139,1,2,'No Frills',44.34,'2023-04-19'),(140,1,7,'Cooler',67.78,'2023-04-19'),(141,2,5,'Skincare',151.99,'2023-04-20'),(142,2,3,'Parking Fee',2.50,'2023-04-20'),(143,1,3,'Parking Fee',10.00,'2023-04-20'),(144,1,2,'Loblaws',36.28,'2023-04-20'),(145,1,2,'Shoppers',12.41,'2023-04-20'),(146,2,4,'Dinner',32.21,'2023-04-22'),(147,2,4,'Lunch',61.96,'2023-04-24'),(148,2,2,'Freshway Supermarket',72.51,'2023-04-25'),(149,2,4,'Lunch',20.00,'2023-04-25'),(150,1,2,'Costco',235.43,'2023-04-26'),(151,1,2,'Loblaws',28.98,'2023-04-27'),(152,2,2,'Hong Tai Asian Supermarket',46.16,'2023-04-29'),(153,1,1,'Salary',2920.00,'2023-04-30'),(154,2,1,'Salary',2920.00,'2023-04-30');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_balance` AFTER INSERT ON `transactions` FOR EACH ROW BEGIN
    IF NEW.CategoryID = 1 THEN
        UPDATE accounts
        SET accounts.Balance = accounts.Balance + NEW.Amount
        WHERE accounts.UserID = NEW.UserID;
	ELSE
		UPDATE accounts
        SET accounts.Balance = accounts.Balance - NEW.Amount
        WHERE accounts.UserID = NEW.UserID;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kevinc','k12345','kevin@email.com'),(2,'nicolec','n12345','nicole@email.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21  0:12:06
