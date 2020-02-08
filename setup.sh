#!/usr/bin/env bash

source env.sh
source install_ros.sh
source install_tools.sh
source setup_tumbleweed.sh

update_system() {
    sudo apt update
    sudo apt upgrade -y
}

setup_env() {
    ln -s $SCRIPT_DIR/conf/env ~/.env
    ln -s $SCRIPT_DIR/conf/aliases ~/.aliases
}

change_hostname() {
    sudo cp $SCRIPT_DIR/conf/hostname /etc/hostname
    sudo cp $SCRIPT_DIR/conf/hosts /etc/hosts
}

main() {
    update_system
    setup_env
    install_ros
    install_tools

    setup_tumbleweed

    change_hostname
    sudo reboot
}

main
