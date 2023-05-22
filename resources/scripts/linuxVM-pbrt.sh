#!/usr/bin/env bash

export PATH=$HOME/pbrt-v3:$PATH

#log format
# <os>-<scene>-<config>.txt

#pbrt file format
# <scene>-<config>.pbrt

#config format
#Accelerator "bvh"
#Accelerator "kdtree"
#PixelFilter "mitchell"
#PixelFilter "sinc"

output_file="output.txt"
os=linuxVM

# Read the CSV file and iterate through each row
while IFS=',' read -r scene config; do
  output_file="log-$os-$scene-$config.txt"
  # Use the values of the current row for iteration
  output="Processing scene: $scene with configuration: $config and output file: $output_file"
  echo "$output" | tee -a "$output_file"
  pbrt ~/scenes/$scene/$scene-$config.pbrt >> $output_file 2>&1
  current_date=$(date)
  echo "$current_date" >> $output_file
  num_files=$(ls -1 $HOME/generated/ | wc -c | tr -d '       ')

  mv "$scene.exr" "$HOME/generated/$scene-$config-$num_files.exr"
  
done < $os-tests.csv
