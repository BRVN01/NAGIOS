#!/bin/bash

verification () {

if [ $(grep -o DISTRIB_ID=Ubuntu /etc/lsb-release) ] && [ $(grep -o DISTRIB_RELEASE=18.04 /etc/lsb-release) ];then
	echo -e "\nSistema: Ubuntu\nPermitido? [\033[00;32mSIM\e[m]"
else
	echo -e "Sistema desconhecido\nPermitido? [\033[00;31mNÃO\e[m]"
	exit 120
fi

program="unzip
zip
tcpdump
openssh-server
mtr
nmap
perl
python
python3
vim
curl
htop
wget
bc
gawk
snmp
snmpd
libnet-snmp-perl
autoconf
gcc
libc6
php7.2
php
make
libapache2-mod-php7.2
apache2
build-essential
xinetd
libmcrypt-dev
libssl-dev
dc
gettext
libmcrypt4"

}

pacotes () {

for i in {1..50}
do
        tam=$(wc -m <<< $2)
        echo -ne "\\r$2$(seq -s '.' "$(($i-$tam))" | tr -d [:digit:])"
	
        sleep 0.003
done

echo -ne "\\r$2$(seq -s '.' "$(($i-$tam))" | tr -d [:digit:])[$1]"
echo ""

}

prerequisites () {

for i in $program
do
	if [[ $(dpkg -l | grep -o "ii  $i") ]];then
		pacotes "\033[0;32mOK\e[m" $i
	else
		notInstalled+="$i "
		pacotes "\033[0;31mNot Installed\e[m" $i
	fi

done

if [[ -z $notInstalled ]];then 
	:
else
	echo -e "\n\n"
	read -p "Você tem pacotes faltantes, gostaria de instalar eles? [y=sim | n=não] " install

		if [[ $install =~ (y|Y) ]];then
			echo -e "\n\nInstalando os requisitos!!\n"
			sudo apt-get update
			sudo apt install -y $notInstalled

		else
			echo -e "\n\nInstale os requisitos para continuar!\napt install -y $notInstalled"
			exit 100
		fi
fi
test $? -eq 0 && cont=0 || cont="Erro nos requisitos"
}


install_nagios () {

echo -e "\nIniciando a instalação do Nagios!!\n\n"

local commands='cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz
tar xzf nagioscore.tar.gz
cd /tmp/nagioscore-nagios-4.4.5/
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled
sudo make all
sudo make install-groups-users
sudo usermod -a -G nagios www-data
sudo make install
sudo make install-daemoninit
sudo make install-commandmode
sudo make install-config
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi
sudo ufw allow Apache
sudo ufw reload
echo -e "\n\n\033[1;33mDigite a senha do usuário nagiosadmin\e[m\n\n"
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo chown nagios. /usr/local/nagios/etc/htpasswd.users
sudo systemctl restart apache2.service
sudo systemctl start nagios.service
sudo systemctl status apache2.service
sudo systemctl status nagios.service'

for var in "$commands"
do
	test -z "${var}" && echo "Erro no processo de instalação do Nagios" && exit 1
        eval "${var}"
	if [ $? -ne 0 ];then
		echo "Command error: ${var}"
	else
		:
	fi
done

test $? -eq 0 && cont1=0 || cont1="Erro install nagios"
}


install_plugins () {
echo -e "\nIniciando a instalação dos Plugins!!\n\n"

local command='cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz
cd /tmp/nagios-plugins-release-2.2.1/
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install
sudo systemctl restart nagios.service
sudo systemctl status nagios.service'

for var in "$command"
do
	test -z "${var}" && echo "Erro no processo de instalação dos Plugins" && exit 1
	
	eval "${var}"	
	if [ $? -ne 0 ];then
		echo "Command error: ${var}"
	else
		:
	fi
done

test $? -eq 0 && cont2=0 || cont2="Error install plugins"
}

#......................................................INICIO.........................................................................#
verification

if [ $? -eq 0 ];then
	echo -e "\nVerificando Requisitos!\n"
	prerequisites
fi
clear

if [ $cont -eq 0 ];then
 	if [ $(systemctl is-enabled nagios 2>/dev/null) ];then
 		clear && echo "Nagios já está instalado!!" && sleep 2
 		cont1=0
 	else
 		install_nagios
 	fi

 else
 	echo "$cont"
 
fi

if [ $cont1 -eq 0 ];then
	if [ -s /usr/local/nagios/libexec/check_load ];then
		echo -e "\n\nPlugins já estão instalados!!\n\n"
		exit 0
	
	else
		install_plugins
	fi

else
	echo "$cont1"
	exit 102
fi

test $cont2 -eq 0 && echo -e "\n\n\033[1;33mTeste sua aplicação Nagios\e[m\n\n" || echo "$cont2"
