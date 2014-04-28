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
INSERT INTO `BlackDeck2` VALUES (459,17),(460,17),(461,17),(462,17),(463,17),(464,17),(465,17),(466,17),(467,17),(468,17),(469,17),(470,17),(471,17),(472,17),(473,17),(474,17),(475,17),(476,17),(477,17),(478,17),(479,17),(480,17),(481,17),(482,17),(483,17),(484,17),(485,17),(486,17),(487,17),(488,17),(489,17),(490,17),(491,17),(492,17),(493,17),(494,17),(495,17),(496,17),(497,17),(498,17),(499,17),(500,17),(501,17),(502,17),(503,17),(504,17),(505,17),(506,17),(507,17),(508,17),(509,17),(510,17),(511,17),(512,17),(513,17),(514,17),(515,17),(516,17),(517,17),(518,17),(519,17),(520,17),(521,17),(522,17),(523,17),(524,17),(525,17),(526,17),(527,17),(528,17),(529,17),(530,17),(531,17),(532,17),(533,17),(534,17),(535,17),(536,17),(537,17),(538,17),(539,17),(540,17),(541,17),(542,17),(543,17),(544,17),(545,17),(546,17),(547,17),(548,17),(459,18),(460,18),(461,18),(462,18),(463,18),(464,18),(465,18),(466,18),(467,18),(468,18),(469,18),(470,18),(471,18),(472,18),(473,18),(474,18),(475,18),(476,18),(477,18),(478,18),(479,18),(480,18),(481,18),(482,18),(483,18),(484,18),(485,18),(486,18),(487,18),(488,18),(489,18),(490,18),(491,18),(492,18),(493,18),(494,18),(495,18),(496,18),(497,18),(498,18),(499,18),(500,18),(501,18),(502,18),(503,18),(504,18),(505,18),(506,18),(507,18),(508,18),(509,18),(510,18),(511,18),(512,18),(513,18),(514,18),(515,18),(516,18),(517,18),(518,18),(519,18),(520,18),(521,18),(522,18),(523,18),(524,18),(525,18),(526,18),(527,18),(528,18),(529,18),(530,18),(531,18),(532,18),(533,18),(534,18),(535,18),(536,18),(537,18),(538,18),(539,18),(540,18),(541,18),(542,18),(543,18),(544,18),(545,18),(546,18),(547,18),(548,18),(459,19),(460,19),(461,19),(462,19),(463,19),(464,19),(465,19),(466,19),(467,19),(468,19),(469,19),(470,19),(471,19),(472,19),(473,19),(474,19),(475,19),(476,19),(477,19),(478,19),(479,19),(480,19),(481,19),(482,19),(483,19),(484,19),(485,19),(486,19),(487,19),(488,19),(489,19),(490,19),(491,19),(492,19),(493,19),(494,19),(495,19),(496,19),(497,19),(498,19),(499,19),(500,19),(501,19),(502,19),(503,19),(504,19),(505,19),(506,19),(507,19),(508,19),(509,19),(510,19),(511,19),(512,19),(513,19),(514,19),(515,19),(516,19),(517,19),(518,19),(519,19),(520,19),(521,19),(522,19),(523,19),(524,19),(525,19),(526,19),(527,19),(528,19),(529,19),(530,19),(531,19),(532,19),(533,19),(534,19),(535,19),(536,19),(537,19),(538,19),(539,19),(540,19),(541,19),(542,19),(543,19),(544,19),(545,19),(546,19),(547,19),(548,19),(459,20),(460,20),(461,20),(462,20),(463,20),(464,20),(465,20),(466,20),(467,20),(468,20),(469,20),(470,20),(471,20),(472,20),(473,20),(474,20),(475,20),(476,20),(477,20),(478,20),(479,20),(480,20),(481,20),(482,20),(483,20),(484,20),(485,20),(486,20),(487,20),(488,20),(489,20),(490,20),(491,20),(492,20),(493,20),(494,20),(495,20),(496,20),(497,20),(498,20),(499,20),(500,20),(501,20),(502,20),(503,20),(504,20),(505,20),(506,20),(507,20),(508,20),(509,20),(510,20),(511,20),(512,20),(513,20),(514,20),(515,20),(516,20),(517,20),(518,20),(519,20),(520,20),(521,20),(522,20),(523,20),(524,20),(525,20),(526,20),(527,20),(528,20),(529,20),(530,20),(531,20),(532,20),(533,20),(534,20),(535,20),(536,20),(537,20),(538,20),(539,20),(540,20),(541,20),(542,20),(543,20),(544,20),(545,20),(546,20),(547,20),(548,20);
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
INSERT INTO `CardInHand` VALUES (154,126,17,1,0,0),(367,126,17,1,0,0),(12,126,17,1,0,0),(171,126,17,1,0,0),(332,126,17,1,0,0),(94,126,17,1,0,0),(28,126,17,1,0,0),(132,126,17,1,0,0),(273,126,17,1,0,0),(302,126,17,1,0,0),(86,0,18,1,0,0),(60,0,18,1,0,0),(444,0,18,1,0,0),(19,0,18,1,0,0),(386,0,18,1,0,0),(108,0,18,1,0,0),(187,0,18,1,0,0),(427,0,18,1,0,0),(198,0,18,1,0,0),(454,0,18,1,0,0),(153,0,18,1,0,0),(155,0,18,1,0,0),(168,0,18,1,0,0),(345,0,18,1,0,0),(442,0,18,1,0,0),(378,0,18,1,0,0),(382,0,18,1,0,0),(119,0,18,1,0,0),(122,0,18,1,0,0),(67,0,18,1,0,0),(297,0,18,1,0,0),(270,0,18,1,0,0),(238,0,18,1,0,0),(391,0,18,1,0,0),(156,0,18,1,0,0),(199,0,18,1,0,0),(401,0,18,1,0,0),(120,0,18,1,0,0),(413,0,18,1,0,0),(222,0,18,1,0,0),(61,0,18,1,0,0),(289,0,18,1,0,0),(76,0,18,1,0,0),(422,0,18,1,0,0),(167,0,18,1,0,0),(241,0,18,1,0,0),(246,0,18,1,0,0),(218,0,18,1,0,0),(252,0,18,1,0,0),(140,0,18,1,0,0),(276,0,18,1,0,0),(319,0,18,1,0,0),(37,0,18,1,0,0),(389,0,18,1,0,0),(208,0,18,1,0,0),(113,0,18,1,0,0),(90,0,18,1,0,0),(393,0,18,1,0,0),(348,0,18,1,0,0),(202,0,18,1,0,0),(457,0,18,1,0,0),(33,0,18,1,0,0),(193,0,18,1,0,0),(75,0,18,1,0,0),(286,0,18,1,0,0),(88,0,18,1,0,0),(369,0,18,1,0,0),(394,0,18,1,0,0),(405,0,18,1,0,0),(390,0,18,1,0,0),(434,0,18,1,0,0),(360,0,18,1,0,0),(443,0,18,1,0,0),(22,0,18,1,0,0),(157,0,18,1,0,0),(221,0,18,1,0,0),(107,0,18,1,0,0),(239,0,18,1,0,0),(164,0,18,1,0,0),(216,0,18,1,0,0),(118,0,18,1,0,0),(377,0,18,1,0,0),(35,0,18,1,0,0),(235,0,18,1,0,0),(165,0,18,1,0,0),(71,0,18,1,0,0),(192,0,18,1,0,0),(347,0,18,1,0,0),(150,0,18,1,0,0),(42,0,18,1,0,0),(159,0,18,1,0,0),(143,0,18,1,0,0),(43,0,18,1,0,0),(323,0,18,1,0,0),(337,0,18,1,0,0),(15,0,18,1,0,0),(174,0,18,1,0,0),(388,0,18,1,0,0),(29,0,18,1,0,0),(13,0,18,1,0,0),(103,126,18,1,0,0),(203,126,18,1,0,0),(433,126,18,1,0,0),(4,126,18,1,0,0),(264,126,18,1,0,0),(154,126,18,1,0,0),(346,126,18,1,0,0),(49,126,18,1,0,0),(253,126,18,1,0,0),(428,126,18,1,0,0),(110,0,20,1,0,0),(160,0,20,1,0,0),(48,0,20,1,0,0),(432,0,20,1,0,0),(151,0,20,1,0,0),(321,0,20,1,0,0),(53,0,20,1,0,0),(116,0,20,1,0,0),(260,0,20,1,0,0),(128,0,20,1,0,0),(235,0,20,1,0,0),(2,0,20,1,0,0),(157,0,20,1,0,0),(237,0,20,1,0,0),(266,0,20,1,0,0),(218,0,20,1,0,0),(224,0,20,1,0,0),(429,0,20,1,0,0),(342,0,20,1,0,0),(70,0,20,1,0,0),(97,0,20,1,0,0),(85,0,20,1,0,0),(399,0,20,1,0,0),(384,0,20,1,0,0),(238,0,20,1,0,0),(196,0,20,1,0,0),(267,0,20,1,0,0),(370,0,20,1,0,0),(67,0,20,1,0,0),(32,0,20,1,0,0),(181,0,20,1,0,0),(182,0,20,1,0,0),(404,0,20,1,0,0),(327,0,20,1,0,0),(358,0,20,1,0,0),(450,0,20,1,0,0),(255,0,20,1,0,0),(252,0,20,1,0,0),(216,0,20,1,0,0),(306,0,20,1,0,0),(127,0,20,1,0,0),(335,0,20,1,0,0),(279,0,20,1,0,0),(246,0,20,1,0,0),(392,0,20,1,0,0),(386,0,20,1,0,0),(126,0,20,1,0,0),(378,0,20,1,0,0),(359,0,20,1,0,0),(109,0,20,1,0,0),(55,0,20,1,0,0),(176,0,20,1,0,0),(434,0,20,1,0,0),(424,0,20,1,0,0),(210,0,20,1,0,0),(259,0,20,1,0,0),(61,0,20,1,0,0),(274,0,20,1,0,0),(129,0,20,1,0,0),(86,0,20,1,0,0),(229,126,20,1,0,0),(40,126,20,1,0,0),(271,126,20,1,0,0),(177,126,20,1,0,0),(188,126,20,1,0,0),(438,126,20,1,0,0),(418,126,20,1,0,0),(93,126,20,1,0,0),(297,126,20,1,0,0),(158,126,20,1,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES (127,'AI Player 1',-1),(128,'AI Player 2',-2),(129,'AI Player 3',-3),(130,'AI Player 4',-4),(131,'AI Player 5',-5),(132,'AI Player 6',-6);
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
INSERT INTO `PlayersInGame` VALUES (126,17,1),(126,18,1),(126,20,1);
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
INSERT INTO `WhiteDeck2` VALUES (1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(8,17),(9,17),(10,17),(11,17),(13,17),(14,17),(15,17),(16,17),(17,17),(18,17),(19,17),(20,17),(21,17),(22,17),(23,17),(24,17),(25,17),(26,17),(27,17),(29,17),(30,17),(31,17),(32,17),(33,17),(34,17),(35,17),(36,17),(37,17),(38,17),(39,17),(40,17),(41,17),(42,17),(43,17),(44,17),(45,17),(46,17),(47,17),(48,17),(49,17),(50,17),(51,17),(52,17),(53,17),(54,17),(55,17),(56,17),(57,17),(58,17),(59,17),(60,17),(61,17),(62,17),(63,17),(64,17),(65,17),(66,17),(67,17),(68,17),(69,17),(70,17),(71,17),(72,17),(73,17),(74,17),(75,17),(76,17),(77,17),(78,17),(79,17),(80,17),(81,17),(82,17),(83,17),(84,17),(85,17),(86,17),(87,17),(88,17),(89,17),(90,17),(91,17),(92,17),(93,17),(95,17),(96,17),(97,17),(98,17),(99,17),(100,17),(101,17),(102,17),(103,17),(104,17),(105,17),(106,17),(107,17),(108,17),(109,17),(110,17),(111,17),(112,17),(113,17),(114,17),(115,17),(116,17),(117,17),(118,17),(119,17),(120,17),(121,17),(122,17),(123,17),(124,17),(125,17),(126,17),(127,17),(128,17),(129,17),(130,17),(131,17),(133,17),(134,17),(135,17),(136,17),(137,17),(138,17),(139,17),(140,17),(141,17),(142,17),(143,17),(144,17),(145,17),(146,17),(147,17),(148,17),(149,17),(150,17),(151,17),(152,17),(153,17),(155,17),(156,17),(157,17),(158,17),(159,17),(160,17),(161,17),(162,17),(163,17),(164,17),(165,17),(166,17),(167,17),(168,17),(169,17),(170,17),(172,17),(173,17),(174,17),(175,17),(176,17),(177,17),(178,17),(179,17),(180,17),(181,17),(182,17),(183,17),(184,17),(185,17),(186,17),(187,17),(188,17),(189,17),(190,17),(191,17),(192,17),(193,17),(194,17),(195,17),(196,17),(197,17),(198,17),(199,17),(200,17),(201,17),(202,17),(203,17),(204,17),(205,17),(206,17),(207,17),(208,17),(209,17),(210,17),(211,17),(212,17),(213,17),(214,17),(215,17),(216,17),(217,17),(218,17),(219,17),(220,17),(221,17),(222,17),(223,17),(224,17),(225,17),(226,17),(227,17),(228,17),(229,17),(230,17),(231,17),(232,17),(233,17),(234,17),(235,17),(236,17),(237,17),(238,17),(239,17),(240,17),(241,17),(242,17),(243,17),(244,17),(245,17),(246,17),(247,17),(248,17),(249,17),(250,17),(251,17),(252,17),(253,17),(254,17),(255,17),(256,17),(257,17),(258,17),(259,17),(260,17),(261,17),(262,17),(263,17),(264,17),(265,17),(266,17),(267,17),(268,17),(269,17),(270,17),(271,17),(272,17),(274,17),(275,17),(276,17),(277,17),(278,17),(279,17),(280,17),(281,17),(282,17),(283,17),(284,17),(285,17),(286,17),(287,17),(288,17),(289,17),(290,17),(291,17),(292,17),(293,17),(294,17),(295,17),(296,17),(297,17),(298,17),(299,17),(300,17),(301,17),(303,17),(304,17),(305,17),(306,17),(307,17),(308,17),(309,17),(310,17),(311,17),(312,17),(313,17),(314,17),(315,17),(316,17),(317,17),(318,17),(319,17),(320,17),(321,17),(322,17),(323,17),(324,17),(325,17),(326,17),(327,17),(328,17),(329,17),(330,17),(331,17),(333,17),(334,17),(335,17),(336,17),(337,17),(338,17),(339,17),(340,17),(341,17),(342,17),(343,17),(344,17),(345,17),(346,17),(347,17),(348,17),(349,17),(350,17),(351,17),(352,17),(353,17),(354,17),(355,17),(356,17),(357,17),(358,17),(359,17),(360,17),(361,17),(362,17),(363,17),(364,17),(365,17),(366,17),(368,17),(369,17),(370,17),(371,17),(372,17),(373,17),(374,17),(375,17),(376,17),(377,17),(378,17),(379,17),(380,17),(381,17),(382,17),(383,17),(384,17),(385,17),(386,17),(387,17),(388,17),(389,17),(390,17),(391,17),(392,17),(393,17),(394,17),(395,17),(396,17),(397,17),(398,17),(399,17),(400,17),(401,17),(402,17),(403,17),(404,17),(405,17),(406,17),(407,17),(408,17),(409,17),(410,17),(411,17),(412,17),(413,17),(414,17),(415,17),(416,17),(417,17),(418,17),(419,17),(420,17),(421,17),(422,17),(423,17),(424,17),(425,17),(426,17),(427,17),(428,17),(429,17),(430,17),(431,17),(432,17),(433,17),(434,17),(435,17),(436,17),(437,17),(438,17),(439,17),(440,17),(441,17),(442,17),(443,17),(444,17),(445,17),(446,17),(447,17),(448,17),(449,17),(450,17),(451,17),(452,17),(453,17),(454,17),(455,17),(456,17),(457,17),(458,17),(1,18),(2,18),(3,18),(5,18),(6,18),(7,18),(8,18),(9,18),(10,18),(11,18),(12,18),(14,18),(16,18),(17,18),(18,18),(20,18),(21,18),(23,18),(24,18),(25,18),(26,18),(27,18),(28,18),(30,18),(31,18),(32,18),(34,18),(36,18),(38,18),(39,18),(40,18),(41,18),(44,18),(45,18),(46,18),(47,18),(48,18),(50,18),(51,18),(52,18),(53,18),(54,18),(55,18),(56,18),(57,18),(58,18),(59,18),(62,18),(63,18),(64,18),(65,18),(66,18),(68,18),(69,18),(70,18),(72,18),(73,18),(74,18),(77,18),(78,18),(79,18),(80,18),(81,18),(82,18),(83,18),(84,18),(85,18),(87,18),(89,18),(91,18),(92,18),(93,18),(94,18),(95,18),(96,18),(97,18),(98,18),(99,18),(100,18),(101,18),(102,18),(104,18),(105,18),(106,18),(109,18),(110,18),(111,18),(112,18),(114,18),(115,18),(116,18),(117,18),(121,18),(123,18),(124,18),(125,18),(126,18),(127,18),(128,18),(129,18),(130,18),(131,18),(132,18),(133,18),(134,18),(135,18),(136,18),(137,18),(138,18),(139,18),(141,18),(142,18),(144,18),(145,18),(146,18),(147,18),(148,18),(149,18),(151,18),(152,18),(158,18),(160,18),(161,18),(162,18),(163,18),(166,18),(169,18),(170,18),(171,18),(172,18),(173,18),(175,18),(176,18),(177,18),(178,18),(179,18),(180,18),(181,18),(182,18),(183,18),(184,18),(185,18),(186,18),(188,18),(189,18),(190,18),(191,18),(194,18),(195,18),(196,18),(197,18),(200,18),(201,18),(204,18),(205,18),(206,18),(207,18),(209,18),(210,18),(211,18),(212,18),(213,18),(214,18),(215,18),(217,18),(219,18),(220,18),(223,18),(224,18),(225,18),(226,18),(227,18),(228,18),(229,18),(230,18),(231,18),(232,18),(233,18),(234,18),(236,18),(237,18),(240,18),(242,18),(243,18),(244,18),(245,18),(247,18),(248,18),(249,18),(250,18),(251,18),(254,18),(255,18),(256,18),(257,18),(258,18),(259,18),(260,18),(261,18),(262,18),(263,18),(265,18),(266,18),(267,18),(268,18),(269,18),(271,18),(272,18),(273,18),(274,18),(275,18),(277,18),(278,18),(279,18),(280,18),(281,18),(282,18),(283,18),(284,18),(285,18),(287,18),(288,18),(290,18),(291,18),(292,18),(293,18),(294,18),(295,18),(296,18),(298,18),(299,18),(300,18),(301,18),(302,18),(303,18),(304,18),(305,18),(306,18),(307,18),(308,18),(309,18),(310,18),(311,18),(312,18),(313,18),(314,18),(315,18),(316,18),(317,18),(318,18),(320,18),(321,18),(322,18),(324,18),(325,18),(326,18),(327,18),(328,18),(329,18),(330,18),(331,18),(332,18),(333,18),(334,18),(335,18),(336,18),(338,18),(339,18),(340,18),(341,18),(342,18),(343,18),(344,18),(349,18),(350,18),(351,18),(352,18),(353,18),(354,18),(355,18),(356,18),(357,18),(358,18),(359,18),(361,18),(362,18),(363,18),(364,18),(365,18),(366,18),(367,18),(368,18),(370,18),(371,18),(372,18),(373,18),(374,18),(375,18),(376,18),(379,18),(380,18),(381,18),(383,18),(384,18),(385,18),(387,18),(392,18),(395,18),(396,18),(397,18),(398,18),(399,18),(400,18),(402,18),(403,18),(404,18),(406,18),(407,18),(408,18),(409,18),(410,18),(411,18),(412,18),(414,18),(415,18),(416,18),(417,18),(418,18),(419,18),(420,18),(421,18),(423,18),(424,18),(425,18),(426,18),(429,18),(430,18),(431,18),(432,18),(435,18),(436,18),(437,18),(438,18),(439,18),(440,18),(441,18),(445,18),(446,18),(447,18),(448,18),(449,18),(450,18),(451,18),(452,18),(453,18),(455,18),(456,18),(458,18),(1,19),(2,19),(3,19),(4,19),(5,19),(6,19),(7,19),(8,19),(9,19),(10,19),(11,19),(12,19),(13,19),(14,19),(15,19),(16,19),(17,19),(18,19),(19,19),(20,19),(21,19),(22,19),(23,19),(24,19),(25,19),(26,19),(27,19),(28,19),(29,19),(30,19),(31,19),(32,19),(33,19),(34,19),(35,19),(36,19),(37,19),(38,19),(39,19),(40,19),(41,19),(42,19),(43,19),(44,19),(45,19),(46,19),(47,19),(48,19),(49,19),(50,19),(51,19),(52,19),(53,19),(54,19),(55,19),(56,19),(57,19),(58,19),(59,19),(60,19),(61,19),(62,19),(63,19),(64,19),(65,19),(66,19),(67,19),(68,19),(69,19),(70,19),(71,19),(72,19),(73,19),(74,19),(75,19),(76,19),(77,19),(78,19),(79,19),(80,19),(81,19),(82,19),(83,19),(84,19),(85,19),(86,19),(87,19),(88,19),(89,19),(90,19),(91,19),(92,19),(93,19),(94,19),(95,19),(96,19),(97,19),(98,19),(99,19),(100,19),(101,19),(102,19),(103,19),(104,19),(105,19),(106,19),(107,19),(108,19),(109,19),(110,19),(111,19),(112,19),(113,19),(114,19),(115,19),(116,19),(117,19),(118,19),(119,19),(120,19),(121,19),(122,19),(123,19),(124,19),(125,19),(126,19),(127,19),(128,19),(129,19),(130,19),(131,19),(132,19),(133,19),(134,19),(135,19),(136,19),(137,19),(138,19),(139,19),(140,19),(141,19),(142,19),(143,19),(144,19),(145,19),(146,19),(147,19),(148,19),(149,19),(150,19),(151,19),(152,19),(153,19),(154,19),(155,19),(156,19),(157,19),(158,19),(159,19),(160,19),(161,19),(162,19),(163,19),(164,19),(165,19),(166,19),(167,19),(168,19),(169,19),(170,19),(171,19),(172,19),(173,19),(174,19),(175,19),(176,19),(177,19),(178,19),(179,19),(180,19),(181,19),(182,19),(183,19),(184,19),(185,19),(186,19),(187,19),(188,19),(189,19),(190,19),(191,19),(192,19),(193,19),(194,19),(195,19),(196,19),(197,19),(198,19),(199,19),(200,19),(201,19),(202,19),(203,19),(204,19),(205,19),(206,19),(207,19),(208,19),(209,19),(210,19),(211,19),(212,19),(213,19),(214,19),(215,19),(216,19),(217,19),(218,19),(219,19),(220,19),(221,19),(222,19),(223,19),(224,19),(225,19),(226,19),(227,19),(228,19),(229,19),(230,19),(231,19),(232,19),(233,19),(234,19),(235,19),(236,19),(237,19),(238,19),(239,19),(240,19),(241,19),(242,19),(243,19),(244,19),(245,19),(246,19),(247,19),(248,19),(249,19),(250,19),(251,19),(252,19),(253,19),(254,19),(255,19),(256,19),(257,19),(258,19),(259,19),(260,19),(261,19),(262,19),(263,19),(264,19),(265,19),(266,19),(267,19),(268,19),(269,19),(270,19),(271,19),(272,19),(273,19),(274,19),(275,19),(276,19),(277,19),(278,19),(279,19),(280,19),(281,19),(282,19),(283,19),(284,19),(285,19),(286,19),(287,19),(288,19),(289,19),(290,19),(291,19),(292,19),(293,19),(294,19),(295,19),(296,19),(297,19),(298,19),(299,19),(300,19),(301,19),(302,19),(303,19),(304,19),(305,19),(306,19),(307,19),(308,19),(309,19),(310,19),(311,19),(312,19),(313,19),(314,19),(315,19),(316,19),(317,19),(318,19),(319,19),(320,19),(321,19),(322,19),(323,19),(324,19),(325,19),(326,19),(327,19),(328,19),(329,19),(330,19),(331,19),(332,19),(333,19),(334,19),(335,19),(336,19),(337,19),(338,19),(339,19),(340,19),(341,19),(342,19),(343,19),(344,19),(345,19),(346,19),(347,19),(348,19),(349,19),(350,19),(351,19),(352,19),(353,19),(354,19),(355,19),(356,19),(357,19),(358,19),(359,19),(360,19),(361,19),(362,19),(363,19),(364,19),(365,19),(366,19),(367,19),(368,19),(369,19),(370,19),(371,19),(372,19),(373,19),(374,19),(375,19),(376,19),(377,19),(378,19),(379,19),(380,19),(381,19),(382,19),(383,19),(384,19),(385,19),(386,19),(387,19),(388,19),(389,19),(390,19),(391,19),(392,19),(393,19),(394,19),(395,19),(396,19),(397,19),(398,19),(399,19),(400,19),(401,19),(402,19),(403,19),(404,19),(405,19),(406,19),(407,19),(408,19),(409,19),(410,19),(411,19),(412,19),(413,19),(414,19),(415,19),(416,19),(417,19),(418,19),(419,19),(420,19),(421,19),(422,19),(423,19),(424,19),(425,19),(426,19),(427,19),(428,19),(429,19),(430,19),(431,19),(432,19),(433,19),(434,19),(435,19),(436,19),(437,19),(438,19),(439,19),(440,19),(441,19),(442,19),(443,19),(444,19),(445,19),(446,19),(447,19),(448,19),(449,19),(450,19),(451,19),(452,19),(453,19),(454,19),(455,19),(456,19),(457,19),(458,19),(1,20),(3,20),(4,20),(5,20),(6,20),(7,20),(8,20),(9,20),(10,20),(11,20),(12,20),(13,20),(14,20),(15,20),(16,20),(17,20),(18,20),(19,20),(20,20),(21,20),(22,20),(23,20),(24,20),(25,20),(26,20),(27,20),(28,20),(29,20),(30,20),(31,20),(33,20),(34,20),(35,20),(36,20),(37,20),(38,20),(39,20),(41,20),(42,20),(43,20),(44,20),(45,20),(46,20),(47,20),(49,20),(50,20),(51,20),(52,20),(54,20),(56,20),(57,20),(58,20),(59,20),(60,20),(62,20),(63,20),(64,20),(65,20),(66,20),(68,20),(69,20),(71,20),(72,20),(73,20),(74,20),(75,20),(76,20),(77,20),(78,20),(79,20),(80,20),(81,20),(82,20),(83,20),(84,20),(87,20),(88,20),(89,20),(90,20),(91,20),(92,20),(94,20),(95,20),(96,20),(98,20),(99,20),(100,20),(101,20),(102,20),(103,20),(104,20),(105,20),(106,20),(107,20),(108,20),(111,20),(112,20),(113,20),(114,20),(115,20),(117,20),(118,20),(119,20),(120,20),(121,20),(122,20),(123,20),(124,20),(125,20),(130,20),(131,20),(132,20),(133,20),(134,20),(135,20),(136,20),(137,20),(138,20),(139,20),(140,20),(141,20),(142,20),(143,20),(144,20),(145,20),(146,20),(147,20),(148,20),(149,20),(150,20),(152,20),(153,20),(154,20),(155,20),(156,20),(159,20),(161,20),(162,20),(163,20),(164,20),(165,20),(166,20),(167,20),(168,20),(169,20),(170,20),(171,20),(172,20),(173,20),(174,20),(175,20),(178,20),(179,20),(180,20),(183,20),(184,20),(185,20),(186,20),(187,20),(189,20),(190,20),(191,20),(192,20),(193,20),(194,20),(195,20),(197,20),(198,20),(199,20),(200,20),(201,20),(202,20),(203,20),(204,20),(205,20),(206,20),(207,20),(208,20),(209,20),(211,20),(212,20),(213,20),(214,20),(215,20),(217,20),(219,20),(220,20),(221,20),(222,20),(223,20),(225,20),(226,20),(227,20),(228,20),(230,20),(231,20),(232,20),(233,20),(234,20),(236,20),(239,20),(240,20),(241,20),(242,20),(243,20),(244,20),(245,20),(247,20),(248,20),(249,20),(250,20),(251,20),(253,20),(254,20),(256,20),(257,20),(258,20),(261,20),(262,20),(263,20),(264,20),(265,20),(268,20),(269,20),(270,20),(272,20),(273,20),(275,20),(276,20),(277,20),(278,20),(280,20),(281,20),(282,20),(283,20),(284,20),(285,20),(286,20),(287,20),(288,20),(289,20),(290,20),(291,20),(292,20),(293,20),(294,20),(295,20),(296,20),(298,20),(299,20),(300,20),(301,20),(302,20),(303,20),(304,20),(305,20),(307,20),(308,20),(309,20),(310,20),(311,20),(312,20),(313,20),(314,20),(315,20),(316,20),(317,20),(318,20),(319,20),(320,20),(322,20),(323,20),(324,20),(325,20),(326,20),(328,20),(329,20),(330,20),(331,20),(332,20),(333,20),(334,20),(336,20),(337,20),(338,20),(339,20),(340,20),(341,20),(343,20),(344,20),(345,20),(346,20),(347,20),(348,20),(349,20),(350,20),(351,20),(352,20),(353,20),(354,20),(355,20),(356,20),(357,20),(360,20),(361,20),(362,20),(363,20),(364,20),(365,20),(366,20),(367,20),(368,20),(369,20),(371,20),(372,20),(373,20),(374,20),(375,20),(376,20),(377,20),(379,20),(380,20),(381,20),(382,20),(383,20),(385,20),(387,20),(388,20),(389,20),(390,20),(391,20),(393,20),(394,20),(395,20),(396,20),(397,20),(398,20),(400,20),(401,20),(402,20),(403,20),(405,20),(406,20),(407,20),(408,20),(409,20),(410,20),(411,20),(412,20),(413,20),(414,20),(415,20),(416,20),(417,20),(419,20),(420,20),(421,20),(422,20),(423,20),(425,20),(426,20),(427,20),(428,20),(430,20),(431,20),(433,20),(435,20),(436,20),(437,20),(439,20),(440,20),(441,20),(442,20),(443,20),(444,20),(445,20),(446,20),(447,20),(448,20),(449,20),(451,20),(452,20),(453,20),(454,20),(455,20),(456,20),(457,20),(458,20);
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

-- Dump completed on 2014-04-28 12:53:19
