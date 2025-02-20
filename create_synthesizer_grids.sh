# Runs the synthesizer grid creation code.

grid_dir='/research/astrodata/highz/synthesizer/grids'
output_dir='/its/home/sw376/astrodata/gaslight/cloudy'
cloudy_output_dir='research/astrodata/highz/synthesizer/cloudy'
cloudy_executable_path='/its/home/sw376/flare/software/cloudy'
machine='artemis'

# list of incident grids
incident_grids=("test")

# list of config files
config_files=("c23.01-sps")

# change directory
cd ..

for i in "${!incident_grids[@]}"; do

    incident_grid=${incident_grids[$i]}
    config_file=${config_files[$i]}

    python create_synthesizer_grid.py \
    --incident-grid=$incident_grid \
    --grid-dir=$grid_dir \
    --cloudy-output-dir=$cloudy_output_dir \
    --cloudy-paramfile=$config_file \

done