#!/bin/sh
function pkg_install() {
  packages=(
    'direnv'
    'unzipq'
    'make'
    'build-essential'
    'libncurses5-dev'
    'libncursesw5-dev'
    'libz-dev'
    'libyaml-dev'
    'libssl-dev'
    'zlib1g-dev'
    'wget'
    'libbz2-dev'
    'libreadline-dev'
    'libsqlite3-dev'
    'xz-utils'
    'tk-dev'
    'libxml2-dev'
    'libxmlsec1-dev'
    'libffi-dev'
    'liblzma-dev'
  )

  for file in ${packages[@]}
  do
    sudo apt install -y $file
  done
}


main() {
  pkg_install
}

main

