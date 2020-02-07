#!/usr/bin/env bash

source env.sh
source install_ros.sh
source install_tools.sh

update_system() {
    sudo apt update
    sudo apt upgrade -y
}

setup_env() {
    ln -s $SCRIPT_DIR/conf/env ~/.env
    ln -s $SCRIPT_DIR/conf/aliases ~/.aliases
}

main() {
    update_system
    setup_env
    install_tools
    install_ros
}

main
