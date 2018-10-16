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
dnf -y update vim-minimal
dnf -y install vim
dnf -y install tmux
dnf -y install zsh
#dnf -y install fzf
# fzf install in user dir
dnf -y install google-chrome-stable --nogpgcheck
# dnf install gnome-tweak-tool

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

