# Runs the grid setup script for a series of grids and configurations.
# This should create slurm job script that can be simply submitted to the 
# queue.

grid_dir='/research/astrodata/highz/synthesizer/grids'
cloudy_output_dir='/research/astrodata/highz/synthesizer/cloudy'
cloudy_executable_path='/its/home/sw376/flare/software/cloudy'
machine='artemis'

# list of incident grids

# incident_grids=("bpass-2.2.1-bin_chabrier03-0.1,300.0")
# config_files=("c23.01-sps")

incident_grids=("qsosed-test" "qsosed-test" "relqso-test" "relqso-test")
config_files=("c23.01-blr-test" "c23.01-nlr-test" "c23.01-blr-test" "c23.01-nlr-test")


# config_files=("c23.01-blr" "c23.01-blr-efrac:-2" "c23.01-nlr" "c23.01-blr" "c23.01-blr-efrac:-2" "c23.01-nlr")


incident_grids=(
    bc03-2016-BaSeL_chabrier-0.1,100
    bc03-2016-BaSeL_kroupa-0.1,100
    bc03-2016-BaSeL_salpeter-0.1,100
    bc03-2016-Miles_chabrier-0.1,100
    bc03-2016-Miles_kroupa-0.1,100
    bc03-2016-Miles_salpeter-0.1,100
    bc03-2016-Stelib_chabrier-0.1,100
    bc03-2016-Stelib_kroupa-0.1,100
    bc03-2016-Stelib_salpeter-0.1,100
    bc03_chabrier03-0.1,100
    bpass-2.2.1-bin_bpl-0.1,1.0,100.0-1.3,2.0
    bpass-2.2.1-bin_bpl-0.1,1.0,100.0-1.3,2.35
    bpass-2.2.1-bin_bpl-0.1,1.0,100.0-1.3,2.7
    bpass-2.2.1-bin_bpl-0.1,1.0,300.0-1.3,2.0
    bpass-2.2.1-bin_bpl-0.1,1.0,300.0-1.3,2.35
    bpass-2.2.1-bin_bpl-0.1,1.0,300.0-1.3,2.7
    bpass-2.2.1-bin_chabrier03-0.1,100.0
    bpass-2.2.1-bin_chabrier03-0.1,300.0
    bpass-2.2.1-sin_bpl-0.1,1.0,100.0-1.3,2.0
    bpass-2.2.1-sin_bpl-0.1,1.0,100.0-1.3,2.35
    bpass-2.2.1-sin_bpl-0.1,1.0,100.0-1.3,2.7
    bpass-2.2.1-sin_bpl-0.1,1.0,300.0-1.3,2.0
    bpass-2.2.1-sin_bpl-0.1,1.0,300.0-1.3,2.35
    bpass-2.2.1-sin_bpl-0.1,1.0,300.0-1.3,2.7
    bpass-2.2.1-sin_chabrier03-0.1,100.0
    bpass-2.2.1-sin_chabrier03-0.1,300.0
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha-0.2
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.0
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.2
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.4
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.6
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,1.5
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,1.6
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,1.7
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,1.8
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,1.9
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.0
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.1
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.2
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.3
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.4
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.5
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.6
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.7
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.8
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,2.9
    fsps-3.2-mist-miles_bpl-0.08,0.5,1,120-1.3,2.3,3.0
    fsps-3.2-mist-miles_chabrier03-0.08,1
    fsps-3.2-mist-miles_chabrier03-0.08,10
    fsps-3.2-mist-miles_chabrier03-0.08,100
    fsps-3.2-mist-miles_chabrier03-0.08,2
    fsps-3.2-mist-miles_chabrier03-0.08,20
    fsps-3.2-mist-miles_chabrier03-0.08,5
    fsps-3.2-mist-miles_chabrier03-0.08,50
    fsps-3.2-mist-miles_chabrier03-0.5,120
    fsps-3.2-mist-miles_chabrier03-1,120
    fsps-3.2-mist-miles_chabrier03-10,120
    fsps-3.2-mist-miles_chabrier03-2,120
    fsps-3.2-mist-miles_chabrier03-20,120
    fsps-3.2-mist-miles_chabrier03-5,120
    fsps-3.2-mist-miles_chabrier03-50,120
)
config_files=("c23.01-sps")


incident_grids=("qsosed-isotropic-limited")
config_files=("c23.01-blr-limited")


# config_files=("c23.01-blr" "c23.01-blr-efrac:-2" "c23.01-nlr" "c23.01-blr" "c23.01-blr-efrac:-2" "c23.01-nlr")

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

    echo $i, $incident_grid, $config_file

    python create_cloudy_input_grid.py \
        --incident-grid=$incident_grid \
        --grid-dir=$grid_dir \
        --cloudy-output-dir=$cloudy_output_dir \
        --cloudy-paramfile=$config_file \
        --machine=$machine \
        --cloudy-executable-path=$cloudy_executable_path

done