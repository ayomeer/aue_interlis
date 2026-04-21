-- Publication Data: pub_gl_grundwasservorkommen.grundwasservorkommen / .isohypse / .gwquellfassungen / .erdsonden_ausschlussbereich

-- INSERT INTO pub_gl_grundwasservorkommen.t_ili2db_dataset(t_id,datasetname) SELECT 1,'gw_ktgl';
-- INSERT INTO pub_gl_grundwasservorkommen.t_ili2db_basket(t_id,dataset,topic,t_ili_tid,attachmentkey) SELECT 2,1,'GL_Grundwasservorkommen_Publikation_V1.GW','4bf65229-f7d0-465c-9109-45e99824cb54','x';
ALTER SEQUENCE pub_gl_grundwasservorkommen.t_ili2db_seq RESTART WITH 10;

TRUNCATE pub_gl_grundwasservorkommen.grundwasservorkommen CASCADE;
TRUNCATE pub_gl_grundwasservorkommen.isohypse CASCADE;
TRUNCATE pub_gl_grundwasservorkommen.gwquellfassungen CASCADE;
TRUNCATE pub_gl_grundwasservorkommen.erdsonden_ausschlussbereich CASCADE;

-- noch keine Daten basierend auf einem Datenmodell!
INSERT INTO pub_gl_grundwasservorkommen.grundwasservorkommen 
  (
    t_basket
    ,flaeche_a
    ,vorkommen
    ,behoerde
    ,beschluss
    ,datenherr
    ,plangrundlage
    ,mutationsdatum
    ,bemerkung
    ,geometrie
  )
  SELECT 
    2
    ,round("FLAECHEM2"/100)
    ,"OBJEKTART"
    ,"BEHOERDE"
    ,"ENT_DAT"::date
    ,"DATENHERR"
    ,"PLANGRUND"
    ,"MUT_DAT"::date
    ,"BEMERKUNG"
    ,geometry
  FROM 
    dbu_aue_gs.gw
;

INSERT INTO pub_gl_grundwasservorkommen.isohypse
  (
    t_basket
    ,t_ili_tid
    ,grundwasserstand
    ,druckniveau
    ,kote
    ,geometrie
  )
  SELECT
    2
    ,t_ili_tid
    ,grundwasserstand
    ,druckniveau
    ,kote
    ,geometrie
  FROM
    gl_grundwasservorkommen.isohypse
;

-- noch keine Daten basierend auf einem Datenmodell!
INSERT INTO pub_gl_grundwasservorkommen.gwquellfassungen
  (
    t_basket
    ,schuettungsmenge
    ,behoerde
    ,beschluss
    ,datenherr
    ,plangrundlage
    ,mutationsdatum
    ,bemerkung
    ,geometrie
  )
  SELECT
    2
    ,"OBJEKTART"
    ,"BEHOERDE"
    ,"ENT_DAT"::date
    ,"DATENHERR"
    ,"PLANGRUND"
    ,"MUT_DAT"::date
    ,"BEMERKUNG"
    ,geometry
  FROM
    dbu_aue_gs.qf
;

-- noch keine Daten basierend auf einem Datenmodell!
INSERT INTO pub_gl_grundwasservorkommen.erdsonden_ausschlussbereich
  (
    t_basket
    ,art
    ,geometrie
  )
  SELECT
    2
    ,art_txt
    ,the_geom
  FROM
    dbu_aue_gs.erdsonden_ausschluss
;
