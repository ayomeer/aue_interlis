import json
from pathlib import Path
from jinja2 import Environment, FileSystemLoader


# Constants
PROJECT_ROOT = Path(__file__).resolve().parent


# Paths
path_templates = Path(PROJECT_ROOT) / "templates"
path_json_args = Path(PROJECT_ROOT) / "rendering_args.json"
path_out = Path(PROJECT_ROOT) / "output"

# Jinja Rendering Setup
env = Environment(
    loader=FileSystemLoader(path_templates),
    variable_start_string="<",
    variable_end_string=">"
)

if __name__ == '__main__':

  # Get rendering args
  with open(path_json_args) as json_file:
    rendering_args = json.load(json_file)

  # Render templates
  template = env.get_template("t_post_import.sql.j2")
  sql = template.render(**rendering_args)
  output_file = Path(path_out) / f"post_sql_{rendering_args["target_schema"]}.sql"
  output_file.write_text(sql)
