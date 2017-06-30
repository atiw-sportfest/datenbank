
DROP PROCEDURE IF EXISTS VariableZuDisziplinZuordnen;
DROP PROCEDURE IF EXISTS VariableVonDisziplinEntfernen;

DELIMITER ;;

CREATE PROCEDURE VariableZuDisziplinZuordnen (
    var_id int,
    did int
)
BEGIN
    INSERT INTO disziplin_variable (var_id, disz_id) VALUES (var_id, did);
END ;;

CREATE PROCEDURE VariableVonDisziplinEntfernen (
    in_var_id int,
    in_did int
)
BEGIN
    DELETE FROM disziplin_variable WHERE var_id = in_var_id and disz_id = in_did;
END ;;

DELIMITER ;
