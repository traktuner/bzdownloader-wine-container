#!/bin/sh
set -x
 
    mkdir /config/wine/
    cd /config/wine/
    curl -L "https://secure.backblaze.com/api/restore_downloader" --output "bzdownloader.zip"
    unzip bzdownloader.zip
    ls -la
    echo "Mounting /restore/ as hdd and rebooting wine"
    wineboot
    ln -s /restore/ /config/wine/dosdevices/d:
    wineboot
    echo "Starting bzdownloader.exe"
    wine64 "bzdownloader.exe" &
    sleep infinity