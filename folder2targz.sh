#!/bin/bash

# Check if folder name is given
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder_name>"
    exit 1
fi

FOLDER_NAME=$1
FOLDER_NAME=${FOLDER_NAME%/}
TAR_FILE="${FOLDER_NAME##*/}.tar.gz"

# Check for directory
if [ ! -d "$FOLDER_NAME" ]; then
    echo "Error: $FOLDER_NAME is not a directory."
    exit 1
fi

# Create tar.gz file from the folder
tar -cvzf "$TAR_FILE" "$FOLDER_NAME"

echo "Successfully created $TAR_FILE"
