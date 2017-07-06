
-- Tables

ALTER TABLE variable ADD (disz_id INTEGER NOT NULL, var_sortIndex INTEGER);
ALTER TABLE variable ADD CONSTRAINT varSortIndex UNIQUE (disz_id, var_sortIndex);

DROP TABLE disziplin_variable;

-- Procedures

DROP PROCEDURE IF EXISTS VariableZuDisziplinZuordnen;
DROP PROCEDURE IF EXISTS VariableVonDisziplinEntfernen;
DROP PROCEDURE IF EXISTS VariableAnlegen;
DROP PROCEDURE IF EXISTS VariableBearbeiten;
DROP PROCEDURE IF EXISTS VariablenEinerDisziplinAnzeigen;

DELIMITER ;;

CREATE PROCEDURE `VariableAnlegen`(
    var_name tinytext,
    var_descr text,
    var_exprParam tinytext,
    typ_id int,
    disz_id int,
    var_sortIndex int
)
BEGIN

    INSERT INTO variable (var_name, var_descr, var_exprParam, typ_id, disz_id, var_sortIndex) VALUES
    (var_name, var_descr, var_exprParam, typ_id, disz_id, var_sortIndex);

    SELECT * FROM variable WHERE var_id = LAST_INSERT_ID();

END ;;

CREATE PROCEDURE `VariableBearbeiten`(
    in_var_id int,
    in_var_name tinytext,
    in_var_descr text,
    in_var_exprParam tinytext,
    in_typ_id int,
    in_var_sortIndex int
)
BEGIN

    UPDATE variable SET
    var_name = in_var_name,
    var_descr = in_var_descr,
    var_exprParam = in_var_exprParam,
    typ_id = in_typ_id,
    var_sortIndex = in_var_sortIndex
    WHERE var_id = in_var_id;

    SELECT * FROM variable WHERE var_id = in_var_id;

END ;;

CREATE PROCEDURE `VariablenEinerDisziplinAnzeigen`(
    in_disz_id int
)
BEGIN

    SELECT * FROM variable WHERE disz_id = in_disz_id;

END ;;

DELIMITER ;
