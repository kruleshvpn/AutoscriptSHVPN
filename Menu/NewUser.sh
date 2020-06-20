#!/bin/bash
#Script Auto Creating The SSH User
#Script By Khairul SHVPN

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo ""
echo "  Please screenshot this page for future reference"
echo ""
echo "Tahniah, Account Trial berjaya didaftarkan. Sila share detail kepada user!!!"
echo ""
echo "==== Details SSH Account ===="
echo "Host         : $IP"
echo "Port OpenSSH : 22,143"
echo "Port Dropbear: 80,443"
echo "Port Squid   : 8080,3128,8080"
echo "Port OpenVPN : 1194"
echo "File OpenVPN : http://$IP/client.ovpn"
echo "Username     : $Login " 
echo "Password     : $Pass"
echo "-----------------------------"
echo "Account Expired Date" 
echo "-----------------------------"  
date -d "$hari days" +"%d-%m-%Y" 
echo "=============================" 
echo "Script by Khairul SHVPN"
echo -e ""
