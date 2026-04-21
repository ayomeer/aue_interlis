java -jar ili2pg-5.5.1.jar --schemaimport \
  --dbhost localhost \
  --dbport 5432 \
  --dbdatabase test-db \
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
  $1 # path to ili model passed as first argument when calling the script
