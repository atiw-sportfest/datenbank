
SET @t_int=100;
SET @t_str=101;
SET @t_stz=102;

SET @d_wts=1000;
SET @d_elt=1337;

-- Typen

INSERT IGNORE INTO typ (typ_id,typ_name,typ_descr,typ_typ) VALUES (@t_int, "Ganzzahl", "Einfacher Zahlewert","int"), (@t_str, "Zeichenkette", "Zeichenkette","java.lang.String"), (@t_stz, "Sternzeichen", "Ein Sternzeichen","String");

INSERT IGNORE INTO typzustand (typ_id,tzst_name,tzst_val) VALUES (@t_stz, "Steinbock", "steinbock"), (@t_stz, "Fische", "fische"), (@t_stz, "Wassermann", "wassermann");

INSERT IGNORE INTO disziplin (disziplinid,name,beschreibung,mindestanzahl,maximalanzahl,aktiviert,teamleistung) VALUES (@d_wts,"Weitsprung","Weit springen",2,2,true,false), (@d_elt,"Disziplin 1337","10 Menschen...",2,2,true,true);

INSERT IGNORE INTO variable (var_id,var_name,var_descr,var_exprParam,typ_id) VALUES (2000,"Weite", "Weite in cm", "w", @t_int), (2001,"Sternzeichen", "Das Sternzeichen des Teilnehmers", "stz", @t_stz);
INSERT IGNORE INTO disziplin_variable (var_id,disz_id) VALUES (2000,@d_wts), (2000,@d_elt), (2001,@d_elt);
