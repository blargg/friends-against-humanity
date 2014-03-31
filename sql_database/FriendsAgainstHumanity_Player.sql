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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
INSERT INTO `Player` VALUES (28,'Olivia',565129654),(29,'Robt',764883392),(30,'Malcom',1160233507),(31,'Allene',352363482),(32,'Kristyn',912795404),(33,'Charlotte',394740281),(34,'Allene',565315516),(35,'Kasi',1618537726),(36,'Jacinta',703488901),(37,'Josephine',154638106),(38,'Jazmine',461317771),(39,'Annette',367950631),(40,'Elwanda',266982419),(41,'Ursula',1726951465),(42,'Mireille',1017118840),(43,'Zetta',938896231),(44,'Kristyn',1509465005),(45,'Ilana',996313350),(46,'Danielle',1280238958),(47,'Ranae',1983528881),(48,'Francoise',1874087155),(49,'Malcom',1589454274),(50,'Lyman',1162993925),(51,'Maryann',824130191),(52,'Olivia',404664357),(53,'Genia',1200286519),(54,'Luciano',1138029375),(55,'Sal',1786535667),(56,'Francoise',1843983649),(57,'Robt',2111297741),(58,'Danielle',1354603511),(59,'Kasi',211243347),(60,'Robt',1056249952),(61,'Hettie',1949843788),(62,'Herbert',1892668508),(63,'Deandre',1698742455),(64,'Kristyn',967479833),(65,'Meghan',1944891671),(66,'Annette',1412830048),(67,'Olivia',1798213902),(68,'Brenda',732601932),(69,'Elwanda',1659446608),(70,'Annette',465633332),(71,'Herbert',858953914),(72,'Marketta',228372395),(73,'Maryann',1672300437),(74,'Keva',1721923306),(75,'Jazmine',1963467714),(76,'Connie',110651138),(77,'Ilana',37989594),(78,'Josephine',233710113),(79,'Hermelinda',1977508698);
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
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
