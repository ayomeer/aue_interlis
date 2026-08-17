java -jar ili2pg-5.5.1.jar \
  --dbhost localhost \
  --dbusr postgres \
  --dbpwd postgres \
  --dbdatabase test_db \
  --dbschema prod_gl_gewaesserzustand \
  --importTid \
  --replace \
  --dataset catalogues "gewaesserzustand/model/Prod_Gewaesserzustand_Catalogues_V1.xml" # path to catalogues xtf