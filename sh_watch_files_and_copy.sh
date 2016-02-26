#!/bin/bash
#
# XXX Changez ici l'adresse IP de l'ordi art3, qui fait jouer les clips
#

IP_PLAYER=10.9.1.172



FROM_DIR=~/Documents/toonloop/default/movies
DEST=art@${IP_PLAYER}:Videos

set -o verbose
mkdir -p ${DEST} # TODO: we won't need this when we will use scp
while true;
do
    CHANGEDFILE=$(inotifywait -e close_write --format %f ${FROM_DIR} )
    scp ${FROM_DIR}/${CHANGEDFILE} ${DEST}/
done
