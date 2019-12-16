#!/bin/sh
script_dir=$(cd $(dirname $0); pwd)
config_dir=$(cd $script_dir; cd ..; pwd)
source $config_dir/environment.sh

nvim_dir=$XDG_CONFIG_HOME/nvim

[ ! -e $nvim_dir ] && mkdir -p $nvim_dir

rm $nvim_dir/.vim
rm $nvim_dir/init.vim
rm ~/.vimrc
rm ~/.zshrc
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.hyper.js

ln -s ~/.vim                $nvim_dir/
ln -s $config_dir/vimrc     $nvim_dir/init.vim
ln -s $config_dir/vimrc     ~/.vimrc
ln -s $config_dir/tmux.conf ~/.tmux.conf
ln -s $config_dir/bashrc    ~/.bashrc
ln -s $config_dir/zshrc     ~/.zshrc
ln -s $config_dir/hyper.js  ~/.hyper.js
