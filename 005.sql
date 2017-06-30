
SET @kid = 1234;
SET @did = 1337;

INSERT INTO klasse (KlassenID, Name) VALUES (@kid, "1234");

INSERT INTO geschlecht (GeschlechtsID, Name) VALUES (1, "m"), (2, "w");

SET @bernd = 3400;
SET @trulla = 3041;
SET @erna = 3402;
SET @maxx = 3403;
INSERT INTO schueler (SchuelerID, Vorname, Nachname, KlassenID, GeschlechtsID) VALUES 
(@bernd, "Bernd", "Vogel", @kid, 1),
(@trulla, "Trulla", "Troet", @kid, 2),
(@erna, "Erna", "Schnürschuh", @kid, 2),
(@maxx, "Max", "Mustermann", @kid, 1);

INSERT INTO leistung (LeistungID, DisziplinID, KlassenID, SchuelerID, Zeitpunkt) VALUES
(1001, @did, @kid, @bernd, now()),
(1002, @did, @kid, @trulla, now()),
(1003, @did, @kid, @erna, now()),
(1004, @did, @kid, @maxx, now()),
(1005, @did, @kid, null, now());

SET @v_wte = 2000;
SET @v_stz = 2001;

INSERT INTO ergebnis (LeistungID, var_id, Wert) VALUES
(1001, @v_wte, "120"),
(1001, @v_stz, "fische"),
(1002, @v_wte, "110"),
(1002, @v_stz, "wassermann"),
(1003, @v_wte, "140"),
(1003, @v_stz, "steinbock");

