#!/bin/sh
goenv() {
  if [ ! -e ~/.goenv ]; then
    git clone https://github.com/syndbg/goenv.git ~/.goenv
  fi
}

rbenv() {
  if [ ! -e ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    # cd ~/.rbenv && src/configure && make -C src
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
    cd ~/.nodenv && src/configure && make -C src
  fi
}

main() {
  goenv
  rbenv
  pyenv
  nodenv
}

main
