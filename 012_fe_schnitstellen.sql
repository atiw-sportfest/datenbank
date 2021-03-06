
DROP PROCEDURE IF EXISTS LeistungenEinerDisziplinAnzeigen;
DROP PROCEDURE IF EXISTS KlassenAnzeigenMitAnmeldung;
DROP PROCEDURE IF EXISTS KlassenAnzeigenMitLeistungAnDisziplin;

DELIMITER ;;

CREATE PROCEDURE `LeistungenEinerDisziplinAnzeigen`(in_d_id int)
BEGIN
    SELECT * FROM leistung WHERE DisziplinID = in_d_id;
END ;;

CREATE PROCEDURE `KlassenAnzeigenMitAnmeldung`(did int)
BEGIN
	select distinct k.* from anmeldung a, schueler s, klasse k where a.DisziplinID = did and a.SchuelerID = s.SchuelerID and s.KlassenID = k.KlassenID order by Name;
END ;;

CREATE PROCEDURE `KlassenAnzeigenMitLeistungAnDisziplin`(did int)
BEGIN
	select distinct k.* from leistung l, klasse k where l.DisziplinID = did and l.KlassenID = k.KlassenID order by Name;
END ;;

DELIMITER ;
