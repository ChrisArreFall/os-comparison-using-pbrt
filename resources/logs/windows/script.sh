#!/bin/bash

# Directory containing the files
directory=$PWD

# Iterate over each file in the directory
for file in "$directory"/*
do
    # Check if the file is a regular file
    if [[ -f "$file" ]]; then
	  echo $file >> names.txt
        # Search for time
        grep -Eo '\([0-9]+\.[0-9]+s\)' "$file" | sed 's/[()]//g; s/s$//'
    fi
done