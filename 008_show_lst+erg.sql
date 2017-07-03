
DROP PROCEDURE IF EXISTS LeistungenEinerKlasseAnzeigen;

DELIMITER ;;

CREATE PROCEDURE LeistungenEinerKlasseAnzeigen (
    in_k_id int
)
BEGIN
    SELECT * FROM leistung WHERE KlassenID = in_k_id;
END ;;

DELIMITER ;
