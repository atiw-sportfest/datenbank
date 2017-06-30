--
-- Table structure for table `regel`
--

DROP TABLE IF EXISTS `regel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regel` (
  `RegelID` int(11) NOT NULL AUTO_INCREMENT,
  `DisziplinID` int(11) NOT NULL,
  `expr` varchar(2048) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegelID`),
  UNIQUE KEY `regel` (`DisziplinID`,`idx`),
  KEY `FKregel50152` (`DisziplinID`),
  CONSTRAINT `FKregel50152` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP PROCEDURE IF EXISTS BerechtigungAnzeigen;

DELIMITER ;;
CREATE PROCEDURE BerechtigungAnzeigen (
    in name varchar(100),
    in passwort varchar(255)
)
BEGIN
	SELECT BerechtigungsID FROM benutzer b WHERE name = b.Name AND passwort = b.Passwort;
END ;;

DELIMITER ;
