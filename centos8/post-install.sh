# echo https://ykwoshia:passwd@github.com > ~/.git-credentials
GIT_REMOTE=http://192.168.199.133/ykwoshia
mkdir -p ~/Documents
if [[ ! -d ~/Documents/myvim ]]; then
    echo clone myvim
    if [[ -z "$GIT_REMOTE" ]]; then
        git clone https://github.com/myvim.git ~/Documents/myvim
    else
        git clone ${GIT_REMOTE}/myvim.git ~/Documents/myvim
    fi
fi

if [[ ! -d ~/Documents/script ]]; then
    echo clone script
    if [[ -z "$GIT_REMOTE" ]]; then
        git clone https://github.com/script.git ~/Documents/script
    else
        git clone ${GIT_REMOTE}/script.git ~/Documents/script
    fi
fi




### vim
if [[ ! -d ~/.vim ]]; then
    echo setup myvim
    ln -s ~/Documents/myvim/vimrc ~/.vimrc
    if [[ -f ~/vim.tar.gz ]]; then
        tar -zxf vim.tar.gz
    else
        mkdir -p ~/.vim/colors
        mkdir -p ~/.vim/autoload
        cp ~/Documents/myvim/Tomorrow-Night-Eighties.vim ~/.vim/colors
        cp ~/Documents/myvim/plug.vim ~/.vim/autoload
    fi

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
    if [[ -z "$GIT_REMOTE" ]]; then
        git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    else
        git clone ${GIT_REMOTE}/oh-my-zsh.git ~/.oh-my-zsh
    fi
    rm -rf ~/.oh-my-zsh/custom
    rm -rf ~/.zshrc
    ln -s ~/Documents/script/zshrc ~/.zshrc
    ln -s ~/Documents/script/custom ~/.oh-my-zsh/custom
    if [[ ! -f ~/.z ]]; then
        touch ~/.z
    fi
fi

### powerline fonts
if [[ ! -d ~/Documents/powerline-fonts ]]; then
    if [[ -z "$GIT_REMOTE" ]]; then
        git clone --depth=1 https://github.com/powerline/powerline-fonts.git
    else
        git clone ${GIT_REMOTE}/powerline-fonts.git ~/Documents/powerline-fonts
    fi
~/Documents/powerline-fonts/install.sh
fi

### fzf
if [[ ! -d ~/.fzf ]]; then
    echo setup fzf
    if [[ -f ~/fzf.tar.gz ]]; then
        tar -xzf fzf.tar.gz
    else
        if [[ -z "$GIT_REMOTE" ]]; then
            git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
        else
            git clone ${GIT_REMOTE}/fzf.git ~/.fzf
        fi
        ~/.fzf/install
    fi
fi

### xfce
if [[ ! -d ~/.config/xfce4/terminal/colorschemes ]]; then
    mkdir -p ~/.config/xfce4/terminal/colorschemes
    cp ~/Documents/script/centos8/kevin/.config/xfce4/terminal/colorschemes/tomorrow.theme ~/.config/xfce4/terminal/colorschemes
    cp ~/Documents/script/centos8/kevin/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal
    mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml
    cp ~/Documents/script/centos8/kevin/.config/xfce4/xfconf/xfce-perchannel-xml/* ~/.config/xfce4/xfconf/xfce-perchannel-xml
    mkdir -p ~/.config/autostart
    cp ~/Documents/script/centos8/kevin/.config/autostart/* ~/.config/autostart
fi

#chsh -s /bin/zsh
# google-chrome --proxy-server=socks5://127.0.0.1:1080
#https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
### perlbrew
if [[ ! -d ~/perl5 ]]; then
    echo setup perlbrew
    if [[ -f ~/perl5.tar.gz ]]; then
        tar -zxf perl5.tar.gz
    else
        curl -L https://raw.githubusercontent.com/gugod/App-perlbrew/master/perlbrew-install | bash
        ~/perl5/perlbrew/bin/perlbrew install-cpanm
    fi
fi

### pyenv
if [[ ! -d ~/.pyenv ]]; then
    echo setup pyenv
    if [[ -f ~/pyenv.tar.gz ]]; then
        tar -zxf pyenv.tar.gz
    else
        curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
    fi
fi
## pyinstaller require CPython build with --enable-shared
# dnf install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel
# env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install xxx


