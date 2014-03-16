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
-- Temporary table structure for view `PlayerHand`
--

DROP TABLE IF EXISTS `PlayerHand`;
/*!50001 DROP VIEW IF EXISTS `PlayerHand`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PlayerHand` (
  `PlayerID` tinyint NOT NULL,
  `CardID` tinyint NOT NULL,
  `Value` tinyint NOT NULL,
  `RoundPlayed` tinyint NOT NULL,
  `GameID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
/*!50001 VIEW `CurrentJudge` AS select `PlayersInGame`.`PlayerID` AS `PlayerId`,`PlayersInGame`.`GameID` AS `GameID` from ((`PlayersInGame` join `PlayerCount` on((`PlayersInGame`.`GameID` = `PlayerCount`.`GameID`))) join `Game`) where ((`Game`.`ID` = `PlayersInGame`.`GameID`) and (`PlayersInGame`.`TurnOrder` = ((`Game`.`CurrentRoundNumber` - 1) % `PlayerCount`.`PlayerCount`))) */;
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
/*!50001 VIEW `PlayerCount` AS select `PlayersInGame`.`GameID` AS `GameID`,count(`PlayersInGame`.`PlayerID`) AS `PlayerCount` from `PlayersInGame` group by `PlayersInGame`.`GameID` */;
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
/*!50001 VIEW `PlayerHand` AS select `CardInHand`.`PlayerID` AS `PlayerID`,`CardInHand`.`CardID` AS `CardID`,`WhiteCard`.`Value` AS `Value`,`CardInHand`.`RoundPlayed` AS `RoundPlayed`,`CardInHand`.`GameID` AS `GameID` from ((`Player` join `CardInHand`) join `WhiteCard`) where ((`Player`.`ID` = `CardInHand`.`PlayerID`) and (`WhiteCard`.`ID` = `CardInHand`.`CardID`)) */;
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

-- Dump completed on 2014-03-16 15:39:28
