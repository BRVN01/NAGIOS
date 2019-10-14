Guia de instalação do Nagios:

https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html

https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/toc.html



A instalação foi feita usando o Ubuntu 18.04



<span style="color:#d86c00">**Baixando os pacotes "DEVS"**</span>

Vamos baixar alguns pacotes que podemos precisar:

```bash
sudo apt-get install -y unzip zip tcpdump ntp tar bzip2 man openssh-server rsync traceroute nmap screen perl python python3 vim curl htop autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc snmp libnet-snmp-perl gettext
```



<span style="color:#d86c00">**Baixando os pacotes**</span>

Vamos baixar os pacotes de compilação, necessários para compilaro o nagios.

```bash
sudo apt-get install -y autoconf gcc libc6 php7.2 make wget unzip php libapache2-mod-php7.2 libgd-dev apache2 build-essential snmp snmpd libnet-snmp-perl libgd-tools xinetd
```



<span style="color:#d86c00">**Baixando o nagios core**</span>

Vamos baixar o Nagios propriamente dito e os plugins.

```bash
cd /tmp

wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz

tar xzvf nagioscore.tar.gz
tar xzvf nagios-plugins-2.2.1.tar.gz
cd nagioscore-nagios-4.4.5
```



<span style="color:#d86c00">**Compilar o nagios core**</span>

```bash
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled

sudo make all
```



<span style="color:#d86c00">**Criando o grupo e usuarios nagios**</span>

Vamos criar o usuário e grupos do **nagios**, o grupo deve ser **nagcmd**.

```bash
sudo make install-groups-users
sudo usermod -a -G nagios www-data
```



<span style="color:#d86c00">**Install Binaries**</span>

```
sudo make install
```



<span style="color:#d86c00">**Install Service / Daemon**</span>

```
sudo make install-daemoninit
```



<span style="color:#d86c00">**Install Command Mode**</span>

```
sudo make install-commandmode
```



<span style="color:#d86c00">**Install Configuration Files**</span>

```
sudo make install-config

```



<span style="color:#d86c00">**Install Apache Config Files**</span>

```
sudo make install-webconf
sudo a2enmod rewrite
sudo a2enmod cgi

```



<span style="color:#d86c00">**Configure Firewall**</span>

```
sudo ufw allow Apache
sudo ufw reload

```



<span style="color:#d86c00">**Create nagiosadmin User Account**</span>

```
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
sudo chown nagios. /usr/local/nagios/etc/htpasswd.users

```



<span style="color:#d86c00">**Start Apache Web Server/Start Service / Daemon**</span>

```
sudo systemctl restart apache2.service
sudo systemctl start nagios.service

```



<span style="color:#d86c00">**Copiando**</span>



```bash
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/

sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers

```



<span style="color:#d86c00">**Installing The Nagios Plugins**</span>



```bash
cd /tmp

wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz

tar zxf nagios-plugins.tar.gz

cd /tmp/nagios-plugins-release-2.2.1/

sudo ./tools/setup

sudo ./configure

sudo make

sudo make install

```



<span style="color:#d86c00">**Service / Daemon Commands**</span>

```bash
sudo systemctl start nagios.service

sudo systemctl stop nagios.service

sudo systemctl restart nagios.service

sudo systemctl status nagios.service

```



<span style="color:#d86c00">**Checar as configurações**</span>

```bash
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg



```



INSTALAÇÃO DO PNP4NAGIOS

Ele é usado para criação de gráficos de performance.

```bash
sudo apt-get -y install rrdtool php7.2-gd php-rrd librrdtool-oo-perl


wget http://ufpr.dl.sourceforge.net/project/pnp4nagios/PNP-0.6/pnp4nagios-0.6.26.tar.gz

tar zxvf pnp4nagios-0.6.26.tar.gz 

cd pnp4nagios-0.6.26

```



Iniciar a compilação e instalação

```bash
sudo ./configure 

sudo make all 

sudo make install
     - This installs the main program and HTML files


Please run 'sudo make install-webconf' to install the
web configuration file

Please run 'sudo make install-config' to install sample
configuration files

Please run 'sudo make install-init' if you want to use
BULK Mode with NPCD



sudo make fullinstall
     - This installs the main program, runlevel scripts, config and HTML files

- Adicione as linhas abaixo em nagios.cfg
vim /usr/local/nagios/etc/nagios.cfg


# HABILITAR PERFORMANCE_DATA 0 ou 1
process_performance_data=1
# SERVICE PERFORMANCE COM NAGIOS/PNP4NAGIOS
service_perfdata_file=/usr/local/pnp4nagios/var/service-perfdata
service_perfdata_file_template=DATATYPE::SERVICEPERFDATA\tTIMET::$TIMET$\tHOSTNAME::
$HOSTNAME$\tSERVICEDESC::$SERVICEDESC$\tSERVICEPERFDATA::
$SERVICEPERFDATA$\tSERVICECHECKCOMMAND::
$SERVICECHECKCOMMAND$\tHOSTSTATE::$HOSTSTATE$\tHOSTSTATETYPE::
$HOSTSTATETYPE$\tSERVICESTATE::$SERVICESTATE$\tSERVICESTATETYPE::
$SERVICESTATETYPE$
service_perfdata_file_mode=a
service_perfdata_file_processing_interval=15
service_perfdata_file_processing_command=process-service-perfdata-file
# HOST PERFORMANCE COM NAGIOS/PNP4NAGIOS
host_perfdata_file=/usr/local/pnp4nagios/var/host-perfdata
host_perfdata_file_template=DATATYPE::HOSTPERFDATA\tTIMET::$TIMET$\tHOSTNAME::
$HOSTNAME$\tHOSTPERFDATA::$HOSTPERFDATA$\tHOSTCHECKCOMMAND::
$HOSTCHECKCOMMAND$\tHOSTSTATE::$HOSTSTATE$\tHOSTSTATETYPE::
$HOSTSTATETYPE$
host_perfdata_file_mode=a
host_perfdata_file_processing_interval=15
host_perfdata_file_processing_command=process-host-perfdata-file

sudo cp contrib/ssi/status-header.ssi /usr/local/nagios/share/ssi/



Renomear o install.php conforme abaixo
mv /usr/local/pnp4nagios/share/install.php /usr/local/pnp4nagios/share/install.php.org

Acrescentar novo comando para gerar gráficos com pnp4nagios
vim /usr/local/nagios/etc/objects/commands.cfg

# COMANDO PAR GERAR GRÁFICOS PARA O HOST
define command{
command_name process-service-perfdata-file
command_line /usr/local/pnp4nagios/libexec/process_perfdata.pl
--bulk=/usr/local/pnp4nagios/var/service-perfdata
}
# COMANDO PAR GERAR GRAFICOS PARA OS SERVICOS
define command{
command_name process-host-perfdata-file
command_line /usr/local/pnp4nagios/libexec/process_perfdata.pl
--bulk=/usr/local/pnp4nagios/var/host-perfdata
}

```



<span style="color:#d86c00">****</span>





























































<span style="color:#d86c00">****</span>
