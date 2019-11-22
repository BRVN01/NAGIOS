[TOC]

# Prefácio

FAZER



# Capítulo 1: Introdução ao Nagios

Nagios é uma ferramenta para monitoramento de rede/sistema, isso significa que o Nagios verifica computadores e/ou dispositivos na sua rede e garante que eles estejam funcionando como deveriam. 

O Nagios verifica constantemente se as máquinas estão funcionando corretamente (através do ping),  ele também verifica se os serviços monitorados nessas máquinas estão funcionando bem.  O principal objetivo do monitoramento da infraestrutura de TI é detectar o mais rápido possível qualquer evento que tenha acontecido, para que se possa tomar uma ação antes que os usuários desse sistema relatem o problema. O monitoramento do sistema no Nagios é dividido em duas categorias de objetos: verificação de hosts e verificação de serviços.  Os hosts representam um dispositivo físico ou virtual em sua rede (servidores, roteadores, switchs, impressoras entre outros). 

Os serviços são funcionalidades específicas, por exemplo, um servidor SSH (Secure Shell), consumo de memória, uso de HD, serviço de e-mail, entre outros serviços. Cada serviço está associado a um host no qual está sendo executado. Além disso, as máquinas podem ser agrupadas em grupos de hosts.

Para que toda essa monitoração ocorra, existem vários arquivos de configuração diferentes que você precisará criar e/ou editar antes de começar a monitorar um dispositivo.

A mágica do Nagios acontece nas verificações de desempenho, ele usa apenas quatro estados distintos, sendo eles: Ok, Warning, Critical e Unknown, tem também o fato de ser baseado em plugins, significando  que se você quiser verificar algum recurso que ainda não tenha um plugin, bastaria escrever um.

O Nagios já vem com um conjunto de plugins padrão, mas caso você tenha necesidade, pode criar seus próprios plugins.



## Principais características

O Nagios é uma ferramenta muito flexivel, ele pode ser configurado para monitorar sua infraestrutura de TI da maneira que você deseja. Também possui um mecanismo para reagir automaticamente a problemas e possui um poderoso sistema de notificação. Tudo isso é baseado em um sistema de definição de objeto, como explicado a seguir:

- **Comandos**: É a forma que o Nagios vai executar as verificações. Sendo uma parte importante da comunicação do Nagios com os plugins.

- **Períodos de tempo**: São períodos de data e hora em que uma operação deve ou não ser executada. Por exemplo, de segunda a sexta-feira, das 09:00 às 17:00.

- **Hosts e grupos de hosts**: São dispositivos, além da possibilidade de agrupar hosts. Um único host pode ser membro de mais de um grupo.

- **Serviços**: São várias funcionalidades ou recursos para monitorar em um host específico. Por exemplo, uso da CPU, espaço de armazenamento ou servidor da Web e etc.

- **Contatos e grupos de contatos**: São as pessoas que devem ser notificadas com informações sobre um evento no host ou serviço, os contatos podem ser agrupados, e um único contato pode ser membro de mais de um grupo.

- **Notificações**: Definem quem deve ser notificado sobre o que, por exemplo, todos os erros do grupo de servidores Windows devem ir para o grupo de contatos do windows-administration durante o horário de trabalho e para o grupo de contatos da equipe nível 2 fora do horário de trabalho.

- **Escalações**: São extensões de notificações; eles definem que depois que um objeto está no mesmo estado por um período específico de tempo, outras pessoas devem ser notificadas de determinados eventos, por exemplo, um servidor crítico que esteja inativo por mais de 4 horas deve alertar o gerenciamento de TI para que eles acompanhem o problema.

Para qualquer administrador, é óbvio que, se o roteador estiver inativo, todas as máquinas acessadas por ele falharão. Caso você não leve isso em consideração, e esse roteador venha a ficar indisponível, você receberá uma lista de várias máquinas e serviços com falha. O Nagios permite definir dependências entre hosts para refletir a topologia de rede real e permite relações entre dispositivos para impedir que sua caixa de mensagem fique lotada de alertas. 

Por exemplo, se um switch L3 que o conecta parte da sua rede estiver inoperante, o Nagios não executará verificações das máquinas subseqüentes (depois do roteador). Isso é ilustrado na figura a seguir:

![1574354656894](../IMG/1574354656894.png)

No caso acima, um dos links está fora, mesmo que os switchs e servidores estejam funcionando, o Nagios não consegue chegar até eles, dessa forma, será retornado indisponibilidade de todos os dispositivos atrás do link com problema, se a configuração correta do Nagios for feita, receberemos apenas um alerta do switch L3, e não de todos os dispositivos atrás do switch L3.



## Estados Soft e hard

O Nagios funciona verificando se um host ou serviço específico está funcionando corretamente e armazenando seu status. Para evitar a detecção de falhas aleatórias e temporárias, o Nagios usa estados *soft* e *hard* para descrever qual é o status atual de um host ou serviço.

Imagine que um administrador esteja reiniciando um servidor da Web e essa operação torne a conexão com as páginas da Web indisponível por 5 segundos. Como essas reinicializações geralmente são feitas à noite para diminuir o número de usuários afetados, esse é um período aceitável. No entanto, um problema pode ser que o Nagios tente se conectar ao servidor e observe que ele está realmente inoperante. Se depender apenas de um único resultado, o Nagios poderá acionar um alerta de que um servidor da Web está inoperante. Na verdade, ele voltaria a funcionar em alguns segundos, mas levaria alguns minutos para Nagios descobrir isso.

Para situações onde o serviço ficou inativo por um curto periodo de tempo ou ou foi um falha momentanea, foram introduzidos estados de verificações *soft*. Quando um status é desconhecido ou é diferente de um status anterior (para o mesmo host/serviço), o Nagios testará novamente o host ou o serviço algumas vezes para garantir que a alteração seja permanente, ou seja, para garantir que o evento não tenha sido momentaneo. Assim o Nagios assume que o novo resultado é um estado *soft*. Após alguns testes *softs*, se o evento continuar acusando o mesmo status, isso significa que o novo estado é permanente (está mesmo com algum problema), então ele é considerado um estado *hard*.

Cada verificação de host e serviço define o número de tentativas a serem executadas antes de assumir que uma alteração é permanente. Isso permite mais flexibilidade sobre quantas falhas devem ser tratadas como um problema real em vez de temporário. Definir o número de verificações como 1 fará com que todas as alterações sejam tratadas como um problema real (isso pode causar falsos alertas). 



# Capítulo 2: Instalando o Nagios 4

Todo processo de instalação foi realizado seguindo a [documentação oficial](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu) do Nagios, usando o sistema operacional do Ubuntu 18.08 LTS.

- Links

  [Nagios Core - Installing Nagios Core From Source](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html)

  [Table of Contents](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/toc.html)



## Preparando o ambiente


Inicialmente vamos baixar alguns pacotes que vamos usar durante a utilização do servidor.

Segue o comando usado:

```
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

## 

## Pré requisitos

Para podermos compilar o Nagios precisamos atender aos pré  requisitos, caso contrário, teremos erro durante a compilação, abaixo  segue o comando que instala as dependências do Nagios.

```
sudo apt-get install -y autoconf gcc libc6 php7.2 php make libapache2-mod-php7.2 apache2 build-essential xinetd 

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

## 

## Baixando o Nagios Core

Agora vamos baixar o pacote do Nagios para podermos compilá-lo.

```
# Entra na pasta /tmp:
cd /tmp

# Baixa o pacote do Nagios Core renomeando o arquivo baixado para nagioscore.tar.gz:
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz

# Descompactar o nagioscore.tar.gz:
tar xzvf nagioscore.tar.gz

# Entrar no nagioscore-nagios-4.4.5:
cd nagioscore-nagios-4.4.5
```



### Compilar o nagios core

```
# Vamos iniciar a preparação do ambiente para podermos compilar o pacote, passamos como argumento o arquivo de configuração do Nagios para o Apache, onde irá ficar o arquivo de apontamento do Nagios para que possamos acessá-lo pelo navegador:
sudo ./configure --with-httpd-conf=/etc/apache2/sites-enabled

# Vamos criar os binários para instalação futura:
sudo make all

# Vamos criar o usuário e grupos do nagios (o grupo deve ser nagcmd, mas o comando abaixo cria o usuário NAGIOS e grupo NAGIOS).
	# O comando 'make install-groups-users' irá criar uma conta do sistema e adicionar esse usuário no grupo do nagios:
	sudo make install-groups-users

# Adicionando o usuário www-data no grupo nagios como um grupo secundário:
sudo usermod -a -G nagios www-data

# Instalando os binários, CGIs e arquivos HTML gerados pelo 'make all':
sudo make install

# Instalando os arquivos de serviço/daemon e habilitando o serviço para iniciar no boot:
sudo make install-daemoninit

# Instalar o arquivo para termos comando externo no Nagios:
sudo make install-commandmode

# Instalando os arquivos de configuração SAMPLE, isso é necessário, pois, sem isso, o Nagios não irá iniciar, ele instala tudo que está dentro de '/usr/local/nagios/etc':
sudo make install-config

# Instalando os arquivos de configuração do servidor web Apache e definindo as configurações do Apache:
	# Instalando o arquivo de configuração do Apache para a interface da web do Nagios (/etc/apache2/sites-enabled/nagios.conf):
	sudo make install-webconf
		
	# Ativando a reescrita do módulo:
	sudo a2enmod rewrite
	
	# Ativando o módulo CGI:
	sudo a2enmod cgi

# Liberando o apache no firewall do Ubuntu:
sudo ufw allow Apache

# Recarregando as regras do firewall:
sudo ufw reload
```

[Explicação rewrite](https://httpd.apache.org/docs/current/mod/mod_rewrite.html).

[Explicação CGI](https://en.wikibooks.org/wiki/Apache/CGI).



#### Criando uma conta de usuário no Nagios

Agora vamos criar um usuário que poderá acessar a aplicação web do Nagios.

```
# Criando um usuário chamado 'nagiosadmin'
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# Mudando Dono e Grupo dono do arquivo 'htpasswd.users':
sudo chown nagios. /usr/local/nagios/etc/htpasswd.users
```



#### Manipuladores de eventos do Nagios

Vamos copiar a pasta de notificação de eventos do Nagios para pasta de produção.

```
# Copiando a pasta 'eventhandlers' para '/usr/local/nagios/libexec/':
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/

# Mudando usuário e dono da pasta 'eventhandlers':
sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers
```



#### Reiniciando o Nagios/Apache

Vamos reiniciar o apache e o Nagios para "aplicar" as mudanças.

```
# Reiniciando o Apache2:
sudo systemctl restart apache2.service

# Reiniciando o Nagios:
sudo systemctl start nagios.service
```

Agora precisamos acessar o IP do servidor do Nagios para verificar se conseguimos acessar a aplicação web do Nagios, o usuário é **nagiosadmin**, a senha é a senha que você definiu.

Se você esqueceu a senha, pode adicionar o usuário novamente usando o comando abaixo e digitar uma nova senha.

```
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```

Caso tenha conseguido acessar, você vera que todos os checks para o  localhost (servidor Nagios) estarão vermelhos, como na imagem abaixo:

[![1573130380552](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573130380552.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573130380552.png)

Isso se deve ao motivo de não termos os plugins necessários para a  verificação desses serviços, podemos ver isso clicando em alguns dos  serviços que estão sendo verificados (vamos pegar como exemplo o Current Load), podemos verificar no campo **Status Information** que o erro é devido ao arquivo (plugin) não ter sido encontrado.

[![1573130571787](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573130571787.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573130571787.png)

Para corrigir isso, vamos instalar os plugins padrões do Nagios.



# Capítulo 3: Instalando o Nagios Plugins

Vamos instalar os plugins padrões do Nagios para que possamos ter uma monitoração padrão da ferramenta.

 

## Pré requisitos

Boa parte dos pré requisitos do Nagios-Plugins já foi instalado  anteriormente, vamos instalar apenas os que não foram instalados.

```
sudo apt install -y libmcrypt-dev libssl-dev dc gettext libmcrypt4

# libmcrypt-dev = Arquivos de desenvolvimento da biblioteca de decriptografia/criptografia;
# libssl-dev = Kit de ferramentas Secure Sockets Layer - arquivos de desenvolvimento;
# dc = calculadora de precisão arbitrária polonesa-reversa dc GNU;
# gettext = Utilitários de internacionalização GNU;
# libmcrypt4 = Biblioteca de Des/Encriptação
```



## Compilando os plugins

Agora vamos baixar e compilar o pacote de plugins do Nagios.

```
# Entrando no /tmp:
cd /tmp

# Baixando o pacote do Nagios-Plugins:
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz

# Descompactando o pacote baixado:
tar zxf nagios-plugins.tar.gz

# Entrando na pasta descompactada do Nagios-Plugins:
cd /tmp/nagios-plugins-release-2.2.1/

# Instala alguns scripts para auxiliar na compilação:
sudo ./tools/setup

# Preparando o ambiente para a compilação:
sudo ./configure

# Vamos criar os binários para instalação futura:
sudo make

# Instalando os binários, CGIs e arquivos HTML gerados pelo 'make all':
sudo make install

# Mundando o usuário e grupo dos plugins para o Nagios:
chown nagios. /usr/local/nagios/libexec/*
```



## Reiniciando o daemon do Nagios

```
# Reinicia o daemon do Nagios:
sudo systemctl restart nagios.service

# Mostra o estatus do serviço do Nagios:
sudo systemctl status nagios.service
```



Você pode verificar o arquivo de configuração do Nagios usando o comando `/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg`.

Após isso você pode dar um `Re-schedule the next check of this service` nos serviços, até que eles venham a ficar com status OK, como na imagem abaixo:

[![1573143150490](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573143150490.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573143150490.png)



Aplicando o `Re-schedule the next check of this service` nos serviços: [![1573143273027](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573143273027.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573143273027.png) 



# Capítulo 4: Configurando o Nagios

Nessa sesção vamos configurar manualmente o arquivo de configurações do Nagios para que possamos ter um arquivo mais customizado.



## Criando o arquivo de configuração principal

O arquivo de configuração principal é chamado nagios.cfg e é o arquivo principal carregado durante a inicialização do Nagios. Ele contém várias diretivas que afetam como o daemon do Nagios Core opera. Este arquivo de configuração é lido pelo daemon do Nagios Core e pelos CGIs.

Para acessar o link que leva a documentação oficial do arquivo de configuração principal do Nagios, basta clicar [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html) .

O arquivo nagios.cfg fica localizado no diretório /usr/local/nagios/etc/nagios.cfg, segue um exemplo:

``` bash
# Arquivo de log, 
# isso requer: 'mkdir /var/log/nagios/' e 'chown -R nagios. /var/log/nagios/' para LOG_FILE
# (opção padrão do Nagios).
log_file=/var/log/nagios/nagios.log
log_rotation_method=d
log_archive_path=/usr/local/nagios/var/archives
use_syslog=1
log_notifications=1
log_service_retries=1
log_host_retries=1
log_event_handlers=1
log_current_states=1
log_external_commands=1
log_passive_checks=0

# Diretório de configuração dos objetos (opção padrão do Nagios).
cfg_file=/usr/local/nagios/etc/objects/commands.cfg
cfg_file=/usr/local/nagios/etc/objects/contacts.cfg
cfg_file=/usr/local/nagios/etc/objects/timeperiods.cfg
cfg_file=/usr/local/nagios/etc/objects/templates.cfg
cfg_file=/usr/local/nagios/etc/objects/localhost.cfg
object_cache_file=/usr/local/nagios/var/objects.cache
precached_object_file=/usr/local/nagios/var/objects.precache

# Informações de armazenamento (opção padrão do Nagios).
resource_file=/usr/local/nagios/etc/resource.cfg

# Arquivo de status
status_file=/usr/local/nagios/var/status.dat

# Usuário e grupo Nagios (opção padrão do Nagios).
nagios_user=nagios
nagios_group=nagios

# Habilitando comandos externos (Re-schedule na interface do Nagios) 
check_external_commands=1

# Este é o arquivo que o Nagios verificará se há comandos externos para processar
# (opção padrão do Nagios).
command_file=/usr/local/nagios/var/rw/nagios.cmd

# Arquivo que irá conter o PID do Nagios (opção padrão do Nagios).
lock_file=/run/nagios.lock

# Arquivo(s) temporário(s), (opções padrões do Nagios).
temp_file=/usr/local/nagios/var/nagios.tmp
temp_path=/tmp

# Intervalo de verificações de host e serviço (opções padrões do Nagios).
service_inter_check_delay_method=s
host_inter_check_delay_method=s

# Distribuição máxima da verificação de serviço (em minutos), (opção padrão do Nagios).
max_service_check_spread=3

# Fator de intercalação de serviço (opção padrão do Nagios).
service_interleave_factor=s

# Verificações máximas de serviço simultâneo (opção padrão do Nagios).
max_concurrent_checks=0

# Verificar resultado Reaper Frequency (segundos), (opções padrões do Nagios).
check_result_reaper_frequency=10
max_check_result_reaper_time=30

# Armazenar resultado de host e serviço (opção padrão do Nagios).
check_result_path=/usr/local/nagios/var/spool/checkresults

# Tempo em que o arquivo de resultado de host e serviço ficara gravado
# (opção padrão do Nagios)
max_check_result_file_age=3600

# Horizon de verificação de host/serviço em cache (opções padrões do Nagios).
cached_host_check_horizon=15
cached_service_check_horizon=15

# Opção preditiva de dependência (opções padrões do Nagios).
enable_predictive_host_dependency_checks=1
enable_predictive_service_dependency_checks=1

# Opção de reprogramação automática.
auto_reschedule_checks=0
auto_rescheduling_interval=15
auto_rescheduling_window=90

# Limite de verificação (opções padrões do Nagios).
service_check_timeout=60
host_check_timeout=30
event_handler_timeout=30
notification_timeout=30
ocsp_timeout=5
ochp_timeout=5
perfdata_timeout=5

# Retenção de Estado (opções padrões do Nagios).
retain_state_information=1
state_retention_file=/usr/local/nagios/var/retention.dat
retention_update_interval=60
use_retained_program_state=1
use_retained_scheduling_info=1
retained_host_attribute_mask=0
retained_service_attribute_mask=0
retained_process_host_attribute_mask=0
retained_process_service_attribute_mask=0
retained_contact_host_attribute_mask=0
retained_contact_service_attribute_mask=0

# Duração do intervalo de tempo
interval_length=60

# Checagem de atualizações do Nagios de forma automática.
check_for_updates=0
bare_update_check=1

# Verificação agressiva de host.
use_aggressive_host_checking=0

# Execução de verificação de serviço
execute_service_checks=1

accept_passive_service_checks=1
execute_host_checks=1
accept_passive_host_checks=1
enable_notifications=1
enable_event_handlers=1
process_performance_data=0
obsess_over_services=0
obsess_over_hosts=0
translate_passive_host_checks=0
passive_host_checks_are_soft=0
check_for_orphaned_services=1
check_for_orphaned_hosts=1
check_service_freshness=1
service_freshness_check_interval=60
service_check_timeout_state=c
check_host_freshness=0
host_freshness_check_interval=60
additional_freshness_latency=15
enable_flap_detection=1
low_service_flap_threshold=5.0
high_service_flap_threshold=20.0
low_host_flap_threshold=5.0
high_host_flap_threshold=20.0
date_format=us
illegal_object_name_chars=`~!$%^&*|'"<>?,()=
illegal_macro_output_chars=`~$&|'"<>
use_regexp_matching=0
use_true_regexp_matching=0
admin_email=nagios@localhost
admin_pager=pagenagios@localhost
daemon_dumps_core=0
use_large_installation_tweaks=0
enable_environment_macros=0
debug_level=0
debug_verbosity=1
debug_file=/usr/local/nagios/var/nagios.debug
max_debug_file_size=1000000
allow_empty_hostgroup_assignment=0
```

Abaixo segue uma descrição de cada variável usada no arquivo principal:

- **CFG_LOG**
  Especifica onde o Nagios deve criar seu arquivo de log principal. Essa deve ser a primeira variável que você define no seu arquivo de configuração, pois o Nagios tentará gravar neste arquivo os erros que - encontrar nos demais dados de configuração.

- **LOG_ROTATION_METHOD**
  É de quanto em quanto tempo o arquivo de log será sobrescrito (d= todo dia).

- **LOG_ARCHIVE_PATH**
  Diretório onde ficará os logs que foram rotacionados.

- **USE_SYSLOG**
  Determina se as mensagem vão ser registradas no SysLog (1 = SIM).

- **LOG_NOTIFICATIONS**
  Informa se as mensagens de notificação serão registradas (1 = sim).

- **LOG_SERVICE_RETRIES**
  Informa se as verificações 'softs' serão registradas para os serviços (1 = sim) .

- **LOG_HOST_RETRIES**
  Informa se as verificações 'softs' serão registradas para os hosts (1 = sim) .

- **LOG_EVENT_HANDLERS**
  Determina se os manipuladores de eventos de serviço e host serão ou não registrados. Manipuladores de eventos são comandos opcionais que podem ser executados sempre que um serviço ou host muda de estado.

- **LOG_CURRENT_STATES**
  Faz com que o Nagios grave o estado atual dos dispositivos gerenciados após rotacionar um log.

- **LOG_EXTERNAL_COMMANDS**
  Registra ou não comandos externos (através da CGI).

- **LOG_PASSIVE_CHECKS**
  Após aplicar um comando externo, o check passivo irá registrar em log essa ação, só que, o Nagios não pode verificar checks passivos, isso porque esses checks são feitos por outros NMSs, o Nagios apenas recebe um informação do estado do check, portanto, não é interessante usar essa opção de registro, isso só encheria mais nosso arquivo de log sem necessidade (1 = padrão, 0 = desabilitado).

- **CFG_FILE**
  É usada para especificar um arquivo de configuração de objeto contendo definições de objeto que o Nagios deve usar para monitorar. Os arquivos de configuração de objeto contêm definições para hosts, grupos de hosts, contatos, grupos de contatos, serviços, comandos etc.

- **OBJECT_CACHE_FILE**
  Especifica um arquivo no qual uma cópia em cache das definições de objetos deve ser armazenada. O arquivo de cache é (re) criado toda vez que o Nagios é (re) iniciado e é usado pelos CGIs. 
  O objetivo é acelerar o cache do arquivo de configuração nos CGIs e permitir que você edite os arquivos de configuração do objeto de origem enquanto o Nagios estiver em execução sem afetar a saída exibida nos CGIs. 
  No Nagios Core 4, configurar o caminho do arquivo object_cache_file como '/dev/null' fará com que o Nagios Core não armazene em cache as informações do objeto. Isso pode ser feito para acelerar as operações, mas não deve ser feito se os CGIs forem usados.

- **PRECACHED_OBJECT_FILE**
  Especifica um arquivo no qual uma cópia pré-processada e pré-armazenada em cache das definições de objetos deve ser armazenada. Este arquivo pode ser usado para melhorar drasticamente os tempos de inicialização em instalações Nagios grandes/complexas.

- **RESOURCE_FILE**
  É usado para especificar um arquivo de recurso opcional, que pode conter variáveis que serão reconhecidas apenas pelo Nagios ($USERn$). 
  As variáveis '$USERn$' são úteis para armazenar nomes de usuário, senhas e itens comumente usados em definições de comando (como caminhos de diretório). 
  Os CGIs não tentam ler os arquivos de recursos, portanto, você pode definir permissões restritivas (600 ou 660) para proteger informações confidenciais.

- **STATUS_FILE**
  É o arquivo que o Nagios usa para armazenar as informações atuais de status, comentários e tempo de inatividade. Esse arquivo é usado pelos CGIs para que o status atual do monitoramento possa ser relatado por meio de uma interface da web. 
  Os CGIs devem ter acesso de leitura a esse arquivo para funcionar corretamente. Este arquivo é excluído toda vez que o Nagios para e é recriado quando é iniciado. 
  No Nagios Core 4, definir o caminho do status_flie como '/dev/null' fará com que o Nagios Core não armazene informações de status. Isso pode ser feito para acelerar as operações, mas não deve ser feito se os CGIs forem usados.
- **STATUS_FILE**
  Este é o arquivo que o Nagios usa para armazenar as informações atuais de status, comentários e tempo de inatividade. Esse arquivo é usado pelos CGIs para que o status atual do monitoramento possa ser relatado por meio de uma interface da web (sem isso o Nagios não irá reportar nada no dashboard). Os CGIs devem ter acesso de leitura a esse arquivo para funcionar corretamente. Este arquivo é excluído toda vez que o Nagios para e é recriado quando é iniciado. No Nagios Core 4, definir o caminho do status_flie como '/dev/null' fará com que o Nagios Core não armazene informações de status. Isso pode ser feito para acelerar as operações, mas não deve ser feito se os CGIs forem usados.

- **NAGIOS USER e GROUP** 
  Especifica o usuário e grupo que o Nagios vai utilizar após ser inicializado.

- **TEMP_FILE**
  Arquivo temporário que o Nagios cria periodicamente para usar na atualização de dados de comentários, status, etc. O arquivo é excluído quando não é mais necessário.

- **TEMP_PATH**
  É um diretório que o Nagios pode usar como espaço temporário para criar arquivos temporários usados durante o processo de monitoramento.

- **SERVICE_INTER_CHECK_DELAY_METHOD** e **HOST_INTER_CHECK_DELAY_METHOD**
  Quando o Nagios é reiniciado, ele tenta agendar a verificações iniciais de todos os objetos, de uma maneira que minimize a carga imposta aos hosts locais e remotos. Isso é feito espaçando as verificações iniciais e intercalando-as. O espaçamento das verificações (também conhecido como atraso entre verificações) é usado para minimizar/equalizar a carga no host local (servidor do Nagios) e a intercalação é usada para minimizar/equalizar a carga imposta aos hosts remotos. 

  s = Use um cálculo de atraso "inteligente" para espalhar as verificações de serviço uniformemente (padrão).

- **MAX_SERVICE_CHECK_SPREAD**
  Assim que o Nagios for iniciado, ele tem um certo tempo para garantir que as verificações iniciais de todos os serviços ocorram dentro do prazo especificado, como é somente após a inicialização do Nagios, você tem que medir o tempo baseando no total de serviços ativos.

- **SERVICE_INTERLEAVE_FACTOR**
  Essa variável determina como as verificações de serviço são intercaladas. A intercalação permite uma distribuição mais uniforme das verificações de serviço, carga reduzida em hosts remotos e detecção geral mais rápida de problemas do host. Definir esse valor como 1 é equivalente a não intercalar as verificações de serviço. Defina esse valor como s (inteligente) para o cálculo automático do fator de intercalação, a menos que você tenha um motivo específico para alterá-lo. A melhor maneira de entender como a intercalação funciona é observar o status CGI (visão detalhada) quando o Nagios está apenas começando. Você deve ver que os resultados da verificação de serviço são espalhados quando começam a aparecer.

- **MAX_CONCURRENT_CHECKS**
  Esta opção permite especificar o número máximo de verificações de serviço que podem ser executadas em paralelo a qualquer momento. A especificação de um valor 0 (padrão) não impõe restrições ao número de verificações simultâneas. Você precisará modificar esse valor com base nos recursos do sistema disponíveis na máquina que executa o Nagios, pois afeta diretamente a carga máxima que será imposta ao sistema (utilização do processador, memória, etc.).

- **CHECK_RESULT_REAPER_FREQUENCY**
  Determina com que frequência o Nagios deve verificar se há resultados de verificação de host e serviço que precisam ser processados. A quantidade máxima de tempo que ele pode gastar processando esses resultados é determinada pelo tempo máximo da ceifeira (veja abaixo). Se a frequência da sua ceifeira for muito alta (pouco frequente), você poderá ver altas latências nas verificações de host e serviço.

- **MAX_CHECK_RESULT_REAPER_TIME**
  Determinam a quantidade máxima de tempo que o daemon Nagios pode gastar processando os resultados das verificações de host e serviço antes de passar para outras coisas - como executar novas verificações de host e serviço. Um valor muito alto pode resultar em grandes latências para as verificações de host e serviço. Um valor muito baixo pode ter o mesmo efeito. Se você estiver enfrentando altas latências, ajuste essa variável e veja qual efeito ela tem.

- **CHECK_RESULT_PATH**
  Esta opção determina qual diretório o Nagios usará para armazenar temporariamente os resultados da verificação de host e serviço antes de serem processados. Este diretório não deve ser usado para armazenar outros arquivos, pois o Nagios limpará periodicamente esse diretório do arquivo antigo.

- **MAX_CHECK_RESULT_FILE_AGE**
  Esta opção determina a quanto tempo no máximo (em segundos), que o Nagios considerará válidos os arquivos de resultado da verificação encontrados no diretório `check_result_path`.

- **CACHED_HOST_CHECK_HORIZON** e **CACHED_SERVICE_CHECK_HORIZON**
  Esta opção determina a quantidade máxima de tempo (em segundos) em que o estado de uma verificação anterior do host/serviço é considerado atual. 
  Os estados do host/serviço em cache (das verificações do host/serviço que foram executadas mais recentemente do que o tempo especificado por esse valor) podem melhorar imensamente o desempenho da verificação do host/serviço. Um valor muito alto para esta opção pode resultar em estados de host/serviço (temporariamente) imprecisos, enquanto um valor muito baixo pode resultar em um impacto no desempenho das verificações de host/serviço. Use um valor 0 se desejar desativar o cache de verificação do host/serviço.

- **ENABLE_PREDICTIVE_HOST/SERVICE_DEPENDENCY_CHECKS**
  Esta opção determina se o Nagios executará ou não verificações preditivas de hosts dos quais dependem (conforme definido nas [dependências do host](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#hostdependency)) para um host específico quando ele mudar de estado. As verificações preditivas ajudam a garantir que a lógica da dependência seja a mais precisa possível.

- **AUTO_RESCHEDULE_CHECKS**
  Esta opção determina se o Nagios tentará reagendar automaticamente as verificações de host e serviço ativas para "suavizá-las" ao longo do tempo. Isso pode ajudar a equilibrar a carga no servidor de monitoramento, pois ele tentará manter o tempo entre verificações consecutivas consistentes, às custas da execução de verificações em um planejamento mais rígido.

- **AUTO_RESCHEDULING_INTERVAL**
  Esta opção determina com que frequência (em segundos) o Nagios tentará reagendar automaticamente as verificações. Esta opção [terá](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#auto_reschedule_checks) efeito apenas se a opção auto_reschedule_checks estiver ativada. O padrão é 30 segundos.

- **AUTO_RESCHEDULING_WINDOW**
  Esta opção determina a "janela" de tempo (em segundos) que o Nagios observará ao reagendar automaticamente as verificações. Somente as verificações de host e serviço que ocorrem nos próximos X segundos (determinadas por esta variável) serão reagendadas. Esta opção [terá](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#auto_reschedule_checks) efeito apenas se a opção [auto_reschedule_checks](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#auto_reschedule_checks) estiver ativada. O padrão é 180 segundos (3 minutos).

- **SERVICE_CHECK_TIMEOUT**
  Este é o número máximo de segundos que o Nagios permitirá que as verificações de serviço sejam executadas. Se as verificações excederem esse limite, elas serão eliminadas e um estado CRÍTICO será retornado. Um erro de tempo limite também será registrado.

  Muitas vezes há uma confusão generalizada sobre o que essa opção realmente faz. Ele deve ser usado como o último mecanismo para eliminar plug-ins que se comportam mal e não saem em tempo hábil. Ele deve ser definido como algo alto (como 60 segundos ou mais), para que cada verificação de serviço normalmente termine de executar dentro desse prazo. Se uma verificação de serviço for mais longa que esse limite, o Nagios o matará pensando que é um processo descontrolado.

- **HOST_CHECK_TIMEOUT**
  Este é o número máximo de segundos que o Nagios permitirá que as verificações de host sejam executadas. Se as verificações excederem esse limite, elas serão eliminadas e um estado CRÍTICO será retornado e o host será considerado BAIXO. Um erro de tempo limite também será registrado.

- **EVENT_HANDLER_TIMEOUT**
  Este é o número máximo de segundos que o Nagios permitirá [que os manipuladores de eventos](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/eventhandlers.html) sejam executados. Se um manipulador de eventos exceder esse limite de tempo, ele será eliminado e um aviso será registrado.
  Manipuladores de eventos são comandos opcionais que podem ser executados sempre que um serviço ou host muda de estado.

- **NOTIFICATION_TIMEOUT**
  Este é o número máximo de segundos que o Nagios permitirá que comandos de notificação sejam executados. Se um comando de notificação exceder esse limite de tempo, ele será eliminado e um aviso será registrado.

- **OCSP_TIMEOUT**
  Este é o número máximo de segundos que o Nagios permitirá que um comando obsessivo do processador de serviço compulsivo seja executado. Se um comando exceder esse limite de tempo, ele será eliminado e um aviso será registrado.

- **OCHP_TIMEOUT**
  Esse é o número máximo de segundos que o Nagios permitirá que um comando obsessivo compulsivo do processador host seja executado. Se um comando exceder esse limite de tempo, ele será eliminado e um aviso será registrado.

- **PERFDATA_TIMEOUT**
  Este é o número máximo de segundos que o Nagios permitirá que um comando do processador de dados de desempenho do host ou um comando do processador de dados de desempenho do serviço seja executado. Se um comando exceder esse limite de tempo, ele será eliminado e um aviso será registrado.

- **RETAIN_STATE_INFORMATION**
  Esta opção determina se o Nagios manterá ou não as informações de estado para hosts e serviços entre as reinicializações do programa. Se você habilitar essa opção, deverá fornecer um valor para a variável state_retention_file. Quando ativado, o Nagios salva todas as informações de estado dos hosts e serviços antes de serem desligadas (ou reiniciadas) e lê as informações de estado salvas anteriormente quando reiniciadas.

- **STATE_RETENTION_FILE**
  Este é o arquivo que o Nagios usará para armazenar informações de status, tempo de inatividade e comentários antes de serem encerradas. Quando o Nagios é reiniciado, ele usa as informações armazenadas neste arquivo para definir os estados iniciais de serviços e hosts antes de começar a monitorar qualquer coisa. Para fazer com que o Nagios retenha as informações de estado entre as reinicializações do programa, você deve habilitar a opção reter_state_informações.

- **RETENTION_UPDATE_INTERVAL**
  Esta configuração determina com que frequência (em minutos) o Nagios salvará automaticamente os dados de retenção durante a operação normal. Se você definir esse valor como 0, o Nagios não salvará os dados de retenção em intervalos regulares, mas ainda salvará os dados de retenção antes de desligar ou reiniciar. Se você desativou a retenção de estado (com a opção reter_stato_informações ), essa opção não terá efeito.

- **USE_RETAINED_PROGRAM_STATE**
  Essa configuração determina se o Nagios definirá ou não várias variáveis de estado em todo o programa com base nos valores salvos no arquivo de retenção. Algumas dessas variáveis de estado de todo o programa que normalmente são salvas no reinício do programa se a retenção de estado estiver ativada incluem as opções enable_notifications, enable_flap_detection, enable_event_handlers, execute_service_checks e accept_passive_service_checks . Se você não tiver a retenção de estado ativada, essa opção não terá efeito.

- **USE_RETAINED_SCHEDULING_INFO**
  Essa configuração determina se o Nagios manterá ou não as informações de agendamento (próximas horas de verificação) para hosts e serviços quando reiniciar.<span style="color:red"> Se você estiver adicionando um grande número (ou porcentagem) de hosts e serviços, eu recomendaria desabilitar essa opção quando você reiniciar o Nagios, pois isso pode prejudicar a propagação das verificações iniciais</span>. Caso contrário, você provavelmente desejará deixá-lo ativado.

- **RETAINED_HOST_ATTRIBUTE_MASK**
  AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.

  Essas opções determinam quais atributos de host ou serviço NÃO são retidos nas reinicializações do programa. Os valores para essas opções são AND, bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos de host e serviço são mantidos.

- **RETAINED_SERVICE_ATTRIBUTE_MASK**
  AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.

  Essas opções determinam quais atributos de host ou serviço NÃO são retidos nas reinicializações do programa. Os valores para essas opções são AND, bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos de host e serviço são mantidos.

- **RETAINED_PROCESS_HOST_ATTRIBUTE_MASK**
  AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.

  Essas opções determinam quais atributos do processo NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de processo de host e serviço separados que podem ser alterados. Por exemplo, as verificações de host podem ser desativadas no nível do programa, enquanto as verificações de serviço ainda estão ativadas. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.

- **RETAINED_PROCESS_SERVICE_ATTRIBUTE_MASK**
  AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.

  Essas opções determinam quais atributos do processo NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de processo de host e serviço separados que podem ser alterados. Por exemplo, as verificações de host podem ser desativadas no nível do programa, enquanto as verificações de serviço ainda estão ativadas. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.

- **RETAINED_CONTACT_HOST_ATTRIBUTE_MASK**
  AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.

  Essas opções determinam quais atributos de contato NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de contato de host e serviço separados que podem ser alterados. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.

- **RETAINED_CONTACT_SERVICE_ATTRIBUTE_MASK**
  AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.

  Essas opções determinam quais atributos de contato NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de contato de host e serviço separados que podem ser alterados. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.

- **INTERVAL_LENGTH**
  Esse é o número de segundos por "intervalo de unidade" usado para cronometrar na fila de agendamento, re-notificações, etc. "Intervalos de unidades" são usados no arquivo de configuração do objeto para determinar com que freqüência executar uma verificação de serviço, com que frequência re-notificar um contato etc.

- **BARE_UPDATE_CHECK**
  Esta opção impede que dados o Nagios envie para o api.nagios.org quando procurar atualizações. Por padrão, o Nagios enviará informações sobre a versão atual do Nagios que você instalou, bem como um indicador sobre se essa foi uma nova instalação ou não. O Nagios Enterprises usa esses dados para determinar o número de usuários executando uma versão específica do Nagios. Habilite esta opção se não desejar que essas informações sejam enviadas.

- **USE_AGGRESSIVE_HOST_CHECKING**
  O Nagios tenta ser inteligente sobre como e quando verifica o status dos hosts. Em geral, desabilitar esta opção permitirá ao Nagios tomar algumas decisões mais inteligentes e verificar os hosts um pouco mais rápido. A ativação dessa opção aumentará a quantidade de tempo necessária para verificar os hosts, mas poderá melhorar um pouco a confiabilidade. A menos que você tenha problemas com o Nagios em não reconhecer que um host foi recuperado, sugiro **não** ativar esta opção.

- **EXECUTE_SERVICE_CHECKS**
  Esta opção determina se o Nagios executará ou não as verificações de serviço quando (re) iniciar inicialmente. Se esta opção estiver desabilitada, o Nagios não executará ativamente nenhuma verificação de serviço e permanecerá em uma espécie de modo " inativo " (ainda poderá aceitar verificações passivas, a menos que você as tenha desativado ). Essa opção é usada com mais freqüência ao configurar servidores de monitoramento de backup, conforme descrito na documentação sobre [redundância](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/redundancy.html), ou ao configurar um ambiente de monitoramento distribuído. 

  Nota: Se você tiver a retenção de estado ativada, o Nagios ignorará essa configuração quando (re) iniciar e usará a última configuração conhecida para esta opção (conforme armazenada no arquivo de retenção de estado), a menos que você desativa a opção use_retained_program_state . Se você deseja alterar esta opção quando a retenção de estado estiver ativa (e o use_retained_program_state estiver ativado), será necessário usar o comando externo apropriado ou alterá-lo através da interface da web.

- **ACCEPT_PASSIVE_SERVICE_CHECKS**
  Esta opção determina se o Nagios aceitará ou não [as verificações passivas de serviço](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/passivechecks.html) quando (re) iniciar inicialmente. Se esta opção estiver desabilitada, o Nagios não aceitará nenhuma verificação passiva de serviço. Nota: Se você tiver a [retenção de estado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information) ativada, o Nagios ignorará essa configuração quando (re) iniciar e usará a última configuração conhecida para esta opção (conforme armazenada no [arquivo de retenção de estado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#state_retention_file) ), a *menos que* você desative a opção [use_retained_program_state](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#use_retained_program_state) . Se você deseja alterar esta opção quando a retenção de estado estiver ativa (e o [use_retained_program_state](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#use_retained_program_state) estiver ativado), será necessário usar o [comando externo](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/extcommands.html) apropriado ou alterá-lo através da interface da web. Os valores são os seguintes:

- **EXECUTE_HOST_CHECKS**
  Esta opção determina se o Nagios executará ou não verificações de host sob demanda e agendadas regularmente quando for (re) iniciado inicialmente. Se esta opção estiver desabilitada, o Nagios não executará nenhuma verificação de host ativamente, embora ainda possa aceitar [verificações passivas de host, a](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/passivechecks.html) menos que você as tenha [desativado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#accept_passive_host_checks) . Essa opção é usada com mais freqüência ao configurar servidores de monitoramento de backup, conforme descrito na documentação sobre [redundância](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/redundancy.html) , ou ao configurar um ambiente de monitoramento [distribuído](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/distributed.html) . Nota: Se você tiver a [retenção de estado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information) ativada, o Nagios ignorará essa configuração quando (re) iniciar e usará a última configuração conhecida para esta opção (conforme armazenada no [arquivo de retenção de estado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#state_retention_file) ), a *menos que*você desativa a opção [use_retained_program_state](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#use_retained_program_state) . Se você deseja alterar esta opção quando a retenção de estado estiver ativa (e o [use_retained_program_state](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#use_retained_program_state) estiver ativado), será necessário usar o [comando externo](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/extcommands.html) apropriado ou alterá-lo através da interface da web.

- **ACCEPT_PASSIVE_HOST_CHECKS**
  Esta opção determina se o Nagios aceitará ou não verificações passivas de host quando (re) iniciar inicialmente. Se esta opção estiver desabilitada, o Nagios não aceitará nenhuma verificação passiva de host. Nota: Se você tiver a retenção de estado ativada, o Nagios ignorará essa configuração quando (re) iniciar e usará a última configuração conhecida para esta opção (conforme armazenada no arquivo de retenção de estado ), a menos que você desative a opção use_retained_program_state . Se você quiser alterar essa opção quando a retenção de estado estiver ativa (e o use_retained_program_state estiver ativado), será necessário usar o comando externo apropriado ou alterá-lo através da interface da web.

- **ENABLE_NOTIFICATIONS**

- **ENABLE_EVENT_HANDLERS**

- **PROCESS_PERFORMANCE_DATA**

- **OBSESS_OVER_SERVICES**

- **OBSESS_OVER_HOSTS**

- **TRANSLATE_PASSIVE_HOST_CHECKS**

- **PASSIVE_HOST_CHECKS_ARE_SOFT**

- **CHECK_FOR_ORPHANED_SERVICES**

- **CHECK_FOR_ORPHANED_HOSTS**

- **CHECK_SERVICE_FRESHNESS**

- **SERVICE_FRESHNESS_CHECK_INTERVAL**

- **SERVICE_CHECK_TIMEOUT_STATE**

- **CHECK_HOST_FRESHNESS**

- **HOST_FRESHNESS_CHECK_INTERVAL**

- **ADDITIONAL_FRESHNESS_LATENCY**

- **ENABLE_FLAP_DETECTION**

- **LOW_SERVICE_FLAP_THRESHOLD**

- **HIGH_SERVICE_FLAP_THRESHOLD**

- **LOW_HOST_FLAP_THRESHOLD**

- **HIGH_HOST_FLAP_THRESHOLD**

- **DATE_FORMAT**

- **ILLEGAL_OBJECT_NAME_CHARS**

- **ILLEGAL_MACRO_OUTPUT_CHARS**

- **USE_REGEXP_MATCHING**

- **USE_TRUE_REGEXP_MATCHING**

- **ADMIN_EMAIL**

- **ADMIN_PAGER**

- **DAEMON_DUMPS_CORE**

- **USE_LARGE_INSTALLATION_TWEAKS**

- **ENABLE_ENVIRONMENT_MACROS**

- **DEBUG_LEVEL**

- **DEBUG_VERBOSITY**

- **DEBUG_FILE**

- **MAX_DEBUG_FILE_SIZE**

- **ALLOW_EMPTY_HOSTGROUP_ASSIGNMENT**

  



#### Arquivo (s) de Recursos

Os arquivos de recursos podem ser usados para armazenar macros definidas pelo usuário. O ponto principal de ter arquivos de recursos é usá-los para armazenar informações confidenciais de configuração (como senhas), sem disponibilizá-las aos CGIs.

Você pode especificar um ou mais arquivos de recursos opcionais usando a diretiva [resource_file](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#resource_file) no seu arquivo de configuração principal. 



#### Arquivos de definição de objeto

Os arquivos de definição de objeto são usados para definir hosts, serviços, grupos de hosts, contatos, grupos de contatos, comandos etc. É aqui que você define todas as coisas que deseja monitorar e como deseja monitorá-las.

Você pode especificar um ou mais arquivos de definição de objeto usando as [diretivas cfg_file](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#cfg_file) e / ou [cfg_dir](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#cfg_dir) em seu arquivo de configuração principal.

Uma introdução às definições de objetos e como elas se relacionam entre si pode ser encontrada [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configobject.html) .

#### Arquivo de configuração CGI

O arquivo de configuração CGI contém várias diretivas que afetam a operação dos [CGIs](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html) . Ele também contém uma referência ao arquivo de configuração principal, para que os CGIs saibam como você configurou o Nagios e onde suas definições de objetos são armazenadas.

A documentação para o arquivo de configuração CGI pode ser encontrada [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html) .
