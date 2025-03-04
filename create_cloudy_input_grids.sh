# Runs the grid setup script for a series of grids and configurations.
# This should create slurm job script that can be simply submitted to the 
# queue.

grid_dir='/research/astrodata/highz/synthesizer/grids'
cloudy_output_dir='/research/astrodata/highz/synthesizer/cloudy'
cloudy_executable_path='/its/home/sw376/flare/software/cloudy'
machine='artemis'

# list of incident grids
incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0")
# incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0-new_ages:6,7,8")
incident_grids=("qsosed-limited")

# list of config files
config_files=("c23.01-sps")
# config_files=("c23.01-sps-grid_limited")
config_files=("c23.01-agn-limited")


# change directory
cd ..

for i in "${!incident_grids[@]}"; do

    incident_grid=${incident_grids[$i]}
    config_file=${config_files[$i]}

    python create_cloudy_input_grid.py \
        --incident-grid=$incident_grid \
        --grid-dir=$grid_dir \
        --cloudy-output-dir=$cloudy_output_dir \
        --cloudy-paramfile=$config_file \
        --machine=$machine \
        --cloudy-executable-path=$cloudy_executable_path

done