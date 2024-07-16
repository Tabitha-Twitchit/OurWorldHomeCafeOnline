#!/bin/bash

# Change to the directory containing the files
cd /users/tabi/desktop/images

# Read the CSV file line by line
while IFS=, read -r old new
do
    # Trim white space
    old=$(echo "$old" | xargs)
    new=$(echo "$new" | xargs)

    # Check if old file exists
    if [ -e "$old" ]; then

        # Rename the file with a temporary prefix to avoid overwriting a file  out of sequence
        # e.g. rename old file1 to file4  and later looking for old file4 but only finding new file4 
        mv "$old" "temp_$new"

    else
        echo "File $old does not exist."
    fi

done < /users/tabi/desktop/renamer2.csv

# Remove the temporary prefix

for file in temp_*.jpg
do
    mv "$file" "${file#temp_}"
done
