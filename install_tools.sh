#!/usr/bin/env bash

source env.sh

install_tools() {
    setup_zsh
    setup_vim
		install_tmux
    install_vcstool
}

setup_zsh() {

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
				sudo apt install tmux -y
}

install_vcstool() {
    sudo apt-get install python3-vcstool
}
