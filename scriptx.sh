#!/bin/bash

# Check if the file exists
if [ ! -f "X" ]; then
    echo "File 'X' not found!"
    exit 1
fi

# Create a temporary file
temp_file=$(mktemp)

# Read the file and add a comma to the end of each line
while IFS= read -r line || [ -n "$line" ]; do
    echo "${line}," >> "$temp_file"
done < X

# Move the temporary file to the original file
mv "$temp_file" X

echo "Commas added to the end of each line."
