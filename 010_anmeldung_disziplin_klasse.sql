USE `sportfest`;
DROP procedure IF EXISTS `AnmeldungenEinerDisziplinUndKlasseAnzeigen`;

DELIMITER $$
USE `sportfest`$$
CREATE DEFINER=`fs151`@`%` PROCEDURE `AnmeldungenEinerDisziplinUndKlasseAnzeigen`(
kid int, did int)
BEGIN
	SELECT s.* from anmeldung a, schueler s where disziplinid=did and a.SchuelerId = s.SchuelerID and s.KlassenID = kid;
END$$

DELIMITER ;