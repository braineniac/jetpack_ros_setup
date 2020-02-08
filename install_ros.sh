#!/usr/bin/env bash

source env.sh
source logging.sh

install_ros() {
    log "Installing ROS"
    setup_ppa
    install_melodic
    setup_sources
    install_build_tools
    setup_workspace
}

setup_ppa() {
    log "Setting up ROS ppa"
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    check
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    check
}

install_melodic() {
    log "Installing ROS melodic"
    sudo apt update
    check
    sudo apt install ros-melodic-desktop -y
    check
}

setup_sources() {
    log "Setting up rosdep"
    sudo rosdep init
    check
    rosdep update
    check
}

install_build_tools() {
    log "Installing useful ROS build tools"
    sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential python3-colcon-common-extensions python3-vcstool -y
    check
}

setup_workspace() {
    log "Setting up ROS workspace"
    mkdir -p $HOME/ros/src
    check
}

