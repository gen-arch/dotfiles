#!/bin/bash
#dotfiles
export DOT_FILE_PATH="$HOME/dotfiles"
#nvim
export XDG_CONFIG_HOME=$HOME/.config
# 標準エディタを設定する
export EDITOR=vim
# メモリに保存する履歴の件数を指定する
export HISTSIZE=10000
#PATH追加
export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin
export TERM=xterm-256color


if [ -e ~/.anyenv ]; then
 export PATH="$HOME/.anyenv/bin:$PATH"
 eval "$(anyenv init -)"
fi

if [ -e ~/go ]; then
  local version=`goenv version | awk '{ print $1}'`
  export GOENV_ROOT=$HOME/.anyenv/envs/goenv
  export GOPATH=$HOME/go/$version
  export PATH=$GOENV_ROOT/bin:$GOPATH/bin:$PATH
fi

if [ "$TMUX_MODE" != "true" ]; then
  export TMUX_MODE="true"
  eval tmux
fi

if [ "$LOG_MODE" != "true" ] && [ -f $HOME/.log.validity ]; then
  export LOG_mode="true"
  [ -f $HOME/log ] && mkdir $HOME/log
  script -a $HOME/log/terminal-log.`date "+%Y%m%H%M%S"`
fi
