#!/bin/sh
echo "Setting gsettings..."
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 1080

echo "Setting sslocal..."
echo "<mypassword>" | sudo -S sslocal -c <shadowsocks.json_path> -d start

echo "Setting privoxy..."
echo "<mypassword>" | sudo -S service privoxy restart
echo "<mypassword>" | sudo -S privoxy --user privoxy /etc/privoxy/config

