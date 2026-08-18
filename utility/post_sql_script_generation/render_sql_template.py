import argparse
import json
from pathlib import Path
from jinja2 import Environment, FileSystemLoader


# Constants
PROJECT_ROOT = Path(__file__).resolve().parent

# Paths
path_templates = Path(PROJECT_ROOT) / "templates"
default_output_path = Path(PROJECT_ROOT) / "output"

# Jinja Rendering Setup
env = Environment(
    loader=FileSystemLoader(path_templates),
    variable_start_string="<",
    variable_end_string=">"
)

if __name__ == '__main__':

  # -- Parse Input --------------------------------------------------------------------------------
  parser = argparse.ArgumentParser(
    description="""
        Utility for generating SQL scripts for common post INTERLIS schemaimport DDL changes and 
        additions. Takes a rendering args as json and outputs SQL Script at given output path.""",
    add_help=True,
  )
  parser.add_argument(
      "--path_rendering_args",
      "-a",
      dest="path_rendering_args",
      type=Path,
      required=True,
      help="Path to rendering args json file.",
  )
  parser.add_argument(
      "--path_output",
      "-o",
      dest="path_output",
      type=Path,
      default=default_output_path, # required=True,
      help="Path of output directory for generated file.",
  )
  args = parser.parse_args()

  # -- Render SQL Script from Template ------------------------------------------------------------
  print(f"Loading file {args.path_rendering_args.resolve()}.")
  with open(args.path_rendering_args) as json_file:
    rendering_args = json.load(json_file)

  # Render templates
  template = env.get_template("t_post_import.sql.j2")
  sql = template.render(**rendering_args)

  # Write text to file
  output_file = Path(args.path_output) / f"post_sql_{rendering_args["target_schema"]}.sql"

  print(f"Writing output to {output_file.resolve()}")
  output_file.write_text(sql)
