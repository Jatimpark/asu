#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 


IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
echo "Starting Backup"
sleep 1
echo "Membuat Directory"
mkdir /root/backup
sleep 1
echo "Start Backup"
sleep 2
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /var/lib/SIJA/ backup/SIJA
cp -r /etc/xray backup/xray
cp -r /home/vps/public_html backup/public_html
cp -r /root/udp backup/udp
cd /root
zip -r $Name-$IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$Name-$IP-$date.zip MW-VPN:
url=$(rclone link dr:$Name-$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file."
echo -e "=================================" 
echo -e "Detail Backup : "
echo -e "================================="
echo -e "IP VPS        : $IP"
echo -e "Client Name   : $Name"
echo -e "Link Backup   : $link"
echo -e "================================="
echo -e "Script By Arya Blitar"
echo ""
echo -e "If you want to restore data, please enter the link above"
rm -rf /root/backup
rm -r /root/$Name-$IP-$date.zip
echo "Done"
