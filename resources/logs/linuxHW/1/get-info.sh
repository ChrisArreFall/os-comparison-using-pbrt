#!/bin/bash

# Set the path to the directory containing the log files
LOG_DIR=$PWD

# Loop through all the files in the directory that have a .txt extension
for LOG_FILE in $LOG_DIR/*.txt; do
    # Use grep to search for lines that match the pattern
    grep -r -B 1 "Statistics:" . | grep "(*s)" | while read line; do
        # Use echo to print out the matching line
        echo "$LOG_FILE: $line"
    done
done


grep -r -B 1 "Statistics:" .