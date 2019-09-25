#!/bin/sh
#dotfiles
export DOT_FILE_PATH="$HOME/dotfiles"
#nvim
export XDG_CONFIG_HOME=$HOME/.config
# 標準エディタを設定する
export EDITOR=vim
# メモリに保存する履歴の件数を指定する
export HISTSIZE=10000
#PATH追加
export PATH=$PATH:$HOME/bin

# env files
if [ -e ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -e ~/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [ -e ~/.ndenv ]; then
  export PATH="$HOME/.ndenv/bin:$PATH"
  eval "$(ndenv init -)"
fi

if [ -e ~/.nodenv ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

if [ -e ~/.goenv ]; then
  export GOENV_ROOT="$HOME/.goenv"
  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"
fi
