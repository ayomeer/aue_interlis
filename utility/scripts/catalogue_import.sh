java -jar ili2pg-5.5.1.jar \
  --dbhost localhost \
  --dbusr postgres \
  --dbpwd postgres \
  --dbdatabase test_db \
  --dbschema $1 \
  --importTid \
  --replace \
  --dataset catalogues $2 # path to catalogues xtf