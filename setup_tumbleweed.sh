#!/usr/bin/env bash

setup_tumbleweed() {
    clone_packages
    install_ws_deps
    compile_ws
}

clone_packages() {
    cd ~/ros/src; vcs import < $HOME/jetpack_ros_setup/tumbleweed.repos
}

install_ws_deps() {
    rosdep install --from-paths $HOME/ros/src  --ignore-src -r -y
}

compile_ws() {
    cd ~/ros; colcon build
}

setup_tumbleweed
