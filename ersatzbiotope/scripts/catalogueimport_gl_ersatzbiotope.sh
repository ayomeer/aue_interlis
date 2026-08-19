java -jar ili2pg-5.5.1.jar \
  --dbhost localhost \
  --dbusr postgres \
  --dbpwd postgres \
  --dbdatabase test_db \
  --dbschema gl_ersatzbiotope \
  --importTid \
  --replace \
  --dataset catalogues \
  ersatzbiotope/model/gl_ersatzbiotope_catalogues.xtf