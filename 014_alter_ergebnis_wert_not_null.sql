
ALTER TABLE `sportfest`.`ergebnis` CHANGE COLUMN `Wert` `Wert` VARCHAR(256) NOT NULL ;

DROP PROCEDURE IF EXISTS SchuelerAnzeigenMitLeistungAnDisziplin;

DELIMITER ;;

CREATE PROCEDURE `SchuelerAnzeigenMitLeistungAnDisziplin`(
    did int
)
BEGIN

    SELECT s.* FROM schueler s, leistung l
    WHERE l. disziplinID = did  AND s.SchuelerID = l.SchuelerID;

END ;;

DELIMITER ;
