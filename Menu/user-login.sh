#!/bin/bash
#
# Script Copyright : Khairul SHVPN
# ================================
# 

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);

echo "------------------------------------------------"
echo "     Senarai Pengguna SSL yang sedang login     ";
echo "------------------------------------------------"
echo "";

for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	USER=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	IP=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $USER - $IP";
	fi
done

echo "";

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

echo "------------------------------------------------"
echo "     Senarai Pengguna SSH yang sedang login     ";
echo "------------------------------------------------"
echo "";

for PID in "${data[@]}"
do
        #echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
	USER=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
	IP=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi
done

echo "";

echo "------------------------------------------------"
echo " Jika didapati ada akaun yang sedang multi login"
echo " Anda boleh KILL connection daripada user dengan"
echo " menggunakan kod dibawah"
echo "------------------------------------------------"
echo " kill nombor PID dan Enter"
echo "------------------------------------------------"

echo "";

echo "Script by Khairul SHVPN";

echo "";
