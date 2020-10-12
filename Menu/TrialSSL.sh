#!/bin/bash
#Script Auto Creating The Trial SSL SSH User
#Expired in One Day Only
#Script by Khairul SHVPN

IP=`wget -q0- ipv4.icanhazip.com`

Login=trialssl-`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`

useradd -e `date -d "$hari days" +"%Y-%m-%d"` -s /bin/sh -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo ""
echo "Please screenshot this page for future reference"
echo ""
echo "Tahniah, Account Trial berjaya didaftarkan. Sila share detail kepada user!!!"
echo ""
echo "==== Details SSH Account ===="
echo "Host         : $IP"
echo "Port OpenSSH : 22,143"
echo "Port Dropbear: 80,443"
echo "Port SSL     : 81,444"
echo "Port Squid   : 8080,3128,8080"
echo "Port OpenVPN : 1194"
echo "Username     : $Login " 
echo "Password     : $Pass"
echo "-----------------------------"
echo "Account Expired Date" 
echo "-----------------------------"  
date -d "$hari days" +"%d-%m-%Y" 
echo "=============================" 
echo "Script by Khairul SHVPN"
echo -e ""
