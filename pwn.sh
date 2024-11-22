#!/bin/bash

BASE_DIR="/home/u181040597/domains"
FILE_NAME="pwn.txt"

# Check if the hello.txt file exists
if [[ ! -f $FILE_NAME ]]; then
    echo "$FILE_NAME does not exist in the current directory."
    exit 1
fi

# Iterate through each domain folder and upload the file
for DOMAIN_DIR in $BASE_DIR/*; do
    if [[ -d $DOMAIN_DIR ]]; then
        PUBLIC_HTML_DIR="$DOMAIN_DIR/public_html"

        if [[ -d $PUBLIC_HTML_DIR ]]; then
            cp $FILE_NAME "$PUBLIC_HTML_DIR/"
            echo "Uploaded $FILE_NAME to $PUBLIC_HTML_DIR"
        else
            echo "Directory $PUBLIC_HTML_DIR does not exist. Skipping $DOMAIN_DIR."
        fi
    fi
done

echo "Upload complete!"
