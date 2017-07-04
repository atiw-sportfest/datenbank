
DROP PROCEDURE IF EXISTS LeistungenEinesSchuelersAnzeigen;

DELIMITER ;;

CREATE PROCEDURE LeistungenEinesSchuelersAnzeigen (
    in_s_id int
)
BEGIN
    SELECT * FROM leistung WHERE SchuelerID = in_s_id;
END ;;

DELIMITER ;
