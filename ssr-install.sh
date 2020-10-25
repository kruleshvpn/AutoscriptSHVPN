#!/bin/bash
#
# Script By Khairul SHVPN
# SHVPN Your Internet Speed Expert
# ==================================================

snap install shadowsocks-libev;
mkdir -p /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev;
touch /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json;
echo "{" | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "server":"ssr.shvpnpower.cf"," | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "mode":"tcp_and_udp"," | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "server_port":443," | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "password":"shvpnpowerssr"," | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "timeout":180," | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "method":"aes-256-gcm"," | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "   "nameserver":"8.8.8.8"" | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json
echo "}" | tee -a /var/snap/shadowsocks-libev/common/etc/shadowsocks-libev/config.json

cd /etc/systemd/system;
wget -o shadowsocks-libev-server@.service "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/sss.json"
