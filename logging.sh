#!/usr/bin/env bash

# Saves file descriptors so they can be restored to whatever they were before redirection or used themselves to output to whatever they were before the following redirect.
exec 3>&1 4>&2 

# Restore file descriptors for particular signals. Not generally necessary since they should be restored when the sub-shell exits.
trap 'exec 2>&4 1>&3' 0 1 2 3 

# Redirect stdout to file log.out then redirect stderr to stdout. Note that the order is important when you want them going to the same file. stdout must be redirected before stderr is redirected to stdout.
exec 1>$LOGFILE 2>&1 

log() {
    # display in log
    echo "==================================================="
    echo "==================================================="
    echo "$1"
    echo "==================================================="
    echo "==================================================="

    # display for user
    echo "$1" >&3
}



