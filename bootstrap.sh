sudo su
apt-get clear
apt-get update
apt-get -y install ubuntu-desktop

wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)

startx