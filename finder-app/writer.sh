#!/bin/bash

writefile=$1 # first command-line argument
writestr=$2 # second command-line argument

# Each of the operations are done inside the syntax {if ...; then <throw_error> fi} to take care of errors

# Check arguments (The -z option in bash scripting is a test operator that checks if a string is null.)
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Missing arguments"
    exit 1 # return a non zero value = error
fi

# Extract directory path (dirname extracts directory part of a path)
writedir=$(dirname "$writefile")

# Create directory path if it doesn't exist (-p is used to create parent directories IF NEEDED)
if ! mkdir -p "$writedir"; then
    echo "Error: Could not create directory path"
    exit 1
fi

# Write to file (overwrite)
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not write to file"
    exit 1
fi
