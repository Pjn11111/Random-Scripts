#!/bin/bash

# Directory containing the text files
DIR="/home/kali/Desktop/XSS"

# Output file
OUTPUT_FILE="$DIR/merged_output.txt"

# Check if the directory exists
if [ -d "$DIR" ]; then
  # Remove the output file if it already exists
  if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
  fi
  
  # Iterate through all text files in the directory
  for FILE in "$DIR"/*.txt; 
  do
    # Check if the file exists to handle the case where there are no .txt files
    if [ -f "$FILE" ]; then
      cat "$FILE" >> "$OUTPUT_FILE"
      echo "" >> "$OUTPUT_FILE"  # Add a newline for separation
    fi
  done
  
  echo "All text files have been merged into $OUTPUT_FILE"
else
  echo "Directory $DIR does not exist."
fi
