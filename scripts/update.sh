#!/bin/sh
readonly DIR=$(cd $(dirname $0); pwd)
readonly ROOT=$(cd $DIR; cd ..; pwd)
readonly CONF=$(cd $DIR; cd ../configs; pwd)

source $DIR/environment.sh
source $DIR/lib/functions.sh

dotfiles=(
  'vimrc'
  'zshrc'
  'tmux.conf'
  'bashrc'
  'hyper.js'
)

nvim_setup

for file in ${dotfiles[@]}
do
  remove_file $file
  symlink     $file
done
