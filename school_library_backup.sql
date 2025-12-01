/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: school_library
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0+deb12u1

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
-- Table structure for table `Borrowing`
--

DROP TABLE IF EXISTS `Borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrowing` (
  `ISBN` varchar(20) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `issuing_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`ISBN`,`reg_no`),
  KEY `reg_no` (`reg_no`),
  CONSTRAINT `Borrowing_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Inventory` (`ISBN`) ON DELETE CASCADE,
  CONSTRAINT `Borrowing_ibfk_2` FOREIGN KEY (`reg_no`) REFERENCES `Students` (`reg_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrowing`
--

LOCK TABLES `Borrowing` WRITE;
/*!40000 ALTER TABLE `Borrowing` DISABLE KEYS */;
INSERT INTO `Borrowing` VALUES
('2001','S20/300','2025-02-22'),
('2140','S23/200','2024-03-21'),
('2147','S20/300','2024-01-21'),
('4302','S11/340','2025-02-23');
/*!40000 ALTER TABLE `Borrowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fines`
--

DROP TABLE IF EXISTS `Fines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fines` (
  `reg_no` varchar(20) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `amount_ksh` decimal(10,2) NOT NULL CHECK (`amount_ksh` > 0),
  PRIMARY KEY (`reg_no`,`ISBN`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `Fines_ibfk_1` FOREIGN KEY (`reg_no`) REFERENCES `Students` (`reg_no`) ON DELETE CASCADE,
  CONSTRAINT `Fines_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `Inventory` (`ISBN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fines`
--

LOCK TABLES `Fines` WRITE;
/*!40000 ALTER TABLE `Fines` DISABLE KEYS */;
INSERT INTO `Fines` VALUES
('S20/300','2147',30000.00);
/*!40000 ALTER TABLE `Fines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fines_Paid`
--

DROP TABLE IF EXISTS `Fines_Paid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fines_Paid` (
  `reg_no` varchar(20) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `amount_ksh` decimal(10,2) NOT NULL CHECK (`amount_ksh` > 0),
  `payment_date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`reg_no`,`ISBN`,`payment_date`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `Fines_Paid_ibfk_1` FOREIGN KEY (`reg_no`) REFERENCES `Students` (`reg_no`) ON DELETE CASCADE,
  CONSTRAINT `Fines_Paid_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `Inventory` (`ISBN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fines_Paid`
--

LOCK TABLES `Fines_Paid` WRITE;
/*!40000 ALTER TABLE `Fines_Paid` DISABLE KEYS */;
INSERT INTO `Fines_Paid` VALUES
('S23/200','2140',400.00,'2024-04-08');
/*!40000 ALTER TABLE `Fines_Paid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `ISBN` varchar(20) NOT NULL,
  `book_name` varchar(200) NOT NULL,
  `number_of_copies` int(11) NOT NULL CHECK (`number_of_copies` >= 0),
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES
('2001','Veterinary Medicine',34),
('2140','Mathematics',37),
('2147','Calculus',72),
('2456','Introduction to Medicine',47),
('4302','Computer Sciences',89);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Notes`
--

DROP TABLE IF EXISTS `Library_Notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library_Notes` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_text` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Notes`
--

LOCK TABLES `Library_Notes` WRITE;
/*!40000 ALTER TABLE `Library_Notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library_Notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Replacement`
--

DROP TABLE IF EXISTS `Replacement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Replacement` (
  `ISBN` varchar(20) NOT NULL,
  `book_name` varchar(200) NOT NULL,
  `date_of_replacement` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`ISBN`,`date_of_replacement`),
  CONSTRAINT `Replacement_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Inventory` (`ISBN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Replacement`
--

LOCK TABLES `Replacement` WRITE;
/*!40000 ALTER TABLE `Replacement` DISABLE KEYS */;
INSERT INTO `Replacement` VALUES
('2140','Mathematics','2024-04-20');
/*!40000 ALTER TABLE `Replacement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Returning`
--

DROP TABLE IF EXISTS `Returning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Returning` (
  `ReturnID` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) NOT NULL,
  `RegNo` varchar(20) NOT NULL,
  `ReturningDate` date NOT NULL,
  PRIMARY KEY (`ReturnID`),
  KEY `ISBN` (`ISBN`),
  KEY `RegNo` (`RegNo`),
  CONSTRAINT `Returning_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Inventory` (`ISBN`),
  CONSTRAINT `Returning_ibfk_2` FOREIGN KEY (`RegNo`) REFERENCES `Students` (`reg_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Returning`
--

LOCK TABLES `Returning` WRITE;
/*!40000 ALTER TABLE `Returning` DISABLE KEYS */;
INSERT INTO `Returning` VALUES
(1,'4302','S11/340','2025-03-02'),
(2,'2001','S20/300','2025-04-07');
/*!40000 ALTER TABLE `Returning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `reg_no` varchar(20) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `contact_info` varchar(50) DEFAULT NULL,
  `area_of_residence` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES
('S11/340','James','0700123456','Njoro'),
('S20/300','Jake','0750123456','Nyeri'),
('S23/200','Paul','0730123456','Nakuru'),
('S41/650','Alice','0740123456','Nairobi'),
('S70/230','Peter','0720123456','Molo');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-31 10:41:27
