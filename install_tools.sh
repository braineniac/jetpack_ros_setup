#!/usr/bin/env bash

source env.sh
source logging.sh

install_tools() {
    log "Installing tools"
    
    setup_zsh
    setup_vim
    install_tmux
    install_vcstool
}

setup_zsh() {
    log "Installing zsh"
    
    # install zsh
    sudo apt install zsh -y

    # install oh-my-zsh to ~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # backup old .zshrc
    mv $HOME/.zshrc $HOME/.zshrc.old

    # create link
    ln -s $SCRIPT_DIR/conf/zshrc ~/.zshrc

    # switch user to zsh
    sudo usermod -s /bin/zsh $USER

}

setup_vim() {
    log "Setting up vim"
    
    # install vim
    sudo apt install vim -y

    # create link
    ln -s $SCRIPT_DIR/conf/vimrc ~/.vimrc

    # clone vundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # compile vim packages
    vim +PluginInstall +qa

    # compile YouCompleteMe core
    python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

}

install_tmux() {
    log "Installing tmux"
    sudo apt install tmux -y
}

