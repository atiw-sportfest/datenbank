
ALTER TABLE variable ADD CONSTRAINT disz_id FOREIGN KEY (disz_id) REFERENCES disziplin(disziplinid);
ALTER TABLE variable ADD (var_sortAsc BIT);

DROP PROCEDURE IF EXISTS VariableAnlegen;
DROP PROCEDURE IF EXISTS VariableBearbeiten;

DELIMITER ;;

CREATE PROCEDURE `VariableAnlegen`(
    var_name tinytext,
    var_descr text,
    var_exprParam tinytext,
    typ_id int,
    disz_id int,
    var_sortIndex int,
    var_sortAsc bit 
)
BEGIN

    INSERT INTO variable (var_name, var_descr, var_exprParam, typ_id, disz_id, var_sortIndex, var_sortAsc) VALUES
    (var_name, var_descr, var_exprParam, typ_id, disz_id, var_sortIndex, var_sort);

    SELECT * FROM variable WHERE var_id = LAST_INSERT_ID();

END ;;

CREATE PROCEDURE `VariableBearbeiten`(
    in_var_id int,
    in_var_name tinytext,
    in_var_descr text,
    in_var_exprParam tinytext,
    in_typ_id int,
    in_var_sortIndex int,
    in_var_sortAsc bit
)
BEGIN

    UPDATE variable SET
    var_name = in_var_name,
    var_descr = in_var_descr,
    var_exprParam = in_var_exprParam,
    typ_id = in_typ_id,
    var_sortIndex = in_var_sortIndex,
    var_sortAsc = in_var_sortAsc
    WHERE var_id = in_var_id;

    SELECT * FROM variable WHERE var_id = in_var_id;

END ;;

DELIMITER ;
