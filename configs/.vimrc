if &compatible
  set nocompatible
endif

let s:script_dir          = expand('~/dotfiles')
let s:dein_dir            = expand('~/.vim/dein')
let s:dein_repo_dir       = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let &runtimepath          = s:dein_repo_dir .",". &runtimepath
let s:toml_dir            = s:script_dir . '/vim/dein/'
let s:toml                = s:toml_dir . 'dein.toml'
let s:lazy_toml           = s:toml_dir . 'dein_lazy.toml'
let s:deoplete_toml       = s:toml_dir . 'deoplete.toml'
let s:lsp_toml            = s:toml_dir . 'lsp.toml'
let s:asyncomplete_toml   = s:toml_dir . 'asyncomplete.toml'
let s:complate            = 'deoplate'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lsp_toml,  {'lazy': 0})

  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  if s:complate == 'deoplate'
    call dein#load_toml(s:deoplete_toml, {'lazy': 1})
    call dein#add ('roxma/nvim-yarp')
    call dein#add ('roxma/vim-hug-neovim-rpc')
  elseif s:complate == 'asyncomplete'
    call dein#load_toml(s:asyncomplete_toml, {'lazy': 1})
  endif

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" setting
" スクロールする時に下が見えるようにする
set scrolloff=5
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" バックスペース有効化
set backspace=indent,eol,start

set clipboard=unnamed

" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" terminal256color対応
set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set fileformat=unix

syntax enable
filetype plugin indent on

autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!bundle exec ruby %
autocmd BufNewFile,BufRead *.sh nnoremap <C-e> :!source %
autocmd BufNewFile,BufRead *.ts         setlocal filetype=typescript
autocmd BufNewFile,BufRead *.vue        setlocal filetype=vue
autocmd BufNewFile,BufRead *.vue        setlocal filetype=vue
autocmd BufNewFile,BufRead Vagrantfile  setlocal filetype=ruby
autocmd BufNewFile,BufRead Capfile      setlocal filetype=ruby
autocmd BufNewFile,BufRead *.tf         setlocal filetype=terraform
autocmd BufNewFile,BufRead .envrc       setlocal filetype=bash
autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown
autocmd BufNewFile,BufRead *.ssh_conf set filetype=sshconfig
autocmd QuickFixCmdPost *grep* cwindow

" Windows Subsystem for Linux で、ヤンクでクリップボードにコピー
if system('uname -a | grep -i microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
  set clipboard&
  set clipboard^=unnamedplus
endif

