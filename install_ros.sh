#!/usr/bin/env bash

source env.sh

install_ros() {
    setup_ppa
    install_melodic
    setup_sources
    install_build_tools
    setup_workspace
    install_colcon
}

setup_ppa() {
	sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
}

install_melodic() {
	sudo apt update
	sudo apt install ros-melodic-desktop -y
}

setup_sources() {
	sudo rosdep init
	rosdep update
}

install_build_tools() {
	sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential -y
}

setup_workspace() {
    mkdir -p $HOME/ros/src
}

install_colcon() {
    sudo apt install python3-colcon-common-extensions -y
}
