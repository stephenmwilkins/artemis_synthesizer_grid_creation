incident_grids=(
    bc03-2016-BaSeL_chabrier-0.1,100,
    bc03-2016-BaSeL_kroupa-0.1,100,
    bc03-2016-BaSeL_salpeter-0.1,100,
    bc03-2016-Miles_chabrier-0.1,100,
    bc03-2016-Miles_kroupa-0.1,100,
    bc03-2016-Miles_salpeter-0.1,100,
    bc03-2016-Stelib_chabrier-0.1,100,
    bc03-2016-Stelib_kroupa-0.1,100,
    bc03-2016-Stelib_salpeter-0.1,100,
    bc03_chabrier03-0.1,100,
    bpass-2.2.1-bin_bpl-0.1,1.0,100.0-1.3,2.0,
    bpass-2.2.1-bin_bpl-0.1,1.0,100.0-1.3,2.35,
    bpass-2.2.1-bin_bpl-0.1,1.0,100.0-1.3,2.7,
    bpass-2.2.1-bin_bpl-0.1,1.0,300.0-1.3,2.0,
    bpass-2.2.1-bin_bpl-0.1,1.0,300.0-1.3,2.35,
    bpass-2.2.1-bin_bpl-0.1,1.0,300.0-1.3,2.7,
    bpass-2.2.1-bin_chabrier03-0.1,100.0,
    bpass-2.2.1-bin_chabrier03-0.1,300.0,
    bpass-2.2.1-sin_bpl-0.1,1.0,100.0-1.3,2.0,
    bpass-2.2.1-sin_bpl-0.1,1.0,100.0-1.3,2.35,
    bpass-2.2.1-sin_bpl-0.1,1.0,100.0-1.3,2.7,
    bpass-2.2.1-sin_bpl-0.1,1.0,300.0-1.3,2.0,
    bpass-2.2.1-sin_bpl-0.1,1.0,300.0-1.3,2.35,
    bpass-2.2.1-sin_bpl-0.1,1.0,300.0-1.3,2.7,
    bpass-2.2.1-sin_chabrier03-0.1,100.0,
    bpass-2.2.1-sin_chabrier03-0.1,300.0,
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35,
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha-0.2,
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.0,
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.2,
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.4,
    bpass-2.3-bin_bpl-0.1,1.0,300.0-1.3,2.35_alpha0.6,
)
config_files=("c23.01-sps")


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

    echo sbatch ${incident_grid}_cloudy-${config_file}.slurm
    sbatch ${incident_grid}_cloudy-${config_file}.slurm

done