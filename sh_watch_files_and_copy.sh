#!/bin/bash
FROM_DIR=~/Documents/toonloop/default/movies
DEST=/tmp/yesss

set -o verbose
mkdir -p ${DEST} # TODO: we won't need this when we will use scp
while true;
do
    CHANGEDFILE=$(inotifywait -e close_write --format %f ${FROM_DIR} )
    cp ${FROM_DIR}/${CHANGEDFILE} ${DEST}
done
