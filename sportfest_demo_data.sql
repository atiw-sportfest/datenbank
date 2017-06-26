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
-- Dumping data for table `anmeldung`
--

LOCK TABLES `anmeldung` WRITE;
/*!40000 ALTER TABLE `anmeldung` DISABLE KEYS */;
/*!40000 ALTER TABLE `anmeldung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `benutzer`
--

LOCK TABLES `benutzer` WRITE;
/*!40000 ALTER TABLE `benutzer` DISABLE KEYS */;
INSERT INTO `benutzer` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',1),('ewald','63f205e15d34aafe2b7a931bddfe467e',1),('richter1','63f205e15d34aafe2b7a931bddfe467e',2),('richter2','63f205e15d34aafe2b7a931bddfe467e',2),('root','63f205e15d34aafe2b7a931bddfe467e',1),('test','098f6bcd4621d373cade4e832627b4f6',1);
/*!40000 ALTER TABLE `benutzer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bewertungseinheit`
--

LOCK TABLES `bewertungseinheit` WRITE;
/*!40000 ALTER TABLE `bewertungseinheit` DISABLE KEYS */;
INSERT INTO `bewertungseinheit` VALUES (1,'cm'),(2,'Sek.'),(3,'Anz.');
/*!40000 ALTER TABLE `bewertungseinheit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `disziplin`
--

LOCK TABLES `disziplin` WRITE;
/*!40000 ALTER TABLE `disziplin` DISABLE KEYS */;
INSERT INTO `disziplin` VALUES (3,'2000m Lauf','Maximal  15  Starter  pro  Lauf. Die Damen starten in einem eigenen Lauf wenn mehr als 5 Starterinnen dabei sind.\n',3,3,1,1),(4,'4x100m Staffel','4  Läufer, Läuferinnen aus einer Klasse',4,4,1,1),(5,'Hochsprung','Es muss mit einem Bein abgesprungen werden ! Pro Höhe sind drei Versuche möglich. Es wird mindestens in 5 cm Schritten erhöht. Fällt die Latte in den ersten drei Sekunden nach dem Sprung nicht, gilt die Höhe als übersprungen.',3,3,1,0),(6,'Weitsprung','Sprung welcher so weit wie möglich sein sollte',5,5,1,0);
/*!40000 ALTER TABLE `disziplin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ergebnis`
--

LOCK TABLES `ergebnis` WRITE;
/*!40000 ALTER TABLE `ergebnis` DISABLE KEYS */;
INSERT INTO `ergebnis` VALUES (1,3,'sprung','weite des Sprungs','cm',1);
/*!40000 ALTER TABLE `ergebnis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `geschlecht`
--

LOCK TABLES `geschlecht` WRITE;
/*!40000 ALTER TABLE `geschlecht` DISABLE KEYS */;
INSERT INTO `geschlecht` VALUES (1,'männlich'),(2,'weiblich'),(3,'beides');
/*!40000 ALTER TABLE `geschlecht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `klasse`
--

LOCK TABLES `klasse` WRITE;
/*!40000 ALTER TABLE `klasse` DISABLE KEYS */;
INSERT INTO `klasse` VALUES (1,'fs1501');
/*!40000 ALTER TABLE `klasse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `leistung`
--

LOCK TABLES `leistung` WRITE;
/*!40000 ALTER TABLE `leistung` DISABLE KEYS */;
/*!40000 ALTER TABLE `leistung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `leistungsergebnis`
--

LOCK TABLES `leistungsergebnis` WRITE;
/*!40000 ALTER TABLE `leistungsergebnis` DISABLE KEYS */;
/*!40000 ALTER TABLE `leistungsergebnis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `regel`
--

LOCK TABLES `regel` WRITE;
/*!40000 ALTER TABLE `regel` DISABLE KEYS */;
INSERT INTO `regel` VALUES (1,'test',2,1,0),(2,'test3',3,1,0),(3,'test2',2,2,0),(4,'test1',2,3,0),(5,'test3',2,4,0),(7,'geschlecht == \"m\" && weite >= 2.4',6,0,10),(8,'geschlecht == \"m\" && weite >= 1.2',6,1,5),(9,'geschlecht == \"m\" && weite >= 0.6',6,2,2),(10,'geschlecht == \"m\" && weite >= 0.3',6,3,1),(11,'geschlecht == \"w\" && weite >= 1.2',6,4,10),(12,'geschlecht == \"w\" && weite >= 0.6',6,5,5),(13,'geschlecht == \"w\" && weite >= 0.3',6,6,2),(14,'geschlecht == \"w\" && weite >= 0.15',6,7,1);
/*!40000 ALTER TABLE `regel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `schüler`
--

LOCK TABLES `schüler` WRITE;
/*!40000 ALTER TABLE `schüler` DISABLE KEYS */;
INSERT INTO `schüler` VALUES (2,'David','Pauli',1,1);
/*!40000 ALTER TABLE `schüler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `zustand`
--

LOCK TABLES `zustand` WRITE;
/*!40000 ALTER TABLE `zustand` DISABLE KEYS */;
INSERT INTO `zustand` VALUES (1,'Gewonnen'),(2,'Verloren'),(3,'Teilgenommen'),(4,'Unentschieden');
/*!40000 ALTER TABLE `zustand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27  1:19:22
