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
-- Table structure for table `Game`
--

DROP TABLE IF EXISTS `Game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Game` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(64) DEFAULT NULL,
  `CurrentRoundNumber` int(11) DEFAULT NULL,
  `CurrentBlackCard` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Game`
--

LOCK TABLES `Game` WRITE;
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
INSERT INTO `Game` VALUES (19,'The City of Jiangyi on Bernadette',2,'478'),(20,'The Weyland-Yutani Research Facility above Bernadette',1,'497'),(21,'The Town of Wise\'s Canyon on Perth',1,'529'),(22,'The City of Jiangyi on Bernadette',2,'483'),(23,'The Ghost Town of New Amarillo on Kerry',1,'503'),(24,'The Censoft Arcology in Yokohama',1,'544'),(25,'The Weyland-Yutani Research Facility above Bernadette',4,'528'),(26,'The Manchester Industrial Area',1,'467'),(27,'The Dynlink Autofactory in Perth',3,'467'),(28,'The Banker Mine on Athens',1,'466'),(29,'The ruins of the Chicago Arcology',3,'472'),(30,'The Crystalline City of Byni',1,'525'),(31,'The ruins of the Chicago Arcology',1,'509'),(32,'The ruins of the Moneaux Research Facility in Baikonur',1,'545'),(33,'The City of Benja on Mala',1,'463'),(34,'The ruins of the Beijing Arcology',2,'537'),(35,'The Town of Wise\'s Canyon on Perth',1,'511'),(36,'The ruins of the Moneaux Research Facility in Baikonur',1,'507'),(37,'The Frozen Moon of Beri VII',2,'489');
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;
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
