#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
NC="\e[0m"
RED="\033[0;31m" 

cd
echo "This Feature Can Only Be Used According To Vps Data With This Autoscript"
echo "Please input link to your vps data backup file."
echo "You can check it on your email if you run backup data vps before."
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -rp "       Link File: " -e url
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp passwd /etc/
cp group /etc/
cp shadow /etc/
cp gshadow /etc/
#cp -r wireguard /etc/
#cp chap-secrets /etc/ppp/
#cp passwd1 /etc/ipsec.d/passwd
#cp ss.conf /etc/shadowsocks-libev/ss.conf
#cp -r anuy639 /var/lib/
#cp -r sstp /home/
cp -r xray /etc/
#cp -r trojan-go /etc/
#cp -r shadowsocksr /usr/local/
cp -r public_html /home/vps/
cp -r udp /root/udp
#cp crontab /etc/
#start
rm -rf /root/backup
rm -f backup.zip
echo Done