#!/bin/bash
#
# Script By Khairul SHVPN
# SHVPN Your Internet Speed Expert
# ==================================================

apt update && apt upgrade -y;
apt install -y snapd;
apt install -y haveged;
wget https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/ssr-install.sh;
reboot
