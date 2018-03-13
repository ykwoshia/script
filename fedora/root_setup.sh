cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

dnf install google-chrome-stable --nogpgcheck
dnf install tmux
dnf install zsh
dnf install fzf

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

