# Update the box

cat <<EOF > /etc/apt/sources.list
deb     http://ftp.cz.debian.org/debian/ jessie main contrib non-free
deb-src http://ftp.cz.debian.org/debian/ jessie main contrib non-free

deb     http://security.debian.org/debian/ jessie/updates main
deb-src http://security.debian.org/debian/ jessie/updates main
EOF

apt-get -y update
apt-get -y install linux-headers-$(uname -r) build-essential
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install unzip bzip2 screen mc vim nano git
apt-get -y install curl lynx links wget rsync

# Set up sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
