#!/bin/bash

# Find all PNG files and sort them by the number after "count"
ls *.png | sed -nE 's/.*count([0-9]+)_.*\.png/\1 &/p' | sort -n | while read count filename; do
  # Use printf to create a zero-padded frame name
  new_name=$(printf "frame_%04d.png" $count)
  
  # Print the old and new file names
  echo "Renaming: $filename -> $new_name"
  
  # Rename the file
  mv "$filename" "$new_name"
done

echo "Files renamed based on 'count' successfully!"

