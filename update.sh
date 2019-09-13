dir=`$(dirname $0)`

rm $dir/nvim/.vim
rm $dir/nvim/init.vim
rm ~/.vimrc
rm ~/.zshrc
rm ~/.zlogin
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.Xmodmap

ln -s ~/.vim         $dir/nvim/
ln -s $dir/.vimrc    $dir/nvim/init.vim
ln -s $dir/vimrc     ~/.vimrc
ln -s $dir/tmux.conf ~/.tmux.conf
ln -s $dir/bashrc    ~/.bashrc
