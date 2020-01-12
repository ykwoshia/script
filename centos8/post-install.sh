# echo https://ykwoshia:passwd@github.com > ~/.git-credentials
mkdir -p ~/Documents
if [[ ! -d ~/Documents/myvim ]]; then
echo clone myvim
git clone https://github.com/ykwoshia/myvim.git ~/Documents/myvim
fi
if [[ ! -d ~/Documents/script ]]; then
echo clone script
git clone https://github.com/ykwoshia/script.git ~/Documents/script
fi




### vim
if [[ ! -d ~/.vim ]]; then
echo setup myvim
ln -s ~/Documents/myvim/vimrc ~/.vimrc
mkdir -p ~/.vim/colors
cp ~/Documents/myvim/Tomorrow-Night-Eighties.vim ~/.vim/colors

### tmux
ln -s ~/Documents/myvim/tmuxconf ~/.tmux.conf

### git
ln -s ~/Documents/myvim/gitconfig ~/.gitconfig
mkdir -p ~/.config/git
ln -s ~/Documents/myvim/gitignore ~/.config/git/ignore

### ctags
ln -s ~/Documents/myvim/ctags ~/.ctags

### ctags
ln -s ~/Documents/myvim/flake8 ~/.flake8
fi

### zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
echo setup zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
rm -rf ~/.oh-my-zsh/custom
rm -rf ~/.zshrc
ln -s ~/Documents/script/zshrc ~/.zshrc
ln -s ~/Documents/script/custom ~/.oh-my-zsh/custom
fi

### powerline fonts
# git clone --depth=1 https://github.com/powerline/powerline-fonts.git
# cd powerline-fonts
# ./install.sh
# cd ~/Documents

### fzf
if [[ ! -d ~/.fzf ]]; then
echo setup fzf
git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
fi

### xfce
if [[ ! -d ~/.config/xfce4/terminal/colorschemes ]]; then
mkdir -p ~/.config/xfce4/terminal/colorschemes
cp ~/Documents/script/centos8/kevin/.config/xfce4/terminal/colorschemes/tomorrow.theme ~/.config/xfce4/terminal/colorschemes
cp ~/Documents/script/centos8/kevin/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
cp ~/Documents/script/centos8/kevin/.config/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/xfconf/xfce-perchannel-xml
fi

#chsh -s /bin/zsh
# google-chrome --proxy-server=socks5://127.0.0.1:1080
#https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
### perlbrew
if [[ ! -d ~/perl5 ]]; then
echo setup perlbrew
curl -L https://raw.githubusercontent.com/gugod/App-perlbrew/master/perlbrew-install | bash
~/perl5/perlbrew/bin/perlbrew install-cpanm
fi

### pyenv
if [[ ! -d ~/.pyenv ]]; then
echo setup pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
fi
## pyinstaller require CPython build with --enable-shared
# dnf install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel
# env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install xxx


