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
    source /opt/ros/melodic/setup.bash; rosdep install --from-paths $HOME/ros/src  --ignore-src -r -y
}

compile_ws() {
    log "Compiling packages"
    source /opt/ros/melodic/setup.bash; cd ~/ros; colcon build
}
