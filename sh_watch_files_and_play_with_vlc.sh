#!/bin/bash
FROM_DIR=~/Videos/

set -o verbose
mkdir -p ${DEST}
while true;
do
    CHANGEDFILE=$(inotifywait -e close_write --format %f ${FROM_DIR} )
    vlc --one-instance --playlist-enqueue ${FROM_DIR}/${CHANGEDFILE} 
done
