# Runs the synthesizer grid creation code.

grid_dir='/research/astrodata/highz/synthesizer/grids'
output_dir='/its/home/sw376/astrodata/gaslight/cloudy'
cloudy_output_dir='/research/astrodata/highz/synthesizer/cloudy'
cloudy_executable_path='/its/home/sw376/flare/software/cloudy'
machine='artemis'

incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0_reduced_ages_[1.00e+06,1.00e+07,1.00e+08]")
config_files=("c23.01-sps-grid")

# change directory
cd ..

for i in "${!incident_grids[@]}"; do

    incident_grid=${incident_grids[$i]}
    
    # if only one config file is provided use that for all the models
    if [ "${#config_files[@]}" -eq 1 ]; then
        config_file=${config_files[0]}
    else
        config_file=${config_files[$i]}
    fi

    echo $incident_grid $config_file

    echo create_synthesizer_grid.py \
    --incident-grid=$incident_grid \
    --grid-dir=$grid_dir \
    --cloudy-output-dir=$cloudy_output_dir \
    --cloudy-paramfile=$config_file \
    --include-spectra \
    --machine=$machine \
    --cloudy-executable-path=$cloudy_executable_path \

    python create_synthesizer_grid.py \
    --incident-grid=$incident_grid \
    --grid-dir=$grid_dir \
    --cloudy-output-dir=$cloudy_output_dir \
    --cloudy-paramfile=$config_file \
    --include-spectra \
    --machine=$machine \
    --cloudy-executable-path=$cloudy_executable_path \
    | tee ${incident_grid}_cloudy-${config_file}.out
    
done