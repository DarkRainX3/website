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
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add booking',1,'add_booking'),(2,'Can change booking',1,'change_booking'),(3,'Can delete booking',1,'delete_booking'),(4,'Can view booking',1,'view_booking'),(5,'Can add booking_ message_ logs',2,'add_booking_message_logs'),(6,'Can change booking_ message_ logs',2,'change_booking_message_logs'),(7,'Can delete booking_ message_ logs',2,'delete_booking_message_logs'),(8,'Can view booking_ message_ logs',2,'view_booking_message_logs'),(9,'Can add booking_ offer',3,'add_booking_offer'),(10,'Can change booking_ offer',3,'change_booking_offer'),(11,'Can delete booking_ offer',3,'delete_booking_offer'),(12,'Can view booking_ offer',3,'view_booking_offer'),(13,'Can add invoice',4,'add_invoice'),(14,'Can change invoice',4,'change_invoice'),(15,'Can delete invoice',4,'delete_invoice'),(16,'Can view invoice',4,'view_invoice'),(17,'Can add meeting',5,'add_meeting'),(18,'Can change meeting',5,'change_meeting'),(19,'Can delete meeting',5,'delete_meeting'),(20,'Can view meeting',5,'view_meeting'),(21,'Can add meeting_ place',6,'add_meeting_place'),(22,'Can change meeting_ place',6,'change_meeting_place'),(23,'Can delete meeting_ place',6,'delete_meeting_place'),(24,'Can view meeting_ place',6,'view_meeting_place'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add review',8,'add_review'),(30,'Can change review',8,'change_review'),(31,'Can delete review',8,'delete_review'),(32,'Can view review',8,'view_review'),(33,'Can add schedule',9,'add_schedule'),(34,'Can change schedule',9,'change_schedule'),(35,'Can delete schedule',9,'delete_schedule'),(36,'Can view schedule',9,'view_schedule'),(37,'Can add desired_ meeting_ place',10,'add_desired_meeting_place'),(38,'Can change desired_ meeting_ place',10,'change_desired_meeting_place'),(39,'Can delete desired_ meeting_ place',10,'delete_desired_meeting_place'),(40,'Can view desired_ meeting_ place',10,'view_desired_meeting_place'),(41,'Can add scheduled_ booking',11,'add_scheduled_booking'),(42,'Can change scheduled_ booking',11,'change_scheduled_booking'),(43,'Can delete scheduled_ booking',11,'delete_scheduled_booking'),(44,'Can view scheduled_ booking',11,'view_scheduled_booking'),(45,'Can add profile',12,'add_profile'),(46,'Can change profile',12,'change_profile'),(47,'Can delete profile',12,'delete_profile'),(48,'Can view profile',12,'view_profile'),(49,'Can add subject',13,'add_subject'),(50,'Can change subject',13,'change_subject'),(51,'Can delete subject',13,'delete_subject'),(52,'Can view subject',13,'view_subject'),(53,'Can add dependent',14,'add_dependent'),(54,'Can change dependent',14,'change_dependent'),(55,'Can delete dependent',14,'delete_dependent'),(56,'Can view dependent',14,'view_dependent'),(57,'Can add known_subject',15,'add_known_subject'),(58,'Can change known_subject',15,'change_known_subject'),(59,'Can delete known_subject',15,'delete_known_subject'),(60,'Can view known_subject',15,'view_known_subject'),(61,'Can add specialty_ subject',16,'add_specialty_subject'),(62,'Can change specialty_ subject',16,'change_specialty_subject'),(63,'Can delete specialty_ subject',16,'delete_specialty_subject'),(64,'Can view specialty_ subject',16,'view_specialty_subject'),(65,'Can add tutor_ verification',17,'add_tutor_verification'),(66,'Can change tutor_ verification',17,'change_tutor_verification'),(67,'Can delete tutor_ verification',17,'delete_tutor_verification'),(68,'Can view tutor_ verification',17,'view_tutor_verification'),(69,'Can add log entry',18,'add_logentry'),(70,'Can change log entry',18,'change_logentry'),(71,'Can delete log entry',18,'delete_logentry'),(72,'Can view log entry',18,'view_logentry'),(73,'Can add permission',19,'add_permission'),(74,'Can change permission',19,'change_permission'),(75,'Can delete permission',19,'delete_permission'),(76,'Can view permission',19,'view_permission'),(77,'Can add group',20,'add_group'),(78,'Can change group',20,'change_group'),(79,'Can delete group',20,'delete_group'),(80,'Can view group',20,'view_group'),(81,'Can add user',21,'add_user'),(82,'Can change user',21,'change_user'),(83,'Can delete user',21,'delete_user'),(84,'Can view user',21,'view_user'),(85,'Can add content type',22,'add_contenttype'),(86,'Can change content type',22,'change_contenttype'),(87,'Can delete content type',22,'delete_contenttype'),(88,'Can view content type',22,'view_contenttype'),(89,'Can add session',23,'add_session'),(90,'Can change session',23,'change_session'),(91,'Can delete session',23,'delete_session'),(92,'Can view session',23,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
