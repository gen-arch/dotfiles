#!/bin/sh
function env_install() {
  if [ ! -e ~/.anyenv ]; then
    git clone https://github.com/anyenv/anyenv ~/.anyenv
  fi
}

main() {
  env_install
}

main
