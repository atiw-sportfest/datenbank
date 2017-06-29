
-- DROP

DROP PROCEDURE IF EXISTS RegelAnzeigen;
DROP PROCEDURE IF EXISTS RegelAnlegen;
DROP PROCEDURE IF EXISTS RegelBearbeiten;

DROP PROCEDURE IF EXISTS VariableAnlegen;
DROP PROCEDURE IF EXISTS VariableAnzeigen;
DROP PROCEDURE IF EXISTS VariableEntfernen;
DROP PROCEDURE If EXISTS VariableBearbeiten;

DROP PROCEDURE IF EXISTS TypAnlegen;
DROP PROCEDURE IF EXISTS TypAnzeigen;
DROP PROCEDURE IF EXISTS TypenAnzeigen;
DROP PROCEDURE IF EXISTS TypEntfernen;
DROP PROCEDURE If EXISTS TypBearbeiten;

DROP PROCEDURE IF EXISTS ZustandAnlegen;
DROP PROCEDURE IF EXISTS ZustandAnzeigen;
DROP PROCEDURE IF EXISTS ZustandEntfernen;
DROP PROCEDURE If EXISTS ZustandBearbeiten;

-- DROP forever, not needed
DROP PROCEDURE IF EXISTS RegelnAnzeigen;

-- PROCEDURES START
DELIMITER ;;

CREATE PROCEDURE RegelAnzeigen (
    in_r_id int
)
BEGIN
    SELECT * FROM regel WHERE RegelID = in_r_id;
END ;;

CREATE PROCEDURE RegelAnlegen (
    disz_id int,
    expr text,
    idx int,
    points int
)
BEGIN
    INSERT INTO regel (disziplinid, expr, idx, points) VALUES (disz_id, expr, idx, points);
    SELECT LAST_INSERT_ID() AS "RegelID";
END ;;

CREATE PROCEDURE RegelBearbeiten(
    in_rid int,
    in_expr text,
    in_idx int,
    in_points int
)
BEGIN
    UPDATE regel SET expr = in_expr, idx = in_idx, points = in_points WHERE RegelID = in_rid;
END ;;

CREATE PROCEDURE VariableAnlegen (
    var_name tinytext,
    var_descr text,
    var_exprParam tinytext,
    typ_id int
)
BEGIN
    INSERT INTO variable (var_name, var_descr, var_exprParam, typ_id) VALUES (var_name, var_descr, var_exprParam, typ_id);
    SELECT * FROM variable WHERE var_id = LAST_INSERT_ID();
END ;;

CREATE PROCEDURE VariableAnzeigen (
    in_var_id int
)
BEGIN
    SELECT * FROM variable WHERE var_id = in_var_id;
END ;;

CREATE PROCEDURE VariableEntfernen (
    in_var_id int
)
BEGIN
    DELETE FROM variable WHERE var_id = in_var_id;
END ;;

CREATE PROCEDURE VariableBearbeiten (
    in_var_id int,
    in_var_name tinytext,
    in_var_descr text,
    in_var_exprParam tinytext,
    in_typ_id int
)
BEGIN
    UPDATE variable SET var_name = in_var_name, var_descr = in_var_descr, var_exprParam = in_var_exprParam, typ_id = in_typ_id WHERE var_id = in_var_id;
    SELECT * FROM variable WHERE var_id = in_var_id;
END ;;

CREATE PROCEDURE TypAnlegen (
    typ_name tinytext,
    typ_descr text,
    typ_typ tinytext
)
BEGIN
    INSERT INTO typ (typ_name, typ_descr, typ_typ) VALUES (typ_name, typ_descr, typ_typ);
    SELECT * FROM typ WHERE typ_id = LAST_INSERT_ID();
END ;;

CREATE PROCEDURE TypAnzeigen (
    in_typ_id int
)
BEGIN
    SELECT * FROM typ WHERE typ_id = in_typ_id;
END ;;

CREATE PROCEDURE TypenAnzeigen ()
BEGIN
    SELECT * FROM typ;
END ;;

CREATE PROCEDURE TypEntfernen (
    in_typ_id int
)
BEGIN
    DELETE FROM typzustand WHERE typ_id = in_typ_id;
    DELETE FROM typ WHERE typ_id = in_typ_id;
END ;;

CREATE PROCEDURE TypBearbeiten (
    in_typ_id int,
    in_typ_name tinytext,
    in_typ_descr text,
    in_typ_typ tinytext
)
BEGIN
    UPDATE typ SET typ_name = in_typ_name, typ_descr = in_typ_descr, typ_typ = in_typ_typ WHERE typ_id = in_typ_id;
    SELECT * FROM typ WHERE typ_id = in_typ_id;
END ;;

CREATE PROCEDURE ZustandAnlegen (
    typ_id int,
    tzst_name tinytext,
    tzst_descr text,
    tzst_val varchar(32)
)
BEGIN
    INSERT INTO typzustand (typ_id, tzst_name, tzst_descr, tzst_val) VALUES (typ_id, tzst_name, tzst_descr, tzst_val);
    SELECT * FROM typzustand WHERE zid = LAST_INSERT_ID();
END ;;

CREATE PROCEDURE ZustandAnzeigen (
    in_z_id int
)
BEGIN
    SELECT * FROM typzustand WHERE zid = in_z_id;
END ;;

CREATE PROCEDURE ZustandEntfernen (
    in_z_id int
)
BEGIN
    DELETE FROM typzustand WHERE zid = in_z_id;
END ;;

CREATE PROCEDURE ZustandBearbeiten (
    in_z_id int,
    in_tzst_name tinytext,
    in_tzst_descr text,
    in_tzst_val varchar(32)
)
BEGIN
    UPDATE typzustand SET tzst_name = in_tzst_name, tzst_descr = in_tzst_descr, tzst_val = in_tzst_val WHERE zid = in_z_id;
    SELECT * FROM typzustand WHERE zid = in_z_id;
END ;;

DELIMITER ;

-- PROCEDURE END

