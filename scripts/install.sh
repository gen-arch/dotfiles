#!/bin/sh
function env_install() {
  os=`uname -a`
  if []
  if [ ! -e ~/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
  fi
}

function anyframe() {
  git clone https://github.com/mollifier/anyframe ~/.temp/anyframe
}

main() {
  anyframe
  env_install
}

main
