
-- Drop unused catref tables
DROP TABLE prod_gl_gewaesserzustand.art_gruppierung_catref;
DROP TABLE prod_gl_gewaesserzustand.erhebung_catref;
DROP TABLE prod_gl_gewaesserzustand.gewaessertyp_catref;
DROP TABLE prod_gl_gewaesserzustand.parameter_catref;
DROP TABLE prod_gl_gewaesserzustand.periodizitaet_catref;
DROP TABLE prod_gl_gewaesserzustand.tel_typ_catref;

-- Create Domains for custom Enum-Types


CREATE DOMAIN prod_gl_gewaesserzustand.messgruppierung_standort_typ_enum as TEXT
CHECK (VALUE IN ('Probeentnahmestandort','Stationsstandort'));

ALTER TABLE prod_gl_gewaesserzustand.messgruppierung
ALTER COLUMN standort_typ TYPE prod_gl_gewaesserzustand.messgruppierung_standort_typ_enum;


-- Add last_modified columns ---------------------------------------------------

-- messgruppierung
ALTER TABLE prod_gl_gewaesserzustand.messgruppierung
ADD COLUMN last_modified timestamp without time zone;

CREATE FUNCTION prod_gl_gewaesserzustand.messgruppierung_update()
  RETURNS TRIGGER
  LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
NEW.last_modified = localtimestamp(0);
RETURN NEW;
END;
$BODY$;

ALTER FUNCTION prod_gl_gewaesserzustand.messgruppierung_update()
  OWNER TO prod_gl_gewaesserzustand_write;

CREATE TRIGGER messgruppierung_update
  BEFORE UPDATE
  ON prod_gl_gewaesserzustand.messgruppierung
  EXECUTE FUNCTION prod_gl_gewaesserzustand.messgruppierung_update();

-- werterhebung
ALTER TABLE prod_gl_gewaesserzustand.werterhebung
ADD COLUMN last_modified timestamp without time zone;

CREATE FUNCTION prod_gl_gewaesserzustand.werterhebung_update()
  RETURNS TRIGGER
  LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
NEW.last_modified = localtimestamp(0);
RETURN NEW;
END;
$BODY$;

ALTER FUNCTION prod_gl_gewaesserzustand.werterhebung_update()
  OWNER TO prod_gl_gewaesserzustand_write;

CREATE TRIGGER werterhebung_update
  BEFORE UPDATE
  ON prod_gl_gewaesserzustand.werterhebung
  EXECUTE FUNCTION prod_gl_gewaesserzustand.werterhebung_update();

-- messnetz
ALTER TABLE prod_gl_gewaesserzustand.messnetz
ADD COLUMN last_modified timestamp without time zone;

CREATE FUNCTION prod_gl_gewaesserzustand.messnetz_update()
  RETURNS TRIGGER
  LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
NEW.last_modified = localtimestamp(0);
RETURN NEW;
END;
$BODY$;

ALTER FUNCTION prod_gl_gewaesserzustand.messnetz_update()
  OWNER TO prod_gl_gewaesserzustand_write;

CREATE TRIGGER messnetz_update
  BEFORE UPDATE
  ON prod_gl_gewaesserzustand.messnetz
  EXECUTE FUNCTION prod_gl_gewaesserzustand.messnetz_update();

-- verantwortlichkeit
ALTER TABLE prod_gl_gewaesserzustand.verantwortlichkeit
ADD COLUMN last_modified timestamp without time zone;

CREATE FUNCTION prod_gl_gewaesserzustand.verantwortlichkeit_update()
  RETURNS TRIGGER
  LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
NEW.last_modified = localtimestamp(0);
RETURN NEW;
END;
$BODY$;

ALTER FUNCTION prod_gl_gewaesserzustand.verantwortlichkeit_update()
  OWNER TO prod_gl_gewaesserzustand_write;

CREATE TRIGGER verantwortlichkeit_update
  BEFORE UPDATE
  ON prod_gl_gewaesserzustand.verantwortlichkeit
  EXECUTE FUNCTION prod_gl_gewaesserzustand.verantwortlichkeit_update();

