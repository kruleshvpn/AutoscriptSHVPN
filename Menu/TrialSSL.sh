#!/bin/bash
#Script Auto Creating The Trial SSL SSH User
#Expired in One Day Only
#Script by Khairul SHVPN

IP=`dig +short myip.opendns.com @resolver1.opendns.com`

Login=shvpn-`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/sh -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Tahniah, Account Trial berjaya didaftarkan. Share detail kepada user!!!"
echo -e ""
echo -e "==== Details SSH Account ===="
echo -e "Host         : $IP" 
echo -e "Port OpenSSH : 22,143"
echo -e "Port Dropbear: 80,443"
echo -e "Port OpenSSL : 81,444"
echo -e "Port Squid   : 8080,3128,8080"
echo -e "Port OpenVPN : 1194"
echo -e "File OpenVPN : http://$IP:85/client.ovpn"
echo -e "Username     : $Login "
echo -e "Password     : $Pass"
echo -e "-----------------------------"
echo -e "Sah Sehingga : $exp"
echo -e "============================="
echo -e "Script by Khairul SHVPN"
echo -e ""
