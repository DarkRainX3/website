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
-- Table structure for table `bookings_booking`
--

DROP TABLE IF EXISTS `bookings_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `description` varchar(250) NOT NULL,
  `booking_type` varchar(10) NOT NULL,
  `pref_platform` varchar(50) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_booking_created_by_id_d8a2f432_fk_auth_user_id` (`created_by_id`),
  KEY `bookings_booking_student_id_b3b10513_fk_accounts_profile_user_id` (`student_id`),
  KEY `bookings_booking_tutor_id_a1760b15_fk_accounts_profile_user_id` (`tutor_id`),
  CONSTRAINT `bookings_booking_created_by_id_d8a2f432_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `bookings_booking_student_id_b3b10513_fk_accounts_profile_user_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_profile` (`user_id`),
  CONSTRAINT `bookings_booking_tutor_id_a1760b15_fk_accounts_profile_user_id` FOREIGN KEY (`tutor_id`) REFERENCES `accounts_profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking`
--

LOCK TABLES `bookings_booking` WRITE;
/*!40000 ALTER TABLE `bookings_booking` DISABLE KEYS */;
INSERT INTO `bookings_booking` VALUES (1,'1999-11-11 11:11:00.000000','1999-11-11 14:11:00.000000','asdg','adsgag','agasdg',NULL,2,3),(2,'2019-04-08 14:30:00.000000','2019-04-08 16:30:00.000000','test','test','test',2,1,NULL),(3,'2019-04-08 14:30:00.000000','2019-04-08 16:30:00.000000','test','test','test',2,1,NULL),(4,'2019-04-08 14:30:00.000000','2019-04-08 16:30:00.000000','test','test','test',2,1,NULL),(5,'2019-04-08 14:30:00.000000','2019-04-08 16:30:00.000000','test','test','test',2,3,NULL);
/*!40000 ALTER TABLE `bookings_booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 21:25:46
