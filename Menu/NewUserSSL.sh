#!/bin/bash
#Script Auto Creating The SSH SSL User
#Script By Khairul SHVPN

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/sh -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Tahniah, Account berjaya didaftarkan. Share detail kepada user!!!"
echo -e ""
echo -e "==== Details SSH Account ===="
echo -e "Host         : $IP" 
echo -e "Port OpenSSH : 22,143"
echo -e "Port Dropbear: 80,443"
echo -e "Port Squid   : 8080,3128,8080"
echo -e "Port OpenVPN : 1194"
echo -e "File OpenVPN : http://$IP:81/client.ovpn"
echo -e "Username     : $Login "
echo -e "Password     : $Pass"
echo -e "-----------------------------"
echo -e "Sah Sehingga : $exp"
echo -e "============================="
echo -e "Script by Khairul SHVPN"
echo -e ""
