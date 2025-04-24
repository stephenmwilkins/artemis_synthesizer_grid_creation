# Edits a set of cloudy input files. In this case the script removes the "iterate to convergence" line for failed models.

cloudy_output_dir='/research/astrodata/highz/synthesizer/cloudy'

incident_grid="qsosed-isotropic-limited"
config_file="c23.01-blr-limited"

# Define grid name
grid_name=${incident_grid}_cloudy-${config_file}

# change directory
cd ..


python edit_cloudy_inputs.py \
--cloudy-output-dir=${cloudy_output_dir} \
--grid-name=${grid_name} \
--list-file=${grid_name}.failures \
--line_to_edit="iterate to convergence" \


