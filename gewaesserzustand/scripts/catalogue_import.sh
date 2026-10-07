java -jar ili2pg-5.5.1.jar \
  --dbhost srv-gisiap-02.glnet.ch \
  --dbport 5432 \
  --dbdatabase glarus \
  --dbusr gisuploadmanager \
  --dbpwd $DB_PASSWORD \
  --dbschema prod_gl_gewaesserzustand \
  --importTid \
  --replace \
  --dataset catalogues "gewaesserzustand/model/Prod_Gewaesserzustand_Catalogues_V1.xml" # path to catalogues xtf