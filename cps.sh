#!/bin/sh

datename=$(date +%Y%m%d-%H%M%S)
basePath=$(cd; pwd)
currentPath=$(pwd)
cutEnd=${currentPath#*$USER/}
cut2End=${cutEnd%%/*}
projPath=${basePath}"/"${cut2End}

apkPath2p1="$projPath/out/target/product/$1/system/app/$2"
apkPath2p2="$projPath/out/target/product/$1/system/priv-app/$2"
apkPath3p1="$basePath/$1/out/target/product/$2/system/app/$3"
apkPath3p2="$basePath/$1/out/target/product/$2/system/priv-app/$3"


if [ $# -eq 3 ];then
	if [ -d $apkPath3p1 ]; then
		echo "$apkPath3p1"
		mkdir /mnt/$USER/$datename
		cp $apkPath3p1*.apk /mnt/$USER/$datename/
		echo "Success. Transit Server Directory: $datename"
	elif [ -d $apkPath3p2 ]; then
		echo "$apkPath3p2"
		mkdir /mnt/$USER/$datename
		cp $apkPath3p2*apk /mnt/$USER/$datename/
		echo "Success. Transit Server Directory: $datename"
	else 
		echo "Directory not exist."
	fi
elif [ $# -eq 2 ]; then
	if [ -d $apkPath2p1 ]; then
		echo "$apkPath2p1"
		mkdir /mnt/$USER/$datename
		cp $apkPath2p1/*.apk /mnt/$USER/$datename/
		echo "Success. Transit Server Directory: $datename"
	elif [ -d $apkPath2p2 ]; then
		echo "$apkPath2p2"
		mkdir /mnt/$USER/$datename
		cp $apkPath2p2/*apk /mnt/$USER/$datename/
		echo "Success. Transit Server Directory: $datename"
	else 
		echo "Directory not exist."
	fi
else
	echo "params length error(2 or 3 params needed)."
fi
