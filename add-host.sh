#!/bin/bash

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`

clear
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Isi Domain/Host Yank : " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
menu
else
echo "IP=$host" > /var/lib/SIJA/ipvps.conf
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo "  Ok ! Wait Tunggu Sebentar Sayank...."
sleep 2
certv2ray
echo ""
read -n 1 -s -r -p "Tekan Enter Balik menu"
menu
fi
