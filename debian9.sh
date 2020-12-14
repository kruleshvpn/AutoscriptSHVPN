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
apt-get -y remove unscd
y
cd
# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
touch /etc/rc.local
cp /proc/sys/net/ipv6/conf/all/disable_ipv6 /etc/rc.local

#change jessie
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/sources.list.debian9"
#change stretch to jessie for debian src

# install wget and curl
apt-get update;apt-get -y install wget curl;

# set time GMT +8
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service ssh restart

# set repo
wget -O /etc/apt/sources.list "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/sources.list.debian7"
wget "http://www.dotdeb.org/dotdeb.gpg"
wget "http://www.webmin.com/jcameron-key.asc"
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc

# update
apt-get update

# install webserver
apt-get -y install nginx

# install essential package
apt-get -y install nano iptables dnsutils openvpn screen whois ngrep unzip unrar bmon iftop htop nmap axel traceroute sysv-rc-conf dnsutils bc nethogs vnstat less screen psmisc apt-file ptunnel mtr git zsh mrtg snmp snmpd snmp-mibs-downloader rsyslog debsums rkhunter

# disable exim
service exim4 stop
sysv-rc-conf exim4 off

# update apt-file
apt-file update

# setting vnstat
vnstat -u -i eth0
service vnstat restart

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
echo 'echo -e "=Menu       (Senarai menu yang boleh digunakan)"' >> .bashrc
echo 'echo -e "=NewUser    (Membuat Akaun SSH Baru)"' >> .bashrc
echo 'echo -e "=NewUserSSL (Membuat Akaun SSH SSL Baru)"' >> .bashrc
echo 'echo -e "=Trial      (Membuat Akaun Trial)"' >> .bashrc
echo 'echo -e "=TrialSSL   (Membuat Akaun Trial SSL)"' >> .bashrc
echo 'echo -e "=Remove     (Membuang Akaun Pengguna SSH)"' >> .bashrc
echo 'echo -e "=Check      (Semak Pengguna Yang Sedang Login)"' >> .bashrc
echo 'echo -e "=User       (Semak Senarai Pengguna SSH)"' >> .bashrc
echo 'echo -e "=ResServ    (Restart Service Dropbear, Webmin, Squid3, OpenVPN dan SSH)"' >> .bashrc
echo 'echo -e "=Reboot     (Reboot VPS Anda)"' >> .bashrc
echo 'echo -e "=Speedtest  (Speedtest VPS Anda)"' >> .bashrc
echo 'echo -e "=Info       (Memaparkan segala info tentang VPS Anda)"' >> .bashrc
echo 'echo -e "=About      (Informasi tentang script auto install)"' >> .bashrc
echo 'echo -e "=exit       (Keluar dari terminal)"' >> .bashrc
echo 'echo -e "============================================"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "Sila masukkan kod arahan anda di bawah:- "' >> .bashrc
echo 'echo -e ""' >> .bashrc

# install webserver
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://github.com/kruleshvpn/AutoscriptSHVPN/raw/master/conf/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by Khairul SHVPN. Do contact me if you have any problem (+601119800265)</pre>" > /home/vps/public_html/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/vps.conf"
service nginx restart

# install openvpn
wget -O /etc/openvpn/openvpn.tar "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/openvpn-debian.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/1194.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/1194.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
iptables -t nat -I POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE
iptables-save > /etc/iptables_latest.conf
wget -O /etc/network/if-up.d/iptables "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/iptables"
chmod +x /etc/network/if-up.d/iptables
service openvpn restart

# OpenVPN configuration
cd /etc/openvpn/
wget -O /etc/openvpn/client.ovpn "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/client-1194.conf"
sed -i $MYIP2 /etc/openvpn/client.ovpn;
cp client.ovpn /home/vps/public_html/

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/badvpn-udpgw64"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

# install mrtg
wget -O /etc/snmp/snmpd.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/snmpd.conf"
wget -O /root/mrtg-mem.sh "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/mrtg-mem.sh"
chmod +x /root/mrtg-mem.sh
cd /etc/snmp/
sed -i 's/TRAPDRUN=no/TRAPDRUN=yes/g' /etc/default/snmpd
service snmpd restart
snmpwalk -v 1 -c public localhost 1.3.6.1.4.1.2021.10.1.3.1
mkdir -p /home/vps/public_html/mrtg
cfgmaker --zero-speed 100000000 --global 'WorkDir: /home/vps/public_html/mrtg' --output /etc/mrtg.cfg public@localhost
curl "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/mrtg.conf" >> /etc/mrtg.cfg
sed -i 's/WorkDir: \/var\/www\/mrtg/# WorkDir: \/var\/www\/mrtg/g' /etc/mrtg.cfg
sed -i 's/# Options\[_\]: growright, bits/Options\[_\]: growright/g' /etc/mrtg.cfg
indexmaker --output=/home/vps/public_html/mrtg/index.html /etc/mrtg.cfg
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
if [ -x /usr/bin/mrtg ] && [ -r /etc/mrtg.cfg ]; then mkdir -p /var/log/mrtg ; env LANG=C /usr/bin/mrtg /etc/mrtg.cfg 2>&1 | tee -a /var/log/mrtg/mrtg.log ; fi
cd

# setting port ssh
cd
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
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

# install vnstat gui
cd /home/vps/public_html/
wget http://www.sqweek.com/sqweek/files/vnstat_php_frontend-1.5.1.tar.gz
tar xf vnstat_php_frontend-1.5.1.tar.gz
rm vnstat_php_frontend-1.5.1.tar.gz
mv vnstat_php_frontend-1.5.1 vnstat
cd vnstat
sed -i 's/eth0/eth0/g' config.php
sed -i "s/\$iface_list = array('eth0', 'sixxs');/\$iface_list = array('eth0');/g" config.php
sed -i "s/\$language = 'nl';/\$language = 'en';/g" config.php
sed -i 's/Internal/Internet/g' config.php
sed -i '/SixXS IPv6/d' config.php
cd

# install fail2ban
apt-get -y install fail2ban;service fail2ban restart

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to kaselurk92@gmail.com'

# install squid3
cd
apt-get -y install squid3
mkdir /etc/squid3
cp /etc/squid/errorpage.css /etc/squid3/errorpage.css
touch /etc/squid3/squid.conf
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/squid3.conf"
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/squid3.conf"
sed -i $MYIP2 /etc/squid3/squid.conf;
sed -i $MYIP2 /etc/squid/squid.conf;
service squid restart

#install stunnel
#apt-get install stunnel4
#wget -O /etc/stunnel/stunnel.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/stunnel.conf"
#openssl genrsa -out key.pem 2048
#openssl req -new -x509 -key key.pem -out cert.pem -days 1095
#cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
#wget -O /etc/default/stunnel4 "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/settingstunnel.conf"
/etc/init.d/stunnel4 restart

# install webmin
cd
wget -O webmin-current.deb "http://www.webmin.com/download/deb/webmin-current.deb"
dpkg -i --force-all webmin-current.deb;
apt-get -y -f install;
rm /root/webmin-current.deb
service webmin restart

# download script
cd /usr/bin
wget -O Menu "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/menu.sh"
wget -O NewUser "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/NewUser.sh"
wget -O NewUserSSL "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/NewUserSSL.sh"
wget -O Trial "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/Trial.sh"
wget -O TrialSSL "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/TrialSSL.sh"
wget -O UserOVPN "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/UserOVPN.sh"
wget -O Remove "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/Remove.sh"
wget -O Check "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/user-login.sh"
wget -O User "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/user-list.sh"
wget -O ResServ "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/ResServ.sh"
wget -O Speedtest "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/speedtest_cli.py"
wget -O Info "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/info.sh"
wget -O About "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Menu/About.sh"

echo "0 0 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "0 1 * * * root /etc/rc.local" > /etc/cron.d/badvpn

chmod +x Menu
chmod +x NewUser
chmod +x NewUserSSL
chmod +x Trial
chmod +x TrialSSL
chmod +x UserOVPN
chmod +x Remove
chmod +x Check
chmod +x User
chmod +x ResServ
chmod +x Speedtest
chmod +x Info
chmod +x About

cd /etc

wget -O rc.local "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Fix/rc.local"
chmod +x rc.local

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
service nginx start
service openvpn restart
service cron restart
service ssh restart
service dropbear restart
service squid restart
service webmin restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# info
clear
echo "" | tee -a log-install.txt
echo "===========================================" | tee -a log-install.txt
echo "Autoscript SHVPN Server Ini Termasuk:" | tee log-install.txt
echo "===========================================" | tee -a log-install.txt
echo "===============Service Port================"  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
echo "OpenSSH  : 22, 143"  | tee -a log-install.txt
echo "Dropbear : 85, 443"  | tee -a log-install.txt
echo "Squid3   : 8080, 3128, 8000 (limit to IP SSH)"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (client config : http://$MYIP/client.ovpn)"  | tee -a log-install.txt
echo "badvpn   : badvpn-udpgw port 7300 & 7400"  | tee -a log-install.txt
echo "nginx    : 80"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
echo "==================Script==================="  | tee -a log-install.txt
echo "==========================================="  | tee -a log-install.txt
echo "Menu      (Senarai menu yang boleh digunakan)"  | tee -a log-install.txt
echo "NewUser   (Membuat Akaun SSH Baru)"  | tee -a log-install.txt
echo "NewUserSSL   (Membuat Akaun SSH Baru)"  | tee -a log-install.txt
echo "Trial     (Membuat Akaun Trial)"  | tee -a log-install.txt
echo "TrialSSL     (Membuat Akaun Trial)"  | tee -a log-install.txt
echo "Remove    (Membuang Akaun Pengguna SSH)"  | tee -a log-install.txt
echo "Check     (Semak Pengguna Yang Sedang Login)"  | tee -a log-install.txt
echo "User      (Semak Senarai Pengguna SSH)"  | tee -a log-install.txt
echo "ResServ   (Restart Service Dropbear, Webmin, Squid3, OpenVPN dan SSH)"  | tee -a log-install.txt
echo "Reboot    (Reboot VPS Anda)"  | tee -a log-install.txt
echo "Speedtest (Speedtest VPS Anda)"  | tee -a log-install.txt
echo "Info      (Memaparkan segala info tentang VPS Anda)"  | tee -a log-install.txt
echo "About     (Informasi tentang script auto install)"  | tee -a log-install.txt
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
echo ""  | tee -a log-install.txt
echo "Terima kasih kerana menggunakan Autoscript SHVPN, Server anda: $HOSTNAME"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
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
wget -O ovpn.sh "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/ovpn.sh"
chmod +x ovpn.sh
cd
apt -y update
apt -y upgrade
apt -y install stunnel
cd /etc/stunnel
wget -O stunnel.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/stunnel.conf"
wget -O stunnel.pem "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/stunnel.pem"
wget -O cert.pem "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/cert.pem"
cd
cd /etc/default
wget -O stunnel4 "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/conf/stunnel4"
service ssh restart
service stunnel4 restart
cd
wget -O fixovpn.sh "http://shvpnpower.cf:85/fix.sh"
wget -O fixdrop.sh "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Fix/fixdrop.sh"
bash fixdrop.sh && rm -f /root/debian9.sh && bash fixovpn.sh
