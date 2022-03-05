#!/bin/sh
set -x
if [ -f "/config/wine/drive_c/Program Files (x86)/Backblaze/bzbui.exe" ]
then
    wine64 "/config/wine/drive_c/Program Files (x86)/Backblaze/bzbui.exe" -noqiet &
    sleep infinity
else
    mkdir /config/wine/
    cd /config/wine/
    curl -L "https://secure.backblaze.com/api/restore_downloader" --output "bzdownloader.zip"
    unzip bzdownloader.zip
    ls -la
    sleep infinity
    wine64 "install_backblaze.exe" &
    sleep infinity
fi