#!/bin/bash
#
# Script By Khairul SHVPN
# SHVPN Your Internet Speed Expert
# ==================================================

# Initialisation var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

# go to root
cd

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install wget and curl
apt-get update;apt-get -y install wget curl;

# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
wget -O /etc/apt/sources.list "http://vira.cf/sources.list.debian7"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# update
apt-get update

# install webserver
apt-get -y install nginx

# install essential package
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar

# install neofetch
echo "deb http://dl.bintray.com/dawidd6/neofetch jessie main" | sudo tee -a /etc/apt/sources.list
curl -L "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" -o Release-neofetch.key && sudo apt-key add Release-neofetch.key && rm Release-neofetch.key
apt-get update
apt-get install neofetch

echo "clear" >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "Selamat datang ke server $HOSTNAME"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "##############################################"' >> .bashrc
echo 'echo -e "#                                            #"' >> .bashrc
echo 'echo -e "#                                            #"' >> .bashrc
echo 'echo -e "#  Jika anda mempunyai sebarang kemusykilan  #"' >> .bashrc
echo 'echo -e "# Boleh terus hubungi admin seperti di bawah #"' >> .bashrc
echo 'echo -e "#          Facebook - SHVPNMalaysia          #"' >> .bashrc
echo 'echo -e "#          Whatsapp - +601119800265          #"' >> .bashrc
echo 'echo -e "#       Telegram - http://t.me/kaselurk      #"' >> .bashrc
echo 'echo -e "#                                            #"' >> .bashrc
echo 'echo -e "#          Script By Khairul SHVPN           #"' >> .bashrc
echo 'echo -e "#                                            #"' >> .bashrc
echo 'echo -e "#                                            #"' >> .bashrc
echo 'echo -e "##############################################"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "============================================"' >> .bashrc
echo 'echo -e "================Menu Bantuan================"' >> .bashrc
echo 'echo -e "============================================"' >> .bashrc
echo 'echo -e "=menu      (Senarai menu yang boleh digunakan)"' >> .bashrc
echo 'echo -e "=usernew   (Membuat Akaun SSH Baru)"' >> .bashrc
echo 'echo -e "=trial     (Membuat Akaun Trial)"' >> .bashrc
echo 'echo -e "=hapus     (Membuang Akaun Pengguna SSH)"' >> .bashrc
echo 'echo -e "=cek       (Semak Pengguna Yang Sedang Login)"' >> .bashrc
echo 'echo -e "=member    (Semak Senarai Pengguna SSH)"' >> .bashrc
echo 'echo -e "=resvis    (Restart Service Dropbear, Webmin, Squid3, OpenVPN dan SSH)"' >> .bashrc
echo 'echo -e "=reboot    (Reboot VPS Anda)"' >> .bashrc
echo 'echo -e "=speedtest (Speedtest VPS Anda)"' >> .bashrc
echo 'echo -e "=info      (Memaparkan segala info tentang VPS Anda)"' >> .bashrc
echo 'echo -e "=about     (Informasi tentang script auto install)"' >> .bashrc
echo 'echo -e "============================================"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "Sila masukkan kod arahan anda di bawah:- "' >> .bashrc
echo 'echo -e ""' >> .bashrc

# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "http://vira.cf/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by Khairul SHVPN || +601119800265</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "http://vira.cf/vps.conf"
service nginx restart

# install openvpn
wget -O /etc/openvpn/openvpn.tar "http://vira.cf/openvpn-debian.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf "http://vira.cf/1194.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_yg_baru_dibikin.conf
wget -O /etc/network/if-up.d/iptables "http://vira.cf/iptables"
chmod +x /etc/network/if-up.d/iptables
service openvpn restart

# konfigurasi openvpn
cd /etc/openvpn/
wget -O /etc/openvpn/client.ovpn "http://vira.cf/client-1194.conf"
sed -i $MYIP2 /etc/openvpn/client.ovpn;
cp client.ovpn /home/vps/public_html/

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "http://vira.cf/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "http://vira.cf/badvpn-udpgw64"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# setting port ssh
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
service ssh restart

# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 443 -p 80"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
service ssh restart
service dropbear restart

# install squid3
cd
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "http://vira.cf/squid3.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
service squid3 restart

# install webmin
cd
wget -O webmin-current.deb "http://www.webmin.com/download/deb/webmin-current.deb"
dpkg -i --force-all webmin-current.deb;
apt-get -y -f install;
rm /root/webmin-current.deb
service webmin restart

# download script
cd /usr/bin
wget -O menu "http://vira.cf/menu.sh"
wget -O usernew "http://vira.cf/usernew.sh"
wget -O trial "http://vira.cf/trial.sh"
wget -O hapus "http://vira.cf/hapus.sh"
wget -O cek "http://vira.cf/user-login.sh"
wget -O member "http://vira.cf/user-list.sh"
wget -O resvis "http://vira.cf/resvis.sh"
wget -O speedtest "http://vira.cf/speedtest_cli.py"
wget -O info "http://vira.cf/info.sh"
wget -O about "http://vira.cf/about.sh"

echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot

chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x resvis
chmod +x speedtest
chmod +x info
chmod +x about

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid3 restart
service webmin restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
clear
echo "" | tee -a log-install.txt
echo "===========================================" | tee -a log-install.txt
echo "Autoscript SHVPN Server Ini Termasuk:" | tee log-install.txt
echo "===========================================" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Service"  | tee -a log-install.txt
echo "-------"  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 80, 443"  | tee -a log-install.txt
echo "Squid3   : 8080, 3128, 8000 (limit to IP SSH)"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP:81/client.ovpn)"  | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300"  | tee -a log-install.txt
echo "nginx    : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Script"  | tee -a log-install.txt
echo "------"  | tee -a log-install.txt
echo "menu (Tampilan menu)"  | tee -a log-install.txt
echo "usernew (Membuat Akaun SSH)"  | tee -a log-install.txt
echo "trial (Membuat Akaun Trial)"  | tee -a log-install.txt
echo "hapus (Menghapus Akaun SSH)"  | tee -a log-install.txt
echo "cek (Cek User Login)"  | tee -a log-install.txt
echo "member (Cek Member SSH)"  | tee -a log-install.txt
echo "resvis (Restart Service dropbear, webmin, squid3, openvpn dan ssh)"  | tee -a log-install.txt
echo "reboot (Reboot VPS)"  | tee -a log-install.txt
echo "speedtest (Speedtest VPS)"  | tee -a log-install.txt
echo "info (Menampilkan Informasi Sistem)"  | tee -a log-install.txt
echo "about (Informasi tentang script auto install)"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
echo "===============Features lain==============="  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
echo "Webmin   : http://$MYIP:10000/"  | tee -a log-install.txt
echo "Timezone : Asia/Kuala_Lumpur (GMT +8)"  | tee -a log-install.txt
echo "IPv4     : [on]"  | tee -a log-install.txt
echo "IPv6     : [off]"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Script By Khairul SHVPN"  | tee -a log-install.txt
echo "SHVPN Your Internet Speed Expert"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "VPS AKAN DIREBOOT SECARA AUTOMATIK SETIAP PUKUL 12 MALAM"  | tee -a log-install.txt
echo "Sila Reboot VPS Anda!!!"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
echo "Terima kasih kerana menggunakan Autoscript SHVPN, Server anda: $HOSTNAME"  | tee -a log-install.txt
echo "##############################################"  | tee -a log-install.txt
echo "#                                            #"  | tee -a log-install.txt
echo "#                                            #"  | tee -a log-install.txt
echo "#  Jika anda mempunyai sebarang kemusykilan  #"  | tee -a log-install.txt
echo "# Boleh terus hubungi admin seperti di bawah #"  | tee -a log-install.txt
echo "#          Facebook - SHVPNMalaysia          #"  | tee -a log-install.txt
echo "#          Whatsapp - +601119800265          #"  | tee -a log-install.txt
echo "#       Telegram - http://t.me/kaselurk      #"  | tee -a log-install.txt
echo "#                                            #"  | tee -a log-install.txt
echo "#          Script By Khairul SHVPN           #"  | tee -a log-install.txt
echo "#                                            #"  | tee -a log-install.txt
echo "#                                            #"  | tee -a log-install.txt
echo "##############################################"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
cd
rm -f /root/debian7-32bit.sh
