ALTER TABLE `sportfest`.`ergebnis` 
CHANGE COLUMN `Wert` `Wert` VARCHAR(256) NOT NULL ;

CREATE DEFINER=`fs151`@`%` PROCEDURE `SchuelerAnzeigenMitLeistungAnDisziplin`(did int)
BEGIN

SELECT s.* FROM schueler s, leistung l
WHERE l. disziplinID = did  AND s.SchuelerID = l.SchuelerID;

END