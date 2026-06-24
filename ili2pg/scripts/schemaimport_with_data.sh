java -jar ili2pg-5.5.1.jar --schemaimport \
  --dbhost localhost \
  --dbport 5432 \
  --dbdatabase test_db \
  --dbusr postgres \
  --dbpwd postgres \
  --dbschema $2 \
  --defaultSrsAuth EPSG \
  --defaultSrsCode 2056 \
  --createFk \
  --createFkIdx \
  --createGeomIdx \
  --createTidCol \
  --createBasketCol \
  --createNumChecks \
  --createUnique \
  --setupPgExt \
  --strokeArcs \
  --coalesceCatalogueRef \
  --coalesceMultiSurface \
  --coalesceMultiPoint \
  --coalesceMultiLine \
  --smart2Inheritance \
  --createMetaInfo \
  --iliMetaAttrs iliMetaAttrs.toml \
  --models $1 # ili model (remote)


java -jar ili2pg-5.5.1.jar \
  --dbhost localhost \
  --dbusr postgres \
  --dbpwd postgres \
  --dbdatabase test_db \
  --dbschema $2 \
  --importTid \
  --replace \
  --dataset catalogues $3 # path to catalogues xtf