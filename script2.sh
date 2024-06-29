#!/bin/bash

# Directory containing the text files
DIR="/home/kali/Desktop/XSS"

# Input and output files
INPUT_FILE="$DIR/merged_output.txt"
OUTPUT_FILE="$DIR/cleaned_output.txt"
TEMP_FILE="$DIR/temp_output.txt"

# Check if the input file exists
if [ -f "$INPUT_FILE" ]; then
  # Remove empty lines and sort the file to prepare for duplicate removal
  grep -v '^$' "$INPUT_FILE" | sort > "$TEMP_FILE"
  
  # Remove duplicates and count them
  awk '!seen[$0]++' "$TEMP_FILE" > "$OUTPUT_FILE"
  
  # Count the number of original lines and unique lines
  original_lines=$(wc -l < "$TEMP_FILE")
  unique_lines=$(wc -l < "$OUTPUT_FILE")
  
  # Calculate the number of duplicate lines
  duplicate_lines=$((original_lines - unique_lines))
  
  # Clean up the temporary file
  rm "$TEMP_FILE"
  
  # Show the result
  echo "Duplicate lines found: $duplicate_lines"
  echo "Duplicate lines deleted: $duplicate_lines"
  echo "Cleaned file created: $OUTPUT_FILE"
else
  echo "Input file $INPUT_FILE does not exist."
fi
