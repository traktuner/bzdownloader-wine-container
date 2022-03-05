#!/bin/sh
set -x
 
    mkdir /config/wine/
    cd /config/wine/
    curl -L "https://secure.backblaze.com/api/restore_downloader" --output "bzdownloader.zip"
    unzip bzdownloader.zip
    ls -la
    echo "Starting bzdownloader.exe"
    wine64 "bzdownloader.exe" &
    sleep infinity