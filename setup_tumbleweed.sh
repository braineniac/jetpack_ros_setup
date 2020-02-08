#!/usr/bin/env bash

source env.sh
source logging.sh

setup_tumbleweed() {
    log "Setting up tumbleweed packages"
    clone_packages
    install_ws_deps
    compile_ws
}

clone_packages() {
    log "Cloning tumbleweed packages"
    cd ~/ros/src; vcs import < $SCRIPT_DIR/tumbleweed.repos
}

install_ws_deps() {
    log "Installing requirements"
    rosdep install --from-paths $HOME/ros/src  --ignore-src -r -y
}

compile_ws() {
    log "Compiling packages"
    cd ~/ros; colcon build
}
