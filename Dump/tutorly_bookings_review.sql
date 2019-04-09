-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: tutorly
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings_review`
--

DROP TABLE IF EXISTS `bookings_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_rating` int(11) NOT NULL,
  `knowledge` varchar(100) NOT NULL,
  `explanation` varchar(250) NOT NULL,
  `invoice_id_id` int(11) NOT NULL,
  `reviewee_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_id_id` (`invoice_id_id`),
  UNIQUE KEY `reviewee_id` (`reviewee_id`),
  UNIQUE KEY `reviewer_id` (`reviewer_id`),
  CONSTRAINT `bookings_review_invoice_id_id_f4737f6d_fk_bookings_invoice_id` FOREIGN KEY (`invoice_id_id`) REFERENCES `bookings_invoice` (`id`),
  CONSTRAINT `bookings_review_reviewee_id_06bf09d1_fk_accounts_profile_id` FOREIGN KEY (`reviewee_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `bookings_review_reviewer_id_7eb22786_fk_accounts_profile_id` FOREIGN KEY (`reviewer_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_review`
--

LOCK TABLES `bookings_review` WRITE;
/*!40000 ALTER TABLE `bookings_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 21:25:50
