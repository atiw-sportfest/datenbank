
DROP PROCEDURE IF EXISTS ErgebnisEntfernen;

DELIMITER ;;

CREATE PROCEDURE ErgebnisEntfernen (
    in_lid int,
    in_vid int
)
BEGIN
    DELETE FROM ergebnis WHERE LeistungID = in_lid AND var_id = in_vid;
END ;;

DELIMITER ;;
