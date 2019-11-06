# Introdução

Este tutorial aborda o processo de instalação do Nagios Core e Nagios plugins no Ubuntu 18.04. O Nagios é um sistema de monitoramento que permite os administradores de rede e pessoal do NOC identificar e resolver problemas de infraestrutura de TI antes que eles afetem processos críticos da empresa. 

O Nagios é oficialmente patrocinado pela [Nagios Enterprises](https://www.nagios.com/), ele tem a função de monitorar toda a sua infraestrutura de TI para garantir que sistemas, aplicativos, serviços e processos de negócios estejam funcionando corretamente. Em caso de falha, o Nagios irá alertar a equipe responsável sobre o evento ocorrido para que eles possam atuar e corrigir o problema antes que isso venha impactar os processos de negócio.

O Nagios possui algumas formas de alerta após ser detectado uma mudança de estado de um dispositivo gerenciado, o tipo mais comum é o alerta visual no dashboard do Nagios, mas você pode configurar para que seja enviado e-mail e até mesmo integrar o envio de mensagens no telegram usando Nagios.

Todo processo de instalação foi realizado seguindo a [documentação oficial](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu) do Nagios.



- Links

  [Nagios Core - Installing Nagios Core From Source](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html)

  [Table of Contents](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/toc.html)



## <span style="color:#d86c00">**Preparando o ambiente**</span>

Inicialmente vamos baixar alguns pacotes que vamos usar durante a utilização do servidor.



Segue o comando usado:

```bash
sudo apt-get install -y unzip zip tcpdump openssh-server mtr nmap perl python python3 vim curl htop wget bc gawk snmp snmpd libnet-snmp-perl

# Descrição das aplicações que vão ser instaladas:

	# UNZIP = Desarquivador para arquivos .zip;
	# ZIP = Arquivador para arquivos .zip;
	# TCPDUMP = Analizador de tráfego de Rede;
	# openssh-server = Servidor SSH (Secure Shell), para acesso seguro a partir de máquinas remotas;
	# MTR = Ferramenta traceroute de tela cheia em ncurses e X11;
	# NMAP = Mapeador de Rede (fazer verificação de portas;
	# PERL = Linguagem de extração e relatórios prática de Larry Wall;
	# PYTHON = Linguagem interativa de alto nível orientada a objetos (versão 2 - padrão);
	# PYTHON3 = Linguagem interativa de alto nível orientada a objetos (versão 3 - padrão);
	# VIM = Editor VI melhorado;
	# CURL = Ferramenta de linha de comando para transferir dados com sintaxe de URL;
	# HTOP = Visualizador de processos interativo;
	# WGET = Gerenciador de download;
	# BC = Calculadora de linha de comando;
	# GAWK = Linguagem AWK;
	# SNMP = Aplicação cliente para utilizar o protocolo SNMP (Gerenciamento de redes);
	# SNMPD = Aplicação servidor para utilizar o protocolo SNMP (Gerenciamento de redes);
	# LIBNET-SNMP-PERL = Script de conexões SNMP.
```



## <span style="color:#d86c00">**Pré requisitos**</span>

Para podermos compilar o Nagios precisamos atender aos pré requisitos, caso contrário, teremos erro durante a compilação, abaixo segue o comando que instala as dependências do Nagios.

```bash
sudo apt-get install -y autoconf gcc libc6 php7.2 php make libapache2-mod-php7.2 apache2 build-essential xinetd 

autoconf gcc libc6 make wget unzip apache2 php libapache2-mod-php7.2 libgd-dev
# Descrição das aplicações que vão ser instaladas:
	# Pré requisitos informados na documentação do Nagios
		# AUTOCONF = Construtor automático de script configure (necessário para compilar);
		# GCC = Compilador C;
		# LIBC6 = Biblioteca C: Bibliotecas compartilhadas;
		# PHP = Linguagem de script incorporada em HTML do servidor (padrão);
		# MAKE = Utilitário de compilação;
		# LIBAPACHE2-MOD-PHP = linguagem de script incorporada em HTML do servidor (módulo Apache 2) (padrão);
		# APACHE = Servidor Web;
		# LIBGD-DEV = Biblioteca de gráficos GD (versão de desenvolvimento).
		
	# Outras aplicações de desenvolvimento
		# XINETD = substituto para o inetd com muitas melhorias.
		# BUILD-ESSENTIALS = O pacote build-essential é uma referência para todos os pacotes necessários para compilar um pacote Debian. Geralmente inclui os compiladores e bibliotecas GCC / g ++ e alguns outros utilitários;
```



## <span style="color:#d86c00">**Baixando o Nagios Core**</span>

Agora vamos baixar o pacote do Nagios para podermos compilá-lo.

```bash
# Entra na pasta /tmp:
cd /tmp

# Baixa o pacote do Nagios Core renomeando o arquivo baixado para nagioscore.tar.gz:
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz

# Descompactar o nagioscore.tar.gz:
tar xzvf nagioscore.tar.gz

# Entrar no nagioscore-nagios-4.4.5:
cd nagioscore-nagios-4.4.5
```



### <span style="color:#d86c00">**Compilar o nagios core**</span>

```bash
# Explicação técnica: Ele combina as bibliotecas no computador do usuário com as exigidas pelo programa antes de compilá- lo a partir do código-fonte.
# Vamos iniciar a preparação do ambiente para podermos compilar o pacote:
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
