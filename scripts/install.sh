#!/bin/sh
goenv() {
  if [ ! -e ~/.goenv ]; then
    git clone https://github.com/syndbg/goenv.git ~/.goenv
  fi
}

rbenv() {
  if [ ! -e ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    cd ~/.rbenv && src/configure && make -C src
  fi
}

pyenv() {
  if [ ! -e ~/.pyenv ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
  fi
}

nodenv() {
  if [ ! -e ~/.nodenv ]; then
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
    cd ~/.nodenv && src/configure && make -C src
  fi
}

anyframe() {
  git clone https://github.com/mollifier/anyframe ~/.temp/anyframe
}

main() {
  goenv
  rbenv
  pyenv
  nodenv
  anyframe
}

main
