#!/bin/bash

# Check if the file exists
if [ ! -f x ]; then
  echo "File 'x' not found!"
  exit 1
fi

# Create a temporary file to store modified content
temp_file=$(mktemp)

# Add a comma at the end of each line and save to the temporary file
while IFS= read -r line; do
  echo "${line}," >> "$temp_file"
done < x

# Move the temporary file back to the original file
mv "$temp_file" x

echo "Commas added to the end of each line."
