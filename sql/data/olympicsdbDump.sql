-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: olympicsdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.30-MariaDB

DROP SCHEMA IF EXISTS `mydb`;
CREATE SCHEMA `mydb`;
USE `mydb`;

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
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete` (
  `AthleteID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `AthleteDOB` date NOT NULL,
  `Country` varchar(25) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `Height` varchar(10) NOT NULL,
  `Weight` varchar(10) NOT NULL,
  `NationalAffliation` varchar(800) NOT NULL,
  PRIMARY KEY (`AthleteID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete`
--

LOCK TABLES `athlete` WRITE;
/*!40000 ALTER TABLE `athlete` DISABLE KEYS */;
INSERT INTO `athlete` VALUES (1,'Anthony','Ervin','1981-05-26','USA','Male','1.91 m','73 kg','Men/s 50m freestyle'),(2,'Justin','Galtin','1982-02-10','USA','Male','1.85 m','83 kg','Men/s 100m'),(3,'Ryan ','Murphy ','1995-07-02','USA','Male','1.91 m','91 kg','Men/s 100m backstroke'),(4,'Nils ','Petersen ','1988-12-06','Germany','Male','1.88 m','80 kg','Football National Team'),(5,'Sarah ','Sjöström ','1993-08-17','Sweden','Female','1.82 m','76 kg','Women’s 100m ');
/*!40000 ALTER TABLE `athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete_get_penalty`
--

DROP TABLE IF EXISTS `athlete_get_penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete_get_penalty` (
  `athlete_AthleteID` int(11) NOT NULL,
  `penalty_PenaltyID` int(11) NOT NULL,
  PRIMARY KEY (`athlete_AthleteID`,`penalty_PenaltyID`),
  KEY `fk_athlete_has_penalty_penalty1_idx` (`penalty_PenaltyID`),
  KEY `fk_athlete_has_penalty_athlete1_idx` (`athlete_AthleteID`),
  CONSTRAINT `fk_athlete_has_penalty_athlete1` FOREIGN KEY (`athlete_AthleteID`) REFERENCES `athlete` (`AthleteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_athlete_has_penalty_penalty1` FOREIGN KEY (`penalty_PenaltyID`) REFERENCES `penalty` (`PenaltyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete_get_penalty`
--

LOCK TABLES `athlete_get_penalty` WRITE;
/*!40000 ALTER TABLE `athlete_get_penalty` DISABLE KEYS */;
INSERT INTO `athlete_get_penalty` VALUES (4,1),(4,2);
/*!40000 ALTER TABLE `athlete_get_penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `athlete_has_team`
--

DROP TABLE IF EXISTS `athlete_has_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete_has_team` (
  `athlete_AthleteID` int(11) NOT NULL,
  `team_TeamID` int(11) NOT NULL,
  PRIMARY KEY (`athlete_AthleteID`,`team_TeamID`),
  KEY `fk_athlete_has_team_team1_idx` (`team_TeamID`),
  KEY `fk_athlete_has_team_athlete1_idx` (`athlete_AthleteID`),
  CONSTRAINT `fk_athlete_has_team_athlete1` FOREIGN KEY (`athlete_AthleteID`) REFERENCES `athlete` (`AthleteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_athlete_has_team_team1` FOREIGN KEY (`team_TeamID`) REFERENCES `team` (`TeamID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete_has_team`
--

LOCK TABLES `athlete_has_team` WRITE;
/*!40000 ALTER TABLE `athlete_has_team` DISABLE KEYS */;
INSERT INTO `athlete_has_team` VALUES (4,3);
/*!40000 ALTER TABLE `athlete_has_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `athlete_records`
--

DROP TABLE IF EXISTS `athlete_records`;
/*!50001 DROP VIEW IF EXISTS `athlete_records`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `athlete_records` AS SELECT 
 1 AS `FName`,
 1 AS `LName`,
 1 AS `Country`,
 1 AS `Event Name`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `EventID` int(11) NOT NULL AUTO_INCREMENT,
  `EventType` varchar(25) NOT NULL,
  `Name` varchar(800) NOT NULL,
  `VenueID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  PRIMARY KEY (`EventID`),
  KEY `VenueID_idx` (`VenueID`),
  CONSTRAINT `VenueID` FOREIGN KEY (`VenueID`) REFERENCES `venue` (`VenueID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (12,'Aquatics','50m Freestyle (Men)',1,'2016-08-07','09:30:00'),(13,'Athletics','100m Freestyle (Men)',2,'2016-08-07','09:30:00'),(14,'Aquatics','100m backstroke (Men)',1,'2016-08-07','15:00:00'),(15,'Aquatics','100m butterfly (Women)',1,'2016-08-07','16:00:00'),(16,'Football','Football – German vs Brazil',1,'2016-08-07','10:00:00'),(17,'Skating','Skating - Men',1,'2016-08-10','09:30:00');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_coordinateby_event_coordinator`
--

DROP TABLE IF EXISTS `event_coordinateby_event_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_coordinateby_event_coordinator` (
  `event_EventID` int(11) NOT NULL,
  `event_coordinator_CoordinateID` int(11) NOT NULL,
  PRIMARY KEY (`event_EventID`,`event_coordinator_CoordinateID`),
  KEY `fk_event_has_event_coordinator_event_coordinator1_idx` (`event_coordinator_CoordinateID`),
  KEY `fk_event_has_event_coordinator_event1_idx` (`event_EventID`),
  CONSTRAINT `fk_event_has_event_coordinator_event1` FOREIGN KEY (`event_EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_event_coordinator_event_coordinator1` FOREIGN KEY (`event_coordinator_CoordinateID`) REFERENCES `event_coordinator` (`CoordinateID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_coordinateby_event_coordinator`
--

LOCK TABLES `event_coordinateby_event_coordinator` WRITE;
/*!40000 ALTER TABLE `event_coordinateby_event_coordinator` DISABLE KEYS */;
INSERT INTO `event_coordinateby_event_coordinator` VALUES (12,1),(12,2);
/*!40000 ALTER TABLE `event_coordinateby_event_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_coordinator`
--

DROP TABLE IF EXISTS `event_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_coordinator` (
  `CoordinateID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  PRIMARY KEY (`CoordinateID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_coordinator`
--

LOCK TABLES `event_coordinator` WRITE;
/*!40000 ALTER TABLE `event_coordinator` DISABLE KEYS */;
INSERT INTO `event_coordinator` VALUES (1,'Smith','Wilson'),(2,'Anna','Dewis');
/*!40000 ALTER TABLE `event_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_has_athlete`
--

DROP TABLE IF EXISTS `event_has_athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_has_athlete` (
  `event_EventID` int(11) NOT NULL,
  `athlete_AthleteID` int(11) NOT NULL,
  PRIMARY KEY (`event_EventID`,`athlete_AthleteID`),
  KEY `fk_event_has_athlete_athlete1_idx` (`athlete_AthleteID`),
  KEY `fk_event_has_athlete_event1_idx` (`event_EventID`),
  CONSTRAINT `fk_event_has_athlete_athlete1` FOREIGN KEY (`athlete_AthleteID`) REFERENCES `athlete` (`AthleteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_athlete_event1` FOREIGN KEY (`event_EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_has_athlete`
--

LOCK TABLES `event_has_athlete` WRITE;
/*!40000 ALTER TABLE `event_has_athlete` DISABLE KEYS */;
INSERT INTO `event_has_athlete` VALUES (12,1),(13,2),(14,3),(15,5),(16,4);
/*!40000 ALTER TABLE `event_has_athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `event_judges`
--

DROP TABLE IF EXISTS `event_judges`;
/*!50001 DROP VIEW IF EXISTS `event_judges`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `event_judges` AS SELECT 
 1 AS `FName`,
 1 AS `LName`,
 1 AS `Country`,
 1 AS `Specialty`,
 1 AS `Gender`,
 1 AS `Event Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `event_rateby_judge`
--

DROP TABLE IF EXISTS `event_rateby_judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_rateby_judge` (
  `event_EventID` int(11) NOT NULL,
  `judge_JudgeID` int(11) NOT NULL,
  PRIMARY KEY (`event_EventID`,`judge_JudgeID`),
  KEY `fk_event_has_judge_judge1_idx` (`judge_JudgeID`),
  KEY `fk_event_has_judge_event1_idx` (`event_EventID`),
  CONSTRAINT `fk_event_has_judge_event1` FOREIGN KEY (`event_EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_judge_judge1` FOREIGN KEY (`judge_JudgeID`) REFERENCES `judge` (`JudgeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_rateby_judge`
--

LOCK TABLES `event_rateby_judge` WRITE;
/*!40000 ALTER TABLE `event_rateby_judge` DISABLE KEYS */;
INSERT INTO `event_rateby_judge` VALUES (17,1),(17,2);
/*!40000 ALTER TABLE `event_rateby_judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `judge`
--

DROP TABLE IF EXISTS `judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `judge` (
  `JudgeID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(25) NOT NULL,
  `LName` varchar(25) NOT NULL,
  `Country` varchar(25) NOT NULL,
  `Specialty` varchar(100) NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  PRIMARY KEY (`JudgeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `judge`
--

LOCK TABLES `judge` WRITE;
/*!40000 ALTER TABLE `judge` DISABLE KEYS */;
INSERT INTO `judge` VALUES (1,'Ronald','Pfenning','Russia','Skating','Male'),(2,'Jiasheng ','Yang','China','Skating','Male');
/*!40000 ALTER TABLE `judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penalty` (
  `PenaltyID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(800) DEFAULT NULL,
  `SportID` int(11) NOT NULL,
  PRIMARY KEY (`PenaltyID`),
  KEY `SportID_idx` (`SportID`),
  CONSTRAINT `SportID` FOREIGN KEY (`SportID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penalty`
--

LOCK TABLES `penalty` WRITE;
/*!40000 ALTER TABLE `penalty` DISABLE KEYS */;
INSERT INTO `penalty` VALUES (1,'False Start penalty','one of the front seven moves before the ball is snapped',16),(2,'Offside penalty','a defender crosses the line of scrimmage ahead of the snap of the ball',16);
/*!40000 ALTER TABLE `penalty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `GameID` int(11) NOT NULL,
  `Description` varchar(800) NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `EventID_idx` (`GameID`),
  CONSTRAINT `GameID` FOREIGN KEY (`GameID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (3,14,'51.85 seconds'),(4,15,'55.48 seconds');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_setby_athlete`
--

DROP TABLE IF EXISTS `record_setby_athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_setby_athlete` (
  `record_RecordID` int(11) NOT NULL,
  `athlete_AthleteID` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`record_RecordID`,`athlete_AthleteID`),
  KEY `fk_record_has_athlete_athlete1_idx` (`athlete_AthleteID`),
  KEY `fk_record_has_athlete_record1_idx` (`record_RecordID`),
  CONSTRAINT `fk_record_has_athlete_athlete1` FOREIGN KEY (`athlete_AthleteID`) REFERENCES `athlete` (`AthleteID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_record_has_athlete_record1` FOREIGN KEY (`record_RecordID`) REFERENCES `record` (`RecordID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_setby_athlete`
--

LOCK TABLES `record_setby_athlete` WRITE;
/*!40000 ALTER TABLE `record_setby_athlete` DISABLE KEYS */;
INSERT INTO `record_setby_athlete` VALUES (3,3,'2016-08-12'),(4,5,'2016-08-13');
/*!40000 ALTER TABLE `record_setby_athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `Country` varchar(25) NOT NULL,
  `EventID` int(11) NOT NULL,
  `MedalType` enum('Gold','Silver','Bronze') NOT NULL,
  `Year` int(11) NOT NULL,
  `ResultID` int(11) NOT NULL,
  PRIMARY KEY (`EventID`,`Country`,`ResultID`),
  CONSTRAINT `EventID` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES ('France',12,'Silver',2016,2),('USA',12,'Gold',2016,1),('USA',12,'Bronze',2016,3),('Australia',13,'Gold',2016,4),('Belgium',13,'Silver',2016,5),('USA',13,'Bronze',2016,6);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `TeamID` int(11) NOT NULL AUTO_INCREMENT,
  `TeamName` varchar(100) NOT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Spain – Volly Ball (Men)'),(2,'Spain – NetBall'),(3,'German - Football');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `VenueID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) NOT NULL,
  PRIMARY KEY (`VenueID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Olympic Aquatics Stadium','Barra Olympic Park','Rio de Janeiro'),(2,'Maracanã Stadium','Maracanã','Rio de Janeiro'),(3,'Mané Garrincha National Stadium','SRPN - North Wing','Brasilia - Federal District');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'olympicsdb'
--

--
-- Final view structure for view `athlete_records`
--

/*!50001 DROP VIEW IF EXISTS `athlete_records`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `athlete_records` AS select `athlete`.`FName` AS `FName`,`athlete`.`LName` AS `LName`,`athlete`.`Country` AS `Country`,`event`.`Name` AS `Event Name`,`record`.`Description` AS `Description` from ((((`record` join `record_setby_athlete` on(`record`.`RecordID` = `record_setby_athlete`.`record_RecordID`)) join `athlete` on(`record_setby_athlete`.`athlete_AthleteID` = `athlete`.`AthleteID`)) join `event_has_athlete` on(`athlete`.`AthleteID` = `event_has_athlete`.`athlete_AthleteID`)) join `event` on(`event_has_athlete`.`event_EventID` = `event`.`EventID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `event_judges`
--

/*!50001 DROP VIEW IF EXISTS `event_judges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `event_judges` AS select `judge`.`FName` AS `FName`,`judge`.`LName` AS `LName`,`judge`.`Country` AS `Country`,`judge`.`Specialty` AS `Specialty`,`judge`.`Gender` AS `Gender`,`event`.`Name` AS `Event Name` from ((`judge` join `event_rateby_judge` on(`event_rateby_judge`.`judge_JudgeID` = `judge`.`JudgeID`)) join `event` on(`event_rateby_judge`.`event_EventID` = `event`.`EventID`)) */;
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

-- Dump completed on 2019-12-20 17:04:09
