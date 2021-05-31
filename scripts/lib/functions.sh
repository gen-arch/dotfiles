#!/bin/sh
function nvim_setup() {
  local dir=$XDG_CONFIG_HOME/nvim
  local vimplg=$dir/.vim
  local vimrc=$dir/init.vim

  [ ! -e $dir ] && mkdir -p $dir

  [ -h $vimplg   ] && rm $vimplg
  [ -h $vimrc    ] && rm $vimrc
  [ -e ~/.vim      ] && ln -s ~/.vim $vimplg
  [ -e $CONF/vimrc ] && ln -s $CONF/vimrc $vimrc
  echo "update nvim"
}

function remove_file(){
  local file=~/$1
  [ -h $file ] && rm $file && echo "delete: $file"
}

function symlink(){
  [[ $1 == */* ]] && mkdir -p ${1%/*} && echo "create directory: ~/${1%/*}"
  ln -s $CONF/$1 ~/$1 && echo "create symlink: ~/$1"
}
