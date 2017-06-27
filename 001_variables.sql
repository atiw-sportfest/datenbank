DROP TABLE IF EXISTS disziplin_variable;
DROP TABLE IF EXISTS variable;
DROP TABLE IF EXISTS typzustand;
DROP TABLE IF EXISTS typ;

CREATE TABLE typ (

    typ_id INT PRIMARY KEY AUTO_INCREMENT,

    typ_name TINYTEXT NOT NULL,
    typ_descr TEXT,
    typ_typ TINYTEXT NOT NULL

);

CREATE TABLE variable (

    var_id INT PRIMARY KEY AUTO_INCREMENT,

    var_name TINYTEXT NOT NULL,
    var_descr TEXT,
    var_exprParam TINYTEXT NOT NULL,

    typ_id INT,

    CONSTRAINT fk_variable_typ FOREIGN KEY (typ_id) REFERENCES typ(typ_id)
);

CREATE TABLE typzustand (

    zid INT PRIMARY KEY AUTO_INCREMENT,
    typ_id INT,

    tzst_name TINYTEXT NOT NULL,
    tzst_descr TEXT,
    tzst_val varchar(32) NOT NULL,

    CONSTRAINT fk_typzustand_typ FOREIGN KEY (typ_id) REFERENCES typ(typ_id),
    CONSTRAINT uq_typzustand_val UNIQUE (typ_id,tzst_val)

);


CREATE TABLE disziplin_variable (

    var_id INT,
    disz_id INT,

    PRIMARY KEY (var_id,disz_id),

    CONSTRAINT fk_disz_var_var FOREIGN KEY (var_id) REFERENCES variable(var_id),
    CONSTRAINT fk_disz_var_disz FOREIGN KEY (disz_id) REFERENCES disziplin(disziplinid)
);

DROP PROCEDURE IF EXISTS VariableAnzeigen;

DELIMITER ;;
CREATE PROCEDURE VariableAnzeigen(
    vid int)
BEGIN

    SELECT * FROM variable WHERE var_id = vid;

END ;;
DELIMITER ;
