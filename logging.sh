#!/usr/bin/env bash

source env.sh

touch $LOGFILE

log() {
    # display in log
    echo "==================================================="
    echo "$1"
    echo "==================================================="
}

check() {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "Error with $1" >&2
        exit 1
    fi
    return $status
}
