#!/bin/sh
readonly DIR=$(cd $(dirname $0); pwd)
readonly ROOT=$(cd $DIR; cd ..; pwd)
readonly CONF=$(cd $DIR; cd ../configs; pwd)

source $DIR/environment.sh
source $DIR/lib/functions.sh


nvim_setup

update_files=(
  '.vimrc'
  '.zshrc'
  '.tmux.conf'
  '.bashrc'
  '.hyper.js'
  '.aliasrc'
  '.config/git/ignore'
)

for file in ${update_files[@]}
do
  remove_file $file
  symlink     $file
done
