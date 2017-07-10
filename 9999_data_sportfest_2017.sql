INSERT IGNORE INTO benutzer (name,passwort,berechtigungsid) VALUES ("test",md5("test"),1);
INSERT IGNORE INTO geschlecht (GeschlechtsID, Name) VALUES (1, "m"), (2, "w");

SET FOREIGN_KEY_CHECKS=0;
delete from `sportfest`.`typzustand`;
delete from `sportfest`.`variable`;
delete from `sportfest`.`typ`;
delete from `sportfest`.`regel`;
delete from `sportfest`.`regelsatz`;
delete from `sportfest`.`disziplin`;
SET FOREIGN_KEY_CHECKS=1;

INSERT INTO `sportfest`.`typ`
(`typ_id`,`typ_name`,`typ_descr`,`typ_typ`,`typ_conv`) VALUES 
(1, "Ganzzahl", "Ganzzahl", "java.lang.Integer", "parseInt"),
(2, "Fließkommazahl", "Fließkommazahl", "java.lang.Float", "parseFloat"),
(3, "Zeit", "Zeit (mm:ss:SSS)", "java.lang.String", null),
(4, "Ausgang", "Gewonnen/Verloren", "String", null),
(5, "Ausgang", "Gewonnen/Verloren/Unentschieden", "String", null),
(6, "Ausgang", "Geschafft/Nicht Geschafft", "String", null);

INSERT INTO `sportfest`.`typzustand`
(`zid`,`typ_id`,`tzst_name`,`tzst_descr`,`tzst_val`) VALUES
(1,4,"Gewonnen","Gewonnen","gewonnen"),
(2,4,"Verloren","Verlosen","verloren"),
(3,5,"Gewonnen","Gewonnen","gewonnen"),
(4,5,"Verloren","Verlosen","verloren"),
(5,5,"Unentschieden","Unentschieden","unentschieden"),
(6,6,"Geschafft und Erster","Geschafft und Erster","geschafft1"),
(7,6,"Geschafft und Zweiter","Geschafft und Zweiter","geschafft2"),
(8,6,"Nicht geschafft","Nicht geschafft","nicht_geschafft");

/*----------------
4x100m Staffellauf
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(1,
"4x100m Staffellauf",
"4  Läufer, Läuferinnen aus einer Klasse. 
Es muss in den Bahnen gelaufen werden! 
Falls es 2 reine Damenstaffeln gibt, starten diese in einem Lauf gegeneinander. ( mit eigener Wertung )",
4,
4,
true,
true,
4);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(1,"Platz","Platz (1-4)","p",1,1,1,true),
(2,"Zeit","Zeit (mm:ss:SSS)","z",3,1,0,true);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(1,1,false),
(2,1,true);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(1,1,"p == 1",0,24),
(2,1,"p == 2",1,21),
(3,1,"p == 3",2,18),
(4,1,"p == 4",3,15),
(5,2,"counter < 3",1,21);


/*----------------
	2000m Lauf
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(2,
"2000m Lauf",
"3 Starter pro Klasse sind möglich! 
Maximal 15 Starter pro Lauf. 
Die Damen starten in einem eigenen Lauf wenn mehr als 5 Starterinnen dabei sind. ",
1,
3,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(3,"Zeit","Zeit (mm:ss:SSS)","z",3,2,0,true);


INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(3,2,false),
(4,2,true);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(6 ,3,"geschlecht == \"m\" && z <= \"9:00\"",0,10),
(7 ,3,"geschlecht == \"m\" && z <= \"11:00\"",1, 7),
(8 ,3,"geschlecht == \"m\" && z > \"11:00\"",2, 4),
(9 ,3,"geschlecht == \"w\" && z <= \"11:00\"",3,10),
(10,3,"geschlecht == \"w\" && z <= \"13:00\"",4, 7),
(11,3,"geschlecht == \"w\" && z > \"13:00\"",5, 4),
(12,4,"geschlecht == \"m\" && counter < 6 && z <= \"9:00\"",0,4),
(13,4,"geschlecht == \"w\" && counter < 2 && z <= \"11:00\"",1,4);

/*----------------
	 Baseball
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(3,
"Baseball",
"Zielen ist gut, Treffen ist besser!
5 Kandidaten pro Klasse sind möglich.
Wer konzentriert sich am besten und wer hat das richtige Timing für die Hits?",
1,
5,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(4,"Treffer","Treffer","t",1,3,0,false);


INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(5,3,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(14,5,"t = 10",0,6),
(15,5,"t >= 6",1,4),
(16,5,"t >= 4",2,3),
(17,5,"t >= 1",3,2);

/*----------------
	Basketball
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(4,
"Basketball",
"Konzentrations - Check am  Basketballkorb. 
5 Kandidaten pro Klasse sind möglich. 
Wer ist der Treffer - König 10 Freiwürfe",
1,
5,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(5,"Treffer","Treffer","t",1,4,0,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(6,4,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(18,6,"t = 10",0,6),
(19,6,"t >= 6",1,4),
(20,6,"t >= 3",2,3),
(21,6,"t >= 1",3,2);

/*----------------
 Beach-Volleyball
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(5,
"Beach-Volleyball",
"3 gegen 3 Panieren und Punkten! 
Gegen Teams aus zwei anderen Klassen wird jeweils 12 Minuten gespielt.
Je nach Zeit laufen die 2. Spiele bis 21 Punkte. (bei 21 : 20 ist Schluss !)",
3,
3,
true,
true,
2);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(6,"Ausgang","Ausgang","a",4,5,1,true),
(7,"Punkte","Punkte","z",1,5,0,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(7,5,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(22,7,"a = \"gewinner\"",0,15),
(23,7,"a = \"verlierer\"",1,8);

/*----------------
	 Frisbee
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)    VALUES
(6,
"Frisbee",
"Zielen - Tor - Tor - Tor!
5 Kandidaten pro Klasse sind möglich.
Wer konzentriert sich am besten und wer hat das richtige Händchen und Gespür für den Wind?
Nach dem Einwerfen - 10 Scheiben in Folge",
1,
5,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(8,"Treffer","Treffer","z",1,6,0,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(8,6,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(24,8,"t = 10",0,6),
(25,8,"t >= 6",1,4),
(26,8,"t >= 3",2,3),
(27,8,"t >= 1",3,2);

/*----------------
	 Fußball
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(7,
"Fußball",
"Kunstrasen  5  gegen  5 (incl. Torwart)
Es gelten die Feldlinien!
Von der Seitenlinie wird der Ball eingerollt!
Aus der Hand rollt der Torwart den Ball ins Spiel! 
Kein Rückpass in die Hand des Torwarts!
Ein Torschuß ist von überall möglich!
Gegen Teams aus zwei anderen Klassen wird jeweils zweimal 10 Min. gespielt.",
5,
5,
true,
true,
2);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(9,"Ausgang","Ausgang","a",5,7,1,true),
(10,"Tore","Tore","z",1,7,0,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(9,7,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(28,9,"a = \"gewinner\"",0,20),
(29,9,"a = \"verlierer\"",1,10),
(30,9,"a = \"unentschieden\"",2,14);

/*----------------
	Hochsprung
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(8,
"Hochsprung",
"Es muss mit einem Bein abgesprungen werden! 
Pro Höhe sind drei Versuche möglich. 
Es wird mindestens in 5 cm Schritten erhöht. 
Fällt die Latte in den ersten drei Sekunden nach dem Sprung nicht, gilt die Höhe als übersprungen.",
1,
3,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(11,"Sprung 1","Höchster Sprung","h1",2,8,0,false),
(12,"Sprung 2","Zweit-höchster Sprung","h2",2,8,1,false),
(13,"Sprung 3","Dritt-höchster Sprung","h3",2,8,2,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(10,8,false),
(11,8,true);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(31,10,"geschlecht == \"m\" && h1 >= 1.45",0,8),
(32,10,"geschlecht == \"m\" && h1 >= 1.25",1,6),
(33,10,"geschlecht == \"m\" && h1 <  1.25",2,4),
(34,10,"geschlecht == \"w\" && h1 >= 1.30",3,8),
(35,10,"geschlecht == \"w\" && h1 >= 1.10",4,6),
(36,10,"geschlecht == \"w\" && h1 <  1.10",5,4),
(37,11,"geschlecht == \"m\" && counter < 6 && h1 >= 1.25",0,6),
(38,11,"geschlecht == \"w\" && counter < 2 && h1 >= 1.10",1,6);
/*----------------
	  Hockey
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(9,
"Hockey",
"Floorball Kunstrasen 4 gegen 4 Schlägertypen sind unerwünscht! ( Bitte Regelblatt beachten!) 
Gegen zwei Gegner aus anderen Klassen wird jeweils 12 Min. gespielt.",
4,
4,
true,
true,
2);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(14,"Ausgang","Ausgang","a",6,9,1,true),
(15,"Tore","Tore","z",1,9,0,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(12,9,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(39,12,"a = \"gewinner\"",0,16),
(40,12,"a = \"verlierer\"",1,12),
(41,12,"a = \"unentschieden\"",2,8);

/*----------------
   Kistenstapeln
-----------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(10,
"Kistenstapeln",
"(Achtung: Regelblatt) 
5 Kandidaten pro Klasse sind ein Team Immer zwei Teams treten gegeneinander an. 
Wer kämpft am besten gegen die Schwerkraft und stapelt 20 Kisten waagerecht!",
5,
5,
true,
true,
2);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(16,"Ausgang","Ausgang","a",5,10,1,true);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(13,10,false);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(42,13,"a = \"geschafft1\"",0,16),
(43,13,"a = \"geschafft2\"",1,12),
(44,13,"a = \"nicht_geschafft\"",2,6);

/*-------------------
Medizinball-Weitwurf
--------------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(11,
"Medizinball-Weitwurf",
"5 Werfer pro Klasse sind möglich.
Ab dem Markierungsband wird gemessen! 
Leichtes Übertreten (Bandbrührung) wird geduldet. ( Wir sind keine Profis! ) 
Der erste Aufprall zählt. 
3 Wertungsversuche - der beste gilt",
1,
5,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(17,"Wurf 1","Weitester Wurf","w1",2,11,0,false),
(18,"Wurf 2","Zweit-weitester Wurf","w2",2,11,1,false),
(19,"Wurf 3","Dritt-weitester Wurf","w3",2,11,2,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(14,11,false),
(15,11,true);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(45,14,"geschlecht == \"m\" && w1 >= 12",0,8),
(46,14,"geschlecht == \"m\" && w1 >= 9",1,6),
(47,14,"geschlecht == \"m\" && w1 <  9",2,4),
(48,14,"geschlecht == \"w\" && w1 >= 12",3,8),
(49,14,"geschlecht == \"w\" && w1 >= 9",4,6),
(50,14,"geschlecht == \"w\" && w1 <  8",5,4),
(51,15,"geschlecht == \"m\" && counter < 6 && w1 >= 12",0,4),
(52,15,"geschlecht == \"w\" && counter < 2 && w1 >= 12",1,4);

/*-------------------
	Weitsprung
--------------------*/
INSERT INTO `sportfest`.`disziplin`(`DisziplinID`,`Name`,`Beschreibung`,`MindestAnzahl`,`MaximalAnzahl`,`aktiviert`,`teamleistung`,`KontrahentenAnzahl`)
VALUES
(12,
"Weitsprung",
"Vor dem schwarzen Markierungsband im Balken wird gemessen! 
Leichtes Übertreten (ca. 3 Zentimeter) wird geduldet. ( Wir sind keine Profis! ) 
Der letzte Abdruck im Sand zählt.",
1,
5,
true,
false,
1);

INSERT INTO `sportfest`.`variable`
(`var_id`,`var_name`,`var_descr`,`var_exprParam`,`typ_id`,`disz_id`,`var_sortIndex`,`var_sortAsc`) VALUES
(20,"Sprung 1","Weitester Sprung","s1",2,12,0,false),
(21,"Sprung 2","Zweit-weitester Sprung","s2",2,12,1,false),
(22,"Sprung 3","Dritt-weitester Sprung","s3",2,12,2,false);

INSERT INTO `sportfest`.`regelsatz`
(`rsatz_id`,`disz_id`,`rsatz_sort`) VALUES
(16,12,false),
(17,12,true);

INSERT INTO `sportfest`.`regel`
(`RegelID`,`rsatz_id`,`expr`,`idx`,`points`) VALUES
(53,16,"geschlecht == \"m\" && s1 >= 4.80",0,6),
(54,16,"geschlecht == \"m\" && s1 >= 4.00",1,4),
(55,16,"geschlecht == \"m\" && s1 <  4.00",2,2),
(56,16,"geschlecht == \"w\" && s1 >= 3.80",3,6),
(57,16,"geschlecht == \"w\" && s1 >= 3.00",4,4),
(58,16,"geschlecht == \"w\" && s1 <  3.00",5,2),
(59,17,"geschlecht == \"m\" && counter < 6 && s1 >= 4.80",0,6),
(60,17,"geschlecht == \"w\" && counter < 2 && s1 >= 3.80",1,6);