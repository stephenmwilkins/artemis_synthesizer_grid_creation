# Submit entire test suite

grid_dir='/research/astrodata/highz/synthesizer/grids'
output_dir='/its/home/sw376/astrodata/gaslight/cloudy'
cloudy_output_dir='/research/astrodata/highz/synthesizer/cloudy'
cloudy_executable_path='/its/home/sw376/flare/software/cloudy'
machine='artemis'

# incident grid to use
incident_grid="bpass-2.2.1-bin_chabrier03-0.1,300.0-new_ages:6,7,8"

# default parameter file
default_config_file="c23.01-sps"

config_files=(
  "CMB"
  "QnH"
  "alpha"
  "column_density"
  "constant_pressure"
  "default"
  "depletion_model:CloudyClassic"
  "depletion_model:Gutkin2016"
  "depletion_model:None"
  "depletion_scale"
  "fixed_ionisation_parameter"
  "grains:ISM"
  "hydrogen_density"
  "no_abundance_scalings"
  "no_grains"
  "planeparallel"
  "reference_abundance:Asplund2009"
  "reference_abundance:Gutkin2016"
  "reference_ionisation_parameter"
)

# change directory
cd ..

for i in "${!config_files[@]}"; do

    config_file=${config_files[$i]}
    echo sbatch ${incident_grid}_cloudy_${default_config_file}-$config_file
    sbatch ${incident_grid}_cloudy_${default_config_file}-$config_file
    
done