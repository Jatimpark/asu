#!/bin/bash
# =========================================
BURIQ () {
curl -sS https://raw.githubusercontent.com/Jatimpark/permission/main/ip > /root/tmp
data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
for user in "${data[@]}"
do
exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
d1=(`date -d "$exp" +%s`)
d2=(`date -d "$biji" +%s`)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
echo $user > /etc/.$user.ini
else
rm -f /etc/.$user.ini > /dev/null 2>&1
fi
done
rm -f /root/tmp
}
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/Jatimpark/permission/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)
Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
if [ "$CekOne" = "$CekTwo" ]; then
res="Expired"
fi
else
res="Permission Accepted..."
fi
}
PERMISSION () {
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIN=$(curl -sS https://raw.githubusercontent.com/Jatimpark/permission/main/ip | awk '{print $4}' | grep $MYIP)
if [ "$MYIP" = "$IZIN" ]; then
Bloman
else
res="Permission Denied!"
fi
BURIQ
}
x="ok"
PERMISSION
if [ "$res" = "Expired" ]; then
Exp="\e[31mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/Jatimpark/permission/main/ip | grep $MYIP | awk '{print $3}')
fi
clear
clear
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2

UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek " 
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek " 
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... " 
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... " 
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek " 
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... " 
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
#export sem=$( curl -s https://raw.githubusercontent.com/artanodrop/permission/main/versions)
# TOTAL RAM
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
# GETTING DOMAIN NAME
Domen="$(cat /etc/xray/domain)"
#Slow="$(cat /root/nsdomain)"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
RAM=$(free -m | awk 'NR==2 {print $2}')
#USAGERAM=$(free -m | awk 'NR==2 {print $3}')
MEMOFREE=$(printf '%-1s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
MODEL=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
DATEVPS=$(date +'%d/%m/%Y')
TIMEZONE=$(printf '%(%H:%M:%S)T')
#SERONLINE=$(uptime -p | cut -d " " -f 2-10000)
clear
echo -e ""
echo -e ""
echo -e "\E[44;1;39m ꧁࿇ SCRIPT SEDERHANA PENUH CINTA ࿇꧂ \E[0m"
echo -e ""
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan} │                  ${BIPurple}${NC}INFO SERVER VPS${NC}"     
echo -e "${BICyan} │"
echo -e " ${BICyan}│  ${BICyan} Hostname     : $HOSTNAME"
echo -e " ${BICyan}│  ${BICyan} Public IP    : $IPVPS"
echo -e " ${BICyan}│  ${BICyan} Domain       : $Domen"
echo -e " ${BICyan}│  ${BICyan} ISP          : $ISPVPS"
echo -e " ${BICyan}│  ${BICyan} Total RAM    : ${totalram}MB"
echo -e " ${BICyan}│  ${BICyan} Usage Memory : $MEMOFREE${NC}"
echo -e " ${BICyan}│  ${BICyan} LoadCPU      : $LOADCPU%${NC}"
echo -e " ${BICyan}│  ${BICyan} Core System  : $CORE${NC}"
echo -e " ${BICyan}│  ${BICyan} Waktu Aktif  : $uphours $upminutes $uptimecek"
echo -e " ${BICyan}│  ${BICyan} System OS    : $MODEL${NC}"
echo -e " ${BICyan}│  ${BICyan} Date         : $DATEVPS${NC}"
echo -e " ${BICyan}│  ${BICyan} Time         : $TIMEZONE${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "     ${BICyan}[${BIWhite}01${BICyan}] SSH     ${BICyan}[${BIYellow}Menu${BICyan}]${NC}"    "     ${BICyan}[${BIWhite}07${BICyan}] BACKUP    ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "${BICyan}   "
echo -e "     ${BICyan}[${BIWhite}02${BICyan}] VMESS   ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "     ${BICyan}[${BIWhite}08${BICyan}] ADD-HOST  ${NC}"
echo -e "     ${BICyan}[${BIWhite}03${BICyan}] VLESS   ${BICyan}[${BIYellow}Menu${BICyan}]${NC}"  "     ${BICyan}[${BIWhite}09${BICyan}] CERT SSL     ${NC}" "${BICyan}  "
echo -e "     ${BICyan}[${BIWhite}04${BICyan}] TROJAN  ${BICyan}[${BIYellow}Menu${BICyan}]${NC}" "     ${BICyan}[${BIWhite}10${BICyan}] INSTAL UDP         "
echo -e "     ${BICyan}[${BIWhite}05${BICyan}] SETTING ${BICyan}[${BIYellow}Menu${BICyan}]${NC}"  "     ${BICyan}[${BIWhite}11${BICyan}] UPDATE MENU ${NC}"
echo -e "     ${BICyan}[${BIWhite}06${BICyan}] TRIALL  ${BICyan}[${BIYellow}Menu${BICyan}]${NC}"  "     ${BICyan}[${BIWhite}12${BICyan}] EXIT  ${NC}"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan} │  \033[0m ${BOLD}${GREEN}   ${BIYellow} SSH${GREEN}       ${BIYellow}VMESS  ${GREEN}     ${BIYellow}VLESS  ${GREEN}     ${BIYellow}TROJAN${GREEN}     $NC "
echo -e "${BICyan} │  \033[0m ${Blue}     $ssh1         $vma           $vla           $tra              $NC"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "    ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
echo -e "  ${BICyan}     STUNNEL ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan} │$NC ${BICyan}HARI INI${NC}: ${red}$ttoday$NC ${BICyan}KEMARIN${NC}: ${red}$tyest$NC ${BICyan}BULAN${NC}: ${red}$tmon$NC $NC"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
echo -e "${BICyan} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}  ${RED}▁ ${CYAN}▂ ${GREEN}▄ ${ORANGE}▅${PINK} ▆${GREEN} ▇ ${RED}█${BLUE}𒆜${CYAN} ༻${NC}  SCRIPT ARYA BLITAR ${BLUE}༺ ${RED}𒆜${GREEN}█ ${ORANGE}▇ ${CYAN}▆ ${RED}▅ ${GREEN}▄ ${ORANGE}▂ ${PINK}▁\E[0m"
echo -e "${BICyan} └─────────────────────────────────────────────────────┘${NC}"
DATE=$(date +'%d %B %Y')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e " ${BICyan}│${ICyan}  Expiry In     : ${NC}$(( (d1 - d2) / 86400 )) ${ORANGE}Days $NC"
}
mai="datediff "$Exp" "$DATE""
echo -e " ${BICyan}┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${BICyan}│ ${ICyan} Version       : ${NC}$(cat /opt/.ver) Last Update ${NC}"
echo -e " ${BICyan}│${ICyan}  User          :${NC} $Name ${NC}"
if [ $exp \< 1000 ];
then
echo -e " ${ICyan}│${ICyan} License     :${RED}$sisa_hari$NC Days Tersisa ${BICyan}"
else
datediff "$Exp" "$DATE"
fi;
echo -e " ${BICyan}└─────────────────────────────────────────────────────┘${NC}"
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-set ;;
6) clear ; menu-trial ;;
7) clear ; menu-bckp ;;
8) clear ; add-host ;;
9) clear ; certv2ray ;;
10) clear ; clear ; wget --load-cookies /tmp/cookies.txt ${UDPX} -O install-udp && rm -rf /tmp/cookies.txt && chmod +x install-udp && ./install-udp ;;
11) clear ; update ;;
12) clear ; exit ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
