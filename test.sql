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
  `middle_name` varchar(50) NOT NULL,
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
/*!40000 ALTER TABLE `accounts_dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_known_subject`
--

DROP TABLE IF EXISTS `accounts_known_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_known_subject` (
  `subject_id` varchar(50) NOT NULL,
  `knowledge_level` varchar(50) NOT NULL,
  `school` varchar(100) NOT NULL,
  `graduation_year` int(11) NOT NULL,
  `gpa` double NOT NULL,
  PRIMARY KEY (`subject_id`),
  CONSTRAINT `accounts_known_subje_subject_id_f3716ac5_fk_accounts_` FOREIGN KEY (`subject_id`) REFERENCES `delete` (`name`)
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'MEng Student','Calgary','default.jpg','University',1,1,1),(2,'MEng Student','Calgary','default.jpg','University',0,1,2),(3,'MEng Student','Calgary','default.jpg','University',1,1,3),(4,'Pro Hockey Player','Boston','default.jpg','High School',0,0,4),(5,'Pro Basketball Player','San Francisco','default.jpg','High School',0,0,5),(6,'I bring balance to the universe','Titan','default.jpg','University',0,0,6),(7,'Founder of Microsoft','Seattle','default.jpg','University',0,1,7),(8,'I teach Python on Youtube','Boulder','default.jpg','University',0,1,8);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_specialty_subject`
--

DROP TABLE IF EXISTS `accounts_specialty_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_specialty_subject` (
  `subject_id` varchar(50) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  PRIMARY KEY (`subject_id`),
  CONSTRAINT `accounts_specialty_s_subject_id_f0a2bb51_fk_accounts_` FOREIGN KEY (`subject_id`) REFERENCES `delete` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_specialty_subject`
--

LOCK TABLES `accounts_specialty_subject` WRITE;
/*!40000 ALTER TABLE `accounts_specialty_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_specialty_subject` ENABLE KEYS */;
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
-- Table structure for table `accounts_subject_tutor`
--

DROP TABLE IF EXISTS `accounts_subject_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_subject_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` varchar(50) NOT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_subject_tutor_subject_id_profile_id_cd809f70_uniq` (`subject_id`,`profile_id`),
  KEY `accounts_subject_tut_profile_id_46bc8a75_fk_accounts_` (`profile_id`),
  CONSTRAINT `accounts_subject_tut_profile_id_46bc8a75_fk_accounts_` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`),
  CONSTRAINT `accounts_subject_tut_subject_id_731b8355_fk_accounts_` FOREIGN KEY (`subject_id`) REFERENCES `accounts_subject` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_subject_tutor`
--

LOCK TABLES `accounts_subject_tutor` WRITE;
/*!40000 ALTER TABLE `accounts_subject_tutor` DISABLE KEYS */;
INSERT INTO `accounts_subject_tutor` VALUES (2,'Web Development',3);
/*!40000 ALTER TABLE `accounts_subject_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_tutor_subjects`
--

DROP TABLE IF EXISTS `accounts_tutor_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_tutor_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_tutor_subjects`
--

LOCK TABLES `accounts_tutor_subjects` WRITE;
/*!40000 ALTER TABLE `accounts_tutor_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_tutor_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_tutor_verification`
--

DROP TABLE IF EXISTS `accounts_tutor_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts_tutor_verification` (
  `tutor_id` int(11) NOT NULL,
  `verification` varchar(100) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add booking',1,'add_booking'),(2,'Can change booking',1,'change_booking'),(3,'Can delete booking',1,'delete_booking'),(4,'Can view booking',1,'view_booking'),(5,'Can add booking_ message_ logs',2,'add_booking_message_logs'),(6,'Can change booking_ message_ logs',2,'change_booking_message_logs'),(7,'Can delete booking_ message_ logs',2,'delete_booking_message_logs'),(8,'Can view booking_ message_ logs',2,'view_booking_message_logs'),(9,'Can add booking_ offer',3,'add_booking_offer'),(10,'Can change booking_ offer',3,'change_booking_offer'),(11,'Can delete booking_ offer',3,'delete_booking_offer'),(12,'Can view booking_ offer',3,'view_booking_offer'),(13,'Can add invoice',4,'add_invoice'),(14,'Can change invoice',4,'change_invoice'),(15,'Can delete invoice',4,'delete_invoice'),(16,'Can view invoice',4,'view_invoice'),(17,'Can add meeting',5,'add_meeting'),(18,'Can change meeting',5,'change_meeting'),(19,'Can delete meeting',5,'delete_meeting'),(20,'Can view meeting',5,'view_meeting'),(21,'Can add meeting_ place',6,'add_meeting_place'),(22,'Can change meeting_ place',6,'change_meeting_place'),(23,'Can delete meeting_ place',6,'delete_meeting_place'),(24,'Can view meeting_ place',6,'view_meeting_place'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add review',8,'add_review'),(30,'Can change review',8,'change_review'),(31,'Can delete review',8,'delete_review'),(32,'Can view review',8,'view_review'),(33,'Can add schedule',9,'add_schedule'),(34,'Can change schedule',9,'change_schedule'),(35,'Can delete schedule',9,'delete_schedule'),(36,'Can view schedule',9,'view_schedule'),(37,'Can add desired_ meeting_ place',10,'add_desired_meeting_place'),(38,'Can change desired_ meeting_ place',10,'change_desired_meeting_place'),(39,'Can delete desired_ meeting_ place',10,'delete_desired_meeting_place'),(40,'Can view desired_ meeting_ place',10,'view_desired_meeting_place'),(41,'Can add scheduled_ booking',11,'add_scheduled_booking'),(42,'Can change scheduled_ booking',11,'change_scheduled_booking'),(43,'Can delete scheduled_ booking',11,'delete_scheduled_booking'),(44,'Can view scheduled_ booking',11,'view_scheduled_booking'),(45,'Can add profile',12,'add_profile'),(46,'Can change profile',12,'change_profile'),(47,'Can delete profile',12,'delete_profile'),(48,'Can view profile',12,'view_profile'),(49,'Can add subject',13,'add_subject'),(50,'Can change subject',13,'change_subject'),(51,'Can delete subject',13,'delete_subject'),(52,'Can view subject',13,'view_subject'),(53,'Can add dependent',14,'add_dependent'),(54,'Can change dependent',14,'change_dependent'),(55,'Can delete dependent',14,'delete_dependent'),(56,'Can view dependent',14,'view_dependent'),(57,'Can add known_subject',15,'add_known_subject'),(58,'Can change known_subject',15,'change_known_subject'),(59,'Can delete known_subject',15,'delete_known_subject'),(60,'Can view known_subject',15,'view_known_subject'),(61,'Can add specialty_ subject',16,'add_specialty_subject'),(62,'Can change specialty_ subject',16,'change_specialty_subject'),(63,'Can delete specialty_ subject',16,'delete_specialty_subject'),(64,'Can view specialty_ subject',16,'view_specialty_subject'),(65,'Can add tutor_ verification',17,'add_tutor_verification'),(66,'Can change tutor_ verification',17,'change_tutor_verification'),(67,'Can delete tutor_ verification',17,'delete_tutor_verification'),(68,'Can view tutor_ verification',17,'view_tutor_verification'),(69,'Can add log entry',18,'add_logentry'),(70,'Can change log entry',18,'change_logentry'),(71,'Can delete log entry',18,'delete_logentry'),(72,'Can view log entry',18,'view_logentry'),(73,'Can add permission',19,'add_permission'),(74,'Can change permission',19,'change_permission'),(75,'Can delete permission',19,'delete_permission'),(76,'Can view permission',19,'view_permission'),(77,'Can add group',20,'add_group'),(78,'Can change group',20,'change_group'),(79,'Can delete group',20,'delete_group'),(80,'Can view group',20,'view_group'),(81,'Can add user',21,'add_user'),(82,'Can change user',21,'change_user'),(83,'Can delete user',21,'delete_user'),(84,'Can view user',21,'view_user'),(85,'Can add content type',22,'add_contenttype'),(86,'Can change content type',22,'change_contenttype'),(87,'Can delete content type',22,'delete_contenttype'),(88,'Can view content type',22,'view_contenttype'),(89,'Can add session',23,'add_session'),(90,'Can change session',23,'change_session'),(91,'Can delete session',23,'delete_session'),(92,'Can view session',23,'view_session'),(93,'Can add tutor_ subjects',24,'add_tutor_subjects'),(94,'Can change tutor_ subjects',24,'change_tutor_subjects'),(95,'Can delete tutor_ subjects',24,'delete_tutor_subjects'),(96,'Can view tutor_ subjects',24,'view_tutor_subjects');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$pyXKe7wtx34c$jqoSMdrWfU22TkYUFJkGPK/pXYeY5Ys4mxeiSK7XOow=','2019-04-09 03:37:53.359850',1,'dtang','David','Tang','david.tang@ucalgary.ca',1,1,'2019-04-08 20:17:19.844923'),(2,'pbkdf2_sha256$150000$nvND7wBYLLOs$92zIlvapgbxVldy54v3s0h4sbdpJeZfw/h59EZkNyWo=','2019-04-08 21:05:31.924706',0,'test','Waley','Chen','test1@123.com',0,1,'2019-04-08 20:33:12.509357'),(3,'pbkdf2_sha256$150000$OXAEHVDoTAkr$p26yso9FD0XYjka6ALytIqJiVcoPwYc9Clt+05UeDHc=','2019-04-08 20:47:49.562349',0,'test2','Karm','Sidhu','test2@123.com',0,1,'2019-04-08 20:34:05.670036'),(4,'pbkdf2_sha256$150000$fbVQ4KEGCypw$FmuF15cDbjmzGW95hBdoRe1WlhuUp4K1n9tBN7nvIJs=',NULL,0,'test3','Jarome','Iginla','test3@123.com',0,1,'2019-04-08 20:34:05.785882'),(5,'pbkdf2_sha256$150000$G9L1mCmE7MHl$Khx49AW9FJdYMg+nhSxMGHHrghoQNWsBbw55Qm8qDPg=',NULL,0,'test4','Stephen','Curry','test4@123.com',0,1,'2019-04-08 20:34:05.897731'),(6,'pbkdf2_sha256$150000$D8nUGECkJzyE$+T6i2rqkTVNJp2wkDOyfziZC8HqrPunLe6EoNU1g1bo=',NULL,0,'test5','Thanos','Titan','test5@123.com',0,1,'2019-04-08 20:34:06.013578'),(7,'pbkdf2_sha256$120000$PRdIzGLPpoXe$wJLaEYpzRiZgJU35fAjdlS/sZTI7Wlrux83kBIkLVvM=',NULL,0,'test6','Bill','Gates','bill@microsoft.com',0,1,'2019-04-09 05:00:17.622010'),(8,'pbkdf2_sha256$120000$0cffeJ8PwrFA$RfJLiWZ7//FkuI/nYHAwNE3xMnNw6rZztkA9f15jPwM=',NULL,0,'test7','Corey','Schafer','pythongod@gmail.com',0,1,'2019-04-09 05:00:33.115216');
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

--
-- Table structure for table `bookings_booking_message_logs`
--

DROP TABLE IF EXISTS `bookings_booking_message_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_booking_message_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking_message_logs`
--

LOCK TABLES `bookings_booking_message_logs` WRITE;
/*!40000 ALTER TABLE `bookings_booking_message_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_booking_message_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings_booking_offer`
--

DROP TABLE IF EXISTS `bookings_booking_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings_booking_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_booking_offer`
--

LOCK TABLES `bookings_booking_offer` WRITE;
/*!40000 ALTER TABLE `bookings_booking_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings_booking_offer` ENABLE KEYS */;
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
  `amount` double NOT NULL,
  `booking_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id_id` (`booking_id_id`),
  CONSTRAINT `bookings_invoice_booking_id_id_39d3c46c_fk_bookings_booking_id` FOREIGN KEY (`booking_id_id`) REFERENCES `bookings_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_invoice`
--

LOCK TABLES `bookings_invoice` WRITE;
/*!40000 ALTER TABLE `bookings_invoice` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_meeting_place`
--

LOCK TABLES `bookings_meeting_place` WRITE;
/*!40000 ALTER TABLE `bookings_meeting_place` DISABLE KEYS */;
INSERT INTO `bookings_meeting_place` VALUES (1,'CPL Central',800,'3 St SE','Calgary','T2G2E7',0),(2,'TFDL',410,'University Ct NW','Calgary','T2N1N4',1),(3,'Starbucks',1120,'16 Ave NW','Calgary','T2M0K8',1),(4,'Higher Ground',1126,'Kensington Rd NW','Calgary','T2N3P3',1),(5,'CPL Memorial Park',1221,'2 St SW','Calgary','T2R1N8',0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings_message`
--

LOCK TABLES `bookings_message` WRITE;
/*!40000 ALTER TABLE `bookings_message` DISABLE KEYS */;
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
-- Table structure for table `delete`
--

DROP TABLE IF EXISTS `delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delete` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delete`
--

LOCK TABLES `delete` WRITE;
/*!40000 ALTER TABLE `delete` DISABLE KEYS */;
INSERT INTO `delete` VALUES ('Accounting'),('Big Data'),('Biology 30'),('Chemistry 30'),('Fluid Mechanics'),('Machine Learning'),('Math K-12'),('Physics 30'),('Programming'),('Science K-12'),('Thermodynamics'),('Web Development');
/*!40000 ALTER TABLE `delete` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-04-09 06:01:36.661298','Web Development','Subject object (Web Development)',2,'[{\"changed\": {\"fields\": [\"tutor\"]}}]',13,1),(2,'2019-04-09 06:03:13.911302','Web Development','Subject object (Web Development)',2,'[{\"changed\": {\"fields\": [\"tutor\"]}}]',13,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'accounts','dependent'),(15,'accounts','known_subject'),(12,'accounts','profile'),(16,'accounts','specialty_subject'),(13,'accounts','subject'),(24,'accounts','tutor_subjects'),(17,'accounts','tutor_verification'),(18,'admin','logentry'),(20,'auth','group'),(19,'auth','permission'),(21,'auth','user'),(1,'bookings','booking'),(2,'bookings','booking_message_logs'),(3,'bookings','booking_offer'),(10,'bookings','desired_meeting_place'),(4,'bookings','invoice'),(5,'bookings','meeting'),(6,'bookings','meeting_place'),(7,'bookings','message'),(8,'bookings','review'),(9,'bookings','schedule'),(11,'bookings','scheduled_booking'),(22,'contenttypes','contenttype'),(23,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-04-08 20:07:17.587907'),(2,'auth','0001_initial','2019-04-08 20:07:18.027365'),(3,'accounts','0001_initial','2019-04-08 20:07:19.990238'),(4,'accounts','0002_auto_20190408_1407','2019-04-08 20:07:21.368398'),(5,'admin','0001_initial','2019-04-08 20:07:21.496228'),(6,'admin','0002_logentry_remove_auto_add','2019-04-08 20:07:21.799821'),(7,'admin','0003_logentry_add_action_flag_choices','2019-04-08 20:07:21.819796'),(8,'contenttypes','0002_remove_content_type_name','2019-04-08 20:07:22.107412'),(9,'auth','0002_alter_permission_name_max_length','2019-04-08 20:07:22.267197'),(10,'auth','0003_alter_user_email_max_length','2019-04-08 20:07:22.311139'),(11,'auth','0004_alter_user_username_opts','2019-04-08 20:07:22.327119'),(12,'auth','0005_alter_user_last_login_null','2019-04-08 20:07:22.522902'),(13,'auth','0006_require_contenttypes_0002','2019-04-08 20:07:22.530845'),(14,'auth','0007_alter_validators_add_error_messages','2019-04-08 20:07:22.546824'),(15,'auth','0008_alter_user_username_max_length','2019-04-08 20:07:22.706612'),(16,'auth','0009_alter_user_last_name_max_length','2019-04-08 20:07:22.866398'),(17,'auth','0010_alter_group_name_max_length','2019-04-08 20:07:22.898354'),(18,'auth','0011_update_proxy_permissions','2019-04-08 20:07:22.914333'),(19,'bookings','0001_initial','2019-04-08 20:07:23.940607'),(20,'bookings','0002_booking_created_by','2019-04-08 20:07:25.314772'),(21,'bookings','0003_remove_booking_commute_fee','2019-04-08 20:07:25.762173'),(22,'bookings','0004_auto_20190408_1258','2019-04-08 20:07:26.213570'),(23,'bookings','0005_auto_20190408_1313','2019-04-08 20:07:27.032478'),(24,'sessions','0001_initial','2019-04-08 20:07:27.104381'),(25,'accounts','0003_auto_20190408_1421','2019-04-08 20:21:27.598857');
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
INSERT INTO `django_session` VALUES ('41zhy1mrd5jhlwc3zov2xhxh305gbedx','OTUyYTc4NzNhOTk3N2UxNjVlNTJjMWJkNjJhOWJhMmU0ZmJhZmYxYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmM1MzE0MDExZDhhNjUwNjVjODk5MjM0YTg0N2FkZWEzZDhkMzE1In0=','2019-04-22 20:55:53.629317'),('jbie6qlf5s9or9i853fl1jef6qkyw2ac','YTA1ZjYxOWJjZDE5MTY1OWUyMDIyNDA4ZGQyZGNiMzY2YjFmYWQzMTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjYzMxNGRkMWM4YjQzOTQyNGI4OTQ0M2Q4MGU2ZTJmNjIwYmM2ZGRlIn0=','2019-04-22 20:47:49.574363'),('k6h7xulaczqlj64u6eto69zbkuq2ka85','Y2IyMDhmZWM1ZGRjNDA0ZjFiNDMyYzc5YjQ2YTFkZmYxM2U3ODdlNzp7fQ==','2019-04-22 20:18:01.140028'),('lvfl37oyx5s3ga8ltc5gogtvcoidphvo','OTUyYTc4NzNhOTk3N2UxNjVlNTJjMWJkNjJhOWJhMmU0ZmJhZmYxYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MmM1MzE0MDExZDhhNjUwNjVjODk5MjM0YTg0N2FkZWEzZDhkMzE1In0=','2019-04-22 21:05:31.944645'),('qlkncqupycdfx635yhdgswtby5wlirvo','NjQ4ZGU3OWZlY2FiMWQ5MjE3ZWVjMDFjMzdkNTA4NDVjYzk3ZWMzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMzE1ZDI0ZjFkZjA1OWU2NGE4N2E0NTU4YzRiNmQyYzNmYjU3NGMzIn0=','2019-04-23 03:37:53.365850'),('xu2ze35yxnbc802voilbte9ky65rluux','Y2IyMDhmZWM1ZGRjNDA0ZjFiNDMyYzc5YjQ2YTFkZmYxM2U3ODdlNzp7fQ==','2019-04-22 20:18:19.013120');
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

-- Dump completed on 2019-04-09  9:06:55
