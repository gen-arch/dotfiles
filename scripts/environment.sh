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
export PATH=$PATH:$HOME/bin:$HOME/.local/bin

if [ -e ~/.anyenv ]; then
 export PATH="$HOME/.anyenv/bin:$PATH"
 eval "$(anyenv init -)"
fi

if [ -e ~/go ]; then
  export GOROOT=$HOME/go
  export GOPATH=$GOROOT/packages
  export PATH=$PATH:$GOROOT/bin
fi


