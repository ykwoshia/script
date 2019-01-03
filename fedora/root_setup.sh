## create files if not exists
echo "modify sslocal before run"
exit 0
if [[ ! -f /etc/yum.repos.d/google-chrome.repo ]]; then
	cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
fi

if [[ $HOSTNAME="myfedora.localdomain" ]]; then
	dnf -y update
fi


dnf -y install git

# use nvim and vim-X11
dnf -y install vim-X11
dnf -y install neovim python2-neovim python3-neovim

dnf -y install tmux
dnf -y install zsh
dnf -y install adobe-source-code-pro-fonts
dnf -y install ctags
#dnf -y install fzf
# fzf install in user dir
dnf -y install google-chrome-stable --nogpgcheck

# ========= here
# virtualbox
dnf -y install gcc
dnf -y install perl
dnf -y install kernel-devel-4.13.9-300.fc27.x86_64
dnf -y install kernel-headers-4.13.9-300.fc27.x86_64

# python compile
dnf -y install zlib-devel
dnf -y install bzip2
dnf -y install bzip2-devel
dnf -y install readline-devel
dnf -y install sqlite
dnf -y install sqlite-devel
dnf -y install openssl-devel
dnf -y install xz xz-devel
dnf -y install libffi-devel

dnf -y install tcl
dnf -y install tcl-devel
dnf -y install tk
dnf -y install tk-devel

dnf -y install python2-wxpython

# office
dnf -y install libreoffice


# services
dnf -y install httpd
dnf -y install cobbler
dnf -y install xinetd
dnf -y install dhcpd
dnf -y install rsync

pip install shadowsocks

mkdir -p /etc/shadowsocks
cat <<END > /etc/shadowsocks/config.json
{
	"server":"",
	"server_port":13753,
	"local_address":"127.0.0.1",
	"local_port":"1080",
	"password":"",
	"method":"rc4-md5",
	"time_out":300
}
END

sslocal -c /etc/shadowsocks/config.json -d start

