#!/bin/bash
#Script Untuk Membuang User Account SSH & OpenVPN
#Script by Khairul SHVPN

read -p "Nama user SSH yang hendak dibuang : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "User $Pengguna telah dibuang dari system."
else
        echo -e "GAGAL: User $Pengguna tiada dalam rekod atau tidak dijumpai."
fi
