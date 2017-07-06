DROP procedure IF EXISTS `AnmeldungenEinerDisziplinUndKlasseAnzeigen`;

DELIMITER $$
CREATE PROCEDURE `AnmeldungenEinerDisziplinUndKlasseAnzeigen`(
kid int, did int)
BEGIN
	SELECT s.* from anmeldung a, schueler s where disziplinid=did and a.SchuelerId = s.SchuelerID and s.KlassenID = kid;
END$$

DELIMITER ;
