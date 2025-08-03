#!/bin/bash

# Script untuk install dan setup LXD di Ubuntu/Debian
echo "🔧 Install snapd (jika belum ada)..."
sudo apt install snapd -y

echo "📦 Install LXD dari Snap..."
sudo snap install lxd

echo "✅ LXD terinstall. Versi:"
lxd --version

lxd init --auto

echo "✅ Install Ubuntu 20.04:"
lxc launch ubuntu:20.04 ubuntu-ssh

echo "Izin port:"
lxc config device add ubuntu-ssh http  proxy listen=tcp:0.0.0.0:80   connect=tcp:127.0.0.1:80
lxc config device add ubuntu-ssh https proxy listen=tcp:0.0.0.0:443  connect=tcp:127.0.0.1:443
lxc config device add ubuntu-ssh port109  proxy listen=tcp:0.0.0.0:109  connect=tcp:127.0.0.1:109
lxc config device add ubuntu-ssh port143  proxy listen=tcp:0.0.0.0:143  connect=tcp:127.0.0.1:143
lxc config device add ubuntu-ssh port2200 proxy listen=tcp:0.0.0.0:2200 connect=tcp:127.0.0.1:2200
lxc config device add ubuntu-ssh port1194 proxy listen=tcp:0.0.0.0:1194 connect=tcp:127.0.0.1:1194

wget https://raw.githubusercontent.com/Babgsuke/sct/main/Fls/bbr.sh &&  chmod +x bbr.sh && ./bbr.sh
