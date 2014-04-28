-- MySQL dump 10.14  Distrib 5.5.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: FriendsAgainstHumanity
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
-- Temporary table structure for view `AI_Players`
--

DROP TABLE IF EXISTS `AI_Players`;
/*!50001 DROP VIEW IF EXISTS `AI_Players`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `AI_Players` (
  `ID` tinyint NOT NULL,
  `Name` tinyint NOT NULL,
  `AuthToken` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `BlackCard`
--

DROP TABLE IF EXISTS `BlackCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackCard` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NumAnswers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlackCard`
--

LOCK TABLES `BlackCard` WRITE;
/*!40000 ALTER TABLE `BlackCard` DISABLE KEYS */;
INSERT INTO `BlackCard` VALUES (459,1),(460,1),(461,1),(462,1),(463,1),(464,1),(465,1),(466,1),(467,1),(468,1),(469,2),(470,1),(471,1),(472,1),(473,1),(474,1),(475,1),(476,1),(477,1),(478,1),(479,1),(480,2),(481,1),(482,2),(483,1),(484,1),(485,1),(486,1),(487,1),(488,2),(489,2),(490,1),(491,1),(492,1),(493,1),(494,1),(495,1),(496,2),(497,1),(498,1),(499,1),(500,1),(501,1),(502,1),(503,1),(504,1),(505,1),(506,1),(507,1),(508,1),(509,1),(510,1),(511,2),(512,2),(513,1),(514,1),(515,1),(516,1),(517,1),(518,1),(519,1),(520,1),(521,2),(522,1),(523,1),(524,1),(525,1),(526,1),(527,1),(528,1),(529,1),(530,1),(531,1),(532,1),(533,3),(534,1),(535,1),(536,1),(537,1),(538,1),(539,1),(540,2),(541,1),(542,2),(543,2),(544,1),(545,3),(546,1),(547,1),(548,1);
/*!40000 ALTER TABLE `BlackCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `BlackCardUseCount`
--

DROP TABLE IF EXISTS `BlackCardUseCount`;
/*!50001 DROP VIEW IF EXISTS `BlackCardUseCount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `BlackCardUseCount` (
  `BlackCardID` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `BlackDeck`
--

DROP TABLE IF EXISTS `BlackDeck`;
/*!50001 DROP VIEW IF EXISTS `BlackDeck`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `BlackDeck` (
  `CardID` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `BlackDeck2`
--

DROP TABLE IF EXISTS `BlackDeck2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlackDeck2` (
  `CardID` int(11) DEFAULT NULL,
  `GameID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlackDeck2`
--

LOCK TABLES `BlackDeck2` WRITE;
/*!40000 ALTER TABLE `BlackDeck2` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlackDeck2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CardInHand`
--

DROP TABLE IF EXISTS `CardInHand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CardInHand` (
  `CardID` int(11) DEFAULT NULL,
  `PlayerID` int(11) DEFAULT NULL,
  `GameID` int(11) DEFAULT NULL,
  `RoundAcquired` int(11) DEFAULT NULL,
  `RoundPlayed` int(11) DEFAULT NULL,
  `PlayedOrder` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CardInHand`
--

LOCK TABLES `CardInHand` WRITE;
/*!40000 ALTER TABLE `CardInHand` DISABLE KEYS */;
/*!40000 ALTER TABLE `CardInHand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CurrentJudge`
--

DROP TABLE IF EXISTS `CurrentJudge`;
/*!50001 DROP VIEW IF EXISTS `CurrentJudge`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CurrentJudge` (
  `PlayerId` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `FullBlackDeck`
--

DROP TABLE IF EXISTS `FullBlackDeck`;
/*!50001 DROP VIEW IF EXISTS `FullBlackDeck`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `FullBlackDeck` (
  `CardID` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `FullWhiteDeck`
--

DROP TABLE IF EXISTS `FullWhiteDeck`;
/*!50001 DROP VIEW IF EXISTS `FullWhiteDeck`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `FullWhiteDeck` (
  `CardID` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Game`
--

LOCK TABLES `Game` WRITE;
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `InTurn`
--

DROP TABLE IF EXISTS `InTurn`;
/*!50001 DROP VIEW IF EXISTS `InTurn`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `InTurn` (
  `PlayerID` tinyint NOT NULL,
  `GameID` tinyint NOT NULL,
  `TurnOrder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LabelList`
--

DROP TABLE IF EXISTS `LabelList`;
/*!50001 DROP VIEW IF EXISTS `LabelList`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LabelList` (
  `label` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `LabelWeights`
--

DROP TABLE IF EXISTS `LabelWeights`;
/*!50001 DROP VIEW IF EXISTS `LabelWeights`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `LabelWeights` (
  `BlackCardID` tinyint NOT NULL,
  `label` tinyint NOT NULL,
  `weight` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Labels`
--

DROP TABLE IF EXISTS `Labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Labels` (
  `ID` int(11) NOT NULL,
  `label` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Labels`
--

LOCK TABLES `Labels` WRITE;
/*!40000 ALTER TABLE `Labels` DISABLE KEYS */;
INSERT INTO `Labels` VALUES (1,'sexual'),(1,'gross'),(1,'absurd'),(2,'sexual'),(2,'absurd'),(2,'racist'),(2,'politics'),(3,'sexual'),(3,'gross'),(3,'absurd'),(4,'racist'),(4,'mundane'),(5,'sexual'),(5,'gross'),(5,'absurd'),(6,'sexual'),(6,'absurd'),(7,'sexual'),(7,'racist'),(7,'religion'),(7,'politics'),(8,'sexual'),(8,'gross'),(8,'absurd'),(9,'absurd'),(9,'racist'),(9,'politics'),(9,'seroius'),(10,'absurd'),(11,'nostalgia'),(11,'mundane'),(12,'nostalgia'),(12,'mundane'),(13,'gross'),(13,'absurd'),(13,'seroius'),(14,'sexual'),(14,'mundane'),(15,'racist'),(15,'politics'),(15,'seroius'),(16,'seroius'),(17,'sexual'),(17,'gross'),(17,'absurd'),(18,'seroius'),(19,'seroius'),(20,'sexual'),(20,'absurd'),(21,'sexual'),(21,'gross'),(21,'politics'),(21,'seroius'),(22,'sexual'),(22,'absurd'),(23,'sexual'),(23,'gross'),(23,'absurd'),(23,'politics'),(24,'absurd'),(24,'religion'),(24,'politics'),(24,'seroius'),(25,'nostalgia'),(25,'absurd'),(26,'seroius'),(27,'racist'),(27,'politics'),(27,'seroius'),(28,'nostalgia'),(28,'mundane'),(29,'gross'),(29,'absurd'),(29,'seroius'),(30,'sexual'),(30,'gross'),(30,'drugs'),(30,'seroius'),(31,'sexual'),(31,'nostalgia'),(31,'gross'),(31,'absurd'),(31,'mundane'),(32,'sexual'),(32,'nostalgia'),(32,'religion'),(33,'racist'),(33,'religion'),(33,'politics'),(34,'absurd'),(34,'religion'),(35,'sexual'),(36,'seroius'),(37,'sexual'),(37,'nostalgia'),(37,'mundane'),(38,'sexual'),(38,'absurd'),(38,'drugs'),(39,'absurd'),(39,'racist'),(39,'politics'),(40,'sexual'),(40,'gross'),(40,'absurd'),(40,'mundane'),(41,'mundane'),(42,'absurd'),(42,'racist'),(42,'politics'),(42,'seroius'),(43,'sexual'),(43,'nostalgia'),(43,'mundane'),(44,'sexual'),(44,'gross'),(45,'racist'),(45,'religion'),(45,'politics'),(45,'seroius'),(45,'mundane'),(46,'mundane'),(47,'nostalgia'),(47,'absurd'),(48,'sexual'),(48,'gross'),(48,'absurd'),(49,'sexual'),(49,'nostalgia'),(49,'mundane'),(50,'racist'),(50,'drugs'),(50,'politics'),(50,'seroius'),(51,'nostalgia'),(51,'religion'),(51,'politics'),(52,'sexual'),(52,'nostalgia'),(52,'religion'),(53,'nostalgia'),(53,'absurd'),(53,'mundane'),(54,'racist'),(54,'religion'),(54,'politics'),(54,'mundane'),(55,'gross'),(55,'absurd'),(55,'drugs'),(55,'seroius'),(56,'sexual'),(56,'gross'),(56,'mundane'),(57,'gross'),(57,'drugs'),(57,'seroius'),(58,'nostalgia'),(58,'mundane'),(59,'sexual'),(59,'gross'),(59,'seroius'),(60,'gross'),(60,'absurd'),(60,'seroius'),(61,'mundane'),(62,'absurd'),(62,'racist'),(62,'politics'),(63,'absurd'),(63,'racist'),(63,'religion'),(63,'politics'),(63,'seroius'),(64,'sexual'),(64,'nostalgia'),(64,'absurd'),(65,'absurd'),(65,'politics'),(65,'seroius'),(66,'sexual'),(66,'gross'),(66,'absurd'),(67,'nostalgia'),(67,'mundane'),(68,'nostalgia'),(68,'gross'),(68,'absurd'),(69,'nostalgia'),(69,'mundane'),(70,'mundane'),(71,'politics'),(71,'mundane'),(72,'absurd'),(72,'religion'),(72,'politics'),(73,'sexual'),(73,'gross'),(74,'absurd'),(74,'seroius'),(75,'racist'),(75,'politics'),(75,'seroius'),(76,'racist'),(76,'seroius'),(77,'gross'),(77,'mundane'),(78,'mundane'),(80,'absurd'),(80,'seroius'),(81,'sexual'),(81,'mundane'),(82,'sexual'),(82,'gross'),(82,'absurd'),(83,'mundane'),(84,'nostalgia'),(84,'politics'),(85,'gross'),(85,'absurd'),(85,'politics'),(86,'sexual'),(86,'nostalgia'),(86,'gross'),(86,'mundane'),(87,'sexual'),(87,'gross'),(87,'absurd'),(88,'absurd'),(88,'religion'),(88,'seroius'),(89,'mundane'),(90,'absurd'),(91,'absurd'),(91,'mundane'),(92,'racist'),(92,'religion'),(92,'politics'),(92,'seroius'),(93,'seroius'),(94,'gross'),(94,'absurd'),(95,'drugs'),(95,'seroius'),(96,'sexual'),(96,'mundane'),(97,'nostalgia'),(98,'sexual'),(98,'gross'),(98,'absurd'),(99,'sexual'),(99,'gross'),(99,'mundane'),(100,'drugs'),(100,'mundane'),(101,'sexual'),(101,'gross'),(101,'absurd'),(102,'absurd'),(102,'mundane'),(103,'sexual'),(103,'absurd'),(103,'politics'),(104,'gross'),(104,'absurd'),(104,'mundane'),(105,'mundane'),(106,'absurd'),(106,'mundane'),(107,'sexual'),(107,'politics'),(108,'sexual'),(108,'nostalgia'),(109,'sexual'),(109,'gross'),(109,'absurd'),(109,'seroius'),(110,'nostalgia'),(110,'absurd'),(110,'seroius'),(110,'mundane'),(111,'nostalgia'),(111,'gross'),(111,'mundane'),(112,'sexual'),(113,'absurd'),(113,'seroius'),(114,'sexual'),(114,'absurd'),(115,'seroius'),(116,'absurd'),(117,'absurd'),(117,'drugs'),(118,'absurd'),(118,'drugs'),(119,'nostalgia'),(119,'mundane'),(120,'gross'),(120,'absurd'),(120,'seroius'),(122,'sexual'),(123,'sexual'),(123,'absurd'),(124,'politics'),(125,'nostalgia'),(125,'mundane'),(126,'gross'),(126,'absurd'),(127,'gross'),(127,'racist'),(127,'politics'),(128,'sexual'),(128,'gross'),(128,'absurd'),(129,'politics'),(129,'seroius'),(130,'racist'),(130,'politics'),(130,'seroius'),(131,'absurd'),(131,'politics'),(132,'sexual'),(132,'absurd'),(133,'sexual'),(133,'gross'),(133,'mundane'),(134,'sexual'),(135,'religion'),(135,'politics'),(136,'nostalgia'),(136,'mundane'),(137,'sexual'),(137,'nostalgia'),(137,'gross'),(137,'absurd'),(137,'drugs'),(137,'seroius'),(138,'nostalgia'),(138,'mundane'),(139,'sexual'),(139,'nostalgia'),(139,'gross'),(139,'absurd'),(139,'mundane'),(140,'racist'),(140,'mundane'),(141,'nostalgia'),(141,'absurd'),(141,'mundane'),(142,'sexual'),(143,'nostalgia'),(143,'mundane'),(144,'absurd'),(144,'racist'),(144,'politics'),(144,'seroius'),(145,'gross'),(145,'absurd'),(146,'politics'),(146,'seroius'),(147,'racist'),(148,'nostalgia'),(149,'sexual'),(150,'gross'),(150,'absurd'),(151,'sexual'),(151,'gross'),(152,'gross'),(153,'nostalgia'),(154,'gross'),(154,'absurd'),(154,'mundane'),(155,'racist'),(155,'politics'),(156,'absurd'),(156,'seroius'),(156,'mundane'),(157,'politics'),(157,'mundane'),(158,'sexual'),(158,'gross'),(158,'seroius'),(159,'seroius'),(160,'nostalgia'),(160,'gross'),(161,'gross'),(161,'absurd'),(161,'drugs'),(162,'sexual'),(163,'gross'),(163,'absurd'),(163,'mundane'),(164,'gross'),(164,'absurd'),(164,'mundane'),(165,'racist'),(165,'politics'),(165,'seroius'),(166,'sexual'),(166,'gross'),(166,'politics'),(166,'seroius'),(167,'sexual'),(167,'absurd'),(168,'sexual'),(169,'nostalgia'),(169,'mundane'),(170,'gross'),(170,'absurd'),(171,'sexual'),(171,'absurd'),(172,'absurd'),(172,'mundane'),(173,'nostalgia'),(173,'absurd'),(174,'nostalgia'),(174,'absurd'),(175,'sexual'),(175,'gross'),(175,'seroius'),(176,'nostalgia'),(176,'absurd'),(177,'religion'),(178,'mundane'),(179,'sexual'),(179,'seroius'),(180,'seroius'),(181,'nostalgia'),(181,'mundane'),(182,'sexual'),(182,'absurd'),(183,'nostalgia'),(183,'absurd'),(183,'mundane'),(184,'sexual'),(184,'gross'),(184,'absurd'),(185,'sexual'),(185,'nostalgia'),(186,'sexual'),(186,'gross'),(186,'absurd'),(187,'absurd'),(187,'seroius'),(188,'sexual'),(188,'gross'),(190,'nostalgia'),(191,'sexual'),(191,'drugs'),(192,'sexual'),(192,'gross'),(192,'absurd'),(192,'seroius'),(193,'absurd'),(194,'sexual'),(194,'gross'),(194,'absurd'),(195,'sexual'),(195,'gross'),(195,'absurd'),(196,'mundane'),(197,'gross'),(198,'gross'),(198,'absurd'),(199,'gross'),(199,'absurd'),(199,'seroius'),(200,'absurd'),(201,'nostalgia'),(202,'sexual'),(202,'gross'),(202,'drugs'),(202,'seroius'),(203,'absurd'),(203,'mundane'),(204,'seroius'),(205,'racist'),(205,'politics'),(205,'seroius'),(206,'racist'),(207,'sexual'),(207,'gross'),(208,'nostalgia'),(209,'politics'),(209,'seroius'),(210,'absurd'),(210,'seroius'),(211,'nostalgia'),(211,'seroius'),(212,'seroius'),(213,'seroius'),(214,'absurd'),(215,'gross'),(215,'seroius'),(216,'racist'),(216,'politics'),(216,'seroius'),(217,'nostalgia'),(218,'absurd'),(219,'sexual'),(219,'gross'),(220,'seroius'),(221,'sexual'),(221,'absurd'),(221,'seroius'),(222,'gross'),(222,'absurd'),(222,'mundane'),(223,'gross'),(223,'absurd'),(223,'mundane'),(224,'seroius'),(225,'racist'),(225,'politics'),(225,'seroius'),(226,'sexual'),(227,'sexual'),(227,'gross'),(228,'nostalgia'),(228,'absurd'),(228,'racist'),(228,'politics'),(228,'seroius'),(229,'gross'),(229,'seroius'),(230,'absurd'),(231,'seroius'),(232,'absurd'),(233,'gross'),(234,'nostalgia'),(234,'gross'),(234,'absurd'),(234,'racist'),(235,'nostalgia'),(235,'absurd'),(236,'absurd'),(236,'seroius'),(237,'sexual'),(237,'gross'),(237,'absurd'),(238,'sexual'),(239,'nostalgia'),(239,'mundane'),(240,'gross'),(240,'mundane'),(241,'sexual'),(241,'gross'),(242,'absurd'),(242,'mundane'),(243,'mundane'),(244,'sexual'),(244,'nostalgia'),(244,'gross'),(244,'absurd'),(244,'seroius'),(244,'mundane'),(245,'absurd'),(245,'mundane'),(246,'nostalgia'),(246,'seroius'),(247,'sexual'),(247,'gross'),(247,'absurd'),(247,'racist'),(247,'drugs'),(248,'mundane'),(249,'sexual'),(249,'nostalgia'),(249,'absurd'),(250,'sexual'),(250,'absurd'),(250,'racist'),(250,'politics'),(250,'seroius'),(251,'nostalgia'),(251,'gross'),(251,'seroius'),(252,'nostalgia'),(253,'gross'),(253,'absurd'),(254,'nostalgia'),(255,'politics'),(255,'mundane'),(256,'sexual'),(256,'gross'),(256,'seroius'),(257,'absurd'),(257,'racist'),(258,'sexual'),(258,'nostalgia'),(259,'absurd'),(259,'seroius'),(260,'racist'),(260,'politics'),(260,'seroius'),(261,'nostalgia'),(262,'sexual'),(262,'absurd'),(263,'nostalgia'),(263,'religion'),(263,'politics'),(263,'seroius'),(264,'nostalgia'),(264,'gross'),(265,'sexual'),(265,'gross'),(265,'mundane'),(266,'sexual'),(266,'gross'),(267,'racist'),(267,'politics'),(268,'sexual'),(268,'gross'),(268,'absurd'),(269,'absurd'),(270,'absurd'),(270,'racist'),(271,'sexual'),(271,'nostalgia'),(271,'religion'),(272,'sexual'),(273,'mundane'),(274,'nostalgia'),(274,'mundane'),(275,'nostalgia'),(275,'absurd'),(275,'mundane'),(276,'racist'),(276,'religion'),(276,'politics'),(276,'seroius'),(277,'seroius'),(278,'absurd'),(279,'racist'),(279,'politics'),(280,'sexual'),(280,'mundane'),(281,'politics'),(281,'seroius'),(283,'nostalgia'),(283,'politics'),(284,'absurd'),(285,'nostalgia'),(285,'absurd'),(286,'mundane'),(287,'nostalgia'),(287,'mundane'),(288,'politics'),(288,'seroius'),(289,'sexual'),(289,'gross'),(289,'absurd'),(289,'politics'),(289,'seroius'),(290,'politics'),(290,'seroius'),(291,'religion'),(291,'politics'),(292,'mundane'),(293,'politics'),(293,'seroius'),(294,'sexual'),(294,'nostalgia'),(294,'drugs'),(295,'sexual'),(295,'gross'),(295,'drugs'),(295,'seroius'),(296,'nostalgia'),(297,'sexual'),(298,'absurd'),(299,'absurd'),(299,'politics'),(299,'seroius'),(300,'seroius'),(301,'sexual'),(301,'gross'),(301,'absurd'),(301,'drugs'),(302,'racist'),(302,'mundane'),(303,'nostalgia'),(303,'mundane'),(304,'nostalgia'),(304,'mundane'),(305,'nostalgia'),(306,'nostalgia'),(306,'religion'),(307,'sexual'),(307,'gross'),(307,'seroius'),(308,'religion'),(308,'politics'),(308,'seroius'),(309,'racist'),(309,'drugs'),(309,'religion'),(309,'politics'),(310,'nostalgia'),(310,'absurd'),(311,'sexual'),(311,'gross'),(311,'absurd'),(312,'mundane'),(313,'seroius'),(313,'mundane'),(314,'nostalgia'),(314,'absurd'),(315,'nostalgia'),(315,'politics'),(316,'sexual'),(316,'gross'),(316,'mundane'),(317,'sexual'),(317,'gross'),(317,'absurd'),(317,'seroius'),(318,'seroius'),(319,'gross'),(319,'absurd'),(319,'racist'),(319,'religion'),(319,'politics'),(319,'seroius'),(320,'sexual'),(320,'gross'),(320,'mundane'),(321,'nostalgia'),(321,'racist'),(322,'mundane'),(323,'sexual'),(323,'absurd'),(324,'sexual'),(324,'absurd'),(325,'drugs'),(326,'seroius'),(327,'gross'),(327,'mundane'),(328,'gross'),(328,'absurd'),(328,'mundane'),(329,'sexual'),(329,'mundane'),(330,'gross'),(331,'nostalgia'),(331,'mundane'),(332,'absurd'),(332,'racist'),(332,'mundane'),(333,'nostalgia'),(333,'mundane'),(334,'absurd'),(335,'sexual'),(335,'gross'),(335,'absurd'),(335,'seroius'),(336,'religion'),(336,'politics'),(337,'sexual'),(337,'mundane'),(338,'mundane'),(339,'seroius'),(340,'politics'),(340,'seroius'),(341,'nostalgia'),(341,'absurd'),(342,'absurd'),(343,'sexual'),(343,'nostalgia'),(343,'mundane'),(344,'nostalgia'),(344,'religion'),(345,'absurd'),(345,'seroius'),(346,'absurd'),(347,'mundane'),(348,'racist'),(348,'politics'),(349,'nostalgia'),(349,'religion'),(349,'politics'),(350,'sexual'),(350,'gross'),(350,'absurd'),(351,'nostalgia'),(351,'religion'),(351,'politics'),(352,'absurd'),(352,'religion'),(352,'politics'),(352,'seroius'),(353,'absurd'),(353,'drugs'),(353,'seroius'),(354,'politics'),(355,'nostalgia'),(356,'sexual'),(356,'religion'),(357,'absurd'),(358,'seroius'),(359,'absurd'),(360,'sexual'),(360,'mundane'),(361,'sexual'),(361,'absurd'),(361,'politics'),(362,'absurd'),(362,'religion'),(362,'politics'),(362,'seroius'),(363,'politics'),(364,'nostalgia'),(364,'absurd'),(364,'seroius'),(365,'seroius'),(366,'nostalgia'),(366,'religion'),(366,'politics'),(367,'seroius'),(368,'drugs'),(368,'seroius'),(369,'gross'),(369,'seroius'),(370,'gross'),(370,'religion'),(370,'politics'),(371,'sexual'),(371,'absurd'),(371,'mundane'),(372,'absurd'),(373,'gross'),(373,'seroius'),(374,'sexual'),(374,'gross'),(374,'absurd'),(375,'nostalgia'),(375,'mundane'),(376,'gross'),(376,'politics'),(377,'gross'),(377,'absurd'),(378,'sexual'),(378,'drugs'),(378,'mundane'),(379,'nostalgia'),(379,'absurd'),(379,'mundane'),(380,'sexual'),(380,'gross'),(380,'absurd'),(380,'mundane'),(381,'nostalgia'),(381,'seroius'),(381,'mundane'),(382,'sexual'),(382,'gross'),(382,'absurd'),(383,'nostalgia'),(383,'absurd'),(383,'mundane'),(384,'absurd'),(385,'sexual'),(385,'gross'),(385,'absurd'),(386,'racist'),(386,'seroius'),(387,'sexual'),(387,'mundane'),(388,'racist'),(388,'religion'),(388,'politics'),(388,'seroius'),(389,'sexual'),(390,'sexual'),(390,'gross'),(390,'absurd'),(390,'seroius'),(391,'gross'),(391,'absurd'),(391,'seroius'),(392,'sexual'),(392,'mundane'),(393,'sexual'),(393,'absurd'),(393,'religion'),(393,'politics'),(393,'seroius'),(394,'sexual'),(394,'gross'),(394,'absurd'),(395,'sexual'),(396,'racist'),(396,'politics'),(396,'seroius'),(397,'gross'),(397,'absurd'),(398,'nostalgia'),(399,'gross'),(400,'nostalgia'),(400,'absurd'),(400,'racist'),(400,'drugs'),(400,'religion'),(400,'politics'),(400,'seroius'),(400,'mundane'),(401,'mundane'),(402,'sexual'),(402,'gross'),(402,'absurd'),(403,'sexual'),(403,'absurd'),(404,'nostalgia'),(404,'absurd'),(404,'mundane'),(405,'gross'),(405,'absurd'),(405,'seroius'),(406,'sexual'),(406,'nostalgia'),(408,'absurd'),(408,'mundane'),(409,'sexual'),(409,'gross'),(409,'absurd'),(410,'nostalgia'),(411,'sexual'),(411,'gross'),(411,'absurd'),(412,'racist'),(412,'mundane'),(413,'nostalgia'),(413,'mundane'),(414,'racist'),(414,'politics'),(414,'seroius'),(415,'sexual'),(415,'nostalgia'),(415,'racist'),(417,'religion'),(418,'absurd'),(418,'seroius'),(419,'racist'),(419,'seroius'),(420,'absurd'),(420,'mundane'),(421,'seroius'),(422,'gross'),(422,'seroius'),(423,'sexual'),(423,'gross'),(423,'absurd'),(423,'mundane'),(424,'racist'),(424,'politics'),(425,'nostalgia'),(425,'absurd'),(425,'mundane'),(426,'nostalgia'),(426,'absurd'),(427,'racist'),(427,'politics'),(427,'seroius'),(428,'sexual'),(429,'nostalgia'),(429,'absurd'),(429,'politics'),(430,'absurd'),(430,'seroius'),(431,'drugs'),(431,'seroius'),(432,'absurd'),(432,'seroius'),(433,'seroius'),(434,'sexual'),(434,'nostalgia'),(434,'mundane'),(435,'gross'),(436,'mundane'),(437,'mundane'),(438,'sexual'),(438,'mundane'),(439,'seroius'),(440,'nostalgia'),(440,'mundane'),(441,'sexual'),(441,'nostalgia'),(441,'gross'),(441,'absurd'),(442,'sexual'),(443,'sexual'),(443,'gross'),(444,'racist'),(446,'absurd'),(446,'politics'),(447,'nostalgia'),(447,'religion'),(448,'politics'),(449,'politics'),(449,'seroius'),(450,'gross'),(450,'absurd'),(451,'religion'),(451,'mundane'),(452,'religion'),(452,'politics'),(452,'seroius'),(453,'gross'),(453,'absurd'),(454,'gross'),(454,'absurd'),(455,'nostalgia'),(455,'mundane'),(456,'gross'),(456,'seroius'),(457,'sexual'),(458,'sexual'),(459,'nostalgia'),(459,'absurd'),(459,'mundane'),(461,'gross'),(462,'sexual');
/*!40000 ALTER TABLE `Labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MaterializedWeights`
--

DROP TABLE IF EXISTS `MaterializedWeights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MaterializedWeights` (
  `BlackCardID` int(11) DEFAULT NULL,
  `label` char(15) DEFAULT NULL,
  `weight` double(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MaterializedWeights`
--

LOCK TABLES `MaterializedWeights` WRITE;
/*!40000 ALTER TABLE `MaterializedWeights` DISABLE KEYS */;
INSERT INTO `MaterializedWeights` VALUES (459,'sexual',0.3333),(459,'seroius',0.6667),(459,'religion',0.3333),(459,'racist',0.3333),(459,'politics',0.6667),(459,'nostalgia',0.3333),(459,'mundane',0.3333),(459,'gross',0.3333),(459,'drugs',0.3333),(459,'absurd',0.3333),(461,'sexual',0.6667),(461,'seroius',0.3333),(461,'religion',0.3333),(461,'racist',0.3333),(461,'politics',0.3333),(461,'nostalgia',0.3333),(461,'mundane',0.3333),(461,'gross',0.6667),(461,'drugs',0.3333),(461,'absurd',0.3333),(475,'sexual',0.3333),(475,'seroius',0.3333),(475,'religion',0.3333),(475,'racist',0.3333),(475,'politics',0.3333),(475,'nostalgia',0.3333),(475,'mundane',0.3333),(475,'gross',0.3333),(475,'drugs',0.3333),(475,'absurd',0.3333),(481,'sexual',0.6667),(481,'seroius',0.6667),(481,'religion',0.6667),(481,'racist',0.3333),(481,'politics',0.6667),(481,'nostalgia',0.3333),(481,'mundane',0.3333),(481,'gross',0.3333),(481,'drugs',0.3333),(481,'absurd',0.6667),(482,'sexual',0.5000),(482,'seroius',0.2500),(482,'religion',0.2500),(482,'racist',0.2500),(482,'politics',0.2500),(482,'nostalgia',0.5000),(482,'mundane',0.5000),(482,'gross',0.5000),(482,'drugs',0.2500),(482,'absurd',0.5000),(483,'sexual',0.3333),(483,'seroius',0.3333),(483,'religion',0.3333),(483,'racist',0.3333),(483,'politics',0.3333),(483,'nostalgia',0.3333),(483,'mundane',0.6667),(483,'gross',0.3333),(483,'drugs',0.3333),(483,'absurd',0.6667),(485,'sexual',0.2500),(485,'seroius',0.2500),(485,'religion',0.2500),(485,'racist',0.2500),(485,'politics',0.2500),(485,'nostalgia',0.2500),(485,'mundane',0.2500),(485,'gross',0.2500),(485,'drugs',0.2500),(485,'absurd',0.5000),(487,'sexual',0.3333),(487,'seroius',0.3333),(487,'religion',0.6667),(487,'racist',0.3333),(487,'politics',0.3333),(487,'nostalgia',0.3333),(487,'mundane',0.6667),(487,'gross',0.3333),(487,'drugs',0.3333),(487,'absurd',0.3333),(493,'sexual',0.6667),(493,'seroius',0.3333),(493,'religion',0.3333),(493,'racist',0.3333),(493,'politics',0.3333),(493,'nostalgia',0.3333),(493,'mundane',0.3333),(493,'gross',0.6667),(493,'drugs',0.3333),(493,'absurd',0.6667),(506,'sexual',0.3333),(506,'seroius',0.6667),(506,'religion',0.6667),(506,'racist',0.3333),(506,'politics',0.6667),(506,'nostalgia',0.3333),(506,'mundane',0.3333),(506,'gross',0.3333),(506,'drugs',0.3333),(506,'absurd',0.6667),(508,'sexual',0.3333),(508,'seroius',0.3333),(508,'religion',0.3333),(508,'racist',0.3333),(508,'politics',0.3333),(508,'nostalgia',0.3333),(508,'mundane',0.3333),(508,'gross',0.3333),(508,'drugs',0.3333),(508,'absurd',0.6667),(510,'sexual',0.3333),(510,'seroius',0.6667),(510,'religion',0.3333),(510,'racist',0.3333),(510,'politics',0.3333),(510,'nostalgia',0.3333),(510,'mundane',0.3333),(510,'gross',0.3333),(510,'drugs',0.3333),(510,'absurd',0.3333),(515,'sexual',0.3333),(515,'seroius',0.3333),(515,'religion',0.3333),(515,'racist',0.3333),(515,'politics',0.3333),(515,'nostalgia',0.6667),(515,'mundane',0.3333),(515,'gross',0.3333),(515,'drugs',0.3333),(515,'absurd',0.3333),(543,'sexual',0.5000),(543,'seroius',0.2500),(543,'religion',0.5000),(543,'racist',0.2500),(543,'politics',0.5000),(543,'nostalgia',0.5000),(543,'mundane',0.2500),(543,'gross',0.2500),(543,'drugs',0.2500),(543,'absurd',0.5000);
/*!40000 ALTER TABLE `MaterializedWeights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `MaxTurnOrder`
--

DROP TABLE IF EXISTS `MaxTurnOrder`;
/*!50001 DROP VIEW IF EXISTS `MaxTurnOrder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `MaxTurnOrder` (
  `GameID` tinyint NOT NULL,
  `HighestTurnOrder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Player` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(64) DEFAULT NULL,
  `AuthToken` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `AuthToken_UNIQUE` (`AuthToken`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `PlayerCount`
--

DROP TABLE IF EXISTS `PlayerCount`;
/*!50001 DROP VIEW IF EXISTS `PlayerCount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PlayerCount` (
  `GameID` tinyint NOT NULL,
  `PlayerCount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `PlayerHand`
--

DROP TABLE IF EXISTS `PlayerHand`;
/*!50001 DROP VIEW IF EXISTS `PlayerHand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PlayerHand` (
  `PlayerID` tinyint NOT NULL,
  `CardID` tinyint NOT NULL,
  `RoundPlayed` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
/*!40000 ALTER TABLE `PlayersInGame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Players_Played`
--

DROP TABLE IF EXISTS `Players_Played`;
/*!50001 DROP VIEW IF EXISTS `Players_Played`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Players_Played` (
  `GameID` tinyint NOT NULL,
  `PlayerID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
/*!40000 ALTER TABLE `Round` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WhiteCard`
--

DROP TABLE IF EXISTS `WhiteCard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WhiteCard` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WhiteCard`
--

LOCK TABLES `WhiteCard` WRITE;
/*!40000 ALTER TABLE `WhiteCard` DISABLE KEYS */;
INSERT INTO `WhiteCard` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(91),(92),(93),(94),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120),(121),(122),(123),(124),(125),(126),(127),(128),(129),(130),(131),(132),(133),(134),(135),(136),(137),(138),(139),(140),(141),(142),(143),(144),(145),(146),(147),(148),(149),(150),(151),(152),(153),(154),(155),(156),(157),(158),(159),(160),(161),(162),(163),(164),(165),(166),(167),(168),(169),(170),(171),(172),(173),(174),(175),(176),(177),(178),(179),(180),(181),(182),(183),(184),(185),(186),(187),(188),(189),(190),(191),(192),(193),(194),(195),(196),(197),(198),(199),(200),(201),(202),(203),(204),(205),(206),(207),(208),(209),(210),(211),(212),(213),(214),(215),(216),(217),(218),(219),(220),(221),(222),(223),(224),(225),(226),(227),(228),(229),(230),(231),(232),(233),(234),(235),(236),(237),(238),(239),(240),(241),(242),(243),(244),(245),(246),(247),(248),(249),(250),(251),(252),(253),(254),(255),(256),(257),(258),(259),(260),(261),(262),(263),(264),(265),(266),(267),(268),(269),(270),(271),(272),(273),(274),(275),(276),(277),(278),(279),(280),(281),(282),(283),(284),(285),(286),(287),(288),(289),(290),(291),(292),(293),(294),(295),(296),(297),(298),(299),(300),(301),(302),(303),(304),(305),(306),(307),(308),(309),(310),(311),(312),(313),(314),(315),(316),(317),(318),(319),(320),(321),(322),(323),(324),(325),(326),(327),(328),(329),(330),(331),(332),(333),(334),(335),(336),(337),(338),(339),(340),(341),(342),(343),(344),(345),(346),(347),(348),(349),(350),(351),(352),(353),(354),(355),(356),(357),(358),(359),(360),(361),(362),(363),(364),(365),(366),(367),(368),(369),(370),(371),(372),(373),(374),(375),(376),(377),(378),(379),(380),(381),(382),(383),(384),(385),(386),(387),(388),(389),(390),(391),(392),(393),(394),(395),(396),(397),(398),(399),(400),(401),(402),(403),(404),(405),(406),(407),(408),(409),(410),(411),(412),(413),(414),(415),(416),(417),(418),(419),(420),(421),(422),(423),(424),(425),(426),(427),(428),(429),(430),(431),(432),(433),(434),(435),(436),(437),(438),(439),(440),(441),(442),(443),(444),(445),(446),(447),(448),(449),(450),(451),(452),(453),(454),(455),(456),(457),(458);
/*!40000 ALTER TABLE `WhiteCard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `WhiteDeck`
--

DROP TABLE IF EXISTS `WhiteDeck`;
/*!50001 DROP VIEW IF EXISTS `WhiteDeck`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WhiteDeck` (
  `CardID` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `WhiteDeck2`
--

DROP TABLE IF EXISTS `WhiteDeck2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WhiteDeck2` (
  `CardID` int(11) DEFAULT NULL,
  `GameID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WhiteDeck2`
--

LOCK TABLES `WhiteDeck2` WRITE;
/*!40000 ALTER TABLE `WhiteDeck2` DISABLE KEYS */;
/*!40000 ALTER TABLE `WhiteDeck2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `WinningCards`
--

DROP TABLE IF EXISTS `WinningCards`;
/*!50001 DROP VIEW IF EXISTS `WinningCards`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WinningCards` (
  `BlackCardID` tinyint NOT NULL,
  `WhiteCardID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `WinningLabelCount`
--

DROP TABLE IF EXISTS `WinningLabelCount`;
/*!50001 DROP VIEW IF EXISTS `WinningLabelCount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `WinningLabelCount` (
  `BlackCardID` tinyint NOT NULL,
  `label` tinyint NOT NULL,
  `ct` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `AI_Players`
--

/*!50001 DROP TABLE IF EXISTS `AI_Players`*/;
/*!50001 DROP VIEW IF EXISTS `AI_Players`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AI_Players` AS select `Player`.`ID` AS `ID`,`Player`.`Name` AS `Name`,`Player`.`AuthToken` AS `AuthToken` from `Player` where (`Player`.`AuthToken` < 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `BlackCardUseCount`
--

/*!50001 DROP TABLE IF EXISTS `BlackCardUseCount`*/;
/*!50001 DROP VIEW IF EXISTS `BlackCardUseCount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `BlackCardUseCount` AS select `WinningCards`.`BlackCardID` AS `BlackCardID`,count(0) AS `count` from `WinningCards` group by `WinningCards`.`BlackCardID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `BlackDeck`
--

/*!50001 DROP TABLE IF EXISTS `BlackDeck`*/;
/*!50001 DROP VIEW IF EXISTS `BlackDeck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `BlackDeck` AS select `FullBlackDeck`.`CardID` AS `CardID`,`FullBlackDeck`.`GameID` AS `GameID` from `FullBlackDeck` where (not((`FullBlackDeck`.`CardID`,`FullBlackDeck`.`GameID`) in (select `Round`.`BlackCardID`,`Round`.`GameID` from `Round`))) order by rand() */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CurrentJudge`
--

/*!50001 DROP TABLE IF EXISTS `CurrentJudge`*/;
/*!50001 DROP VIEW IF EXISTS `CurrentJudge`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CurrentJudge` AS select `PlayersInGame`.`PlayerID` AS `PlayerId`,`PlayersInGame`.`GameID` AS `GameID` from ((`PlayersInGame` join `MaxTurnOrder` on((`PlayersInGame`.`GameID` = `MaxTurnOrder`.`GameID`))) join `Game`) where ((`Game`.`ID` = `PlayersInGame`.`GameID`) and (`PlayersInGame`.`TurnOrder` = (((`Game`.`CurrentRoundNumber` - 1) % `MaxTurnOrder`.`HighestTurnOrder`) + 1))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FullBlackDeck`
--

/*!50001 DROP TABLE IF EXISTS `FullBlackDeck`*/;
/*!50001 DROP VIEW IF EXISTS `FullBlackDeck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FullBlackDeck` AS select `BlackCard`.`ID` AS `CardID`,`Game`.`ID` AS `GameID` from (`Game` join `BlackCard`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `FullWhiteDeck`
--

/*!50001 DROP TABLE IF EXISTS `FullWhiteDeck`*/;
/*!50001 DROP VIEW IF EXISTS `FullWhiteDeck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `FullWhiteDeck` AS select `WhiteCard`.`ID` AS `CardID`,`Game`.`ID` AS `GameID` from (`Game` join `WhiteCard`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `InTurn`
--

/*!50001 DROP TABLE IF EXISTS `InTurn`*/;
/*!50001 DROP VIEW IF EXISTS `InTurn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `InTurn` AS select `PlayersInGame`.`PlayerID` AS `PlayerID`,`PlayersInGame`.`GameID` AS `GameID`,`PlayersInGame`.`TurnOrder` AS `TurnOrder` from `PlayersInGame` where (`PlayersInGame`.`TurnOrder` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LabelList`
--

/*!50001 DROP TABLE IF EXISTS `LabelList`*/;
/*!50001 DROP VIEW IF EXISTS `LabelList`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `LabelList` AS select distinct `Labels`.`label` AS `label` from `Labels` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LabelWeights`
--

/*!50001 DROP TABLE IF EXISTS `LabelWeights`*/;
/*!50001 DROP VIEW IF EXISTS `LabelWeights`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `LabelWeights` AS select `win`.`BlackCardID` AS `BlackCardID`,`win`.`label` AS `label`,((`win`.`ct` + 1) / (`total`.`count` + 2)) AS `weight` from (`WinningLabelCount` `win` join `BlackCardUseCount` `total` on((`win`.`BlackCardID` = `total`.`BlackCardID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `MaxTurnOrder`
--

/*!50001 DROP TABLE IF EXISTS `MaxTurnOrder`*/;
/*!50001 DROP VIEW IF EXISTS `MaxTurnOrder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `MaxTurnOrder` AS select `Game`.`ID` AS `GameID`,count(`InTurn`.`TurnOrder`) AS `HighestTurnOrder` from (`Game` left join `InTurn` on((`Game`.`ID` = `InTurn`.`GameID`))) group by `InTurn`.`GameID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PlayerCount`
--

/*!50001 DROP TABLE IF EXISTS `PlayerCount`*/;
/*!50001 DROP VIEW IF EXISTS `PlayerCount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PlayerCount` AS select `Game`.`ID` AS `GameID`,count(`PlayersInGame`.`PlayerID`) AS `PlayerCount` from (`Game` left join `PlayersInGame` on((`Game`.`ID` = `PlayersInGame`.`GameID`))) group by `Game`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PlayerHand`
--

/*!50001 DROP TABLE IF EXISTS `PlayerHand`*/;
/*!50001 DROP VIEW IF EXISTS `PlayerHand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PlayerHand` AS select `CardInHand`.`PlayerID` AS `PlayerID`,`CardInHand`.`CardID` AS `CardID`,`CardInHand`.`RoundPlayed` AS `RoundPlayed`,`CardInHand`.`GameID` AS `GameID` from ((`Player` join `CardInHand`) join `WhiteCard`) where ((`Player`.`ID` = `CardInHand`.`PlayerID`) and (`WhiteCard`.`ID` = `CardInHand`.`CardID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Players_Played`
--

/*!50001 DROP TABLE IF EXISTS `Players_Played`*/;
/*!50001 DROP VIEW IF EXISTS `Players_Played`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Players_Played` AS select distinct `Game`.`ID` AS `GameID`,`pig`.`PlayerID` AS `PlayerID` from ((`Game` join `PlayersInGame` `pig` on((`Game`.`ID` = `pig`.`GameID`))) join `CardInHand` `cih` on(((`cih`.`GameID` = `Game`.`ID`) and (`cih`.`PlayerID` = `pig`.`PlayerID`)))) where (`cih`.`RoundPlayed` = `Game`.`CurrentRoundNumber`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WhiteDeck`
--

/*!50001 DROP TABLE IF EXISTS `WhiteDeck`*/;
/*!50001 DROP VIEW IF EXISTS `WhiteDeck`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `WhiteDeck` AS select `FullWhiteDeck`.`CardID` AS `CardID`,`FullWhiteDeck`.`GameID` AS `GameID` from `FullWhiteDeck` where (not((`FullWhiteDeck`.`CardID`,`FullWhiteDeck`.`GameID`) in (select `CardInHand`.`CardID`,`CardInHand`.`GameID` from `CardInHand`))) order by rand() */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WinningCards`
--

/*!50001 DROP TABLE IF EXISTS `WinningCards`*/;
/*!50001 DROP VIEW IF EXISTS `WinningCards`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `WinningCards` AS select `A`.`BlackCardID` AS `BlackCardID`,`B`.`CardID` AS `WhiteCardID` from (`Round` `A` join `CardInHand` `B` on(((`B`.`PlayerID` = `A`.`WinnerID`) and (`A`.`GameID` = `B`.`GameID`) and (`A`.`RoundNumber` = `B`.`RoundPlayed`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `WinningLabelCount`
--

/*!50001 DROP TABLE IF EXISTS `WinningLabelCount`*/;
/*!50001 DROP VIEW IF EXISTS `WinningLabelCount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `WinningLabelCount` AS select `bc`.`ID` AS `BlackCardID`,`LabelList`.`label` AS `label`,count(`wc`.`BlackCardID`) AS `ct` from ((`BlackCard` `bc` join `LabelList`) left join (`WinningCards` `wc` join `Labels` `wl` on((`wc`.`WhiteCardID` = `wl`.`ID`))) on(((`bc`.`ID` = `wc`.`BlackCardID`) and (`LabelList`.`label` = `wl`.`label`)))) group by `bc`.`ID`,`LabelList`.`label` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-28 12:40:19
