
-- DROP

DROP PROCEDURE IF EXISTS LeistungAnlegen;
DROP PROCEDURE IF EXISTS LeistungenAnzeigen;
DROP PROCEDURE IF EXISTS LeistungEntfernen;
DROP PROCEDURE IF EXISTS LeistungBearbeiten;

DROP PROCEDURE IF EXISTS ErgebnisseAnzeigen;
DROP PROCEDURE IF EXISTS ErgebnisAnlegen;

DELIMITER ;;

CREATE PROCEDURE LeistungAnlegen (
    in_disz_id int,
    in_k_id int,
    in_s_id int,
    in_tstp timestamp
)
BEGIN
    INSERT INTO leistung (disziplinid, klassenid, schuelerid, zeitpunkt) VALUES (in_disz_id, in_k_id, in_s_id, in_tstp);
    SELECT * FROM leistung WHERE leistungid = LAST_INSERT_ID();
END ;;

CREATE PROCEDURE LeistungenAnzeigen ()
BEGIN
    SELECT * FROM leistung;
END;;

CREATE PROCEDURE LeistungEntfernen (
    l_id int
)
BEGIN
    DELETE FROM ergebnis WHERE LeistungID = l_id;
    DELETE FROM leistung WHERE LeistungID = l_id;
END ;;

CREATE PROCEDURE LeistungBearbeiten(
    in_l_id int,
    in_d_id int,
    in_k_id int,
    in_s_id int,
    in_tstp timestamp
)
BEGIN
    UPDATE leistung SET disziplinid = in_d_id, klassenid = in_k_id, schuelerid = in_s_id, zeitpunkt = in_tstp WHERE LeistungID = in_l_id;
    SELECT * FROM leistung WHERE LeistungID = in_l_id;
END ;;

CREATE PROCEDURE ErgebnisseAnzeigen (
    l_id int
)
BEGIN
    SELECT * FROM ergebnis WHERE LeistungID = l_id;
END ;;

CREATE PROCEDURE ErgebnisAnlegen (
    l_id int,
    erg_wert varchar(256),
    in_var_id int
)
BEGIN
    INSERT INTO ergebnis (LeistungID, wert, var_id) VALUES (l_id, erg_wert, in_var_id);
    SELECT * FROM ergebnis WHERE LeistungID = l_id AND var_id = in_var_id;
END ;;

DELIMITER ;
