-- MySQL dump 10.13  Distrib 5.6.30, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sportfest
-- ------------------------------------------------------
-- Server version	5.6.30-1

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
-- Table structure for table `anmeldung`
--

DROP TABLE IF EXISTS `anmeldung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anmeldung` (
  `DisziplinID` int(11) NOT NULL,
  `SchülerID` int(11) NOT NULL,
  KEY `FKAnmeldung256515` (`DisziplinID`),
  KEY `FKAnmeldung976756` (`SchülerID`),
  CONSTRAINT `FKAnmeldung256515` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`),
  CONSTRAINT `FKAnmeldung976756` FOREIGN KEY (`SchülerID`) REFERENCES `schüler` (`SchülerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anmeldung`
--

LOCK TABLES `anmeldung` WRITE;
/*!40000 ALTER TABLE `anmeldung` DISABLE KEYS */;
/*!40000 ALTER TABLE `anmeldung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benutzer`
--

DROP TABLE IF EXISTS `benutzer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `benutzer` (
  `Name` varchar(100) NOT NULL,
  `Passwort` varchar(255) DEFAULT NULL,
  `BerechtigungsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benutzer`
--

LOCK TABLES `benutzer` WRITE;
/*!40000 ALTER TABLE `benutzer` DISABLE KEYS */;
INSERT INTO `benutzer` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',1),('ewald','63f205e15d34aafe2b7a931bddfe467e',1),('richter1','63f205e15d34aafe2b7a931bddfe467e',2),('richter2','63f205e15d34aafe2b7a931bddfe467e',2),('root','63f205e15d34aafe2b7a931bddfe467e',1);
/*!40000 ALTER TABLE `benutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bewertungseinheit`
--

DROP TABLE IF EXISTS `bewertungseinheit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bewertungseinheit` (
  `BewertungseinheitID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BewertungseinheitID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bewertungseinheit`
--

LOCK TABLES `bewertungseinheit` WRITE;
/*!40000 ALTER TABLE `bewertungseinheit` DISABLE KEYS */;
INSERT INTO `bewertungseinheit` VALUES (1,'cm'),(2,'Sek.'),(3,'Anz.');
/*!40000 ALTER TABLE `bewertungseinheit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disziplin`
--

DROP TABLE IF EXISTS `disziplin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disziplin` (
  `DisziplinID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Beschreibung` varchar(2048) DEFAULT NULL,
  `MindestAnzahl` int(3) DEFAULT NULL,
  `MaximalAnzahl` int(3) DEFAULT NULL,
  `aktiviert` int(1) DEFAULT NULL,
  `teamleistung` int(1) DEFAULT NULL,
  PRIMARY KEY (`DisziplinID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disziplin`
--

LOCK TABLES `disziplin` WRITE;
/*!40000 ALTER TABLE `disziplin` DISABLE KEYS */;
INSERT INTO `disziplin` VALUES (3,'2000m Lauf','Maximal  15  Starter  pro  Lauf. Die Damen starten in einem eigenen Lauf wenn mehr als 5 Starterinnen dabei sind.\n',3,3,1,1),(4,'4x100m Staffel','4  Läufer, Läuferinnen aus einer Klasse',4,4,1,1),(5,'Hochsprung','Es muss mit einem Bein abgesprungen werden ! Pro Höhe sind drei Versuche möglich. Es wird mindestens in 5 cm Schritten erhöht. Fällt die Latte in den ersten drei Sekunden nach dem Sprung nicht, gilt die Höhe als übersprungen.',3,3,1,0),(6,'Weitsprung','Sprung welcher so weit wi möglich sein sollte',5,5,1,0);
/*!40000 ALTER TABLE `disziplin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ergebnis`
--

DROP TABLE IF EXISTS `ergebnis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ergebnis` (
  `ErgebnisID` int(11) NOT NULL AUTO_INCREMENT,
  `DisziplinID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Beschreibung` varchar(2048) DEFAULT NULL,
  `Variablenname` varchar(100) DEFAULT NULL,
  `BewertungseinheitID` int(11) NOT NULL,
  PRIMARY KEY (`ErgebnisID`),
  KEY `FKErgebnis303121` (`DisziplinID`),
  KEY `FKErgebnis76351` (`BewertungseinheitID`),
  CONSTRAINT `FKErgebnis303121` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`),
  CONSTRAINT `FKErgebnis76351` FOREIGN KEY (`BewertungseinheitID`) REFERENCES `bewertungseinheit` (`BewertungseinheitID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ergebnis`
--

LOCK TABLES `ergebnis` WRITE;
/*!40000 ALTER TABLE `ergebnis` DISABLE KEYS */;
INSERT INTO `ergebnis` VALUES (1,3,'sprung','weite des Sprungs','cm',1);
/*!40000 ALTER TABLE `ergebnis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geschlecht`
--

DROP TABLE IF EXISTS `geschlecht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geschlecht` (
  `GeschlechtsID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`GeschlechtsID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geschlecht`
--

LOCK TABLES `geschlecht` WRITE;
/*!40000 ALTER TABLE `geschlecht` DISABLE KEYS */;
INSERT INTO `geschlecht` VALUES (1,'männlich'),(2,'weiblich'),(3,'beides');
/*!40000 ALTER TABLE `geschlecht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klasse` (
  `KlassenID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`KlassenID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES (1,'fs1501');
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leistung`
--

DROP TABLE IF EXISTS `leistung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leistung` (
  `LeistungID` int(11) NOT NULL AUTO_INCREMENT,
  `DisziplinID` int(11) NOT NULL,
  `ErgebnisID` int(11) NOT NULL,
  `KlassenID` int(11) NOT NULL,
  `SchülerID` int(11) NOT NULL,
  `Zeitpunkt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LeistungID`),
  KEY `FKLeistung447192` (`DisziplinID`),
  KEY `FKLeistung43106` (`KlassenID`),
  KEY `FKLeistung786079` (`SchülerID`),
  CONSTRAINT `FKLeistung43106` FOREIGN KEY (`KlassenID`) REFERENCES `klasse` (`KlassenID`),
  CONSTRAINT `FKLeistung447192` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`),
  CONSTRAINT `FKLeistung786079` FOREIGN KEY (`SchülerID`) REFERENCES `schüler` (`SchülerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leistung`
--

LOCK TABLES `leistung` WRITE;
/*!40000 ALTER TABLE `leistung` DISABLE KEYS */;
/*!40000 ALTER TABLE `leistung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leistungsergebnis`
--

DROP TABLE IF EXISTS `leistungsergebnis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leistungsergebnis` (
  `ErgebnisID` int(11) NOT NULL,
  `LeistungID` int(11) NOT NULL,
  `Wert` int(11) DEFAULT NULL,
  PRIMARY KEY (`ErgebnisID`,`LeistungID`),
  KEY `FKLeistungse932193` (`LeistungID`),
  KEY `FKLeistungse201545` (`ErgebnisID`),
  CONSTRAINT `FKLeistungse201545` FOREIGN KEY (`ErgebnisID`) REFERENCES `ergebnis` (`ErgebnisID`),
  CONSTRAINT `FKLeistungse932193` FOREIGN KEY (`LeistungID`) REFERENCES `leistung` (`LeistungID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leistungsergebnis`
--

LOCK TABLES `leistungsergebnis` WRITE;
/*!40000 ALTER TABLE `leistungsergebnis` DISABLE KEYS */;
/*!40000 ALTER TABLE `leistungsergebnis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regel`
--

DROP TABLE IF EXISTS `regel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regel` (
  `RegelID` int(11) NOT NULL AUTO_INCREMENT,
  `expr` varchar(2048) DEFAULT NULL,
  `DisziplinID` int(11) NOT NULL,
  `idx` int(11) NOT NULL,
  `punkte` int(11) NOT NULL,
  PRIMARY KEY (`RegelID`),
  UNIQUE KEY `unique_idx` (`DisziplinID`,`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regel`
--

LOCK TABLES `regel` WRITE;
/*!40000 ALTER TABLE `regel` DISABLE KEYS */;
INSERT INTO `regel` VALUES (1,'test',2,1),(2,'test3',3,1),(3,'test2',2,2),(4,'test1',2,3),(5,'test3',2,4);
/*!40000 ALTER TABLE `regel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schüler`
--

DROP TABLE IF EXISTS `schüler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schüler` (
  `SchülerID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `KlassenID` int(11) NOT NULL,
  `GeschlechtsID` int(11) NOT NULL,
  PRIMARY KEY (`SchülerID`),
  KEY `FKSchüler920130` (`GeschlechtsID`),
  KEY `FKSchüler614103` (`KlassenID`),
  CONSTRAINT `FKSchüler614103` FOREIGN KEY (`KlassenID`) REFERENCES `klasse` (`KlassenID`),
  CONSTRAINT `FKSchüler920130` FOREIGN KEY (`GeschlechtsID`) REFERENCES `geschlecht` (`GeschlechtsID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schüler`
--

LOCK TABLES `schüler` WRITE;
/*!40000 ALTER TABLE `schüler` DISABLE KEYS */;
INSERT INTO `schüler` VALUES (2,'David','Pauli',1,1);
/*!40000 ALTER TABLE `schüler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zustand`
--

DROP TABLE IF EXISTS `zustand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zustand` (
  `ZustandsID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ZustandsID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zustand`
--

LOCK TABLES `zustand` WRITE;
/*!40000 ALTER TABLE `zustand` DISABLE KEYS */;
INSERT INTO `zustand` VALUES (1,'Gewonnen'),(2,'Verloren'),(3,'Teilgenommen'),(4,'Unentschieden');
/*!40000 ALTER TABLE `zustand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sportfest'
--
/*!50003 DROP PROCEDURE IF EXISTS `BewertungseinheitAendern` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `BewertungseinheitAendern`(bid int, inName varchar(255))
BEGIN
	update bewertungseinheit set Name = inName where BewertungseinheitID=bid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BewertungseinheitAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `BewertungseinheitAnlegen`(inName varchar(255))
BEGIN
	insert into bewertungseinheit(Name)
    values(inName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BewertungseinheitAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `BewertungseinheitAnzeigen`(in bid int)
BEGIN
	SELECT * FROM bewertungseinheit where BewertungseinheitID = bid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BewertungseinheitenAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `BewertungseinheitenAnzeigen`()
BEGIN
	SELECT * FROM bewertungseinheit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BewertungseinheitLoeschen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `BewertungseinheitLoeschen`(bid int)
BEGIN
	delete from bewertungseinheit where BewertungseinheitID = bid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `datenbankZuruecksetzen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `datenbankZuruecksetzen`()
BEGIN
	SET foreign_key_checks = 0;
    drop table if exists Regel;
	drop table if exists Anmeldung;
	drop table if exists Klasse;
	drop table if exists Schüler;
	drop table if exists Ergebnis;
	drop table if exists Bewertungseinheit;
	drop table if exists Zustand;
	drop table if exists Geschlecht;    
	drop table if exists Leistungsergebnis;
	drop table if exists Disziplin;
	drop table if exists Leistung;
    SET foreign_key_checks = 1;

	create table Leistung (LeistungID int(11) not null auto_increment, DisziplinID int(11) not null, ErgebnisID int(11) not null, KlassenID int(11) not null, SchülerID int(11) not null, Zeitpunkt timestamp null, primary key (LeistungID));
	create table Disziplin (DisziplinID int(11) not null auto_increment, Name varchar(100), Beschreibung varchar(2048), MindestAnzahl int(3), MaximalAnzahl int(3), aktiviert int(1), teamleistung int(1), primary key (DisziplinID));
	create table Leistungsergebnis (ErgebnisID int(11) not null, LeistungID int(11) not null, Wert int(11), primary key (ErgebnisID, LeistungID));
	create table Geschlecht (GeschlechtsID int(11) not null auto_increment, Name varchar(25), primary key (GeschlechtsID));
	create table Zustand (ZustandsID int(11) not null auto_increment, Name varchar(100), primary key (ZustandsID));
	create table Bewertungseinheit (BewertungseinheitID int(11) not null auto_increment, Name varchar(100), primary key (BewertungseinheitID));
	create table Ergebnis (ErgebnisID int(11) not null auto_increment, DisziplinID int(11) not null, Name varchar(100), Beschreibung varchar(2048), Variablenname varchar(100), BewertungseinheitID int(11) not null, primary key (ErgebnisID));
	create table Schüler (SchülerID int(11) not null auto_increment, Vorname varchar(50), Nachname varchar(50), KlassenID int(11) not null, GeschlechtsID int(11) not null, primary key (SchülerID));
	create table Klasse (KlassenID int(11) not null auto_increment, Name varchar(10), primary key (KlassenID));
	create table Anmeldung (DisziplinID int(11) not null, SchülerID int(11) not null);
	CREATE TABLE Regel (RegelID int(11) NOT NULL AUTO_INCREMENT, expr varchar(2048), DisziplinID int(11) NOT NULL, PRIMARY KEY (RegelID));
    
    alter table Leistung add index FKLeistung447192 (DisziplinID), add constraint FKLeistung447192 foreign key (DisziplinID) references Disziplin (DisziplinID);
	alter table Ergebnis add index FKErgebnis303121 (DisziplinID), add constraint FKErgebnis303121 foreign key (DisziplinID) references Disziplin (DisziplinID);
	alter table Leistungsergebnis add index FKLeistungse932193 (LeistungID), add constraint FKLeistungse932193 foreign key (LeistungID) references Leistung (LeistungID);
	alter table Leistungsergebnis add index FKLeistungse201545 (ErgebnisID), add constraint FKLeistungse201545 foreign key (ErgebnisID) references Ergebnis (ErgebnisID);
	alter table Schüler add index FKSchüler920130 (GeschlechtsID), add constraint FKSchüler920130 foreign key (GeschlechtsID) references Geschlecht (GeschlechtsID);
	alter table Schüler add index FKSchüler614103 (KlassenID), add constraint FKSchüler614103 foreign key (KlassenID) references Klasse (KlassenID);
	alter table Anmeldung add index FKAnmeldung256515 (DisziplinID), add constraint FKAnmeldung256515 foreign key (DisziplinID) references Disziplin (DisziplinID);
	alter table Anmeldung add index FKAnmeldung976756 (SchülerID), add constraint FKAnmeldung976756 foreign key (SchülerID) references Schüler (SchülerID);
	alter table Leistung add index FKLeistung43106 (KlassenID), add constraint FKLeistung43106 foreign key (KlassenID) references Klasse (KlassenID);
	alter table Leistung add index FKLeistung786079 (SchülerID), add constraint FKLeistung786079 foreign key (SchülerID) references Schüler (SchülerID);
	alter table Ergebnis add index FKErgebnis76351 (BewertungseinheitID), add constraint FKErgebnis76351 foreign key (BewertungseinheitID) references Bewertungseinheit (BewertungseinheitID);

	INSERT INTO Geschlecht VALUES (1, 'männlich');
	INSERT INTO Geschlecht VALUES (2, 'weiblich');
	INSERT INTO Geschlecht VALUES (3, 'beides');

	INSERT INTO Zustand VALUES(1, 'Gewonnen');
	INSERT INTO Zustand VALUES(2, 'Verloren');
	INSERT INTO Zustand VALUES(3, 'Teilgenommen');
	INSERT INTO Zustand VALUES(4, 'Unentschieden');

	INSERT INTO Bewertungseinheit VALUES(1, 'cm');
	INSERT INTO Bewertungseinheit VALUES(2, 'Sek.');
	INSERT INTO Bewertungseinheit VALUES(3, 'Anz.');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisziplinAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `DisziplinAnlegen`( inName varchar(255),
 inBeschreibung varchar(255),
 inminTeilnehmer int,
 inmaxTeilnehmer int,
 inTeamleistung int,
 inaktiviert bool
)
BEGIN
	insert into disziplin (Name, beschreibung, mindestanzahl,maximalanzahl,teamleistung,aktiviert) 
    values (inName,inBeschreibung,inminTeilnehmer,inmaxTeilnehmer,inTeamleistung,inaktiviert);
        select last_insert_id();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisziplinAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `DisziplinAnzeigen`(
in id int)
BEGIN
Select * from disziplin where disziplinid=id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisziplinBearbeiten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `DisziplinBearbeiten`(
did int,
inName varchar(255),
 inBeschreibung varchar(255),
 inminTeilnehmer int,
 inmaxTeilnehmer int,
 inTeamleistung int,
 inaktiviert bool)
BEGIN
	update disziplin set Name=inName, beschreibung= inBeschreibung,
    mindestanzahl=inminTeilnehmer,maximalanzahl=inmaxTeilnehmer
    ,teamleistung=inTeamleistung, aktiviert= inaktiviert where disziplinid =did;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisziplinenAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `DisziplinenAnzeigen`()
BEGIN
	SELECT * FROM disziplin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DisziplinLoeschen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `DisziplinLoeschen`(did int)
BEGIN
	delete from disziplin where DisziplinID= did;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ErgebnisAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `ErgebnisAnlegen`(
indid int,
inname varchar(255),
inbeschreibung  varchar(255),
invariablenname  varchar(255),
bid int
)
BEGIN	
	insert into ergebnis (disziplinid,name,beschreibung,variablenname,bewertungseinheitid)
    values(indid,inname,inbeschreibung,invariablenname, bid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ErgebnisseAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `ErgebnisseAnzeigen`()
BEGIN
select * from ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GeschlechtAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `GeschlechtAnzeigen`(in gid int)
BEGIN
	SELECT * FROM geschlecht where GeschlechtsID = gid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GeschlechterAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `GeschlechterAnzeigen`()
BEGIN
	SELECT * FROM geschlecht;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gibBerechtigung` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `gibBerechtigung`(in name varchar(100), in passwort varchar(255))
BEGIN
	SELECT BerechtigungsID FROM benutzer b WHERE name = b.Name AND passwort = b.Passwort;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `KlasseAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `KlasseAnlegen`(
inname varchar(255))
BEGIN
		insert into  klasse (name) values (inname);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Klasseanzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `Klasseanzeigen`(kid int)
BEGIN
	select * from klasse where klassenID= kid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `KlasseBearbeiten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `KlasseBearbeiten`(inkid int,
inname varchar(255))
BEGIN
	update klasse set name= inname where klassenid=inkid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Klasseloeschen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `Klasseloeschen`(kid int)
BEGIN
	delete from klasse where klassenid=kid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `KlassenAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `KlassenAnzeigen`()
BEGIN
	select * from klasse;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeistungSchulerAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `LeistungSchulerAnlegen`(
did int,
eid int,
sid int,
inzeitpunkt timestamp
)
BEGIN
	insert into leisting (disziplinid,ergebnisid,schülerid,zeitpunkt) values(did,eid,sid,inzeitpunkt);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeistungsergebnisAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `LeistungsergebnisAnlegen`(eid int, lid int, wert int)
BEGIN
	insert into leistungsergebnis(ErgebnisID, LeistungID, Wert)
    values(eid, lid, wert);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeistungsergebnisAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `LeistungsergebnisAnzeigen`(eid int, lid int)
BEGIN
	Select * from leistungsergebnis where ErgebnisID=eid AND LeistungID = lid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeistungsergebnisseAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `LeistungsergebnisseAnzeigen`()
BEGIN
	Select * from leistungsergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Regel1EinerDisziplinAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `Regel1EinerDisziplinAnzeigen`(did int)
BEGIN
select * from regel where disziplinid=did order by disziplinid, idx limit 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegelAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `RegelAnlegen`(
inexpr varchar(255),
indid int,
inidx int
)
BEGIN
	insert regel (expr,Disziplinid,idx) values(inexpr,indid,idx);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegelAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `RegelAnzeigen`(rid int)
BEGIN
Select * from Regel where regelid=rid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegelEinerDisziplinAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `RegelEinerDisziplinAnzeigen`(did int)
BEGIN
select * from regel where disziplinid=did order by disziplinid, idx;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegelLoeschen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `RegelLoeschen`(rid int)
BEGIN
	delete from regel where regelid=rid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegelnAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `RegelnAnzeigen`()
BEGIN
Select * from regel order by disziplinid, idx;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegelnEinerDisziplinAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `RegelnEinerDisziplinAnzeigen`(did int)
BEGIN
select * from regel where disziplinid=did order by disziplinid, idx DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SchuelerAnlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `SchuelerAnlegen`(vorname varchar(50), nachname varchar(50), klassenid int(10), geschlechtsid int(10) )
BEGIN
INSERT INTO schüler(vorname, nachname, klassenid, geschlechtsid) VALUEs(vorname, nachname, klassenid, geschlechtsid);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SchuelerAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `SchuelerAnzeigen`(sid int)
BEGIN
		select * from schüler where schülerid= sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SchuelerEinerDisziplinUndKlasseAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `SchuelerEinerDisziplinUndKlasseAnzeigen`(kid int, did int)
BEGIN

SELECT * FROM schüler s, leistung l
WHERE l.KlassenID = kid AND l. disziplinID = did  AND s.SchülerID = l.SchülerID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SchuelerLoeschen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `SchuelerLoeschen`(sid int)
BEGIN
	delete from schüler where schülerid = sid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SchuelerPAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `SchuelerPAnzeigen`()
BEGIN
	select * from schüler;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ZustaendeAnzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `ZustaendeAnzeigen`()
BEGIN
select * from zustand;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Zustandanlegen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `Zustandanlegen`(inname varchar(255))
BEGIN
	insert into zustand (name) values(inname);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zustandanzeigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `zustandanzeigen`(zid int)
BEGIN
	select * from zustand where zustandsid= zid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Zustandloeschen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`fs151`@`%` PROCEDURE `Zustandloeschen`(zid int)
BEGIN
delete from zustand where zustandsid=zid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27  1:16:00
