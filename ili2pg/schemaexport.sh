java -jar ili2pg-5.5.1.jar --export \
  --models GL_Ersatzbiotope_V1 \
  --dbhost localhost \
  --dbport 5432 \
  --dbdatabase test_db \
  --dbusr postgres \
  --dbpwd postgres \
  db_exports/output.xtf