#!/bin/bash

# =================CONFIGURATION =================
# Directory to process (default is current directory if not provided as argument)
TARGET_DIR="${1:-.}"

# The new base name for the files
BASE_NAME="photo"

# STARTING NUMBER
COUNTER=1

# SAFETY MODE: Set to "true" to see what happens without renaming.
# Set to "false" to actually rename the files.
DRY_RUN="false"
# ================================================

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Move into the directory
cd "$TARGET_DIR" || exit

echo "Processing files in: $(pwd)"

# Loop through all files in the directory
# using simple shell expansion (alphabetical order by default)
for file in *; do
    # 1. Skip if it is a directory
    if [ -d "$file" ]; then
        continue
    fi

    # 2. Skip if the file is this script itself (to prevent renaming the script)
    if [ "$file" == "$(basename "$0")" ]; then
        continue
    fi

    # 3. Extract the file extension
    # "${file##*.}" gets everything after the last dot
    extension="${file##*.}"

    # Handle cases where files might not have an extension
    if [ "$file" == "$extension" ]; then
        new_name="${BASE_NAME}${COUNTER}"
    else
        new_name="${BASE_NAME}${COUNTER}.${extension}"
    fi

    # 4. Perform the rename
    if [ "$DRY_RUN" == "true" ]; then
        echo "[DRY RUN] Would rename: '$file' -> '$new_name'"
    else
        # Check if destination already exists to prevent overwriting
        if [ -e "$new_name" ] && [ "$file" != "$new_name" ]; then
            echo "[WARNING] Target '$new_name' already exists. Skipping '$file'."
        else
            mv "$file" "$new_name"
            echo "Renamed: '$file' -> '$new_name'"
        fi
    fi

    # Increment the counter
    ((COUNTER++))
done

if [ "$DRY_RUN" == "true" ]; then
    echo "------------------------------------------------"
    echo "Dry run complete. No changes were made."
    echo "Edit the script and set DRY_RUN=\"false\" to apply changes."
fi
