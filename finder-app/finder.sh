#!/bin/bash

filesdir=$1 # argument 1
searchstr=$2 # argument 2

# Check arguments (-z checks if strings are null)
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: Missing arguments"
    exit 1
fi

# Check directory exists (-d checks if path exists and is a directory)
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi

# Count files (find: recursive filesystem traversal, -type f: only regular files, |: feed this output to next command,  wc -l: count lines)
num_files=$(find "$filesdir" -type f | wc -l)

# Count matching lines (-R: recursive, grep: pattern matching, |: feed this output to next command,  wc -l: count matches)
num_matches=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"
