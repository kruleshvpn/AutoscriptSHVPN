cd /etc/default/;
wget -O dropbear "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Fix/DropPort";
cd /etc/nginx/conf.d/;
wget -O vps.conf "https://raw.githubusercontent.com/kruleshvpn/AutoscriptSHVPN/master/Fix/vps.conf";
service dropbear restart;
service nginx restart;
