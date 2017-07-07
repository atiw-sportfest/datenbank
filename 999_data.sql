
-- Disziplinen

SET @d_wts=1000;
SET @d_elt=1337;

INSERT IGNORE INTO disziplin (disziplinid,name,beschreibung,mindestanzahl,maximalanzahl,aktiviert,teamleistung) VALUES
(@d_wts,"Weitsprung","Weit springen",2,2,true,false),
(@d_elt,"Disziplin 1337","10 Menschen...",2,2,true,true);

-- Variablen, Type, Zustände

SET @t_int=100;
SET @t_str=101;
SET @t_stz=102;
SET @t_flt=103;

SET @v_wte_wts=2000;
SET @v_wte_elt=2001;
SET @v_stz_elt=2002;

INSERT IGNORE INTO typ (typ_id,typ_name,typ_descr,typ_typ,typ_conv) VALUES
(@t_int, "Ganzzahl", "Einfacher Zahlewert","java.lang.Integer","parseInt"),
(@t_str, "Zeichenkette", "Zeichenkette","java.lang.String",null),
(@t_stz, "Sternzeichen", "Ein Sternzeichen","String", null),
(@t_flt, "Fließkommazahl", "Kommazahl", "java.lang.Float", "parseFloat");

INSERT IGNORE INTO typzustand (typ_id,tzst_name,tzst_val) VALUES
(@t_stz, "Steinbock", "steinbock"),
(@t_stz, "Fische", "fische"),
(@t_stz, "Wassermann", "wassermann");


INSERT IGNORE INTO variable (var_id,var_name,var_descr,var_exprParam,typ_id,disz_id,var_sortIndex) VALUES
(@v_wte_wts,"Weite", "Gesprungene Weite in Metern", "weite", @t_flt,@d_wts,0),
(@v_stz_elt,"Sternzeichen", "Das Sternzeichen des Teilnehmers", "stz",@t_stz,@d_elt,0),
(@v_wte_elt,"Weite", "Geflogenen Weite in Metern", "weite", @t_flt,@d_elt,1);

-- Benutzer

INSERT IGNORE INTO benutzer (name,passwort,berechtigungsid) VALUES
("test",md5("test"),1);

-- Regeln

INSERT IGNORE INTO `regel` (expr,disziplinid,idx,points) VALUES
('geschlecht == \"m\" && weite >= 2.4',1000,0,10),
('geschlecht == \"m\" && weite >= 1.2',1000,1,5),
('geschlecht == \"m\" && weite >= 0.6',1000,2,2),
('geschlecht == \"m\" && weite >= 0.3',1000,3,1),
('geschlecht == \"w\" && weite >= 1.2',1000,4,10),
('geschlecht == \"w\" && weite >= 0.6',1000,5,5),
('geschlecht == \"w\" && weite >= 0.3',1000,6,2),
('geschlecht == \"w\" && weite >= 0.15',1000,7,1);

-- Klassen, Schüler

SET @kid = 1234;
SET @did = 1337;

INSERT IGNORE INTO klasse (KlassenID, Name) VALUES (@kid, "1234");

INSERT IGNORE INTO geschlecht (GeschlechtsID, Name) VALUES (1, "m"), (2, "w");

SET @bernd = 3400;
SET @trulla = 3041;
SET @erna = 3402;
SET @maxx = 3403;

INSERT IGNORE INTO schueler (SchuelerID, Vorname, Nachname, KlassenID, GeschlechtsID) VALUES 
(@bernd, "Bernd", "Vogel", @kid, 1),
(@trulla, "Trulla", "Troet", @kid, 2),
(@erna, "Erna", "Schnürschuh", @kid, 2),
(@maxx, "Max", "Mustermann", @kid, 1);

-- Leistungen, Ergebnisse

INSERT IGNORE INTO leistung (LeistungID, DisziplinID, KlassenID, SchuelerID, Zeitpunkt) VALUES
(1001, @did, @kid, @bernd, now()),
(1002, @did, @kid, @trulla, now()),
(1003, @did, @kid, @erna, now()),
(1004, @did, @kid, @maxx, now()),
(1005, @did, @kid, null, now());

INSERT IGNORE INTO ergebnis (LeistungID, var_id, Wert) VALUES
(1001, @v_wte_elt, "1.20"),
(1001, @v_stz_elt, "fische"),
(1002, @v_wte_elt, "1.10"),
(1002, @v_stz_elt, "wassermann"),
(1003, @v_wte_elt, "1.40"),
(1003, @v_stz_elt, "steinbock");

