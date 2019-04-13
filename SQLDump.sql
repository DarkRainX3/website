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
-- Table structure for table `accounts_dependent`
--

DROP TABLE IF EXISTS `accounts_dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_dependent` (
  `parent_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`parent_id`),
  CONSTRAINT `accounts_dependent_parent_id_f097df5d_fk_accounts_profile_id` FOREIGN KEY (`parent_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_dependent`
--

LOCK TABLES `accounts_dependent` WRITE;
/*!40000 ALTER TABLE `accounts_dependent` DISABLE KEYS */;
INSERT INTO `accounts_dependent` VALUES (1,'saf','fsasf','fafas');
/*!40000 ALTER TABLE `accounts_dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_known_subject`
--

DROP TABLE IF EXISTS `accounts_known_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_known_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowledge_level` varchar(50) NOT NULL,
  `school` varchar(100) NOT NULL,
  `graduation_year` int(11) DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `subject_id` varchar(50) NOT NULL,
  `subject_creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_known_subje_subject_id_f3716ac5_fk_accounts_` (`subject_id`),
  KEY `accounts_known_subje_subject_creator_id_eadb84fb_fk_auth_user` (`subject_creator_id`),
  CONSTRAINT `accounts_known_subje_subject_creator_id_eadb84fb_fk_auth_user` FOREIGN KEY (`subject_creator_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_known_subje_subject_id_f3716ac5_fk_accounts_` FOREIGN KEY (`subject_id`) REFERENCES `accounts_subject` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_known_subject`
--

LOCK TABLES `accounts_known_subject` WRITE;
/*!40000 ALTER TABLE `accounts_known_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_known_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `education_level` varchar(100) NOT NULL,
  `student_flag` tinyint(1) NOT NULL,
  `tutor_flag` tinyint(1) NOT NULL,
  `rate` double DEFAULT NULL,
  `subjects_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_profile_subjects_id_db0720ca_fk_accounts_` (`subjects_id`),
  CONSTRAINT `accounts_profile_subjects_id_db0720ca_fk_accounts_` FOREIGN KEY (`subjects_id`) REFERENCES `accounts_known_subject` (`id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'MEng Student','Calgary','default.jpg','University',1,1,50,NULL,1),(2,'MEng Student','Calgary','default.jpg','University',0,1,50,NULL,2),(3,'MEng Student','Calgary','default.jpg','University',1,1,50,NULL,3),(4,'Pro Hockey Player','Boston','default.jpg','High School',0,0,0,NULL,4),(5,'Pro Basketball Player','San Francisco','default.jpg','High School',0,0,0,NULL,5),(6,'I bring balance to the universe','Titan','default.jpg','University',0,0,0,NULL,6),(7,'Founder of Microsoft','Seattle','default.jpg','University',0,1,200,NULL,7),(8,'I teach Python on Youtube','Boulder','default.jpg','University',0,1,1000,NULL,8);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_subject`
--

DROP TABLE IF EXISTS `accounts_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_subject` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_subject`
--

LOCK TABLES `accounts_subject` WRITE;
/*!40000 ALTER TABLE `accounts_subject` DISABLE KEYS */;
INSERT INTO `accounts_subject` VALUES ('Accounting'),('Big Data'),('Biology 30'),('Chemistry 30'),('Fluid Mechanics'),('Machine Learning'),('Math K-12'),('Physics 30'),('Programming'),('Science K-12'),('Thermodynamics'),('Web Development');
/*!40000 ALTER TABLE `accounts_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_tutor_verification`
--

DROP TABLE IF EXISTS `accounts_tutor_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_tutor_verification` (
  `tutor_id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`tutor_id`),
  CONSTRAINT `accounts_tutor_verif_tutor_id_ac612f38_fk_accounts_` FOREIGN KEY (`tutor_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_tutor_verification`
--

LOCK TABLES `accounts_tutor_verification` WRITE;
/*!40000 ALTER TABLE `accounts_tutor_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_tutor_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add booking',1,'add_booking'),(2,'Can change booking',1,'change_booking'),(3,'Can delete booking',1,'delete_booking'),(4,'Can view booking',1,'view_booking'),(5,'Can add meeting',2,'add_meeting'),(6,'Can change meeting',2,'change_meeting'),(7,'Can delete meeting',2,'delete_meeting'),(8,'Can view meeting',2,'view_meeting'),(9,'Can add meeting_ place',3,'add_meeting_place'),(10,'Can change meeting_ place',3,'change_meeting_place'),(11,'Can delete meeting_ place',3,'delete_meeting_place'),(12,'Can view meeting_ place',3,'view_meeting_place'),(13,'Can add schedule',4,'add_schedule'),(14,'Can change schedule',4,'change_schedule'),(15,'Can delete schedule',4,'delete_schedule'),(16,'Can view schedule',4,'view_schedule'),(17,'Can add desired_ meeting_ place',5,'add_desired_meeting_place'),(18,'Can change desired_ meeting_ place',5,'change_desired_meeting_place'),(19,'Can delete desired_ meeting_ place',5,'delete_desired_meeting_place'),(20,'Can view desired_ meeting_ place',5,'view_desired_meeting_place'),(21,'Can add scheduled_ booking',6,'add_scheduled_booking'),(22,'Can change scheduled_ booking',6,'change_scheduled_booking'),(23,'Can delete scheduled_ booking',6,'delete_scheduled_booking'),(24,'Can view scheduled_ booking',6,'view_scheduled_booking'),(25,'Can add review',7,'add_review'),(26,'Can change review',7,'change_review'),(27,'Can delete review',7,'delete_review'),(28,'Can view review',7,'view_review'),(29,'Can add message',8,'add_message'),(30,'Can change message',8,'change_message'),(31,'Can delete message',8,'delete_message'),(32,'Can view message',8,'view_message'),(33,'Can add invoice',9,'add_invoice'),(34,'Can change invoice',9,'change_invoice'),(35,'Can delete invoice',9,'delete_invoice'),(36,'Can view invoice',9,'view_invoice'),(37,'Can add known_subject',10,'add_known_subject'),(38,'Can change known_subject',10,'change_known_subject'),(39,'Can delete known_subject',10,'delete_known_subject'),(40,'Can view known_subject',10,'view_known_subject'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile'),(45,'Can add subject',12,'add_subject'),(46,'Can change subject',12,'change_subject'),(47,'Can delete subject',12,'delete_subject'),(48,'Can view subject',12,'view_subject'),(49,'Can add dependent',13,'add_dependent'),(50,'Can change dependent',13,'change_dependent'),(51,'Can delete dependent',13,'delete_dependent'),(52,'Can view dependent',13,'view_dependent'),(53,'Can add tutor_ verification',14,'add_tutor_verification'),(54,'Can change tutor_ verification',14,'change_tutor_verification'),(55,'Can delete tutor_ verification',14,'delete_tutor_verification'),(56,'Can view tutor_ verification',14,'view_tutor_verification'),(57,'Can add log entry',15,'add_logentry'),(58,'Can change log entry',15,'change_logentry'),(59,'Can delete log entry',15,'delete_logentry'),(60,'Can view log entry',15,'view_logentry'),(61,'Can add permission',16,'add_permission'),(62,'Can change permission',16,'change_permission'),(63,'Can delete permission',16,'delete_permission'),(64,'Can view permission',16,'view_permission'),(65,'Can add group',17,'add_group'),(66,'Can change group',17,'change_group'),(67,'Can delete group',17,'delete_group'),(68,'Can view group',17,'view_group'),(69,'Can add user',18,'add_user'),(70,'Can change user',18,'change_user'),(71,'Can delete user',18,'delete_user'),(72,'Can view user',18,'view_user'),(73,'Can add content type',19,'add_contenttype'),(74,'Can change content type',19,'change_contenttype'),(75,'Can delete content type',19,'delete_contenttype'),(76,'Can view content type',19,'view_contenttype'),(77,'Can add session',20,'add_session'),(78,'Can change session',20,'change_session'),(79,'Can delete session',20,'delete_session'),(80,'Can view session',20,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$s59GSuFAdJMx$P59VsZH6p4sTD0AJ4mEQyzGwEZARUV8A5gKkE8iLobc=','2019-04-13 02:24:37.096542',1,'dtang','David','Tang','david.tang@ucalgary.ca',1,1,'2019-04-08 20:17:19.844923'),(2,'pbkdf2_sha256$150000$nvND7wBYLLOs$92zIlvapgbxVldy54v3s0h4sbdpJeZfw/h59EZkNyWo=','2019-04-08 21:05:31.924706',0,'test','Waley','Chen','test1@123.com',0,1,'2019-04-08 20:33:12.509357'),(3,'pbkdf2_sha256$150000$OXAEHVDoTAkr$p26yso9FD0XYjka6ALytIqJiVcoPwYc9Clt+05UeDHc=','2019-04-08 20:47:49.562349',0,'test2','Karm','Sidhu','test2@123.com',0,1,'2019-04-08 20:34:05.670036'),(4,'pbkdf2_sha256$150000$fbVQ4KEGCypw$FmuF15cDbjmzGW95hBdoRe1WlhuUp4K1n9tBN7nvIJs=',NULL,0,'test3','Jarome','Iginla','test3@123.com',0,1,'2019-04-08 20:34:05.785882'),(5,'pbkdf2_sha256$150000$G9L1mCmE7MHl$Khx49AW9FJdYMg+nhSxMGHHrghoQNWsBbw55Qm8qDPg=',NULL,0,'test4','Stephen','Curry','test4@123.com',0,1,'2019-04-08 20:34:05.897731'),(6,'pbkdf2_sha256$150000$D8nUGECkJzyE$+T6i2rqkTVNJp2wkDOyfziZC8HqrPunLe6EoNU1g1bo=',NULL,0,'test5','Thanos','Titan','test5@123.com',0,1,'2019-04-08 20:34:06.013578'),(7,'pbkdf2_sha256$120000$PRdIzGLPpoXe$wJLaEYpzRiZgJU35fAjdlS/sZTI7Wlrux83kBIkLVvM=',NULL,0,'test6','Bill','Gates','bill@microsoft.com',0,1,'2019-04-09 05:00:17.622010'),(8,'pbkdf2_sha256$120000$0cffeJ8PwrFA$RfJLiWZ7//FkuI/nYHAwNE3xMnNw6rZztkA9f15jPwM=',NULL,0,'test7','Corey','Schafer','pythongod@gmail.com',0,1,'2019-04-09 05:00:33.115216');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

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
  `pref_platform` varchar(50) NOT NULL,
  `transaction_time` datetime(6) NOT NULL,
  `location_id` varchar(100) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_booking_location_id_ab55b4c5_fk_bookings_` (`location_id`),
  KEY `bookings_booking_student_id_b3b10513_fk_accounts_profile_user_id` (`student_id`),
  KEY `bookings_booking_tutor_id_a1760b15_fk_accounts_profile_user_id` (`tutor_id`),
  CONSTRAINT `bookings_booking_location_id_ab55b4c5_fk_bookings_` FOREIGN KEY (`location_id`) REFERENCES `bookings_meeting_place` (`name`),
  CONSTRAINT `bookings_booking_student_id_b3b10513_fk_accounts_profile_user_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_profile` (`user_id`),
  CONSTRAINT `bookings_booking_tutor_id_a1760b15_fk_accounts_profile_user_id` FOREIGN KEY (`tutor_id`) REFERENCES `accounts_profile` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking`
--

LOCK TABLES `bookings_booking` WRITE;
/*!40000 ALTER TABLE `bookings_booking` DISABLE KEYS */;
INSERT INTO `bookings_booking` VALUES (1,'2019-04-13 07:00:00.000000','2019-04-13 11:00:00.000000','Test','In-Person','2019-04-13 04:09:23.191390','Starbucks',1,2);
/*!40000 ALTER TABLE `bookings_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_desired_meeting_place`
--

DROP TABLE IF EXISTS `bookings_desired_meeting_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_desired_meeting_place` (
  `meeting_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`meeting_ptr_id`),
  CONSTRAINT `bookings_desired_mee_meeting_ptr_id_c56c15ce_fk_bookings_` FOREIGN KEY (`meeting_ptr_id`) REFERENCES `bookings_meeting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_desired_meeting_place`
--

LOCK TABLES `bookings_desired_meeting_place` WRITE;
/*!40000 ALTER TABLE `bookings_desired_meeting_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_desired_meeting_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_invoice`
--

DROP TABLE IF EXISTS `bookings_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  CONSTRAINT `bookings_invoice_booking_id_1b4956a2_fk_bookings_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `bookings_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_invoice`
--

LOCK TABLES `bookings_invoice` WRITE;
/*!40000 ALTER TABLE `bookings_invoice` DISABLE KEYS */;
INSERT INTO `bookings_invoice` VALUES (1,10,210,1);
/*!40000 ALTER TABLE `bookings_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_meeting`
--

DROP TABLE IF EXISTS `bookings_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_meeting`
--

LOCK TABLES `bookings_meeting` WRITE;
/*!40000 ALTER TABLE `bookings_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_meeting_place`
--

DROP TABLE IF EXISTS `bookings_meeting_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_meeting_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` varchar(6) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_meeting_place`
--

LOCK TABLES `bookings_meeting_place` WRITE;
/*!40000 ALTER TABLE `bookings_meeting_place` DISABLE KEYS */;
INSERT INTO `bookings_meeting_place` VALUES (1,'CPL Central',800,'3 St SE','Calgary','T2G2E7',0),(2,'TFDL',410,'University Ct NW','Calgary','T2N1N4',1),(3,'Starbucks',1120,'16 Ave NW','Calgary','T2M0K8',1),(4,'Higher Ground',1126,'Kensington Rd NW','Calgary','T2N3P3',1),(5,'CPL Memorial Park',1221,'2 St SW','Calgary','T2R1N8',0),(6,'Test',108,'Test','Test','Test',0);
/*!40000 ALTER TABLE `bookings_meeting_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_message`
--

DROP TABLE IF EXISTS `bookings_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `sent_at` datetime(6) NOT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_message_recipient_id_afff67d2_fk_accounts_profile_id` (`recipient_id`),
  KEY `bookings_message_sender_id_1a83cb64_fk_accounts_profile_id` (`sender_id`),
  CONSTRAINT `bookings_message_recipient_id_afff67d2_fk_accounts_profile_id` FOREIGN KEY (`recipient_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `bookings_message_sender_id_1a83cb64_fk_accounts_profile_id` FOREIGN KEY (`sender_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_message`
--

LOCK TABLES `bookings_message` WRITE;
/*!40000 ALTER TABLE `bookings_message` DISABLE KEYS */;
INSERT INTO `bookings_message` VALUES (8,'fasffsadsadsdsasdafafsddfsafdds','2019-04-13 03:37:29.160696',2,1),(9,'dsaasddasds','2019-04-13 03:52:56.309970',3,1),(10,'HELP ME IN C++ PLS WALEY PLSSSSSSSSSSSSSSSSSSSSSSSSSSSS','2019-04-13 04:27:43.374175',2,1);
/*!40000 ALTER TABLE `bookings_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_review`
--

DROP TABLE IF EXISTS `bookings_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `overall_rating` int(11) NOT NULL,
  `explanation` varchar(250) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `reviewee_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviewee_id` (`reviewee_id`),
  UNIQUE KEY `reviewer_id` (`reviewer_id`),
  UNIQUE KEY `bookings_review_booking_id_6d649234_uniq` (`booking_id`),
  CONSTRAINT `bookings_review_booking_id_6d649234_fk_bookings_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `bookings_booking` (`id`),
  CONSTRAINT `bookings_review_reviewee_id_06bf09d1_fk_accounts_profile_id` FOREIGN KEY (`reviewee_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `bookings_review_reviewer_id_7eb22786_fk_accounts_profile_id` FOREIGN KEY (`reviewer_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_review`
--

LOCK TABLES `bookings_review` WRITE;
/*!40000 ALTER TABLE `bookings_review` DISABLE KEYS */;
INSERT INTO `bookings_review` VALUES (1,5,'Best guy everrr',1,2,1);
/*!40000 ALTER TABLE `bookings_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_schedule`
--

DROP TABLE IF EXISTS `bookings_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_schedule`
--

LOCK TABLES `bookings_schedule` WRITE;
/*!40000 ALTER TABLE `bookings_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_scheduled_booking`
--

DROP TABLE IF EXISTS `bookings_scheduled_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_scheduled_booking` (
  `booking_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_ptr_id`),
  CONSTRAINT `bookings_scheduled_b_booking_ptr_id_49876e64_fk_bookings_` FOREIGN KEY (`booking_ptr_id`) REFERENCES `bookings_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_scheduled_booking`
--

LOCK TABLES `bookings_scheduled_booking` WRITE;
/*!40000 ALTER TABLE `bookings_scheduled_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_scheduled_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-13 01:27:27.172997','None','Message object (None)',1,'[{\"added\": {}}]',8,1),(2,'2019-04-13 02:35:49.163897','1','Message object (1)',2,'[{\"changed\": {\"fields\": [\"sent_at\"]}}]',8,1),(3,'2019-04-13 02:46:18.282880','None','Message object (None)',1,'[{\"added\": {}}]',8,1),(4,'2019-04-13 02:57:53.128967','None','Message object (None)',1,'[{\"added\": {}}]',8,1),(5,'2019-04-13 02:59:03.933087','None','Message object (None)',1,'[{\"added\": {}}]',8,1),(6,'2019-04-13 03:22:27.465280','None','Message object (None)',1,'[{\"added\": {}}]',8,1),(7,'2019-04-13 03:28:28.686409','None','Message object (None)',1,'[{\"added\": {}}]',8,1),(8,'2019-04-13 03:31:04.782532','2','fsaasfsafdsfsdassd',1,'[{\"added\": {}}]',8,1),(9,'2019-04-13 03:37:23.568790','7','fasffsadsadsdsasdafads',3,'',8,1),(10,'2019-04-13 03:37:23.688772','6','fasffsadsadsdsa',3,'',8,1),(11,'2019-04-13 03:37:23.737742','5','fasffsa',3,'',8,1),(12,'2019-04-13 03:37:23.768633','4','I NEED HELP BADLY IN C++',3,'',8,1),(13,'2019-04-13 03:37:23.796615','3','I NEED HELP BADLY IN C++',3,'',8,1),(14,'2019-04-13 03:37:23.820682','2','fsaasfsafdsfsdassd',3,'',8,1),(15,'2019-04-13 03:37:23.849484','1','testest',3,'',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'accounts','dependent'),(10,'accounts','known_subject'),(11,'accounts','profile'),(12,'accounts','subject'),(14,'accounts','tutor_verification'),(15,'admin','logentry'),(17,'auth','group'),(16,'auth','permission'),(18,'auth','user'),(1,'bookings','booking'),(5,'bookings','desired_meeting_place'),(9,'bookings','invoice'),(2,'bookings','meeting'),(3,'bookings','meeting_place'),(8,'bookings','message'),(7,'bookings','review'),(4,'bookings','schedule'),(6,'bookings','scheduled_booking'),(19,'contenttypes','contenttype'),(20,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-13 01:12:42.890898'),(2,'auth','0001_initial','2019-04-13 01:12:43.351839'),(3,'accounts','0001_initial','2019-04-13 01:12:45.101268'),(4,'admin','0001_initial','2019-04-13 01:12:46.108947'),(5,'admin','0002_logentry_remove_auto_add','2019-04-13 01:12:46.479955'),(6,'admin','0003_logentry_add_action_flag_choices','2019-04-13 01:12:46.494915'),(7,'contenttypes','0002_remove_content_type_name','2019-04-13 01:12:46.765731'),(8,'auth','0002_alter_permission_name_max_length','2019-04-13 01:12:46.954299'),(9,'auth','0003_alter_user_email_max_length','2019-04-13 01:12:46.994646'),(10,'auth','0004_alter_user_username_opts','2019-04-13 01:12:47.007612'),(11,'auth','0005_alter_user_last_login_null','2019-04-13 01:12:47.162797'),(12,'auth','0006_require_contenttypes_0002','2019-04-13 01:12:47.169778'),(13,'auth','0007_alter_validators_add_error_messages','2019-04-13 01:12:47.184797'),(14,'auth','0008_alter_user_username_max_length','2019-04-13 01:12:47.391235'),(15,'auth','0009_alter_user_last_name_max_length','2019-04-13 01:12:47.546325'),(16,'auth','0010_alter_group_name_max_length','2019-04-13 01:12:47.576245'),(17,'auth','0011_update_proxy_permissions','2019-04-13 01:12:47.591206'),(18,'bookings','0001_initial','2019-04-13 01:12:48.409019'),(19,'sessions','0001_initial','2019-04-13 01:12:50.434305'),(20,'bookings','0002_auto_20190412_2040','2019-04-13 02:40:43.551678'),(21,'bookings','0003_auto_20190412_2058','2019-04-13 02:58:45.221424'),(22,'bookings','0004_auto_20190412_2301','2019-04-13 05:01:43.463870'),(23,'accounts','0002_auto_20190413_0002','2019-04-13 06:02:54.779220');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('aef5vjelbmoq2uxs1tegrbtecin3h6iu','ZTliMDU1ZmE0YjMzYTg5ZDA2ZWU0NmJlZTY5YTFjYzM2ODgzNTg3Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzRjYTJmOTEyZTkwNzRiMDA4N2MxN2ZiYWFmNGNlMTQyMWFjM2EwIn0=','2019-04-27 02:24:37.220472');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-13  0:03:46
