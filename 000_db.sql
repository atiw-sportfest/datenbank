--
-- Table structure for table `anmeldung`
--

DROP TABLE IF EXISTS `anmeldung`;
CREATE TABLE `anmeldung` (
  `DisziplinID` int(11) NOT NULL,
  `SchuelerID` int(11) NOT NULL,
  KEY `FKanmeldung224868` (`DisziplinID`),
  KEY `FKanmeldung496997` (`SchuelerID`),
  CONSTRAINT `FKanmeldung224868` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKanmeldung496997` FOREIGN KEY (`SchuelerID`) REFERENCES `schueler` (`SchuelerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `benutzer`
--

DROP TABLE IF EXISTS `benutzer`;
CREATE TABLE `benutzer` (
  `Name` varchar(100) NOT NULL,
  `Passwort` varchar(255) DEFAULT NULL,
  `BerechtigungsID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `disziplin`
--

DROP TABLE IF EXISTS `disziplin`;
CREATE TABLE `disziplin` (
  `DisziplinID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Beschreibung` varchar(2048) DEFAULT NULL,
  `MindestAnzahl` int(3) DEFAULT NULL,
  `MaximalAnzahl` int(3) DEFAULT NULL,
  `aktiviert` int(1) DEFAULT NULL,
  `teamleistung` int(1) DEFAULT NULL,
  `KontrahentenAnzahl` int(11) DEFAULT NULL,
  PRIMARY KEY (`DisziplinID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `ergebnis`
--

DROP TABLE IF EXISTS `ergebnis`;
CREATE TABLE `ergebnis` (
  `LeistungID` int(11) NOT NULL,
  `Wert` varchar(256) DEFAULT NULL,
  `var_id` int(11) NOT NULL,
  PRIMARY KEY (`LeistungID`,`var_id`),
  KEY `FKergebnis239955` (`LeistungID`),
  KEY `FKergebnis402622` (`var_id`),
  CONSTRAINT `FKergebnis239955` FOREIGN KEY (`LeistungID`) REFERENCES `leistung` (`LeistungID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKergebnis402622` FOREIGN KEY (`var_id`) REFERENCES `variable` (`var_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `geschlecht`
--

DROP TABLE IF EXISTS `geschlecht`;
CREATE TABLE `geschlecht` (
  `GeschlechtsID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`GeschlechtsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `klasse`
--

DROP TABLE IF EXISTS `klasse`;
CREATE TABLE `klasse` (
  `KlassenID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`KlassenID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `leistung`
--

DROP TABLE IF EXISTS `leistung`;
CREATE TABLE `leistung` (
  `LeistungID` int(11) NOT NULL AUTO_INCREMENT,
  `DisziplinID` int(11) NOT NULL,
  `KlassenID` int(11) NOT NULL,
  `SchuelerID` int(11) DEFAULT NULL,
  `Zeitpunkt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LeistungID`),
  KEY `FKleistung910233` (`DisziplinID`),
  KEY `FKleistung532661` (`KlassenID`),
  KEY `FKleistung632099` (`SchuelerID`),
  CONSTRAINT `FKleistung532661` FOREIGN KEY (`KlassenID`) REFERENCES `klasse` (`KlassenID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKleistung632099` FOREIGN KEY (`SchuelerID`) REFERENCES `schueler` (`SchuelerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKleistung910233` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `regel`
--

DROP TABLE IF EXISTS `regel`;
CREATE TABLE `regel` (
  `RegelID` int(11) NOT NULL AUTO_INCREMENT,
  `DisziplinID` int(11) NOT NULL,
  `expr` varchar(2048) DEFAULT NULL,
  `idx` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegelID`),
  UNIQUE KEY `regel` (`idx`),
  KEY `FKregel50152` (`DisziplinID`),
  CONSTRAINT `FKregel50152` FOREIGN KEY (`DisziplinID`) REFERENCES `disziplin` (`DisziplinID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `schueler`
--

DROP TABLE IF EXISTS `schueler`;
CREATE TABLE `schueler` (
  `SchuelerID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(50) DEFAULT NULL,
  `Nachname` varchar(50) DEFAULT NULL,
  `KlassenID` int(11) NOT NULL,
  `GeschlechtsID` int(11) NOT NULL,
  PRIMARY KEY (`SchuelerID`),
  KEY `FKschueler944621` (`KlassenID`),
  KEY `FKschueler10993` (`GeschlechtsID`),
  CONSTRAINT `FKschueler10993` FOREIGN KEY (`GeschlechtsID`) REFERENCES `geschlecht` (`GeschlechtsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKschueler944621` FOREIGN KEY (`KlassenID`) REFERENCES `klasse` (`KlassenID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `typ`
--

DROP TABLE IF EXISTS `typ`;
CREATE TABLE `typ` (
  `typ_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_name` tinytext NOT NULL,
  `typ_descr` text,
  `typ_typ` tinytext NOT NULL,
  PRIMARY KEY (`typ_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `typzustand`
--

DROP TABLE IF EXISTS `typzustand`;
CREATE TABLE `typzustand` (
  `zid` int(11) NOT NULL AUTO_INCREMENT,
  `typ_id` int(11) DEFAULT NULL,
  `tzst_name` tinytext NOT NULL,
  `tzst_descr` text,
  `tzst_val` varchar(32) NOT NULL,
  PRIMARY KEY (`zid`),
  UNIQUE KEY `uq_typzustand_val` (`typ_id`,`tzst_val`),
  KEY `FKtypzustand993740` (`typ_id`),
  CONSTRAINT `FKtypzustand993740` FOREIGN KEY (`typ_id`) REFERENCES `typ` (`typ_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
CREATE TABLE `variable` (
  `var_id` int(11) NOT NULL AUTO_INCREMENT,
  `var_name` tinytext NOT NULL,
  `var_descr` text,
  `var_exprParam` tinytext NOT NULL,
  `typ_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`var_id`),
  KEY `FKvariable880404` (`typ_id`),
  CONSTRAINT `FKvariable880404` FOREIGN KEY (`typ_id`) REFERENCES `typ` (`typ_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping routines for database 'sportfest'
--

DELIMITER ;;

CREATE PROCEDURE `AnmeldungAnlegen`(
sid int,
did int
)
BEGIN
call Anmeldungloeschen(did,sid);
INSERT INTO `sportfest`.`anmeldung`
(`DisziplinID`,
`SchuelerID`)
VALUES
(did,
sid);
END ;;
CREATE PROCEDURE `AnmeldungenAnzeigen`()
BEGIN
Select* from Anmeldung;

END ;;
CREATE PROCEDURE `AnmeldungenEinerDisziplinAnzeigen`(
did int)
BEGIN
select * from anmeldung where disziplinid=did;
END ;;
CREATE PROCEDURE `AnmeldungLoeschen`(
did int,
sid int
)
BEGIN
delete from anmeldung where disziplinid=did and schuelerid=sid;
END ;;
CREATE PROCEDURE `BenutzerAendern`(
inname varchar(255),
inpasswort varchar(255),
inBerechtigungID int
)
BEGIN
update benutzer set 
passwort= inpasswort, berechtigungsid= inBerechtigungID where 
name =inname;
END ;;
CREATE PROCEDURE `BenutzerAnlegen`(
inname varchar(255),
inpasswort varchar(255),
inBerechtigungID int
)
BEGIN
insert into benutzer (name,passwort,berechtigungsid) values
(inname,inpasswort,inBerechtigungID);
END ;;
CREATE PROCEDURE `BenutzerAnzeigen`()
BEGIN
select * from benutzer;
END ;;
CREATE PROCEDURE `BenutzerDatenExistieren`(
inname varchar(255),
inpasswort varchar(255))
BEGIN
	select count(*) from benutzer where name=inname and passwort=inpasswort;
END ;;
CREATE PROCEDURE `BenutzerLoeschen`(
delname varchar(255))
BEGIN
delete from benutzer where name=delname;
END ;;
CREATE PROCEDURE `BenutzerPasswortAendern`(
inname varchar(255),
inpasswort varchar(255)
)
BEGIN
update benutzer set 
passwort= inpasswort where 
name =inname;
END ;;
CREATE PROCEDURE `BerechtigungAnzeigen`(in name varchar(100), in passwort varchar(255))
BEGIN
	SELECT BerechtigungsID FROM benutzer b WHERE name = b.Name AND passwort = b.Passwort;
END ;;
CREATE PROCEDURE `DisziplinAendern`(
did int,
inName varchar(255),
 inBeschreibung varchar(255),
 inminTeilnehmer int,
 inmaxTeilnehmer int,
 inTeamleistung int,
 inaktiviert bool,
 inKontrahentenAnzahl int)
BEGIN
	update disziplin set Name=inName, beschreibung= inBeschreibung,
    mindestanzahl=inminTeilnehmer,maximalanzahl=inmaxTeilnehmer
    ,teamleistung=inTeamleistung, aktiviert= inaktiviert, KontrahentenAnzahl=inKontrahentenAnzahl where disziplinid =did;
END ;;
CREATE PROCEDURE `DisziplinAnlegen`( inName varchar(255),
 inBeschreibung varchar(255),
 inminTeilnehmer int,
 inmaxTeilnehmer int,
 inTeamleistung int,
 inaktiviert bool,
 inKontrahentenAnzahl int
)
BEGIN
	insert into disziplin (Name, beschreibung, mindestanzahl,maximalanzahl,teamleistung,aktiviert, KontrahentenAnzahl) 
    values (inName,inBeschreibung,inminTeilnehmer,inmaxTeilnehmer,inTeamleistung,inaktiviert,inKontrahentenAnzahl);
        select last_insert_id();
END ;;
CREATE PROCEDURE `DisziplinAnzeigen`(
in id int)
BEGIN
Select * from disziplin where disziplinid=id;
END ;;
CREATE PROCEDURE `DisziplinAnzeigen2`(
in id int)
BEGIN
Select * from disziplin where disziplinid=id;
END ;;
CREATE PROCEDURE `DisziplinBearbeiten`(
did int,
inName varchar(255),
 inBeschreibung varchar(255),
 inminTeilnehmer int,
 inmaxTeilnehmer int,
 inTeamleistung int,
 inaktiviert bool,
 inKontrahentenAnzahl int)
BEGIN
	update disziplin set Name=inName, beschreibung= inBeschreibung,
    mindestanzahl=inminTeilnehmer,maximalanzahl=inmaxTeilnehmer
    ,teamleistung=inTeamleistung, aktiviert= inaktiviert, KontrahentenAnzahl=inKontrahentenAnzahl where disziplinid =did;
END ;;
CREATE PROCEDURE `Disziplinen2017`()
BEGIN

	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("4x100m Staffellauf",
		"4  Läufer, Läuferinnen aus einer Klasse. Es muss in den Bahnen gelaufen werden! Falls es 2 reine Damenstaffeln gibt, starten diese in einem Lauf gegeneinander. ( mit eigener Wertung )",
		4,
		4,
		true,
		true,
        4);
        
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("2000m Lauf",
		"3  Starter pro Klasse sind möglich! Maximal  15  Starter  pro  Lauf. Die Damen starten in einem eigenen Lauf wenn mehr als 5 Starterinnen dabei sind. ",
		1,
		3,
		true,
		false,
        1);
        
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Baseball",
		"Zielen ist gut, Treffen ist besser ! 5  Kandidaten pro Klasse sind möglich Wer konzentriert sich am besten und wer hat das richtige Timing für die Hits ?",
		1,
		5,
		true,
		false,
        1);
        
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Basketball",
		"Konzentrations - Check am  Basketballkorb. 5  Kandidaten pro Klasse sind möglich. Wer ist der Treffer - König 10  Freiwürfe",
		1,
		5,
		true,
		false,
        1);
	
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Beach-Volleyball",
		"3  gegen  3 Panieren und Punkten! Gegen Teams aus zwei anderen Klassen wird jeweils 12 Minuten gespielt.Je nach Zeit laufen die 2. Spiele bis 21 Punkte. (bei 21 : 20 ist Schluss !)",
		3,
		3,
		true,
		true,
        2);
        
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)    VALUES
		("Frisbee",
		"Zielen   -   Tor  -  Tor  -  Tor  ! 5  Kandidaten pro Klasse sind möglich Wer konzentriert sich  am besten und wer hat das richtige Händchen und Gespür für den Wind ? Nach dem Einwerfen - 10 Scheiben in Folge",
		1,
		5,
		true,
		false,
        1);
        
 	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Fußball",
		"Kunstrasen  5  gegen  5 (incl. Torwart) Es gelten die Feldlinien ! Von der Seitenlinie wird der Ball eingerollt ! Aus der Hand rollt der Torwart den Ball ins Spiel ! Kein Rückpass in die Hand des Torwarts ! Ein Torschuß ist von überall möglich ! Gegen Teams aus zwei anderen Klassen wird jeweils  zweimal  10 Min. gespielt.",
		5,
		5,
		true,
		true,
        2);
        
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Hochsprung",
		"Es muss mit einem Bein abgesprungen werden ! Pro Höhe sind drei Versuche möglich. Es wird mindestens in 5 cm Schritten erhöht. Fällt die Latte in den ersten drei Sekunden nach dem Sprung nicht, gilt die Höhe als übersprungen.",
		1,
		3,
		true,
		false,
        1);

	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Hockey",
		"Floorball  Kunstrasen   4  gegen  4 Schlägertypen sind unerwünscht ! ( Bitte Regelblatt beachten! ) Gegen zwei Gegner aus anderen Klassen wird jeweils 12 Min. gespielt.",
		4,
		4,
		true,
		true,
        2);
   
 	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
   VALUES
		("Kistenstapeln",
		"( Achtung  :  Regelblatt ) 5  Kandidaten pro Klasse sind ein Team Immer zwei Teams treten    gegeneinander an Wer kämpft am besten gegen die Schwerkraft und stapelt 20 Kisten waagerecht !",
		5,
		5,
		true,
		true,
        1);
	
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Medizinball-Weitwurf",
		"5  Werfer pro Klasse sind möglich Ab dem Markierungsband wird gemessen ! Leichtes Übertreten (Bandbrührung) wird geduldet. ( Wir sind keine Profis! ) Der erste Aufprall zählt. 3  Wertungsversuche  -  der beste gilt",
		1,
		5,
		true,
		false,
        1);
        
	INSERT INTO `sportfest`.`disziplin`(`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
    VALUES
		("Weitsprung",
		"Vor dem schwarzen Markierungsband im Balken wird gemessen ! Leichtes Übertreten (ca. 3 Zentimeter) wird geduldet. ( Wir sind keine Profis! ) Der letzte Abdruck im Sand zählt.",
		1,
		5,
		true,
		false,
        1);
        
END ;;
CREATE PROCEDURE `DisziplinenAnzeigen`()
BEGIN
	SELECT * FROM disziplin;
END ;;
CREATE PROCEDURE `DisziplinLoeschen`(did int)
BEGIN
	delete from disziplin where DisziplinID= did;
END ;;
CREATE PROCEDURE `GeschlechtAnzeigen`(in gid int)
BEGIN
	SELECT * FROM geschlecht where GeschlechtsID = gid;
END ;;
CREATE PROCEDURE `GeschlechterAnzeigen`()
BEGIN
	SELECT * FROM geschlecht;
END ;;
CREATE PROCEDURE `KlasseAnlegen`(
inname varchar(255))
BEGIN
		insert into  klasse (name) values (inname);
         SELECT LAST_INSERT_ID(); 
END ;;
CREATE PROCEDURE `Klasseanzeigen`(kid int)
BEGIN
	select * from klasse where klassenID= kid;
END ;;
CREATE PROCEDURE `KlasseBearbeiten`(inkid int,
inname varchar(255))
BEGIN
	update klasse set name= inname where klassenid=inkid;
END ;;
CREATE PROCEDURE `Klasseloeschen`(kid int)
BEGIN
	delete from klasse where klassenid=kid;
END ;;
CREATE PROCEDURE `KlassenAnzeigen`()
BEGIN
	select * from klasse order by Name;
END ;;
CREATE PROCEDURE `LeistungAendern`(
lid int,
did int,
kid int,
sid int,
inzeitpunkt timestamp
)
BEGIN
Update leistung set 
disziplinid= did
,schuelerid=sid,klassenid=kid,zeitpunkt=inzeitpunkt 
where leistungid= lid;
END ;;
CREATE PROCEDURE `LeistungAnzeigen`(lid int)
BEGIN
select * from leistung where leistungid =lid;
END ;;
CREATE PROCEDURE `LeistungenAnzeigen`()
BEGIN
select * from Leistung;
END ;;
CREATE PROCEDURE `LeistungKlasseAnlegen`(
did int,
kid int,
inzeitpunkt timestamp
)
BEGIN
	
	insert into leistung (disziplinid,klassenid,zeitpunkt) values(did,kid,inzeitpunkt);
	SELECT LAST_INSERT_ID(); 
END ;;
CREATE PROCEDURE `LeistungLoeschen`(
lid int)
BEGIN
delete from leistungsergebnis where  leistungid=lid;
delete from leistung where leistungid =lid;
END ;;
CREATE PROCEDURE `LeistungSchuelerAnlegen`(
did int,
sid int,
inzeitpunkt timestamp
)
BEGIN
	
	insert into leistung (disziplinid,schuelerid,klassenid,zeitpunkt) values(did,sid,(select klassenid from schueler where schuelerid= sid),inzeitpunkt);
	SELECT LAST_INSERT_ID(); 
END ;;
CREATE PROCEDURE `RegelAnlegen`(
    disz_id int,
    expr text,
    idx int,
    points int
)
BEGIN
    INSERT INTO regel (disziplinid, expr, idx, points) VALUES (disz_id, expr, idx, points);
    SELECT LAST_INSERT_ID() AS "RegelID";
END ;;
CREATE PROCEDURE `RegelAnzeigen`(
    in_r_id int
)
BEGIN
    SELECT * FROM regel WHERE RegelID = in_r_id;
END ;;
CREATE PROCEDURE `RegelBearbeiten`(
    in_rid int,
    in_expr text,
    in_idx int,
    in_points int
)
BEGIN
    UPDATE regel SET expr = in_expr, idx = in_idx, points = in_points WHERE RegelID = in_rid;
END ;;
CREATE PROCEDURE `RegelLoeschen`(rid int)
BEGIN
	delete from regel where regelid=rid;
END ;;
CREATE PROCEDURE `RegelnEinerDisziplinAnzeigen`(did int)
BEGIN
select * from regel where disziplinid=did order by idx;

END ;;
CREATE PROCEDURE `SchuelerAendern`(
	insid int,
    invorname varchar(255),
    innachname varchar(255),
    inklassenid int,
    ingeschlechtsid int
)
BEGIN
update`sportfest`.`schueler`
set Vorname= invorname,
Nachname=innachname,
KlassenID=inklassenid,
GeschlechtsID=ingeschlechtsid
where 
schuelerid= insid;
END ;;
CREATE PROCEDURE `SchuelerAnlegen`(
	
	invorname varchar(255),
    innachname varchar(255),
    inklassenid int,
    ingeschlechtsid int
)
BEGIN
	INSERT INTO `sportfest`.`schueler`
	(
	`Vorname`,
	`Nachname`,
	`KlassenID`,
	`GeschlechtsID`) VALUES
	(invorname,
	innachname,
	inklassenid,
	ingeschlechtsid);
	SELECT LAST_INSERT_ID();
 
END ;;
CREATE PROCEDURE `SchuelerAnzeigen`(sid int)
BEGIN
		select * from schueler where schuelerid= sid;
END ;;
CREATE PROCEDURE `SchuelerEinerDisziplinUndKlasseAnzeigen`(kid int, did int)
BEGIN

SELECT * FROM schueler s, leistung l
WHERE l.KlassenID = kid AND l. disziplinID = did  AND s.SchuelerID = l.SchuelerID;

END ;;
CREATE PROCEDURE `SchuelerEinerKlasseAnzeigen`(kid int)
BEGIN
 SELECT * FROM schueler s WHERE s.KlassenID = kid;
END ;;
CREATE PROCEDURE `schuelerKlasseLeeren`()
BEGIN

	SET foreign_key_checks = 0;
	drop table if exists Anmeldung;
	drop table if exists Klasse;
	drop table if exists Schueler;
	SET foreign_key_checks = 1;
    
    create table Schueler (SchuelerID int(11) not null auto_increment, Vorname varchar(50), Nachname varchar(50), KlassenID int(11) not null, GeschlechtsID int(11) not null, primary key (SchuelerID));
	create table Klasse (KlassenID int(11) not null auto_increment, Name varchar(10), primary key (KlassenID));
	create table Anmeldung (DisziplinID int(11) not null, SchuelerID int(11) not null);
	
    alter table Schueler add index FKSchueler920130 (GeschlechtsID), add constraint FKSchueler920130 foreign key (GeschlechtsID) references Geschlecht (GeschlechtsID);
	alter table Schueler add index FKSchueler614103 (KlassenID), add constraint FKSchueler614103 foreign key (KlassenID) references Klasse (KlassenID);
	alter table Anmeldung add index FKAnmeldung256515 (DisziplinID), add constraint FKAnmeldung256515 foreign key (DisziplinID) references Disziplin (DisziplinID);
	alter table Anmeldung add index FKAnmeldung976756 (SchuelerID), add constraint FKAnmeldung976756 foreign key (SchuelerID) references Schueler (SchuelerID);
	
END ;;
CREATE PROCEDURE `SchuelerLoeschen`(sid int)
BEGIN
	delete from schueler where schuelerid = sid;
END ;;
CREATE PROCEDURE `SchuelerPAnzeigen`()
BEGIN
		select * from schueler;
END ;;
CREATE PROCEDURE `TypAnlegen`(
    typ_name tinytext,
    typ_descr text,
    typ_typ tinytext
)
BEGIN
    INSERT INTO typ (typ_name, typ_descr, typ_typ) VALUES (typ_name, typ_descr, typ_typ);
    SELECT * FROM typ WHERE typ_id = LAST_INSERT_ID();
END ;;
CREATE PROCEDURE `TypAnzeigen`(
    in_typ_id int
)
BEGIN
    SELECT * FROM typ WHERE typ_id = in_typ_id;
END ;;
CREATE PROCEDURE `TypBearbeiten`(
    in_typ_id int,
    in_typ_name tinytext,
    in_typ_descr text,
    in_typ_typ tinytext
)
BEGIN
    UPDATE typ SET typ_name = in_typ_name, typ_descr = in_typ_descr, typ_typ = in_typ_typ WHERE typ_id = in_typ_id;
    SELECT * FROM typ WHERE typ_id = in_typ_id;
END ;;
CREATE PROCEDURE `TypenAnzeigen`()
BEGIN
    SELECT * FROM typ;
END ;;
CREATE PROCEDURE `TypEntfernen`(
    in_typ_id int
)
BEGIN
    DELETE FROM typzustand WHERE typ_id = in_typ_id;
    DELETE FROM typ WHERE typ_id = in_typ_id;
END ;;
CREATE PROCEDURE `VariableAnzeigen`(
    in_var_id int
)
BEGIN
    SELECT * FROM variable WHERE var_id = in_var_id;
END ;;
CREATE PROCEDURE `VariableEntfernen`(
    in_var_id int
)
BEGIN
    DELETE FROM variable WHERE var_id = in_var_id;
END ;;
CREATE PROCEDURE `VariablenAnzeigen`()
BEGIN

    SELECT * FROM variable;

END ;;
CREATE PROCEDURE `ZustaendeEinesTypsAnzeigen`(
    tid int)
BEGIN

    SELECT * FROM typzustand where typ_id = tid;

END ;;
CREATE PROCEDURE `ZustandAnlegen`(
    typ_id int,
    tzst_name tinytext,
    tzst_descr text,
    tzst_val varchar(32)
)
BEGIN
    INSERT INTO typzustand (typ_id, tzst_name, tzst_descr, tzst_val) VALUES (typ_id, tzst_name, tzst_descr, tzst_val);
    SELECT * FROM typzustand WHERE zid = LAST_INSERT_ID();
END ;;
CREATE PROCEDURE `ZustandAnzeigen`(
    in_z_id int
)
BEGIN
    SELECT * FROM typzustand WHERE zid = in_z_id;
END ;;
CREATE PROCEDURE `ZustandBearbeiten`(
    in_z_id int,
    in_tzst_name tinytext,
    in_tzst_descr text,
    in_tzst_val varchar(32)
)
BEGIN
    UPDATE typzustand SET tzst_name = in_tzst_name, tzst_descr = in_tzst_descr, tzst_val = in_tzst_val WHERE zid = in_z_id;
    SELECT * FROM typzustand WHERE zid = in_z_id;
END ;;
CREATE PROCEDURE `ZustandEntfernen`(
    in_z_id int
)
BEGIN
    DELETE FROM typzustand WHERE zid = in_z_id;
END ;;

DELIMITER ;

INSERT INTO `sportfest`.`benutzer`
(`Name`,
`Passwort`,
`BerechtigungsID`)
VALUES
("admin",
"21232f297a57a5a743894a0e4a801fc3",
1),
("ewald",
"21232f297a57a5a743894a0e4a801fc3",
1);;

INSERT INTO `sportfest`.`geschlecht`
(`GeschlechtsID`,
`Name`)
VALUES
(1,
"männlich"),
(2,
"weiblich"),
(3,
"beides");
