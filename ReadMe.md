# aue_interlis

Centralized repo for all things schema modelling.

## Steps for (Re-)Importing Schema:

1) For executing the scripts used for schemaimports, you need a terminal with the current working directory at the project root, where `ili2pg-5.5.1.jar` is located. This is the default for this project, but if you're not already there, navigate there.

2) Check out the `scripts` directory for the given project. There you will find a `schemaimport_<schema_name>.sh` script. Additionally, there may be pre and post sql scripts which are ran before and after the schema import to prepare (usually just drop the existing schema if it already exists) and configure the created schema further (set up roles, etc). 

    > ⚠️ If the postScript includes trigger function setup, it won't be run as a postScript of the schemaimport shell script because ili2pg doesn't parse it correctly. In that case, run the postScript manually in pgAdmin. 

3) Execute the schemaimport script. For Example:
    ```bash
    ./gsbohrung/scripts/schemaimport_pub_gl_bohrkataster.sh 
    ```

4) If there the model uses a Catalogue XML, run `catalogueimport` script.

5) Set up datasets and baskets in QGIS and Model Baker:
    - In Model Baker Import/Export Wizard: Generate QGIS Project from created database schema.
    - In Model Baker Dataset Manager: Add new dataset and baskets.
      Default dataset naming: `data` 

6) Run corresponding dbt job to populate the schema in dbt workspace. See details in the ReadMe there.


## Importing Data into new Schema Version

The INTERLIS XTF data export/import mechanism comes in handy here: It simply matches class and field names when importing the values, so as long as there is a matching target field, the values get imported correctly. 

The general steps are:

1) Import new schema version (IAP)

2) Import catalogues (if applicable)

3) Export data (and only data, not catalogues!) from PROD schema to XTF using Model Baker
    - If columns changed names -> Search and replace in the XTF
    
4) Import data from XTF-Export
    - Make sure to create a new dataset to import the data into, e.g. `data`

5) Run post-import SQL script

> ⚠️ This workflow sometimes creates issues relating to INTERLIS' caching mechanism. If you get unexpected validation errors in the new schema, try clearing the ilicache under `C:\Users\<username>\.ilicache`


### Additive Model Changes

XTF imports have no problem with there being more fields or classes in the target schema than occur in the XTF. So when doing strictly additive model changes, the XTF exported from the live model can be imported straight into the new version to carry over data.

### Changing Field Names

If fields change names, this can be adjusted in the XTF directly using basic search and replace in the editor.
<!-- TODO: Test this -->

## Troubleshooting

#### Model Baker Dataset Manager doesn't recognize t_basket column
The most common cause of this is that a QGIS Model Baker project was blocking the schema, when trying to re-import the schema using the schemaimport script. Even if QGIS was closed and the schema continues and finishes successfully, this issue might result.

**Solution:**
Make sure QGIS is closed and re-import the schema.

#### Schemaimport postScript fails with error about unterminated function body (missing $$)
The SQL script passed via the `--postScript` argument is chunked into statements by splitting naively at `;`. Since function definitions use `;` within the body, the naive chunking breaks the script.

**Solution:**
Don't use `--postScript` and run the post-script manually in pgAdmin. 

## Todo

`utility/render_sql_template.py`:
- [ ] Change trigger setup, so individual insert and update trigger-trigger_function pairs are created for each table listed in the `trigger_setup` key.

- [ ] Add Option to add DEFAULT oid generation to `t_ili_tid`
