#!/bin/sh
function env_install() {
  os=`uname -a`
  asdf_version="v0.11.1"

  if [ ! -e ~/.adsf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $asdf_version
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
