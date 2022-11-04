-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for osx10.16 (x86_64)
--
-- Host: localhost    Database: airbnb
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `accommodation`
--

DROP TABLE IF EXISTS `accommodation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accommodation` (
  `accommodation_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `price_per_day` decimal(6,2) NOT NULL,
  `number_guests_allowed` tinyint(2) DEFAULT NULL,
  `max_number_children` tinyint(2) DEFAULT NULL,
  `description` text NOT NULL,
  `max_check_in` time DEFAULT NULL,
  `max_check_out` time DEFAULT NULL,
  `room_belongs_to` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`accommodation_id`),
  KEY `user_id` (`user_id`),
  KEY `room_belongs_to` (`room_belongs_to`),
  CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accommodation_ibfk_2` FOREIGN KEY (`room_belongs_to`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodation`
--

LOCK TABLES `accommodation` WRITE;
/*!40000 ALTER TABLE `accommodation` DISABLE KEYS */;
INSERT INTO `accommodation` VALUES (1,'apartment',72.50,4,3,'\'located in the city centre calm ideal for a small family vacation!\'','21:00:00','10:00:00',NULL,1),(2,'apartment',52.00,4,3,'\'Relaxed and away from the bustling and the noise supermarket nearby\'','22:00:00','11:00:00',NULL,3),(3,'apartment',100.00,5,3,'\'big apartment ideal for families with a lot of kids!\'','22:00:00','10:00:00',NULL,6),(4,'house',135.00,7,5,'\'Big house in a picturesque are of the city\'','20:00:00','11:00:00',NULL,7),(5,'apartment',98.50,3,2,'\'Small apartment but very convenient for tourists\'','23:00:00','10:00:00',NULL,8),(6,'room',36.00,2,2,'\'Room in a calm apartment which can also be fully rented\'','21:00:00','10:00:00',1,1),(7,'room',22.00,2,2,'\'Room that is part of a bigger apartment in a relaxed area\'','22:00:00','11:00:00',2,3),(8,'apartment',80.00,3,2,'\'Small cousy modern apartment\'','00:00:00','11:00:00',NULL,9),(9,'apartment',40.00,3,3,'\'Perfect if you want to get to know the city and not walk much subway nearby\'','22:00:00','12:00:00',NULL,11),(10,'house',120.00,6,3,'\'Colonial style home perfect for summer vacations near the beach\'','22:00:00','13:00:00',NULL,17);
/*!40000 ALTER TABLE `accommodation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` char(2) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `house_number` smallint(4) NOT NULL,
  `floor` smallint(3) DEFAULT NULL,
  `zip_code` varchar(15) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  UNIQUE KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'GB',NULL,'Warenford','Ivy Lane',28,1,'NE70 0QY',1),(2,'GB',NULL,'Broome','Park End St',62,3,'NR35 2HH',2),(3,'NG','Abuja','Central','Mazsalah Shopping Complex suite',41,30,'110001',3),(4,'MX','Veracruz','Cordoba','Cordoba Centro',1,0,'94500',4),(5,'PL',NULL,'Warszawa','ul. Bobrowiecka',87,5,'00-728',5),(6,'GB',NULL,'Wareford','Ivy lane',28,1,'NE70 0QY',6),(7,'GB',NULL,'Broome','Park End St',62,3,'NR35 2HH',7),(8,'CA','Alberta','Calgary','Heritage drive',3165,20,'T2V 2W2',8),(9,'SY','Tel White','Ar-raqqa','Raka St',12,1,'22727',9),(10,'US','Pennsylvania','Pittsburgh','Jacobs Street',4932,0,'15206',10);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `photo` mediumblob DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Dhaval','M',NULL,'2021-08-12'),(2,'Dionysios','M',NULL,'2021-11-28'),(3,'Paavo','M',NULL,'2021-08-22'),(4,'Gerold','M',NULL,'2021-07-18'),(5,'Arlotto','M',NULL,'2021-05-25'),(6,'Kiran','F',NULL,'2021-02-08'),(7,'Martins','F',NULL,'2021-06-20'),(8,'Toni','M',NULL,'2021-10-27'),(9,'Octavius','M',NULL,'2021-07-07'),(10,'Mitra','F',NULL,'2021-08-06');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowed`
--

DROP TABLE IF EXISTS `allowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowed` (
  `allowed_id` int(11) NOT NULL AUTO_INCREMENT,
  `smoking` tinyint(1) NOT NULL DEFAULT 0,
  `pets` tinyint(1) NOT NULL DEFAULT 0,
  `visitors` tinyint(1) NOT NULL DEFAULT 0,
  `accommodation_id` int(11) NOT NULL,
  PRIMARY KEY (`allowed_id`),
  UNIQUE KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `allowed_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowed`
--

LOCK TABLES `allowed` WRITE;
/*!40000 ALTER TABLE `allowed` DISABLE KEYS */;
INSERT INTO `allowed` VALUES (1,1,1,1,1),(2,1,1,0,2),(3,0,1,0,3),(4,0,0,0,4),(5,1,0,1,5),(6,0,0,1,6),(7,0,0,1,7),(8,0,1,1,8),(9,1,1,1,9),(10,1,0,1,10);
/*!40000 ALTER TABLE `allowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `amenities_id` int(11) NOT NULL AUTO_INCREMENT,
  `wifi` tinyint(1) NOT NULL DEFAULT 0,
  `kitchen` tinyint(1) NOT NULL DEFAULT 0,
  `air_conditioning` tinyint(1) NOT NULL DEFAULT 0,
  `washer` tinyint(1) NOT NULL DEFAULT 0,
  `iron` tinyint(1) NOT NULL DEFAULT 0,
  `free_parking` tinyint(1) NOT NULL DEFAULT 0,
  `pool` tinyint(1) NOT NULL DEFAULT 0,
  `self_check_in` tinyint(1) NOT NULL DEFAULT 0,
  `hair_dryer` tinyint(1) NOT NULL DEFAULT 0,
  `heating` tinyint(1) NOT NULL DEFAULT 0,
  `accommodation_id` int(11) NOT NULL,
  PRIMARY KEY (`amenities_id`),
  UNIQUE KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `amenities_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,1,1,0,0,1,0,1,1,0,0,1),(2,1,0,1,0,0,0,0,1,0,1,2),(3,0,1,1,0,1,1,0,0,1,1,3),(4,1,1,0,0,1,1,0,1,0,0,4),(5,0,0,0,0,0,0,0,1,0,1,5),(6,1,1,0,0,1,0,1,1,0,0,6),(7,1,0,1,0,0,0,0,1,0,1,7),(8,0,1,0,1,1,0,0,1,1,0,8),(9,0,0,1,0,1,1,0,1,1,0,9),(10,1,0,1,0,1,1,1,1,0,0,10);
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `IBAN` char(64) NOT NULL,
  `BIC_SWIFT` char(64) NOT NULL,
  `country` char(2) NOT NULL,
  `payment_info_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `payment_info_id` (`payment_info_id`),
  CONSTRAINT `bank_account_ibfk_1` FOREIGN KEY (`payment_info_id`) REFERENCES `payment_info` (`payment_info_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES (1,'9d3da17dc28f6073e5c4ea31c5bcf1e582eaddc8a35d2e0eb05cdf0b2a0ad0e9','','GB',1),(2,'4713016151fda401d48a25d5a123d38149f54287ba936935636068708af96a16','','GB',3),(3,'','89618fe153652dca5997294c6dea91b9c36fd8f03f4e719e270ca41988ae0d81','NG',6),(4,'','a60c14c18e19c4d6bdd108c8ab01508a7478943009e9841a1f0d91d8beede4bc','MX',7),(5,'dbcec1a19d5efacb36582eb929ccac680ebae7dee38686786f12634327af91c0','','PL',8),(6,'','fd0411609f6794317c335dfd47e62bac2df6d3a6dfc619a5a2d9564d0932e934','CA',9),(7,'','4d9dda6c3c9ed81c3b0afc29bcc1717ed3b8b94cdd74537b496f43accdadb446','SY',11),(8,'','30407847443c7684c0f2f664362359372b170e668effa17b10cb92be737e243a','US',17);
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `number_guests` tinyint(2) NOT NULL,
  `number_children` tinyint(2) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2022-01-24 00:00:00','2022-01-25 00:00:00',2,0,2,1),(2,'2022-03-07 00:00:00','2022-03-24 00:00:00',1,0,2,6),(3,'2022-02-26 00:00:00','2022-02-27 00:00:00',2,1,2,1),(4,'2022-02-27 00:00:00','2022-03-20 00:00:00',3,0,4,2),(5,'2022-03-21 00:00:00','2022-04-03 00:00:00',1,2,4,7),(6,'2022-01-03 00:00:00','2022-01-30 00:00:00',3,0,5,3),(7,'2022-02-25 00:00:00','2022-03-06 00:00:00',2,2,5,3),(8,'2022-03-19 00:00:00','2022-03-26 00:00:00',1,0,12,3),(9,'2022-01-11 00:00:00','2022-01-31 00:00:00',5,0,13,4),(10,'2022-03-09 00:00:00','2022-03-23 00:00:00',4,2,14,4),(11,'2022-02-14 00:00:00','2022-02-24 00:00:00',6,2,15,4),(12,'2022-02-11 00:00:00','2022-03-18 00:00:00',2,0,15,5),(13,'2022-01-16 00:00:00','2022-01-25 00:00:00',1,2,16,5),(14,'2022-01-02 00:00:00','2022-01-03 00:00:00',3,0,18,8),(15,'2022-02-06 00:00:00','2022-04-03 00:00:00',2,2,18,8),(16,'2022-01-31 00:00:00','2022-02-17 00:00:00',2,0,19,9),(17,'2022-02-17 00:00:00','2022-03-30 00:00:00',1,0,20,9),(18,'2022-01-27 00:00:00','2022-01-31 00:00:00',5,0,23,10),(19,'2022-03-15 00:00:00','2022-03-18 00:00:00',3,1,24,10);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_help`
--

DROP TABLE IF EXISTS `booking_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking_help` (
  `help_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `agent_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`help_id`),
  KEY `agent_id` (`agent_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `booking_help_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `booking_help_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_help`
--

LOCK TABLES `booking_help` WRITE;
/*!40000 ALTER TABLE `booking_help` DISABLE KEYS */;
INSERT INTO `booking_help` VALUES (1,'Cannot change my booking',2,13),(2,'My credit card is not working',2,11),(3,'I booked the wrong date and don\'t know how to change them',5,15),(4,'How can I find my booking',7,12),(5,'The host is not responding',6,8),(6,'I need to cancel my booking perhaps',10,16),(7,'I need help with my booking',9,8),(8,'How can I change my booking?',7,16),(9,'If I am late for check-in how can I contact the host',10,1),(10,'Payment not going through',2,13);
/*!40000 ALTER TABLE `booking_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `calendar_date` date NOT NULL,
  PRIMARY KEY (`calendar_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES ('2022-01-01'),('2022-01-02'),('2022-01-03'),('2022-01-04'),('2022-01-05'),('2022-01-06'),('2022-01-07'),('2022-01-08'),('2022-01-09'),('2022-01-10'),('2022-01-11'),('2022-01-12'),('2022-01-13'),('2022-01-14'),('2022-01-15'),('2022-01-16'),('2022-01-17'),('2022-01-18'),('2022-01-19'),('2022-01-20'),('2022-01-21'),('2022-01-22'),('2022-01-23'),('2022-01-24'),('2022-01-25'),('2022-01-26'),('2022-01-27'),('2022-01-28'),('2022-01-29'),('2022-01-30'),('2022-01-31'),('2022-02-01'),('2022-02-02'),('2022-02-03'),('2022-02-04'),('2022-02-05'),('2022-02-06'),('2022-02-07'),('2022-02-08'),('2022-02-09'),('2022-02-10'),('2022-02-11'),('2022-02-12'),('2022-02-13'),('2022-02-14'),('2022-02-15'),('2022-02-16'),('2022-02-17'),('2022-02-18'),('2022-02-19'),('2022-02-20'),('2022-02-21'),('2022-02-22'),('2022-02-23'),('2022-02-24'),('2022-02-25'),('2022-02-26'),('2022-02-27'),('2022-02-28'),('2022-03-01'),('2022-03-02'),('2022-03-03'),('2022-03-04'),('2022-03-05'),('2022-03-06'),('2022-03-07'),('2022-03-08'),('2022-03-09'),('2022-03-10'),('2022-03-11'),('2022-03-12'),('2022-03-13'),('2022-03-14'),('2022-03-15'),('2022-03-16'),('2022-03-17'),('2022-03-18'),('2022-03-19'),('2022-03-20'),('2022-03-21'),('2022-03-22'),('2022-03-23'),('2022-03-24'),('2022-03-25'),('2022-03-26'),('2022-03-27'),('2022-03-28'),('2022-03-29'),('2022-03-30'),('2022-03-31'),('2022-04-01'),('2022-04-02'),('2022-04-03'),('2022-04-04'),('2022-04-05'),('2022-04-06'),('2022-04-07'),('2022-04-08'),('2022-04-09'),('2022-04-10'),('2022-04-11'),('2022-04-12'),('2022-04-13'),('2022-04-14'),('2022-04-15'),('2022-04-16'),('2022-04-17'),('2022-04-18'),('2022-04-19'),('2022-04-20'),('2022-04-21'),('2022-04-22'),('2022-04-23'),('2022-04-24'),('2022-04-25'),('2022-04-26'),('2022-04-27'),('2022-04-28'),('2022-04-29'),('2022-04-30'),('2022-05-01'),('2022-05-02'),('2022-05-03'),('2022-05-04'),('2022-05-05'),('2022-05-06'),('2022-05-07'),('2022-05-08'),('2022-05-09'),('2022-05-10'),('2022-05-11'),('2022-05-12'),('2022-05-13'),('2022-05-14'),('2022-05-15'),('2022-05-16'),('2022-05-17'),('2022-05-18'),('2022-05-19'),('2022-05-20'),('2022-05-21'),('2022-05-22'),('2022-05-23'),('2022-05-24'),('2022-05-25'),('2022-05-26'),('2022-05-27'),('2022-05-28'),('2022-05-29'),('2022-05-30'),('2022-05-31'),('2022-06-01'),('2022-06-02'),('2022-06-03'),('2022-06-04'),('2022-06-05'),('2022-06-06'),('2022-06-07'),('2022-06-08'),('2022-06-09'),('2022-06-10'),('2022-06-11'),('2022-06-12'),('2022-06-13'),('2022-06-14'),('2022-06-15'),('2022-06-16'),('2022-06-17'),('2022-06-18'),('2022-06-19'),('2022-06-20'),('2022-06-21'),('2022-06-22'),('2022-06-23'),('2022-06-24'),('2022-06-25'),('2022-06-26'),('2022-06-27'),('2022-06-28'),('2022-06-29'),('2022-06-30'),('2022-07-01'),('2022-07-02'),('2022-07-03'),('2022-07-04'),('2022-07-05'),('2022-07-06'),('2022-07-07'),('2022-07-08'),('2022-07-09'),('2022-07-10'),('2022-07-11'),('2022-07-12'),('2022-07-13'),('2022-07-14'),('2022-07-15'),('2022-07-16'),('2022-07-17'),('2022-07-18'),('2022-07-19'),('2022-07-20'),('2022-07-21'),('2022-07-22'),('2022-07-23'),('2022-07-24'),('2022-07-25'),('2022-07-26'),('2022-07-27'),('2022-07-28'),('2022-07-29'),('2022-07-30'),('2022-07-31'),('2022-08-01'),('2022-08-02'),('2022-08-03'),('2022-08-04'),('2022-08-05'),('2022-08-06'),('2022-08-07'),('2022-08-08'),('2022-08-09'),('2022-08-10'),('2022-08-11'),('2022-08-12'),('2022-08-13'),('2022-08-14'),('2022-08-15'),('2022-08-16'),('2022-08-17'),('2022-08-18'),('2022-08-19'),('2022-08-20'),('2022-08-21'),('2022-08-22'),('2022-08-23'),('2022-08-24'),('2022-08-25'),('2022-08-26'),('2022-08-27'),('2022-08-28'),('2022-08-29'),('2022-08-30'),('2022-08-31'),('2022-09-01'),('2022-09-02'),('2022-09-03'),('2022-09-04'),('2022-09-05'),('2022-09-06'),('2022-09-07'),('2022-09-08'),('2022-09-09'),('2022-09-10'),('2022-09-11'),('2022-09-12'),('2022-09-13'),('2022-09-14'),('2022-09-15'),('2022-09-16'),('2022-09-17'),('2022-09-18'),('2022-09-19'),('2022-09-20'),('2022-09-21'),('2022-09-22'),('2022-09-23'),('2022-09-24'),('2022-09-25'),('2022-09-26'),('2022-09-27'),('2022-09-28'),('2022-09-29'),('2022-09-30'),('2022-10-01'),('2022-10-02'),('2022-10-03'),('2022-10-04'),('2022-10-05'),('2022-10-06'),('2022-10-07'),('2022-10-08'),('2022-10-09'),('2022-10-10'),('2022-10-11'),('2022-10-12'),('2022-10-13'),('2022-10-14'),('2022-10-15'),('2022-10-16'),('2022-10-17'),('2022-10-18'),('2022-10-19'),('2022-10-20'),('2022-10-21'),('2022-10-22'),('2022-10-23'),('2022-10-24'),('2022-10-25'),('2022-10-26'),('2022-10-27'),('2022-10-28'),('2022-10-29'),('2022-10-30'),('2022-10-31'),('2022-11-01'),('2022-11-02'),('2022-11-03'),('2022-11-04'),('2022-11-05'),('2022-11-06'),('2022-11-07'),('2022-11-08'),('2022-11-09'),('2022-11-10'),('2022-11-11'),('2022-11-12'),('2022-11-13'),('2022-11-14'),('2022-11-15'),('2022-11-16'),('2022-11-17'),('2022-11-18'),('2022-11-19'),('2022-11-20'),('2022-11-21'),('2022-11-22'),('2022-11-23'),('2022-11-24'),('2022-11-25'),('2022-11-26'),('2022-11-27'),('2022-11-28'),('2022-11-29'),('2022-11-30'),('2022-12-01'),('2022-12-02'),('2022-12-03'),('2022-12-04'),('2022-12-05'),('2022-12-06'),('2022-12-07'),('2022-12-08'),('2022-12-09'),('2022-12-10'),('2022-12-11'),('2022-12-12'),('2022-12-13'),('2022-12-14'),('2022-12-15'),('2022-12-16'),('2022-12-17'),('2022-12-18'),('2022-12-19'),('2022-12-20'),('2022-12-21'),('2022-12-22'),('2022-12-23'),('2022-12-24'),('2022-12-25'),('2022-12-26'),('2022-12-27'),('2022-12-28'),('2022-12-29'),('2022-12-30'),('2022-12-31');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `phone_number_2` (`phone_number`),
  UNIQUE KEY `phone_number_3` (`phone_number`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'+441632960499','fraser@yahoo.com',1),(2,'+1-202-555-0109','curly@verizon.net',2),(3,'+441632960215','josephw@att.net',3),(4,'+1-202-555-0112','schwaang@me.com',4),(5,'+353 20 917 1907','storerm@aol.com',5),(6,'+234 706 310 5123 ','gward@yahoo.com',6),(7,'+52 888 287 3053','noahb@yahoo.ca',7),(8,'+48 69 329 9223','bowmanbs@optonline.net',8),(9,'+1-613-555-0164','whimsy@outlook.com',9),(10,'+27 81 716 5924','rafasgj@aol.com',10),(11,'+963 33 509 0954','wainwrig@comcast.net',11),(12,'+39 06 070 0625','nullchar@live.com',12),(13,'+1-202-555-0143','evans@comcast.net',13),(14,'+1-202-555-0106','niknejad@msn.com',14),(15,'+7 401 415 0551','tmccarth@me.com',15),(16,'+351268124122','miturria@comcast.net',16),(17,'+1-202-555-0168','kspiteri@sbcglobal.net',17),(18,'+1-202-555-0144','jamuir@comcast.net',18),(19,'+7 401 415 0552','griner@hotmail.com',19),(20,'+1-202-555-0149','janusfury@msn.com',20),(21,'+33 93 479 4300','jeffcovey@mac.com',21),(22,'+44 1632 960544','hahsler@hotmail.com',22),(23,'+56 61 585 9361','gbacon@icloud.com',23),(24,'+1-202-555-0199','stakasa@aol.com',24),(25,'+1-202-555-9999','kaiser@optonline.net',25);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(10) NOT NULL,
  `card_number` char(64) NOT NULL,
  `expiry_date` char(64) NOT NULL,
  `CVC` char(64) NOT NULL,
  `payment_info_id` int(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `payment_info_id` (`payment_info_id`),
  CONSTRAINT `credit_card_ibfk_1` FOREIGN KEY (`payment_info_id`) REFERENCES `payment_info` (`payment_info_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (1,'visa','507069b83b19b0aed9750707bbae781657432796c408273815d8d8b49d69c88e','ccc9a13f20317447585362fbd7407bfaa12cabd80105ea2f25268fe318fcba18','52f14fc33ef45dd80ac2626077948f44d8d211d5f24bf9db333c9403968e634a',2),(2,'mastercard','2b689d4a6e06b5794ca9210ec83be14c38216d0f98c95f6b530b35023eaeeae6','ad4235fd3cb0d7b69d151650285376a21d0eb910705e92ee122366a71e8c6424','fa4ddf29f41b575377ce14a7900d1e26b669163ca53b80ea3168c6801cf7e114',4),(3,'mastercard','67056375533f90b6f1a980110af62d65cd55b1fc53c47dd654339d7921153b78','11170a7367a266643f2ac45f9d0fec1b1676cc5c215d864833ba7e7e19d13d06','e5b861a6d8a966dfca7e7341cd3eb6be9901688d547a72ebed0b1f5e14f3d08d',5),(4,'visa','79c4e59ab93dfca91671363fcd03efba0d3533c1aee5e93e8d6492902a8ee54c','c276bec1f9fea3834b921d61b7ec6313984e7cd247e679d4d406263f367a54ca','9dcbe7e30f0bd60827341113108a55f86b604f921e0792418a9810075dbf3d22',10),(5,'visa','f6eadb0edfedcdc68e875782aa98707fc2c52a1a642541d1ae48dcd34356670d','620fff792e8c9a1b9696be58e07e6e194b025e1f46bd603f5da985b2acc0aabe','b312d5fbcfab403a28f259ab3d2b333ae2412727528b63ae3c032be535410ed5',12),(6,'visa','6f15edc69955d71c5770d3c2942a338a96b9868769522b46f3840a0d3c7eb1ed','f7a44b9f82782f7d22c197933d357356866dc40738b4418991582f8a0c18649c','0788979fc9366e21cd56311511b897a222cf91711481bcd7dc837eac2172d087',13),(7,'visa','f1275e6248e2f6e1f5570599ef54dd574469f0bb197b99939a54c9a3c5de62ee','8b6fa5636a977e6f6d1920e31df6cec9398ca0a0955ddc550c87922f0f394236','97468f679ad305fa4dbbf17fd4bf18c41fb655f2d86162b1d91ad4f1e09814c1',14),(8,'mastercard','76438dfd83c017c8129cc222959de87e9e5361ff058b7ccbc8194b9b8fea7c49','d185916a5c06504d34058b3566991ca1f750a2855ccd2228a61d745df590b061','1ad269a743bd01b5bb74f135c332a4acc98ef1a570d966fcd6a801de6d9ae3bc',15),(9,'visa','92c42df2aed4e61424ac14342c580728eb596bc3587c215668169d330e7b99de','f622950de6b53c24f262474a72264490ad1ce0038c713ad244d9ec5a1a46cddc','4c970004b0678d439f177e77d3cabdb7e9a44df770948ddc2467cbc76b7211c3',16),(10,'amexpress','81ad211b6c884501a70bdf361762f985b02629c8347178339395d94b8dbcf68c','8c58c826f1d2bfc56d910b7d8c256dcf18debd0561a69b9d2e7e996a420416e6','7acc684a848a9b954959fdd22493f48cf44eed028275b6b9999c7cade8956fc7',18),(11,'jcb','dcfbac4b9eb28215c8636e6be31fff21c0d6d7d36a0f25935f20d5e6183c78f2','3c7f0ddbd4e093bdf6187f5ff4786884d2c181f4d1376010a5e7c66ae51fd7e6','99ee50221221864d50c60baea6f14d8ac2e235cc6e78be6088cd40cc97fca394',19),(12,'visa','7e4396202179af9456b00e4a54cbb4464f37a67e5a572755d122a3869853f95e','5f229406f385d7baf477fc3188ef03e3c2a9b769ab940b8c965f3cf3d77753b4','793733573a1dfd14a2e889a11b2ad7b6981de29df813863b528dc1ae99416eeb',20),(13,'visa','0eda8bfcd57e56273f60806f51cf9652a66027382bc13cacc5e387f15bc0475e','54f4d4096d2b2040ee70b8e7c5d7173de948539dda3c07cc19510b34a51ea139','d80eae6e96d148b3b2abbbc6760077b66c4ea071f847dab573d507a32c4d99a5',21),(14,'amexpress','ef8e643111eb2c1596d86556e82b0a044e8e24e8b3af42458dd0f35bd55e70fd','f06e36821a01dc1a3d41af5aad69b33380e5608b23cd86365ab61ca1df7cb1a2','fed88b40aba63cac05eadd5db0088c036005ec235c7be6fd87d656946b733332',22),(15,'mastercard','13f744ef0752c00eb4a57c6c74c83bd8f278f80d6cac50036a79bf7eb17c4585','fd9f769fba27fd241d642cd03c9c9c50fd25fab103cd17736df505b27ecd1b65','81f27f8a7d8766c72c0307a31327c1fad9007c6c3d33724ad2a5c0a8fe0df33d',23),(16,'mastercard','7bd83abae24e7bf770ac906ac3e190b3c2030b6170f3ab458149a0a1bbdf91be','2ac3afb659ed5889c12d8f97286bb1d680d3d248a8ca5b7d71d22145c9bbcb62','33512007840ced1bb0aab68f47cb5f702abd494a15f26bcbe26a1e47af03d841',24),(17,'jcb','b4d7c86dfa42b6468b0e99c7510b77309e61358e172c827cd14eb5bb2366631b','316c6be2321e4145d79edf6fee11a987d4a015cfb3db918afc66ba2b2fa1ffa1','8e6aee9efac8086ebac545d45c63e0d0dfcddd0d77d53e45c04d05cafdd2a8a8',25);
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_help`
--

DROP TABLE IF EXISTS `date_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_help` (
  `accommodation_id` int(11) NOT NULL,
  `calendar_date` date NOT NULL,
  PRIMARY KEY (`accommodation_id`,`calendar_date`),
  KEY `calendar_date` (`calendar_date`),
  CONSTRAINT `date_help_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `date_help_ibfk_2` FOREIGN KEY (`calendar_date`) REFERENCES `calendar` (`calendar_date`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_help`
--

LOCK TABLES `date_help` WRITE;
/*!40000 ALTER TABLE `date_help` DISABLE KEYS */;
INSERT INTO `date_help` VALUES (1,'2022-01-24'),(1,'2022-02-26'),(2,'2022-02-27'),(2,'2022-02-28'),(2,'2022-03-01'),(2,'2022-03-02'),(2,'2022-03-03'),(2,'2022-03-04'),(2,'2022-03-05'),(2,'2022-03-06'),(2,'2022-03-07'),(2,'2022-03-08'),(2,'2022-03-09'),(2,'2022-03-10'),(2,'2022-03-11'),(2,'2022-03-12'),(2,'2022-03-13'),(2,'2022-03-14'),(2,'2022-03-15'),(2,'2022-03-16'),(2,'2022-03-17'),(2,'2022-03-18'),(2,'2022-03-19'),(3,'2022-01-03'),(3,'2022-01-04'),(3,'2022-01-05'),(3,'2022-01-06'),(3,'2022-01-07'),(3,'2022-01-08'),(3,'2022-01-09'),(3,'2022-01-10'),(3,'2022-01-11'),(3,'2022-01-12'),(3,'2022-01-13'),(3,'2022-01-14'),(3,'2022-01-15'),(3,'2022-01-16'),(3,'2022-01-17'),(3,'2022-01-18'),(3,'2022-01-19'),(3,'2022-01-20'),(3,'2022-01-21'),(3,'2022-01-22'),(3,'2022-01-23'),(3,'2022-01-24'),(3,'2022-01-25'),(3,'2022-01-26'),(3,'2022-01-27'),(3,'2022-01-28'),(3,'2022-01-29'),(3,'2022-02-25'),(3,'2022-02-26'),(3,'2022-02-27'),(3,'2022-02-28'),(3,'2022-03-01'),(3,'2022-03-02'),(3,'2022-03-03'),(3,'2022-03-04'),(3,'2022-03-05'),(3,'2022-03-19'),(3,'2022-03-20'),(3,'2022-03-21'),(3,'2022-03-22'),(3,'2022-03-23'),(3,'2022-03-24'),(3,'2022-03-25'),(4,'2022-01-11'),(4,'2022-01-12'),(4,'2022-01-13'),(4,'2022-01-14'),(4,'2022-01-15'),(4,'2022-01-16'),(4,'2022-01-17'),(4,'2022-01-18'),(4,'2022-01-19'),(4,'2022-01-20'),(4,'2022-01-21'),(4,'2022-01-22'),(4,'2022-01-23'),(4,'2022-01-24'),(4,'2022-01-25'),(4,'2022-01-26'),(4,'2022-01-27'),(4,'2022-01-28'),(4,'2022-01-29'),(4,'2022-01-30'),(4,'2022-02-14'),(4,'2022-02-15'),(4,'2022-02-16'),(4,'2022-02-17'),(4,'2022-02-18'),(4,'2022-02-19'),(4,'2022-02-20'),(4,'2022-02-21'),(4,'2022-02-22'),(4,'2022-02-23'),(4,'2022-03-09'),(4,'2022-03-10'),(4,'2022-03-11'),(4,'2022-03-12'),(4,'2022-03-13'),(4,'2022-03-14'),(4,'2022-03-15'),(4,'2022-03-16'),(4,'2022-03-17'),(4,'2022-03-18'),(4,'2022-03-19'),(4,'2022-03-20'),(4,'2022-03-21'),(4,'2022-03-22'),(5,'2022-01-16'),(5,'2022-01-17'),(5,'2022-01-18'),(5,'2022-01-19'),(5,'2022-01-20'),(5,'2022-01-21'),(5,'2022-01-22'),(5,'2022-01-23'),(5,'2022-01-24'),(5,'2022-02-11'),(5,'2022-02-12'),(5,'2022-02-13'),(5,'2022-02-14'),(5,'2022-02-15'),(5,'2022-02-16'),(5,'2022-02-17'),(5,'2022-02-18'),(5,'2022-02-19'),(5,'2022-02-20'),(5,'2022-02-21'),(5,'2022-02-22'),(5,'2022-02-23'),(5,'2022-02-24'),(5,'2022-02-25'),(5,'2022-02-26'),(5,'2022-02-27'),(5,'2022-02-28'),(5,'2022-03-01'),(5,'2022-03-02'),(5,'2022-03-03'),(5,'2022-03-04'),(5,'2022-03-05'),(5,'2022-03-06'),(5,'2022-03-07'),(5,'2022-03-08'),(5,'2022-03-09'),(5,'2022-03-10'),(5,'2022-03-11'),(5,'2022-03-12'),(5,'2022-03-13'),(5,'2022-03-14'),(5,'2022-03-15'),(5,'2022-03-16'),(5,'2022-03-17'),(6,'2022-03-07'),(6,'2022-03-08'),(6,'2022-03-09'),(6,'2022-03-10'),(6,'2022-03-11'),(6,'2022-03-12'),(6,'2022-03-13'),(6,'2022-03-14'),(6,'2022-03-15'),(6,'2022-03-16'),(6,'2022-03-17'),(6,'2022-03-18'),(6,'2022-03-19'),(6,'2022-03-20'),(6,'2022-03-21'),(6,'2022-03-22'),(6,'2022-03-23'),(7,'2022-03-21'),(7,'2022-03-22'),(7,'2022-03-23'),(7,'2022-03-24'),(7,'2022-03-25'),(7,'2022-03-26'),(7,'2022-03-27'),(7,'2022-03-28'),(7,'2022-03-29'),(7,'2022-03-30'),(7,'2022-03-31'),(7,'2022-04-01'),(7,'2022-04-02'),(8,'2022-01-02'),(8,'2022-02-06'),(8,'2022-02-07'),(8,'2022-02-08'),(8,'2022-02-09'),(8,'2022-02-10'),(8,'2022-02-11'),(8,'2022-02-12'),(8,'2022-02-13'),(8,'2022-02-14'),(8,'2022-02-15'),(8,'2022-02-16'),(8,'2022-02-17'),(8,'2022-02-18'),(8,'2022-02-19'),(8,'2022-02-20'),(8,'2022-02-21'),(8,'2022-02-22'),(8,'2022-02-23'),(8,'2022-02-24'),(8,'2022-02-25'),(8,'2022-02-26'),(8,'2022-02-27'),(8,'2022-02-28'),(8,'2022-03-01'),(8,'2022-03-02'),(8,'2022-03-03'),(8,'2022-03-04'),(8,'2022-03-05'),(8,'2022-03-06'),(8,'2022-03-07'),(8,'2022-03-08'),(8,'2022-03-09'),(8,'2022-03-10'),(8,'2022-03-11'),(8,'2022-03-12'),(8,'2022-03-13'),(8,'2022-03-14'),(8,'2022-03-15'),(8,'2022-03-16'),(8,'2022-03-17'),(8,'2022-03-18'),(8,'2022-03-19'),(8,'2022-03-20'),(8,'2022-03-21'),(8,'2022-03-22'),(8,'2022-03-23'),(8,'2022-03-24'),(8,'2022-03-25'),(8,'2022-03-26'),(8,'2022-03-27'),(8,'2022-03-28'),(8,'2022-03-29'),(8,'2022-03-30'),(8,'2022-03-31'),(8,'2022-04-01'),(9,'2022-01-31'),(9,'2022-02-01'),(9,'2022-02-02'),(9,'2022-02-03'),(9,'2022-02-04'),(9,'2022-02-05'),(9,'2022-02-06'),(9,'2022-02-07'),(9,'2022-02-08'),(9,'2022-02-09'),(9,'2022-02-10'),(9,'2022-02-11'),(9,'2022-02-12'),(9,'2022-02-13'),(9,'2022-02-14'),(9,'2022-02-15'),(9,'2022-02-16'),(9,'2022-02-17'),(9,'2022-02-18'),(9,'2022-02-19'),(9,'2022-02-20'),(9,'2022-02-21'),(9,'2022-02-22'),(9,'2022-02-23'),(9,'2022-02-24'),(9,'2022-02-25'),(9,'2022-02-26'),(9,'2022-02-27'),(9,'2022-02-28'),(9,'2022-03-01'),(9,'2022-03-02'),(9,'2022-03-03'),(9,'2022-03-04'),(9,'2022-03-05'),(9,'2022-03-06'),(9,'2022-03-07'),(9,'2022-03-08'),(9,'2022-03-09'),(9,'2022-03-10'),(9,'2022-03-11'),(9,'2022-03-12'),(9,'2022-03-13'),(9,'2022-03-14'),(9,'2022-03-15'),(9,'2022-03-16'),(9,'2022-03-17'),(9,'2022-03-18'),(9,'2022-03-19'),(9,'2022-03-20'),(9,'2022-03-21'),(9,'2022-03-22'),(9,'2022-03-23'),(9,'2022-03-24'),(9,'2022-03-25'),(9,'2022-03-26'),(9,'2022-03-27'),(9,'2022-03-28'),(9,'2022-03-29'),(9,'2022-04-02'),(10,'2022-01-27'),(10,'2022-01-28'),(10,'2022-01-29'),(10,'2022-01-30'),(10,'2022-03-15'),(10,'2022-03-16'),(10,'2022-03-17');
/*!40000 ALTER TABLE `date_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_rating_host`
--

DROP TABLE IF EXISTS `guest_rating_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_rating_host` (
  `g_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `stars` tinyint(1) NOT NULL,
  `comment` text DEFAULT NULL,
  `guest_rater` int(11) NOT NULL,
  `host_rated` int(11) NOT NULL,
  PRIMARY KEY (`g_rating_id`),
  KEY `guest_rater` (`guest_rater`),
  KEY `host_rated` (`host_rated`),
  CONSTRAINT `guest_rating_host_ibfk_1` FOREIGN KEY (`guest_rater`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guest_rating_host_ibfk_2` FOREIGN KEY (`host_rated`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_rating_host`
--

LOCK TABLES `guest_rating_host` WRITE;
/*!40000 ALTER TABLE `guest_rating_host` DISABLE KEYS */;
INSERT INTO `guest_rating_host` VALUES (1,5,'Very nice host',2,1),(2,5,'Excellent in every way!',4,3),(3,2,'Host was not very friendly!',5,6),(4,3,'Ok!',12,7),(5,2,'Wouldn\'t recommend!',15,8),(6,5,'Great host experience',18,9),(7,5,'Helpful and just a nice person',13,11),(8,3,'Wish the host was more helpful',14,17),(9,5,'Host and Family all simply great',15,1),(10,1,'I was unsatisfied',16,3),(11,1,'Unhelpful would not recommend to anybody',18,6),(12,5,'I never met such nice people',19,7),(13,4,'Very good!!',20,8),(14,2,'Bad',5,9),(15,2,'Not my favourite trip and host did not help',4,11),(16,2,'2 stars not good',2,17),(17,2,'could be better',2,1),(18,5,'Very satisfied',23,6),(19,4,'Above average host good info available',24,7);
/*!40000 ALTER TABLE `guest_rating_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_rating_guest`
--

DROP TABLE IF EXISTS `host_rating_guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host_rating_guest` (
  `h_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `stars` tinyint(1) NOT NULL,
  `comment` text DEFAULT NULL,
  `host_rater` int(11) NOT NULL,
  `guest_rated` int(11) NOT NULL,
  PRIMARY KEY (`h_rating_id`),
  KEY `host_rater` (`host_rater`),
  KEY `guest_rated` (`guest_rated`),
  CONSTRAINT `host_rating_guest_ibfk_1` FOREIGN KEY (`host_rater`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `host_rating_guest_ibfk_2` FOREIGN KEY (`guest_rated`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_rating_guest`
--

LOCK TABLES `host_rating_guest` WRITE;
/*!40000 ALTER TABLE `host_rating_guest` DISABLE KEYS */;
INSERT INTO `host_rating_guest` VALUES (1,5,'Very friendly',1,2),(2,1,'Loud and obnoxious guests',3,4),(3,3,'Okay',6,5),(4,5,'Such nice people',7,12),(5,3,'Nice',8,15),(6,5,'So happy to receive them',9,18),(7,5,'No worries',11,13),(8,1,'bad guest',17,14),(9,3,'Good person',1,15),(10,3,'Very satisfied',3,16),(11,5,'So Satisfied',6,18),(12,5,'Not too bad folks!',7,19),(13,4,'Despite some issues ok!',8,20),(14,1,'Parties and loud do not recommend',9,5),(15,2,'2 stars!!! could be better',11,4),(16,4,'GOOD',17,2),(17,1,'Very dirty',1,2),(18,3,'Broke a window but was nice still',6,23),(19,1,'My house will never be the same',7,24);
/*!40000 ALTER TABLE `host_rating_guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `english` tinyint(1) NOT NULL DEFAULT 0,
  `spanish` tinyint(1) NOT NULL DEFAULT 0,
  `french` tinyint(1) NOT NULL DEFAULT 0,
  `portuguese` tinyint(1) NOT NULL DEFAULT 0,
  `russian` tinyint(1) NOT NULL DEFAULT 0,
  `chinese` tinyint(1) NOT NULL DEFAULT 0,
  `hindi` tinyint(1) NOT NULL DEFAULT 0,
  `japanese` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`languages_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,1,0,0,0,0,0,0,0,1),(2,1,0,0,0,0,0,0,0,2),(3,1,0,0,0,0,0,0,1,3),(4,1,0,0,0,0,0,0,0,4),(5,1,0,0,0,0,0,0,0,5),(6,1,0,0,0,0,0,0,0,6),(7,1,0,0,1,0,0,0,0,7),(8,1,1,0,0,1,0,0,0,8),(9,1,0,1,0,0,0,0,0,9),(10,1,0,0,0,0,0,0,0,10),(11,1,0,1,0,0,0,0,0,11),(12,1,0,1,0,0,0,0,0,12),(13,1,1,0,0,1,0,0,0,13),(14,1,0,0,0,0,1,0,1,14),(15,1,0,1,0,1,0,0,0,15),(16,1,0,1,1,0,0,0,0,16),(17,1,1,0,0,0,0,0,0,17),(18,1,0,1,0,0,0,0,0,18),(19,1,0,1,0,0,0,0,0,19),(20,1,0,0,0,0,0,0,0,20),(21,1,0,1,0,0,0,0,0,21),(22,1,0,0,0,0,0,0,0,22),(23,1,1,0,0,0,0,0,0,23),(24,1,0,0,0,0,0,0,0,24),(25,1,0,0,0,0,0,0,0,25);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(64) NOT NULL,
  `last_online` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`login_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'hirerejoice1','5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8','2022-02-08 14:01:32',1),(2,'meaningaccess','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f','2022-01-17 20:02:05',2),(3,'asternret21urn','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','2022-02-11 04:31:44',3),(4,'elementboundary','e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446','2022-02-28 23:32:26',4),(5,'tunaforever','395a1f99d806280b5c6c1bb69ca610a8255e49277e66b1d0de49923ed8143964','2022-02-02 01:17:46',5),(6,'splitpatroon','14df4811004f9efc2dd0aa8c976164d98a17049bbbf7fe6aa8ce3179c37724be','2022-01-08 03:27:47',6),(7,'infuriatedracer','e9b71991b7f947a3467fff8aeb5f6944a34cb9c5f9ab9e605411dd3655190c6c','2022-01-26 13:37:21',7),(8,'presentclipclop','b9c570632a6f07cf5b4315d59c9d41035e570bfc85ef19d5c2d68cf65ff1dfad','2022-01-23 22:43:46',8),(9,'boorishlabored','bafd151a86f9a573b153e76e3a8a0053b3340ce304a301a5354288fb18bce848','2022-02-27 22:49:47',9),(10,'melodiceagle','64572013ece46382e4c5a3277ac7a7ebfb9706a1b1f9750d7d631f4104b36e7b','2022-01-25 22:29:54',10),(11,'wheneverpassive','fd7321c405f8af43810a6723bbaf6fb5c9461aee273bc3693ee7903becc4e6ea','2022-01-07 17:35:59',11),(12,'aredout','c5610e7b0427b148283d2d17de1c7c8ed11782a5aaea5909675386eb899c8b17','2022-01-16 04:55:00',12),(13,'inspectblessing','150a71e23ca33baaec8bbeee9bc380350781ea8c110bb0462c9bdf822beb6ebb','2022-02-20 19:34:07',13),(14,'lutzdemanding','6d4499d7f6925d247d23239368a4aed3ea64aad483f9303cf534130adffb1437','2022-01-14 05:19:35',14),(15,'scientistsdraught','1521ba8c33683c6e2d3113498ca037633ab15b576e74a5154e3540876acf732e','2022-03-05 09:03:22',15),(16,'melonsvacant','c495634064a4baa0c6f7a5aed1f9f47488b421a4eca666a0b112baa720cee7f5','2022-01-11 20:17:41',16),(17,'longjohnsmistake','b74a9ce989ebd9686fdf3972e0f53ab6296b0e9d33d9aa1417450cf81f5422b1','2022-01-13 09:31:26',17),(18,'ladderupright','d44f4e1fe695047c2d198e29af109ff8c82feff140d756c8f5cefc42e8c72d8b','2022-03-01 23:06:14',18),(19,'gritssanction','f3a57b8c483ea1f5a03d7c2df9c94a9f9aa251301ce1eee19d1c2bf2b27e993e','2022-01-03 01:57:49',19),(20,'giftedtrifling','430005175c4c7810996d3481f0dbc3ec01103d6abcc5beec5db4b3f1eae35047','2022-02-12 22:55:37',20),(21,'poletangibleachootangeri2121nes','dc8b11023a9355d2f9c9f744f83ce1c9396decd213aadb6b4680a08d7d3e3a84','2022-02-12 22:40:37',21),(22,'mullfeigned4','c1cc69e61c0f1c7ade8df0f2994e582e7c1f2c57d1ec192a0baf9f96b7739d9d','2022-01-02 04:27:29',22),(23,'smuthboomerang','b1245fda69f440cd4156be5d665d717e5218fc9b02e755425f55df2eb1e02185','2022-01-24 01:07:57',23),(24,'cauliflowerscreech','1c23bf80af726a00e023fff77ee026955af61c8427f1aba955068c80a21527f0','2022-03-10 17:26:42',24),(25,'rang99','ae88fcbc774f96a4f165475959e251b7fbe42abc4d820219c6982096cd7751c3','2022-01-15 15:17:16',25);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_info` (
  `payment_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`payment_info_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `payment_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
INSERT INTO `payment_info` VALUES (1,'bank_ac',1),(2,'cr_card',2),(3,'bank_ac',3),(4,'cr_card',4),(5,'cr_card',5),(6,'bank_ac',6),(7,'bank_ac',7),(8,'bank_ac',8),(9,'bank_ac',9),(10,'cr_card',10),(11,'bank_ac',11),(12,'cr_card',12),(13,'cr_card',13),(14,'cr_card',14),(15,'cr_card',15),(16,'cr_card',16),(17,'bank_ac',17),(18,'cr_card',18),(19,'cr_card',19),(20,'cr_card',20),(21,'cr_card',21),(22,'cr_card',22),(23,'cr_card',23),(24,'cr_card',24),(25,'cr_card',25);
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` mediumblob DEFAULT NULL,
  `accommodation_id` int(11) NOT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `accommodation_id` (`accommodation_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodation` (`accommodation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,NULL,1),(2,NULL,1),(3,NULL,2),(4,NULL,2),(5,NULL,3),(6,NULL,3),(7,NULL,4),(8,NULL,4),(9,NULL,5),(10,NULL,5),(11,NULL,6),(12,NULL,6),(13,NULL,7),(14,NULL,7),(15,NULL,8),(16,NULL,8),(17,NULL,9),(18,NULL,9),(19,NULL,10),(20,NULL,10);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `photo` mediumblob DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `join_date` date NOT NULL,
  `country` char(2) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'H','Sidrah','Rangel','F',NULL,'1957-04-05','2015-05-12','GB'),(2,'G','Hebe','Washington','M',NULL,'1983-09-05','2019-07-31','US'),(3,'H','Tahmina','Byers','F',NULL,'1990-01-23','2015-12-17','GB'),(4,'G','Stefanie','Faulkner','F',NULL,'1996-04-13','2017-03-17','US'),(5,'G','Hallam','Mccormack','M',NULL,'1997-10-01','2015-08-19','IE'),(6,'H','Isobelle','Robbins','F',NULL,'1978-03-19','2020-03-31','NG'),(7,'H','Gaia','Nieves','F',NULL,'1970-03-10','2020-07-22','MX'),(8,'H','Kuba','Keenan','M',NULL,'1967-04-01','2014-05-16','PL'),(9,'H','Tiana','Howard','F',NULL,'1962-09-18','2015-08-19','CA'),(10,'G','Iyla','Callahan','F',NULL,'1981-05-03','2018-08-10','ZA'),(11,'H','Tamsin','Shepherd','M',NULL,'1979-12-24','2019-07-18','SY'),(12,'G','Paloma','Lees','F',NULL,'1990-10-28','2019-08-14','IT'),(13,'G','Martha','Schmitt','F',NULL,'1994-04-30','2019-08-28','US'),(14,'G','Marilyn','Wagner','F',NULL,'1997-12-09','2020-02-07','US'),(15,'G','Manav','Gibson','M',NULL,'2000-02-13','2021-04-15','RU'),(16,'G','Lola','Rivers','F',NULL,'1981-11-27','2020-02-07','PT'),(17,'H','Bronwen','Page','M',NULL,'1981-05-03','2019-01-15','US'),(18,'G','Harlen','Cameron','M',NULL,'1993-03-19','2019-07-31','US'),(19,'G','Hoorain','Irwin','M',NULL,'1994-04-30','2013-09-24','AF'),(20,'G','Franklin','French','M',NULL,'1991-02-27','2015-02-17','US'),(21,'G','Tia','Neale','M',NULL,'1992-01-26','2018-02-07','FR'),(22,'G','Nancy','Bradley','F',NULL,'1993-12-05','2018-07-06','GB'),(23,'G','Daisy','Ponce','F',NULL,'1994-08-17','2018-08-08','CL'),(24,'G','Lindsay','Finnegan','F',NULL,'1995-06-29','2020-04-08','US'),(25,'G','Shania','Hartman','F',NULL,'2003-03-20','2022-01-12','US');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(25) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `limit_use` tinyint(2) DEFAULT NULL,
  `voucher_code` varchar(8) NOT NULL,
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `voucher_code` (`voucher_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (1,'5%','2020-01-01',NULL,5,'XGKP0QCF'),(2,'10%','2020-01-01',NULL,3,'0WPNKP77'),(3,'pay1nightget1','2021-10-01','2021-12-20',1,'VDWPDD8J'),(4,'pay2nightsget1free','2022-01-20','2022-02-20',1,'WWEZU8ZN'),(5,'USA15%','2022-06-04','2022-06-04',1,'14707D8C'),(6,'freebreakfast','2020-01-01',NULL,5,'5HZ0Z4SS'),(7,'bookamonthget25%','2022-02-01','2022-02-28',1,'VOJHGIR3'),(8,'winter15%','2021-11-01','2022-03-20',1,'2ODTJ4HG');
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher_solution`
--

DROP TABLE IF EXISTS `voucher_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voucher_solution` (
  `user_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`action_id`),
  KEY `action_id` (`action_id`),
  CONSTRAINT `voucher_solution_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `voucher_solution_ibfk_2` FOREIGN KEY (`action_id`) REFERENCES `voucher` (`action_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher_solution`
--

LOCK TABLES `voucher_solution` WRITE;
/*!40000 ALTER TABLE `voucher_solution` DISABLE KEYS */;
INSERT INTO `voucher_solution` VALUES (2,1),(2,2),(2,8),(4,3),(4,8),(5,2),(10,1),(10,6),(12,4),(13,1),(13,2),(14,6),(15,6),(16,1),(16,2),(18,1),(19,1),(20,3),(21,6),(22,1),(22,2),(22,6),(23,7),(24,8),(25,1),(25,3);
/*!40000 ALTER TABLE `voucher_solution` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18  0:57:29
