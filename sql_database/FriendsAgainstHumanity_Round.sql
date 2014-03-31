CREATE DATABASE  IF NOT EXISTS `FriendsAgainstHumanity` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `FriendsAgainstHumanity`;
-- MySQL dump 10.14  Distrib 5.5.36-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: FriendsAgainstHumanity
-- ------------------------------------------------------
-- Server version	5.5.36-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Round`
--

DROP TABLE IF EXISTS `Round`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Round` (
  `RoundNumber` int(11) DEFAULT NULL,
  `GameID` int(11) DEFAULT NULL,
  `WinnerID` int(11) DEFAULT NULL,
  `BlackCardID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Round`
--

LOCK TABLES `Round` WRITE;
/*!40000 ALTER TABLE `Round` DISABLE KEYS */;
INSERT INTO `Round` VALUES (4,1,1,'1'),(5,1,1,'1'),(1,1,1,'1'),(1,1,1,'1'),(1,1,1,'1'),(2,1,1,'1'),(3,1,1,'1'),(1,1,1,'1'),(1,1,1,'1'),(1,1,1,'1'),(1,6,5,'299'),(2,6,5,'426'),(3,6,5,'80'),(1,11,5,'315'),(4,6,5,'299'),(5,6,7,'76'),(1,13,6,'457'),(2,13,7,'246'),(3,13,6,'353'),(1,14,12,'151'),(1,10,13,'151'),(1,12,16,'320'),(1,8,16,'296'),(1,17,18,'279'),(1,18,20,'89'),(1,19,25,'203'),(1,22,33,'98'),(1,25,39,'76'),(2,25,40,'394'),(3,25,38,'352'),(1,27,43,'274'),(2,27,42,'326'),(1,29,55,'443'),(2,29,51,'53'),(1,34,71,'117'),(1,37,77,'195');
/*!40000 ALTER TABLE `Round` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-31 14:09:46
