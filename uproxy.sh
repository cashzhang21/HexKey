#!/bin/sh
echo "Setting gsettings..."
gsettings set org.gnome.system.proxy mode 'none'
gsettings set org.gnome.system.proxy.socks host ''
gsettings set org.gnome.system.proxy.socks port 0 

echo "Setting sslocal..."
echo "<mypassword>" | sudo -S sslocal -c <shadowsocks.json_path> -d stop

#echo "Setting privoxy..."
#echo "<mypassword>" | sudo -S service privoxy stop

