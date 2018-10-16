cd ~/Documents/
if [[ ! -d ~/Documents/myvim ]]; then
git clone https://github.com/ykwoshia/myvim.git
fi
if [[ ! -d ~/Documents/script ]]; then
git clone https://github.com/ykwoshia/script.git
fi




cd ~

### vim
ln -s ~/Documents/myvim/vimrc .vimrc
mkdir -p ~/.vim/colors
cp ~/Documents/myvim/Tomorrow-Night-Eighties.vim ~/.vim/colors

### tmux
ln -s ~/Documents/myvim/tmuxconf .tmux.conf

### git
ln -s ~/Documents/myvim/gitconfig .gitconfig
mkdir -p ~/.config/git
ln -s ~/Documents/myvim/gitignore ~/.config/git/ignore

### zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git
cp -r oh-my-zsh ~/.oh-my-zsh
rm -rf ~/.oh-my-zsh/custom
ln -s ~/Documents/script/zshrc .zshrc
ln -s ~/Documents/script/custom ~/.oh-my-zsh/custom

### powerline fonts
git clone --depth=1 https://github.com/powerline/powerline-fonts.git
cd powerline-fonts
./install.sh
cd ~/Documents

### fzf
git clone --depth=1 https://github.com/junegunn/fzf.git
cp -r ~/Documents/fzf ~/.fzf
~/.fzf/install

### xfce
mkdir -p ~/.config/xfce4/terminal/colorschemes
cp ~/Documents/script/fedora/xfce/tomorrow.theme ~/.config/xfce4/terminal/colorschemes

#chsh -s /bin/zsh
google-chrome --proxy-server=socks5://127.0.0.1:1080
#https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
### perlbrew
curl -L https://install.perlbrew.pl | bash

### pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

#chsh -s /bin/zsh
# google-chrome --proxy-server=socks5://127.0.0.1:1080
