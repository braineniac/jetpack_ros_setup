#!/usr/bin/env bash

source env.sh
source logging.sh
source install_ros.sh
source install_tools.sh
source setup_tumbleweed.sh

main() {
    update_system
    setup_env
    install_ros
    install_tools

    setup_tumbleweed

    change_hostname
    reboot_system
}

update_system() {
    log "Updating system"
    sudo apt update
#    sudo apt upgrade -y
}

setup_env() {
    log "Linking eenviroment"
    ln -sv $SCRIPT_DIR/conf/env ~/.env
    ln -sv $SCRIPT_DIR/conf/aliases ~/.aliases
}

change_hostname() {
    log "Setting hostname"
    sudo cp $SCRIPT_DIR/conf/hostname /etc/hostname
    sudo cp $SCRIPT_DIR/conf/hosts /etc/hosts
}

reboot_system() {
    log "Reboot system"
    sudo reboot
}

main 2>&1 | tee $LOGFILE
