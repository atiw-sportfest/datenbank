
-- Tables

ALTER TABLE variable ADD (disz_id INTEGER NOT NULL, var_sortIndex INTEGER);
ALTER TABLE variable ADD CONSTRAINT varSortIndex UNIQUE (disz_id, var_sortIndex);

DROP TABLE IF EXISTS disziplin_variable;

-- Procedures

DROP PROCEDURE IF EXISTS VariableZuDisziplinZuordnen;
DROP PROCEDURE IF EXISTS VariableVonDisziplinEntfernen;
DROP PROCEDURE IF EXISTS VariableAnlegen;
DROP PROCEDURE IF EXISTS VariableBearbeiten;
DROP PROCEDURE IF EXISTS VariablenEinerDisziplinAnzeigen;
DROP PROCEDURE IF EXISTS VariablenEinerDisziplinEntfernen;

DELIMITER ;;

CREATE PROCEDURE `VariablenEinerDisziplinAnzeigen`(
    in_disz_id int
)
BEGIN

    SELECT * FROM variable WHERE disz_id = in_disz_id;

END ;;

CREATE PROCEDURE VariablenEinerDisziplinEntfernen (
    in_disz_id int
)
BEGIN

    -- Return do be deleted rows
    CALL VariablenEinerDisziplinAnzeigen(in_disz_id);
    
    DELETE FROM variable WHERE disz_id = in_disz_id;

END ;;

DELIMITER ;
