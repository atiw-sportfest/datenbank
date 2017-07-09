
DROP TABLE IF EXISTS regelsatz;

CREATE TABLE regelsatz (
    rsatz_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    disz_id INTEGER,
    rsatz_sort BIT,
    CONSTRAINT rsatz_disz_id FOREIGN KEY (disz_id) REFERENCES disziplin(DisziplinID)
);

ALTER TABLE regel DROP FOREIGN KEY FKregel50152;
ALTER TABLE regel DROP KEY regel;
ALTER TABLE regel DROP DisziplinID;

ALTER TABLE regel ADD rsatz_id INTEGER NOT NULL AFTER RegelID;
ALTER TABLE regel ADD CONSTRAINT regel_rsatz_id_fk FOREIGN KEY (rsatz_id) REFERENCES regelsatz(rsatz_id);
ALTER TABLE regel ADD CONSTRAINT regel_idx_unq UNIQUE (rsatz_id,idx);


DROP PROCEDURE IF EXISTS RegelsatzAnlegen;
DROP PROCEDURE IF EXISTS RegelsatzAnzeigen;
DROP PROCEDURE IF EXISTS RegelsatzBearbeiten;
DROP PROCEDURE IF EXISTS RegelsatzEnfernen;
DROP PROCEDURE IF EXISTS RegelsaetzeAnzeigen;

DROP PROCEDURE IF EXISTS RegelsaetzeEinerDisziplinAnzeigen;
DROP PROCEDURE IF EXISTS RegelnEinesRegelsatzesAnzeigen;

DELIMITER ;;

CREATE PROCEDURE RegelsaetzeEinerDisziplinAnzeigen (
    in_disz_id int
)
BEGIN

    SELECT * FROM regelsatz WHERE disz_id = in_disz_id;

END ;;


CREATE PROCEDURE RegelnEinesRegelsatzesAnzeigen (
    in_rsatz_id int
)
BEGIN

    SELECT * FROM regel WHERE rsatz_id = in_rsatz_id ORDER BY idx DESC;

END ;;

DELIMITER ;
