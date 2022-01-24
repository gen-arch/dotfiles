#=======================================
# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#=======================================
if [ -d $HOME/.oh-my-zsh ];then
  export ZSH="$HOME/.oh-my-zsh"
  # ZSH_THEME="steeef"
  HIST_STAMPS="mm/dd/yyyy"
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
  plugins=(
    git
    gcloud
    lxd
    ubuntu
    systemd
    gh
    direnv
    docker
    bundler
    dotenv
    rake
    rbenv
    ruby
    terraform
    asdf
  )
  source $ZSH/oh-my-zsh.sh
fi

#=======================================
#ローカル設定即時読みこみ
#=======================================
[ -f ~/.zshrc.first ] && source ~/.zshrc.first
#=======================================
#環境変数
#=======================================
[ -f $HOME/dotfiles/scripts/environment.sh ] && source $HOME/dotfiles/scripts/environment.sh
#=======================================
#基本設定
#=======================================
# 補完候補を一覧で表示する
setopt auto_list
# 補完キー連打で候補順に自動で補完する
setopt auto_menu
# cd 時に自動でディレクトリスタックに追加する
setopt auto_pushd
# コマンド履歴に実行時間も記録する
setopt extended_history
# 履歴中の重複行をすべて削除する
setopt hist_ignore_all_dups
# 直前と重複するコマンドを記録しない
setopt hist_ignore_dups
# コマンド中の余分なスペースは削除して履歴に記録する
setopt hist_reduce_blanks
# 履歴と重複するコマンドを記録しない
setopt hist_save_no_dups
# ^D でシェルを終了しない
setopt ignore_eof
# 履歴をすぐに追加する（通常はシェル終了時）
setopt inc_append_history
# # 以降をコメントとして扱う
setopt interactive_comments
# ビープを無効にする
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
# = 以降も補完する（例：--option=value）
setopt magic_equal_subst
# バックグラウンド処理の状態変化をすぐに通知する
setopt notify
# 8bit文字を有効にする
setopt print_eight_bit
# 終了ステータスが0以外の場合にステータスを表示する
setopt print_exit_value
# VCS情報の表示を有効にする
setopt prompt_subst
# ディレクトリスタックと重複したディレクトリをスタックに追加しない
setopt pushd_ignore_dups
# rm * の前に確認をとる
setopt rm_star_wait
# Zsh間で履歴を共有する
setopt share_history
# コマンド実行後は右プロンプトを消す
setopt transient_rprompt
#=======================================
#autoloadコマンド:実際に実行されるまで関数本体の読み込みを遅らせる際に使用
#=======================================
# フック機能を有効にする
autoload -Uz add-zsh-hook
# コマンドのオプションや引数を補完する
autoload -Uz compinit && compinit -u
# URLをエスケープする
autoload -Uz url-quote-magic
# VCS情報の表示を有効にする
autoload -Uz vcs_info
#色の変更
autoload -Uz colors
colors
#vcs_info の宣言と設定
autoload -Uz vcs_info
#=======================================
# 文字入力時にURLをエスケープする
zle -N self-insert url-quote-magic
#=======================================
#anyframe(https://github.com/mollifier/anyframe ~/.temp/anyframe)
#=======================================
fpath=(~/.temp/anyframe(N-/) $fpath)

autoload -Uz anyframe-init
anyframe-init

#=======================================
#キーバインド
#=======================================
# コマンドラインの編集モードをViにする
bindkey -v

# バックスペースキーで文字を削除する
bindkey -v '^?' backward-delete-char

# Shift-Tabで候補を逆順に補完する
bindkey '^[[Z' reverse-menu-complete

# ghq で管理しているリポジトリから検索・移動する
bindkey '^@' anyframe-widget-cd-ghq-repository

# コマンドを履歴から検索・実行する
bindkey '^r' anyframe-widget-put-history

# console
bindkey '^k' kill-line
bindkey '^u' kill-whole-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

#=======================================
#関数
#=======================================
function find_cd() {
  cd "$(find . -type d | peco)"
}

function peco-lscd {
local dir="$( ls | peco )"
if [ -f "$dir" ]; then
  vi "$dir"
else
  if [ ! -z "$dir" ] ; then
    cd "$dir"
  fi
fi
}
#=======================================
#エイリアス
#=======================================
[ -f ~/.aliasrc ] && source ~/.aliasrc

#=======================================
#モジュール(http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Standard-Styles)
#=======================================
# 補完の表示方法を変更する
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{cyan}%c%u(%b)%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示
#=======================================
#fzf(https://github.com/junegunn/fzf)
#install(git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf)
#~/.fzf/install
#=======================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#=======================================
#zaw(https://github.com/zsh-users/zaw)
#install(git clone git://github.com/zsh-users/zaw.git)
#=======================================
[ -f ~/zaw/zaw.zsh ] && source ~/zaw/zaw.zsh
#=======================================
#プロンプト
#=======================================
# プロンプト表示直前に vcs_info 呼び出し
precmd () { vcs_info }

# プロンプト（左）
PROMPT='
%{$fg[red]%}[%n@%m]%{$reset_color%} %{${fg[red]}%}[%~]%{${reset_color}%}
${vcs_info_msg_0_} %{${fg[red]}%}%}$%{${reset_color}%} >> '

#プロンプト（右）
# RPROMPT='%{${fg[red]}%}[%~]%{${reset_color}%}'
#=======================================
#ローカル設定読み込み
#=======================================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
#=======================================
#aws cli complate
#=======================================
[ -f $HOME/dotfiles/scripts/aws_cli_complete.sh ] && source $HOME/dotfiles/scripts/aws_cli_complete.sh
#=======================================
