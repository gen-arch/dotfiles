#!/bin/sh
rm $DOT_FILE_PATH/nvim/.vim
rm $DOT_FILE_PATH/nvim/init.vim
rm ~/.vimrc
rm ~/.zshrc
rm ~/.zlogin
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.Xmodmap

ln -s ~/.vim         $DOT_FILE_PATH/nvim/
ln -s $DOT_FILE_PATH/vimrc    $DOT_FILE_PATH/nvim/init.vim
ln -s $DOT_FILE_PATH/vimrc     ~/.vimrc
ln -s $DOT_FILE_PATH/tmux.conf ~/.tmux.conf
ln -s $DOT_FILE_PATH/bashrc    ~/.bashrc
