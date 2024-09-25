#!/bin/bash

if ! command -v 7z &> /dev/null
then
    echo "7z is not installed. Please install it and try again."
    exit 1
fi

# Loop through each directory in current folder
for dir in */ ; do
    # Skip if not a directory
    if [ -d "$dir" ]; then
        # Remove trailing slash from folder name
        folder_name=$(basename "$dir")

        # Compress the folder with 7z and keep the original files
        7z a "${folder_name}.7z" "$dir"

        echo "Compressed folder: $dir"
    fi
done

echo "All folders have been compressed."
