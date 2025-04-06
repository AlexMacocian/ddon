#!/bin/bash

response=$(curl -s "https://api.github.com/repos/sebastian-heinz/Arrowgene.DragonsDogmaOnline/releases/latest")

# Extract the tag name and download URL using jq
tag_name=$(echo "$response" | jq -r '.tag_name')
download_url=$(echo "$response" | jq -r '.assets[] | select(.name | test("^linux-x64-.*\\.tar\\.gz$")) | .browser_download_url')

if [ -n "$download_url" ]; then
    echo "Downloading linux-x64.tar.gz from the latest release..."
    curl -L "$download_url" -o /tmp/linux-x64.tar.gz

    echo "Creating server folder"
    mkdir -p /ddon/server

    echo "Extracting linux-static.tar.gz ..."
    tar -xzf /tmp/linux-x64.tar.gz -C /ddon/server

    echo "Cleaning up downloaded file..."
    rm /tmp/linux-x64.tar.gz

    echo "Download and extraction completed successfully."
else
    echo "No linux-x64.tar.gz asset found in the latest release."
    exit 1
fi