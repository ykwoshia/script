cd ~/Documents/
git clone https://github.com/ykwoshia/myvim.git
git clone https://github.com/ykwoshia/script.git
cd ~
ln -s ~/Documents/myvim/vimrc .vimrc
mkdir -p ~/.vim/colors
cp ~/Documents/myvim/Tomorrow-Night-Eighties.vim ~/.vim/colors

ln -s ~/Documents/myvim/tmuxconf .tmux.conf
ln -s ~/Documents/myvim/gitconfig .gitconfig


git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
ln -s ~/Documents/script/zshrc .zshrc
ln -s ~/Documents/script/custom ~/.oh-my-zsh/custom

#chsh -s /bin/zsh
google-chrome --proxy-server=socks5://127.0.0.1:1080
