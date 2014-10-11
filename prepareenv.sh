#!/bin/sh
if [ ! -x docker ]
then
cd /etc/apt/
sudo cp sources.list sources.list.backup
sudo cat > sources.list << 'EOF'
deb http://mirrors.oschina.net/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-backports main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.oschina.net/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.oschina.net/ubuntu/ trusty-updates main restricted universe multiverse
EOF
wget -qO- https://get.docker.io/gpg | sudo apt-key add -
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential -y
sudo apt-get install lxc-docker -y
sudo gpasswd -a ${USER} docker
sudo service docker restart
sudo reboot
fi

if [ -x docker ]
then
vendor=mason
mkdir ~/docker/source/ -p
cd ~/docker/source/
sudo apt-get install debootstrap -y
git clone https://github.com/docker/docker.git
cd docker/contrib/
sudo ./mkimage.sh -t $vendor/ubuntu debootstrap --include=ubuntu-minimal --components=main,universe trusty  http://mirrors.oschina.net/ubuntu/
fi
