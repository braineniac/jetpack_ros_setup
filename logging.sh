#!/usr/bin/env bash

source env.sh

touch $LOGFILE

log() {
    # display in log
    echo "==================================================="
    echo "$1"
    echo "==================================================="
}
