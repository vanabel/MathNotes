#!/bin/bash

# Detect if the OS is Linux and give a warning about creation times
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Warning: On Linux, file creation times are generally not accessible."
    echo "This script may not function as expected for storing and restoring creation times."
fi

# Prompt for the directory path
read -p "Enter the directory path (e.g., /path/to/markdown/files): " directory

# Validate if the directory exists
if [[ ! -d "$directory" ]]; then
    echo "The directory does not exist."
    exit 1
fi

# Define the file to store creation times
timestamps_file="$directory/creation_times_mac.txt"

# Store creation times
if [[ "$1" == "store" ]]; then
    echo "Storing creation times..."
    # Clear the timestamps file
    > "$timestamps_file"

    # Iterate through all .md files in the directory
    for f in "$directory"/*.md; do
        filename=$(basename "$f")
        # Retrieve the creation time and append it to the timestamps file
        if [[ "$OSTYPE" == "darwin"* ]]; then
            stat -f "%SB" -t "%Y-%m-%d %H:%M:%S" "$f" >> "$timestamps_file"
        else
            echo "Unavailable" >> "$timestamps_file"  # Handle Linux case where creation time is not accessible
        fi
        echo "$filename" >> "$timestamps_file"
    done

    echo "Creation times stored in $timestamps_file"
    exit 0
fi

# Restore creation times
if [[ "$1" == "restore" ]]; then
    echo "Restoring creation times..."
    restoring=false
    while IFS= read -r line; do
        if [[ -n "$line" ]]; then
            if [[ "$restoring" == true ]]; then
                filepath="$directory/$line"
                # Trim spaces from the file name
                filepath="$directory/$(echo "$line" | sed 's/[[:space:]]*$//')"
                # Check if the file exists before restoring the time
                if [[ -f "$filepath" ]]; then
                    if [[ "$date" != "Unavailable" ]]; then
                        if [[ "$OSTYPE" == "darwin"* ]]; then
                            # Restore the creation time using SetFile
                            date_formatted=$(date -j -f "%Y-%m-%d %H:%M:%S" "$date" +"%m/%d/%Y %H:%M:%S")
                            SetFile -d "$date_formatted" "$filepath"
                            echo "Restored creation time for $filepath"
                        else
                            # Linux: creation time is not modifiable
                            echo "Creation time not available for $filepath, skipping."
                        fi
                    else
                        echo "Creation time not available for $filepath, skipping."
                    fi
                else
                    echo "File $filepath does not exist, skipping."
                fi
                restoring=false
            else
                # Store the creation time
                date="$line"
                restoring=true
            fi
        fi
    done < "$timestamps_file"

    echo "Creation times restored!"
    exit 0
fi

# Instructions
echo "Usage: "
echo
echo "To store creation times: script.sh store"
echo "To restore creation times: script.sh restore"
