# Runs the grid setup script for a series of grids and configurations.
# This should create slurm job script that can be simply submitted to the 
# queue.

grid_dir='/research/astrodata/highz/synthesizer/grids'
cloudy_output_dir='/research/astrodata/highz/synthesizer/cloudy'
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

    python create_cloudy_input_grid.py \
        --incident-grid=$incident_grid \
        --grid-dir=$grid_dir \
        --cloudy-output-dir=$cloudy_output_dir \
        --cloudy-paramfile=c23.01-sps \
        --machine=$machine \
        --cloudy-executable-path=$cloudy_executable_path

done