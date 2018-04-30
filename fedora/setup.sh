cd ~/Documents/
if [[ ! -d ~/Documents/myvim ]]; then
git clone https://github.com/ykwoshia/myvim.git
fi
if [[ ! -d ~/Documents/script ]]; then
git clone https://github.com/ykwoshia/script.git
fi
cd ~
ln -s ~/Documents/myvim/vimrc .vimrc
mkdir -p ~/.vim/colors
cp ~/Documents/myvim/Tomorrow-Night-Eighties.vim ~/.vim/colors

ln -s ~/Documents/myvim/tmuxconf .tmux.conf
ln -s ~/Documents/myvim/gitconfig .gitconfig


git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
rm -rf ~/.oh-my-zsh/custom
ln -s ~/Documents/script/zshrc .zshrc
ln -s ~/Documents/script/custom ~/.oh-my-zsh/custom

git clone --depth=1 https://github.com/powerline/powerline-fonts.git
cd powerline-fonts
./install.sh
cd ~/Documents


#chsh -s /bin/zsh
google-chrome --proxy-server=socks5://127.0.0.1:1080
#https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
