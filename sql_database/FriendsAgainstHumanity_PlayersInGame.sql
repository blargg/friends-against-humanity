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
-- Table structure for table `PlayersInGame`
--

DROP TABLE IF EXISTS `PlayersInGame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayersInGame` (
  `PlayerID` int(11) DEFAULT NULL,
  `GameID` int(11) DEFAULT NULL,
  `TurnOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayersInGame`
--

LOCK TABLES `PlayersInGame` WRITE;
/*!40000 ALTER TABLE `PlayersInGame` DISABLE KEYS */;
INSERT INTO `PlayersInGame` VALUES (1,1,1),(2,1,2),(4,1,3),(4,2,1),(4,3,1),(4,4,1),(5,1,4),(5,5,1),(5,4,2),(5,6,1),(6,6,2),(6,7,1),(5,7,2),(6,9,1),(5,9,2),(5,11,1),(6,11,2),(7,11,3),(7,6,3),(7,13,1),(6,13,2),(8,16,1),(12,16,2),(13,16,3),(14,16,4),(15,15,1),(12,15,2),(13,15,3),(15,3,2),(16,14,1),(12,14,2),(13,14,3),(12,10,1),(13,10,2),(16,10,3),(17,12,1),(13,12,2),(16,12,3),(17,8,1),(13,8,2),(16,8,3),(17,17,1),(18,17,2),(19,17,3),(17,18,1),(20,18,2),(21,18,3),(22,19,1),(25,19,2),(26,19,3),(27,20,1),(28,21,1),(29,21,2),(30,21,3),(31,22,1),(32,22,2),(33,22,3),(34,23,1),(35,24,1),(38,25,1),(39,25,2),(40,25,3),(42,27,1),(43,27,2),(44,27,3),(45,28,1),(48,28,2),(49,28,3),(50,28,4),(51,29,1),(54,29,2),(55,29,3),(58,30,1),(59,30,2),(60,30,3),(61,31,1),(62,32,1),(62,31,2),(64,31,3),(65,33,1),(68,33,2),(69,33,3),(70,34,1),(71,34,2),(72,34,3),(73,35,1),(74,36,1),(75,35,2),(76,35,3),(79,37,1),(78,37,2),(77,37,3);
/*!40000 ALTER TABLE `PlayersInGame` ENABLE KEYS */;
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
