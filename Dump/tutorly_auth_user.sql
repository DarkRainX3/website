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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$pXxTzH0cS8ur$Ex5RxaBK2ngU6EXAosqvMqIRMcD1uFFpruVdRz0HFt0=','2019-04-08 20:21:38.232263',1,'dtang','David','Tang','david.tang@ucalgary.ca',1,1,'2019-04-08 20:17:19.844923'),(2,'pbkdf2_sha256$150000$nvND7wBYLLOs$92zIlvapgbxVldy54v3s0h4sbdpJeZfw/h59EZkNyWo=','2019-04-08 21:05:31.924706',0,'test','test1','test1','test1@123.com',0,1,'2019-04-08 20:33:12.509357'),(3,'pbkdf2_sha256$150000$OXAEHVDoTAkr$p26yso9FD0XYjka6ALytIqJiVcoPwYc9Clt+05UeDHc=','2019-04-08 20:47:49.562349',0,'test2','test2','test2','test2@123.com',0,1,'2019-04-08 20:34:05.670036'),(4,'pbkdf2_sha256$150000$fbVQ4KEGCypw$FmuF15cDbjmzGW95hBdoRe1WlhuUp4K1n9tBN7nvIJs=',NULL,0,'test3','test3','test3','test3@123.com',0,1,'2019-04-08 20:34:05.785882'),(5,'pbkdf2_sha256$150000$G9L1mCmE7MHl$Khx49AW9FJdYMg+nhSxMGHHrghoQNWsBbw55Qm8qDPg=',NULL,0,'test4','test4','test4','test4@123.com',0,1,'2019-04-08 20:34:05.897731'),(6,'pbkdf2_sha256$150000$D8nUGECkJzyE$+T6i2rqkTVNJp2wkDOyfziZC8HqrPunLe6EoNU1g1bo=',NULL,0,'test5','test5','test5','test5@123.com',0,1,'2019-04-08 20:34:06.013578');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 21:25:51
