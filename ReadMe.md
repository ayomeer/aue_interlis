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
      Default dataset naming: `Baseset` 

6) Run corresponding dbt job to populate the schema in dbt workspace. See details in the ReadMe there.

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

- [x] Implement argparse for  `utility/render_sql_template.py` 
  - path_rendering_args
  - path_out

