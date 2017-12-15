#!/bin/sh

sudo mkdir /mnt/$USER
sudo mount -t cifs -o rw,username=$USER,uid=1000,gid=1000,iocharset=cp936,file_mode=0777,dir_mode=0777 //$1/$USER  /mnt/$USER

echo "export PATH=${PATH}:/home/$USER/tools" >> ~/.bashrc
echo "alias cps='cps.sh'" >> ~/.bashrc
