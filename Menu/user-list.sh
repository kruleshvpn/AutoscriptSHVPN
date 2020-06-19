#!/bin/bash
echo "-------------------------------"
echo "USERNAME          EXPIRED DATE "
echo "==============================="
echo -e ""
while read expired
do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        echo "------------------------------------------"
        printf "%-17s %2s\n" "Username : $AKUN , Account Expired On :" "$exp"
        fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "------------------------------------------"
echo ""
echo "==============================="
echo "Jumlah User Account: $JUMLAH User"
echo "-------------------------------"
echo -e ""
echo -e "Script by Khairul SHVPN"
echo -e ""
