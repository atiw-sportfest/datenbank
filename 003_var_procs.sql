
DROP PROCEDURE IF EXISTS VariablenEinerDisziplinAnzeigen;

DELIMITER ;;
CREATE PROCEDURE VariablenEinerDisziplinAnzeigen(
    did int)
BEGIN

    SELECT v.* FROM disziplin_variable JOIN variable v USING (var_id) WHERE disz_id = did;

END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS VariablenAnzeigen;

DELIMITER ;;
CREATE PROCEDURE VariablenAnzeigen()
BEGIN

    SELECT * FROM variable;

END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS TypAnzeigen;

DELIMITER ;;
CREATE PROCEDURE TypAnzeigen(
    tid int)
BEGIN

    SELECT * FROM typ where typ_id = tid;

END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS ZustaendeEinesTypsAnzeigen;

DELIMITER ;;
CREATE PROCEDURE ZustaendeEinesTypsAnzeigen(
    tid int)
BEGIN

    SELECT * FROM typzustand where typ_id = tid;

END ;;
DELIMITER ;
