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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 21:25:47
