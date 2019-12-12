[TOC]

# <span style="color:#d86c00">**Prefácio**</span>

<span style="color:#696969">Esse documento tenta passar ao leitor o conhecimento mais aprofundado da ferramenta de monitoramento conhecida como Nagios, o documento começa abordando a parte didática e após mostrar ao leitor tudo o que a ferramenta tem a oferecer, avançamos para parte prática, onde o leitor já terá conhecimentos de como funciona a ferramenta e passará a colocar o conhecimento em prática.</span>



# <span style="color:#d86c00">**Capítulo 1: Introdução ao Nagios**</span>

<span style="color:#696969">Nagios é uma ferramenta para monitoramento de rede/sistema, isso significa que o Nagios verifica computadores e/ou dispositivos na sua rede e garante que eles estejam funcionando como deveriam. </span>

<span style="color:#696969">O Nagios verifica constantemente se as máquinas estão funcionando corretamente (através do ping),  ele também verifica se os serviços monitorados nessas máquinas estão funcionando bem.  O principal objetivo do monitoramento da infraestrutura de TI é detectar o mais rápido possível qualquer evento que tenha acontecido, para que se possa tomar uma ação antes que os usuários desse sistema relatem o problema. O monitoramento do sistema no Nagios é dividido em duas categorias de objetos: verificação de hosts e verificação de serviços.  Os hosts representam um dispositivo físico ou virtual em sua rede (servidores, roteadores, switchs, impressoras entre outros). </span>

<span style="color:#696969">Os serviços são funcionalidades específicas, por exemplo, um servidor SSH (Secure Shell), consumo de memória, uso de HD, serviço de e-mail, entre outros serviços. Cada serviço está associado a um host no qual está sendo executado. Além disso, as máquinas podem ser agrupadas em grupos de hosts.</span>

<span style="color:#696969">Para que toda essa monitoração ocorra, existem vários arquivos de configuração diferentes que você precisará criar e/ou editar antes de começar a monitorar um dispositivo.</span>

<span style="color:#696969">A mágica do Nagios acontece nas verificações de desempenho, ele usa apenas quatro estados distintos, sendo eles: Ok, Warning, Critical e Unknown, tem também o fato de ser baseado em plugins, significando  que se você quiser verificar algum recurso que ainda não tenha um plugin, bastaria escrever um.</span>

<span style="color:#696969">O Nagios já vem com um conjunto de plugins padrão, mas caso você tenha necessidade, pode criar seus próprios plugins.</span>



## <span style="color:#d86c00">**Requisitos do sistema**</span>

<span style="color:#696969">O único requisito para executar o Nagios Core é uma máquina executando Linux (ou variante UNIX) que tenha acesso à rede e um compilador C instalado (se estiver instalando a partir do código-fonte).</span>

<span style="color:#696969">Você *não precisa* usar os CGIs (Uso do Nagios a partir de um navegador, onde scripts que rodam em backend passam informações e interagem com frontend) incluídos no Nagios Core. No entanto, se você decidir usá-los, precisará ter o seguinte software instalado:</span>

- <span style="color:#696969">Um servidor web (preferencialmente [Apache](http://www.apache.org/)).</span>



## <span style="color:#d86c00">**Licença do Nagios**</span>

<span style="color:#696969">O Nagios Core está licenciado sob os termos da [GNU General Public License](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html) Versão 2, publicada pela [Free Software Foundation](http://www.fsf.org/). Isso lhe dá permissão legal para copiar, distribuir e/ou modificar o Nagios sob certas condições. Leia o arquivo 'LICENSE' [versão online da licença](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html) para obter mais detalhes.</span>

<span style="color:#696969">O Nagios Core é fornecido COMO ESTÁ SEM GARANTIA DE QUALQUER TIPO, INCLUINDO A GARANTIA DE PROJETO, COMERCIALIZAÇÃO E ADEQUAÇÃO A UM OBJETIVO ESPECÍFICO.</span>



## <span style="color:#d86c00">**Apoio**</span>

<span style="color:#696969">Como uma ferramenta amplamente conhecida, o Nagios conta com dicas, tutoriais, documentação e manuais do Nagios de forma gratuita, para quem adquirir a versão paga do Nagios também ganha uma licença que lhe da direito ao suporte a ferramenta por uma equipe especializada.</span>

[Dicas, tutoriais, documentação e manuais do Nagios](https://library.nagios.com/)
[Fórum de suporte da comunidade e do Nagios](https://support.nagios.com/forum/)




## <span style="color:#d86c00">**Principais características**</span>

<span style="color:#696969">O Nagios é uma ferramenta muito flexível, ele pode ser configurado para monitorar sua infraestrutura de TI da maneira que você deseja. Também possui um mecanismo para reagir automaticamente a problemas e possui um poderoso sistema de notificação. 
Tudo isso é baseado em um sistema de definição de objetos (objetos são todos os elementos envolvidos na lógica de monitoramento e notificação do Nagios), como explicado a seguir:</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**Comandos**</span>: É a forma que o Nagios vai executar as verificações. Sendo uma parte importante da comunicação do Nagios com os plugins.</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**Períodos de tempo**</span>: São períodos de data e hora em que uma operação deve ou não ser executada. Por exemplo, de segunda a sexta-feira, das 09:00 às 17:00.</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**Hosts e grupos de hosts**</span>: São dispositivos (servidores, impressoras, roteadores, switchs etc), além da possibilidade de agrupar hosts. Um único host pode ser membro de mais de um grupo.</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**Serviços e grupo de serviços**</span>: São várias funcionalidades ou recursos para monitorar em um host específico. Por exemplo, uso da CPU, espaço de armazenamento ou servidor da Web e etc.</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**Contatos e grupos de contatos**</span>: São as pessoas que devem ser notificadas com informações sobre um evento no host ou serviço, os contatos podem ser agrupados, e um único contato pode ser membro de mais de um grupo.</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**Notificações**</span>: Definem quem deve ser notificado sobre o que, por exemplo, todos os erros do grupo de servidores Windows devem ir para o grupo de contatos do windows-administration durante o horário de trabalho e para o grupo de contatos da equipe nível 2 fora do horário de trabalho.</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**Escalações**</span>: São extensões de notificações; eles definem que depois que um objeto está no mesmo estado por um período específico de tempo, outras pessoas devem ser notificadas de determinados eventos, por exemplo, um servidor crítico que esteja inativo por mais de 4 horas deve alertar o gerenciamento de TI para que eles acompanhem o problema.</span>

[Mais sobre objetos e como definir arquivos de objetos](#<span style="color:#d86c00">**Arquivos de definição de objeto**</span>)



# <span style="color:#d86c00">**Capítulo 2: Entendendo o Nagios**</span>

<span style="color:#696969">Nessa sessão vamos ver alguns dos principais arquivos de configuração do Nagios, quais são suas funcionalidades e vamos configurar algumas funcionalidades para pegar prática com o métdodo de configuração da ferramenta.</span>



## <span style="color:#d86c00">**Arquivo de configuração principal**</span>

<span style="color:#696969">O arquivo de configuração principal é chamado <span style="color:#008080">***nagios.cfg***</span>, é o arquivo principal carregado durante a inicialização do Nagios, ele contém várias diretivas que afetam como o daemon do Nagios opera. </span>
<span style="color:#696969">Este arquivo de configuração é lido pelo daemon do Nagios e pelos CGIs (que fazem a comunicação com frontend do Nagios, em outras palavras, o "navegador" usado para visualizar eventos no dashboard do nagios).</span>

<span style="color:#696969">Não precisamos necessariamente editar ou recriar esse arquivo, o arquivo original já vem com todas as funcionalidades prontas e funcionais, a edição seria mais passar um pente fino, melhorando a performance das verificações do Nagios, mas isso depende muito da infraestrutura de TI usada, portanto, vamos explicar algumas linha usada no arquivo<span style="color:#008080">***nagios.cfg***</span>.</span>

<span style="color:#696969">Para acessar o link que leva a documentação oficial do arquivo de configuração principal do Nagios, basta clicar [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html).</span>

<span style="color:#696969">O arquivo <span style="color:#C0C0C0">***nagios.cfg***</span> fica localizado no diretório `/usr/local/nagios/etc/nagios.cfg`:</span>

```bash
### Sessão de logs, 
# Mudar a pasta padrão dos logs necessita que seja aplicado as devidas permissões para a nova pasta, aplicando o comando para a nova pasta de log 'chown -R nagios. pasta', isso server somente para a variável LOG_FILE.
log_file=/var/log/nagios/nagios.log

# (opções padrões do Nagios).
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

# Diretório de configuração dos objetos (opções padrões do Nagios).
cfg_file=/usr/local/nagios/etc/objects/commands.cfg
cfg_file=/usr/local/nagios/etc/objects/contacts.cfg
cfg_file=/usr/local/nagios/etc/objects/timeperiods.cfg
cfg_file=/usr/local/nagios/etc/objects/templates.cfg
cfg_file=/usr/local/nagios/etc/objects/localhost.cfg
object_cache_file=/usr/local/nagios/var/objects.cache
precached_object_file=/usr/local/nagios/var/objects.precache

# Informações de armazenamento (opção padrão do Nagios).
resource_file=/usr/local/nagios/etc/resource.cfg

# Arquivo de status (opção padrão do Nagios).
status_file=/usr/local/nagios/var/status.dat

# Usuário e grupo Nagios (opções padrões do Nagios).
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

# Opção para aceitar verificação de serviço passivo
accept_passive_service_checks=1

# Opção para execução de verificação de host
execute_host_checks=1

# Opção para aceitar a verificação de host passivo
accept_passive_host_checks=1

# Opção Notificações, caso a retenção de estado esteja ativada, 
# essa opção é desconsiderada no inicio/reinicio do Nagios.
enable_notifications=1

# Opção de manipulador de eventos, caso a retenção de estado esteja ativada, 
# essa opção é desconsiderada no inicio/reinicio do Nagios.
enable_event_handlers=1

# Opção de processamento de dados de desempenho
process_performance_data=0

# Opção de obsessão por serviços, só use em caso de monitoramento distribuído para serviços.
obsess_over_services=0

# Opção de obsessão por serviços, só use em caso de monitoramento distribuído para Hosts.
obsess_over_hosts=0

# Opção Traduzir verificações de host passivas
translate_passive_host_checks=0

# As verificações passivas de host são tratadas com SOFT (Não)
passive_host_checks_are_soft=0

# Opção de verificação de serviço órfão
check_for_orphaned_services=1

# Opção de verificação de host órfão
check_for_orphaned_hosts=1

# Ativar a verificação em segundos para um serviço
check_service_freshness=1

# Opção de verificação de atualização de serviço (em segundos)
service_freshness_check_interval=60

## Estado de tempo limite da verificação do serviço
# Essa configuração determina o estado em que o Nagios relatará, quando o tempo limite 
# de uma verificação de serviço expirar, ou seja, não responderá em (segundos) 
# 'service_check_timeout'. Isso pode ser útil se uma máquina estiver executando 
# uma carga muito alta e você não desejar considerar crítico uma verificação 
# de serviço (o padrão).

## As configurações válidas são:

# c - Crítico (padrão)
# u - Desconhecido
# w - Aviso
# o - OK
service_check_timeout_state=c

# Opção adicional de latência de limite de atualização
additional_freshness_latency=15

## Opção de detecção de retalho
# Esta opção determina se o Nagios tentará ou não detectar hosts e 
# serviços que estão "flapando". O flap ocorre quando um host ou 
# serviço muda entre estados com muita frequência, resultando em uma 
# enxurrada de notificações sendo enviadas (com isso o Nagios não notificará). 
# Quando o Nagios detecta que um host ou serviço está flapando, 
# ele suprime temporariamente as notificações desse host/serviço 
# até que ele pare de flapar.
enable_flap_detection=1

# Limite baixo de flap de serviço (em %)
low_service_flap_threshold=5.0

# Limite alto de flap de serviço (em %)
high_service_flap_threshold=20.0

# Limite baixo de flap de host (em %)
low_host_flap_threshold=5.0

# Limite alto de flap de host (em %)
high_host_flap_threshold=20.0

# Formato de data (padrão 'us')

#Option	         Output Format	           Sample Output
#us	             MM/DD/YYYY HH:MM:SS	   06/30/2002 03:15:00
#euro	         DD/MM/YYYY HH:MM:SS	   30/06/2002 03:15:00
#iso8601	     YYYY-MM-DD HH:MM:SS	   2002-06-30 03:15:00
#strict-iso8601	 YYYY-MM-DDTHH:MM:SS	   2002-06-30T03:15:00
date_format=euro

# Caracteres ilegais de nome de objeto
illegal_object_name_chars=`~!$%^&*|'"<>?,()=

# Caracteres ilegais de saída de macro (variáveis como $HOSTOUTPUT$)
illegal_macro_output_chars=`~$&|'"<>

# Opção de correspondência de expressão regular
use_regexp_matching=0

# Opção de correspondência de expressão regular verdadeira
use_true_regexp_matching=0

# Endereço de e-mail do administrador
admin_email=nagios@localhost

# Pager do administrador
admin_pager=pagenagios@localhost

# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux_OpenStack_Platform/3/html/Getting_Started_Guide/ch08s02.html
daemon_dumps_core=0

# Opção de ajustes grandes na instalação
use_large_installation_tweaks=0

## Opção de macros de ambiente
# Esta opção determina se o daemon Nagios disponibilizará todas as macros
# padrão como variáveis de ambiente para seus comandos de verificação, 
# notificação, manipulador de eventos, etc. 
# Em instalações grandes do Nagios, isso pode ser problemático, 
# pois requer memória adicional e (mais importante) CPU para calcular os valores 
# de todas as macros e disponibilizá-las ao ambiente.
enable_environment_macros=0

# Nível de depuração
debug_level=0

# Verbosidade de Depuração
debug_verbosity=1

# Arquivo de depuração
debug_file=/usr/local/nagios/var/nagios.debug

# Tamanho máximo do arquivo de depuração (em linhas)
max_debug_file_size=1000000

## Permitir atribuição de grupo de hosts vazia
#  opção booleana determina se serviços, dependências de serviço ou dependências 
# de host atribuídas a grupos de hosts vazios (grupos de hosts sem membros do host) 
# farão com que o Nagios saia com erro na inicialização (ou durante uma verificação 
# de configuração) ou não. O comportamento padrão, se a opção não estiver presente no 
# arquivo de configuração principal, é que o Nagios saia com erro se algum desses 
# objetos estiver associado a grupos de hosts que não possuem hosts associados a eles.
allow_empty_hostgroup_assignment=0
```

<span style="color:#FFFF00"><span style="color:#FFFF00">Verifique a descrição de cada opção acima, consultando</span></span> [este link](definition_main-cfg.html).



## <span style="color:#d86c00">**Arquivo(s) de Recursos**</span>

<span style="color:#696969">Os arquivos de recursos no geral, podem ser usados para armazenar macros definidas pelo usuário. O foco principal de usarmos arquivos de recursos, é poder armazenar informações confidenciais (como senhas), sem exibi-las aos CGIs.</span>

<span style="color:#696969">Você pode especificar um ou mais arquivos de recursos opcionais usando a diretiva [resource_file](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#resource_file), que fica no arquivo de configuração princial. Em uma instalação rápida do Nagios, o padrão para *resource_file* é o arquivo `/usr/local/nagios/etc/resource.cfg`.</span>

<span style="color:#696969">Conteúdo de *resource.cfg*:</span>

```bash
# Configurações padrões do Nagios.
# Seta $USER1$ com o caminho para os plugins:
$USER1$=/usr/local/nagios/libexec

# Seta $USER2$ com o caminho para os manipuladores de eventos (essa opção está
# comentada, ou seja, não entrará em vigor no funcionamento do sistema):
#$USER2$=/usr/local/nagios/libexec/eventhandlers

# Aqui temos um exemplo de como poderiamos colocar usuário e senha para sere usados em comandos do Nagios (também não entrará em vigor no funcionamento do sistema):
#$USER3$=someuser
#$USER4$=somepassword
```

<span style="color:#696969">Os arquivos de recursos geralmente contêm dados confidenciais, pois só podem ser usados em definições de objetos e não é possível ler seus valores na interface da web. Isso torna possível ocultar senhas para vários serviços confidenciais dos administradores do Nagios sem privilégios adequados. Podemos ter até 32 macros (variáveis), denominadas <span style="color:#00CED1">**$USER1$**</span>, <span style="color:#00CED1">**$USER2$**</span> ... <span style="color:#00CED1">**$USER32$**</span>.</span>



## <span style="color:#d86c00">**Arquivo de configuração CGI**</span>

<span style="color:#696969">Os arquivos de configuração CGI contém várias opções que afetam como a operação dos [CGIs](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html) trabalham. Esses arquivos também contém uma referência ao arquivo de configuração principal, para que os CGIs saibam como você configurou o Nagios e onde suas definições de objetos são armazenadas, esses scripts CGI alteram a funcionalidade do Nagios quando utilizada por navegadores (dashboard do Nagios), caso você não use CGI, a interação na monitoração dos recursos será feita apenas por linha de comando.</span>

<span style="color:#696969">Para pessoas que terão acesso a página do Nagios, você deve editar o arquivo de configuração do CGI para poder aplicar as devidas permissões a cada usuário ou grupo de usuário, dessa forma, poderá manter o controle do que cada usuário pode fazer no CGI.</span>

<span style="color:#696969">Em uma instalação rápida do Nagios, o local padrão para<span style="color:#C0C0C0">*cgi.cfg*</span>é o arquivo `/usr/local/nagios/etc/cgi.cfg`. Segue um exemplo do arquivo:</span>

```bash
main_config_file=/usr/local/nagios/etc/nagios.cfg
physical_html_path=/usr/local/nagios/share
url_html_path=/nagios
show_context_help=0
use_pending_states=1
use_authentication=1
use_ssl_authentication=0
authorized_for_system_information=nagiosadmin
authorized_for_configuration_information=nagiosadmin
authorized_for_system_commands=nagiosadmin
authorized_for_all_services=nagiosadmin
authorized_for_all_hosts=nagiosadmin
authorized_for_all_service_commands=nagiosadmin
authorized_for_all_host_commands=nagiosadmin
default_statuswrl_layout=4
ping_syntax=/bin/ping -n -U -c 5 $HOSTADDRESS$
refresh_rate=90
result_limit=100
escape_html_tags=1
action_url_target=_blank
notes_url_target=_blank
lock_author_names=1
navbar_search_for_addresses=1
navbar_search_for_aliases=1
```

<span style="color:#FFFF00">Verifique a descrição de cada opção acima, consultando</span>[este link](definition_cgi.html).

<span style="color:#696969">A documentação para o arquivo de configuração CGI pode ser encontrada [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html) .</span>



## <span style="color:#d86c00">**Arquivos de definição de objeto**</span>

<span style="color:#696969">Arquivos de objetos servem para que possamos definir `hosts`, `serviços`, `grupos de hosts`, `contatos`, `grupos de contatos`, `comandos`  etc. Todos esses arquivos serão usados pelo Nagios quando ele estiver em funcionamento. Esses arquivos de objetos são definidos usando as diretivas <span style="color:#00CED1">**cfg_dir**</span> (para definir um diretório) e <span style="color:#00CED1">**cfg_file**</span> (para definir um arquivo), segue um exemplo padrão de diretivas do Nagios:</span>

```bash
# Define o arquivo que conterá os comandos usado pelo Nagios,
# aqui se tem o caminho dos plugins, parâmetros, entre outras informações:
cfg_file=/usr/local/nagios/etc/objects/commands.cfg

# Define o arquivo que conterá os contatos usado pelo Nagios,
# aqui se tem o os parâmetros para notificação, seja por e-mail ou algum outro tipo
# de notificação que tenha sido criado:
cfg_file=/usr/local/nagios/etc/objects/contacts.cfg

# Define o arquivo que conterá os períodos para notificação, usado pelo Nagios,
# os períodos de notificações servem para verificações de checks, notificações 
# de problemas entre outras ciosas. Dessa forma, poderemos notificar
# uma equipe específica sempre num período em que estão trabalhando.
cfg_file=/usr/local/nagios/etc/objects/timeperiods.cfg

# Define o arquivo que conterá os exemplos de diretivas como: 
#	contact (contatos); 
#	host (criação de uma máquina);
#	service (que serviços eu vou monitorar).
cfg_file=/usr/local/nagios/etc/objects/templates.cfg

# Aqui nós temos o arquivo de configuração no nosso servidor Nagios.
# Aqui temos a criação do host (localhost), alguns serviços que serão
# monitorados nele, dentre outras informações.
cfg_file=/usr/local/nagios/etc/objects/localhost.cfg

# Definição do arquivo de recursos que será usado.
resource_file=/usr/local/nagios/etc/resource.cfg
```



## <span style="color:#d86c00">**Definições de Objetos**</span>

<span style="color:#696969">Aqui vamos verificar como definir objetos no Nagios. Todo objeto terá 3 diretivas em comum, são elas:</span>

- <span style="color:#C0C0C0">**name**</span>
<span style="color:#696969">É o nome do objeto;</span>
  

  
- <span style="color:#C0C0C0">**use**</span>
<span style="color:#696969">Esta variável faz com que seu objeto atual, possa herdar valores de outro objetos, apenas se a opção
  <span style="color:#00CED1">use</span> for usada no objeto atual, para isso, basta passar o <span style="color:#00CED1">name</span> do objeto que você quer herdar as propriedades como valor da variável <span style="color:#00CED1">use</span>, exemplo: </span>
  
  ​           <span style="color:#FFDAB9">use                             generic-host</span>
  
  <span style="color:#696969">Nesse caso, vamos herdar as propriedades do objeto <span style="color:#00CED1">generic-host</span> (***generic-host*** é o nome de um objeto que já foi criado anteriormente).</span>
  
  
  
- <span style="color:#C0C0C0">**register**</span>
  <span style="color:#696969">É usada para indicar se a definição do objeto deve ou não ser "registrada" no Nagios, o não registro é muito usado para criação de modelos, caso contrário o Nagios tentará registrar tal objeto como algo válido.</span>

```bash
# Exemplo de objeto modelo para um Host.
define host {
    check_command                check-host-alive
    notification_options         d, u, r
    max_check_attempts           5
    name                         generichosttemplate 
    register                     0
}
```

<span style="color:#696969">A variável faltante acima seria o <span style="color:#00CED1">*host_name*</span>, mas esse objeto só irá nos servir como um modelo para ser herdado, não precisamos registra-lo (como um host válido), porque ele está incompleto, sendo assim dessa forma ele não será um host e sim um modelo em outras palavras.</span>

<span style="color:#696969">Os valores são os seguintes: </span>

- <span style="color:#C0C0C0">**0**</span><span style="color:#696969">**= NÃO registra a definição do objeto**; </span>

- <span style="color:#C0C0C0">**1**</span><span style="color:#696969">**= registra a definição do objeto** (<span style="color:#FFDAB9">**esse é o padrão**</span>). </span>

  <span style="color:#696969">Essa variável NÃO é herdada na opção<span style="color:#00CED1">***use***</span>, toda definição de objeto (que seja parcial) usada como modelo deve definir explicitamente a diretiva de *registro* como *0*, caso contrário ela será registrada.</span>



### <span style="color:#d86c00">**Variáveis locais versus variáveis herdadas**</span>

<span style="color:#696969">A variável local ***SEMPRE*** terá prioridade sobre a variável herdada, isso significa que, se você definir uma variável num *objeto X*, e herdar propriedades do *objeto Y*, que possui a mesma variável setada, a variável que será utilizada será a que for especificada no *objeto X*, porque ele da prioridade para variáveis locais, exemplo:</span>

```bash
# Vamos criar um objeto para uma máquina que será um servidor:
define host {
    host_name                Server1
    check_command            check-host-alive
    notification_options     d, u, r
    max_check_attempts       5
    name                     servidores_nutela
}

# Vamos criar um outro objeto para uma máquina que será um servidor e que irá herdar
# propriedades do 'Servidor 1':
define host {
    host_name                Server2
    max_check_attempts       3
    use                      servidores_nutela
}

# Você observará que a definição para host Server1 foi definida como tendo servidores_nutela
# como o nome do modelo. A definição para o host Server2 está usando a definição de 
# servidores_nutela como seu objeto de modelo. 
# Depois que o Nagios processa esses dados, a definição resultante do host Server2 
# seria equivalente a esta definição:
define host {
    host_name               Server2
    check_command           check-host-alive
    notification_options    d, u, r
    max_check_attempts      3
}
```

<span style="color:#696969">Perceba que no host *Server2* foram herdados apenas a propriedade `check_command` do host *Server1*, variáveis como `notification_options` e `max_check_attempts` não foram herdadas porque foram definidas localmente.</span>



### <span style="color:#d86c00">**Encadeamento de herança**</span>

<span style="color:#696969">Um *objeto X* pode herdar propriedades de um *objeto Y*, isso nós já vimos acima, mas um *objeto X* que herdou propriedades de um *objeto Y* pode dar essas propriedades para um outro *objeto* (um pouco confuso, não?), vamos aos exemplos:</span>

```bash
# Vamos criar um objeto para uma máquina que será um servidor:
define host {
    host_name               Server1
    check_command           check-host-alive
    notification_options    d, u, r
    max_check_attempts      5
    name                    servidores_nutela
}

# Vamos criar um outro objeto para uma máquina que será um servidor e que irá herdar
# propriedades do 'Servidor 1':
define host {
    host_name               Server2
    max_check_attempts      3
    use                     servidores_nutela
    name                    servidores2
}

# Vamos criar um outro objeto para uma máquina que será um servidor e que irá herdar
# propriedades do 'Servidor 2':
define host {
    host_name               Server3
    use                     servidores2
}

# Você observará que a definição para host Server1 foi definida como tendo servidores_nutela
# como o nome do modelo. A definição para o host Server2 está usando a definição de 
# servidores_nutela (de Server1) como seu objeto de modelo. 
#
# A definição para o host Server3 está usando a definição de 
# servidores2 (de Server2) como seu objeto de modelo.
#
# Depois que o Nagios processa esses dados, a definição resultante do host Server3 
# seria equivalente a esta definição:
define host {
    host_name               Server3
    check_command           check-host-alive
    notification_options    d, u, r
    max_check_attempts      3
}
```

<span style="color:#696969">Dessa forma, o host *Server3* herda variáveis da definição de host *Server2*, que por sua vez herda variáveis da definição de host *Server1*.</span>



<span style="color:#d86c00">**E porque entender isso é importante?**</span>

<span style="color:#696969">Na maioria dos casos, vamos herdar propriedades do modelo `generic-host` ou `linux-server` (caso esteja trabalhando com máquinas Linux), isso facilita muito não só a criação de novos objetos, como poupa muito tempo de nós.</span>

<span style="color:#696969">Dessa forma, pegamos algo pronto, ou criamos um modelo customizado e apenas vamos herdando desse modelo.</span>



### <span style="color:#d86c00">**Variáveis de objeto personalizadas**</span>

<span style="color:#696969">Qualquer variável criada e que seja definida em modelos de hosts, modelos de serviços ou modelos de contatos serão herdadas como qualquer outra variável.</span>

```bash
# Criando um modelo de Host com variáveis customizadas:
define host {
    _customvar1             somevalue # Variável de host personalizada 
    _snmp_community         public # CVariável de host personalizada 
    name                    generichosttemplate
    register                0
}

# Criando um host que herdará as propriedades de 'generichosttemplate':
define host {
    host_name               Server1
    address                 192.168.1.3
    use                     generichosttemplate
}

# O host Server1 herdará as variáveis personalizadas, que são: _customvar1 e 
# _snmp_community, bem como seus respectivos valores.
# O resultado efetivo é uma definição para Server1 que se parece com isso:
define host {
    host_name               Server1
    address                 192.168.1.3
    _customvar1             somevalue
    _snmp_community         public
}
```



<span style="color:#d86c00">**Impedir herança de variável**</span>

<span style="color:#696969">Caso você não queira que alguma variável seja herdada, pode especificar seu valor como NULL, assim como no exemplo abaixo:</span>

```bash
# Criando um modelo de Host com variáveis customizadas:
define host {
    _customvar1             somevalue # Variável de host personalizada 
    _snmp_community         public # CVariável de host personalizada 
    name                    generichosttemplate
    register                0
}

# Criando um host que herdará as propriedades de 'generichosttemplate':
define host {
    host_name               Server1
    address                 192.168.1.3
    _customvar1             null
    use                     generichosttemplate
}

# O host Server1 herdará a variável personalizada '_snmp_community', 
# bem como seus respectivos valores, impedindo que ele herde a variável '_customvar1',
# já que impedimos isso passando valor de 'null' para ela.
# O resultado efetivo é uma definição para Server1 que se parece com isso:
define host {
    host_name               Server1
    address                 192.168.1.3
    _snmp_community         public
}
```



<span style="color:#d86c00">**Usando valores herdados mais valores locais**</span>

<span style="color:#696969">As vezes podemos querer usar os valores herdados juntamente com valores locais, para isso precisamos adicionar um sinal de adição`+`, para ele acrescentar um valor a outro já existente, isso só está disponível para variáveis padrões do Nagios.</span>

```bash
define host {
    hostgroups              all-servers
    name                    generichosttemplate
    register                0
}

define host {
    host_name               Server1
    hostgroups              +linux-servers,web-servers
    use                     generichosttemplate
}
```

Nesse caso, o host *Server1* terá não só o valor de sua variável local, mas também da variável herdada:

```bash
define host {
    host_name               linuxserver1
    hostgroups              all-servers,linux-servers,web-servers
}
# all-servers veio de generichosttemplate;
# linux-servers e web-servers foram adicionadas localmente.
```



### <span style="color:#d86c00">**Definindo Host**</span>

<span style="color:#696969">Vamos abordar a criação de um objeto de definição cuja funcionalidade é criar um host, como as opções a serem utilizadas são vastas, estarei mostrando um exemplo completo do que o objeto `define host` pode receber e então falaremos sobre cada opção a ser usada.</span>

```bash
define host {
host_name						host_name
alias							alias
display_name					display_name
address							IP
parents							host_names
importance						#
hostgroups						hostgroup_names
check_command					command_name
initial_state					[o,d,u]
max_check_attempts				#
check_interval					#
retry_interval					#
active_checks_enabled			[0/1]
passive_checks_enabled			[0/1]
check_period					timeperiod_name
obsess_over_host|obsess			[0/1]
check_freshness					[0/1]
freshness_threshold				#
event_handler					command_name
event_handler_enabled			[0/1]
low_flap_threshold				#
high_flap_threshold				#
flap_detection_enabled			[0/1]
flap_detection_options			[o,d,u]
process_perf_data				[0/1]
retain_status_information		[0/1]
retain_nonstatus_information	[0/1]
contacts						contacts
contact_groups					contact_groups
notification_interval			#
first_notification_delay		#
notification_period				timeperiod_name
notification_options			[d,u,r,f,s]
notifications_enabled			[0/1]
stalking_options				[o,d,u,N]
notes	                		note_string
notes_url						url
action_url						url
icon_image						image_file
icon_image_alt					alt_string
vrml_image						image_file
statusmap_image					image_file
2d_coords						x_coord,y_coord
3d_coords						x_coord,y_coord,z_coord
}    
```

<span style="color:#FFFF00">Verifique a descrição de cada opção acima, consultando</span>[este link](definition_host.html).



### <span style="color:#d86c00">**Definindo Host Groups**</span>

<span style="color:#696969">A definição de grupo de hosts é usada para agrupar um ou mais hosts juntos, isso simplifica uma configuração padrão para todos os Hosts participantes do grupo.</span>


```bash
define hostgroup {
# Nome do grupo de hosts.
    hostgroup_name	        hostgroup_name

# Apelido para o grupo de hosts.
    alias                   alias

# Nome dos membros, separados por vírgula.
    members	                hosts

# Nome de outros hostgroups.
    hostgroup_members       hostgroups

# Definir uma descrição para o host.
    notes	                DESCRICAO

# Definir uma URL para uma anotação do host (informações).
    notes_url	            url

# Definir uma URL para uma ação do host (procedimentos que podem
# ser seguidos em caso de falha).
    action_url	            url
   	}
   	
#### Opções necessárias para criação de um HostGroup:

define hostgroup {
    hostgroup_name	        hostgroup_name
    alias                   alias
    }
```



### <span style="color:#d86c00">**Definindo Service**</span>

<span style="color:#696969">Um objeto do tipo service é usado para identificar um serviço que será  executado num determinado host ou grupo de hosts, abaixo segue um exemplo de todas as opções que um objeto do tipo <span style="color:#00CED1">service</span> pode ter:</span>

```bash
define service {
	host_name						host_name
	hostgroup_name					hostgroup_name
	service_description				service_description
	display_name					display_name
	parents							service_descriptions
	importance						#
	servicegroups					servicegroup_names
	is_volatile						[0/1]
	check_command					command_name
	initial_state					[o,w,u,c]
	max_check_attempts				#
	check_interval					#
	retry_interval					#
	active_checks_enabled			[0/1]
	passive_checks_enabled			[0/1]
	check_period					timeperiod_name
	obsess_over_service|obsess		[0/1]
	check_freshness					[0/1]
	freshness_threshold				#
	event_handler					command_name
	event_handler_enabled			[0/1]
	low_flap_threshold				#
	high_flap_threshold				#
	flap_detection_enabled			[0/1]
	flap_detection_options			[o,w,c,u]
	process_perf_data				[0/1]
	retain_status_information		[0/1]
	retain_nonstatus_information	[0/1]
	notification_interval			#
	first_notification_delay		#
	notification_period				timeperiod_name
	notification_options			[w,u,c,r,f,s]
	notifications_enabled			[0/1]
	contacts						contacts
	contact_groups					contact_groups
	stalking_options				[o,w,u,c,N]
	notes							note_string
	notes_url						url
	action_url						url
	icon_image						image_file
	icon_image_alt					alt_string
   	}
```

<span style="color:#FFFF00">Verifique a descrição de cada opção acima, consultando</span> [este link](definition_service.html).



### <span style="color:#d86c00">**Definindo Service Groups**</span>

<span style="color:#696969">A definição de grupo de serviços é usada para agrupar um ou mais serviços para simplificar a configuração de objetos (também conhecido como [Truques de economia de tempo](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objecttricks.html)).</span>

```bash
define servicegroup {
# Nome do grupo de serviços.
servicegroup_name		servicegroup_name

# Apelido para o grupo de serviços.
alias                   alias

# Nome dos membros, separados por vírgula.
members					services

# Nome de outros service serviços.
servicegroup_members	servicegroups

# Definir uma descrição para o serviços.
notes					note_string

# Definir uma URL para uma anotação dos serviços (informações).
notes_url				url

# Definir uma URL para uma ação dos serviços (procedimentos que podem
# ser seguidos em caso de falha).
action_url				url
   	}


#### Opções necessárias para criação de um Service Group:
define servicegroup {
servicegroup_name		servicegroup_name
alias                   alias
}
```



### <span style="color:#d86c00">**Definindo Contatos**</span>

Uma definição de contato é usada para identificar alguém que deve ser contatado no caso de um problema num Host ou Serviço, abaixo segue um exemplo de todas as opções que um objeto do tipo <span style="color:#00CED1">contact</span> pode ter:

```bash
define contact {
contact_name					contact_name
alias                   		alias
contactgroups					contactgroup_names
minimum_importance				#
host_notifications_enabled		[0/1]
service_notifications_enabled	[0/1]
host_notification_period		timeperiod_name
service_notification_period		timeperiod_name
host_notification_options		[d,u,r,f,s,n]
service_notification_options	[w,u,c,r,f,s,n]
host_notification_commands		command_name
service_notification_commands	command_name
email							email_address
addressx						additional_contact_address
can_submit_commands				[0/1]
retain_status_information		[0/1]
retain_nonstatus_information	[0/1]
   	}
```

<span style="color:#FFFF00">Verifique a descrição de cada opção acima, consultando</span> [este link](definition_contact.html).

## <span style="color:#d86c00">**Event Handler - Manipuladores de Eventos**</span>









https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/eventhandlers.html



# <span style="color:#d86c00">**Instalando o Nagios 4**</span>

<span style="color:#696969">Todo processo de instalação foi realizado seguindo a [documentação oficial](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html#Ubuntu) do Nagios, usando o sistema operacional do Ubuntu 18.08 LTS.</span>

- <span style="color:#C0C0C0">Link</span>

  [Nagios Core - Installing Nagios Core From Source](https://support.nagios.com/kb/article/nagios-core-installing-nagios-core-from-source-96.html)

  [Table of Contents](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/toc.html)



## <span style="color:#d86c00">**Preparando o ambiente**</span>

<span style="color:#696969">Inicialmente vamos baixar alguns pacotes que vamos usar durante a utilização do servidor.</span>

<span style="color:#696969">Segue o comando usado:</span>

```
sudo apt-get install -y unzip zip tcpdump openssh-server mtr nmap perl python python3 vim curl htop wget bc gawk snmp snmpd libnet-snmp-perl

# Descrição das aplicações que vão ser instaladas:

	# UNZIP = Desarquivador para arquivos .zip;
	# ZIP = Arquivador para arquivos .zip;
	# TCPDUMP = Analisador de tráfego de Rede;
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

<span style="color:#696969">Para podermos compilar o Nagios precisamos atender aos pré  requisitos, caso contrário, teremos erro durante a compilação, abaixo  segue o comando que instala as dependências do Nagios.</span>

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



## <span style="color:#d86c00">**Baixando o Nagios Core**</span>

<span style="color:#696969">Agora vamos baixar o pacote do Nagios para podermos compilá-lo.</span>

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



### <span style="color:#d86c00">**Compilar o nagios core**</span>

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



#### <span style="color:#d86c00">**Criando uma conta de usuário no Nagios**</span>

<span style="color:#696969">Agora vamos criar um usuário que poderá acessar a aplicação web do Nagios.</span>

```
# Criando um usuário chamado 'nagiosadmin'
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

# Mudando Dono e Grupo dono do arquivo 'htpasswd.users':
sudo chown nagios. /usr/local/nagios/etc/htpasswd.users
```



#### <span style="color:#d86c00">**Manipuladores de eventos do Nagios**</span>

<span style="color:#696969">Vamos copiar a pasta de notificação de eventos do Nagios para pasta de produção.</span>

```
# Copiando a pasta 'eventhandlers' para '/usr/local/nagios/libexec/':
sudo cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/

# Mudando usuário e dono da pasta 'eventhandlers':
sudo chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers
```



#### <span style="color:#d86c00">**Reiniciando o Nagios/Apache**</span>

<span style="color:#696969">Vamos reiniciar o apache e o Nagios para "aplicar" as mudanças.</span>

```
# Reiniciando o Apache2:
sudo systemctl restart apache2.service

# Reiniciando o Nagios:
sudo systemctl start nagios.service
```



<span style="color:#696969">Agora precisamos acessar o IP do servidor do Nagios para verificar se conseguimos acessar a aplicação web do Nagios, o usuário é **nagiosadmin**, a senha é a senha que você definiu.</span>



<span style="color:#696969">Se você esqueceu a senha, pode adicionar o usuário novamente usando o comando abaixo e digitar uma nova senha.</span>

```
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```



<span style="color:#696969">Caso tenha conseguido acessar, você vera que todos os checks para o  localhost (servidor Nagios) estarão vermelhos, como na imagem abaixo:</span>

[![1573130380552](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573130380552.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573130380552.png)



<span style="color:#696969">Isso se deve ao motivo de não termos os plugins necessários para a  verificação desses serviços, podemos ver isso clicando em alguns dos  serviços que estão sendo verificados (vamos pegar como exemplo o Current Load), podemos verificar no campo <span style="color:#00CED1">**Status Information**</span> que o erro é devido ao arquivo (plugin) não ter sido encontrado.</span>

[![1573130571787](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573130571787.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573130571787.png)



<span style="color:#696969">Para corrigir isso, vamos instalar os plugins padrões do Nagios.</span>



# <span style="color:#d86c00">**Instalando o Nagios Plugins**</span>

<span style="color:#696969">Vamos instalar os plugins padrões do Nagios para que possamos ter uma monitoração padrão da ferramenta.</span>

 

## <span style="color:#d86c00">**Pré requisitos**</span>

<span style="color:#696969">Boa parte dos pré requisitos do Nagios-Plugins já foi instalado  anteriormente, vamos instalar apenas os que não foram instalados.</span>

```
sudo apt install -y libmcrypt-dev libssl-dev dc gettext libmcrypt4

# libmcrypt-dev = Arquivos de desenvolvimento da biblioteca de descriptografia/criptografia;
# libssl-dev = Kit de ferramentas Secure Sockets Layer - arquivos de desenvolvimento;
# dc = calculadora de precisão arbitrária polonesa-reversa dc GNU;
# gettext = Utilitários de internacionalização GNU;
# libmcrypt4 = Biblioteca de Des/Encriptação
```



## <span style="color:#d86c00">**Compilando os plugins**</span>

<span style="color:#696969">Agora vamos baixar e compilar o pacote de plugins do Nagios.</span>

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

# Mudando o usuário e grupo dos plugins para o Nagios:
chown nagios. /usr/local/nagios/libexec/*
```



## <span style="color:#d86c00">**Reiniciando o daemon do Nagios**</span>

```
# Reinicia o daemon do Nagios:
sudo systemctl restart nagios.service

# Mostra o status do serviço do Nagios:
sudo systemctl status nagios.service
```



<span style="color:#696969">Você pode verificar o arquivo de configuração do Nagios usando o comando `/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg`.</span>



<span style="color:#696969">Após isso você pode dar um `Re-schedule the next check of this service` nos serviços, até que eles venham a ficar com status OK, como na imagem abaixo:</span>



[![1573143150490](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573143150490.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573143150490.png)



<span style="color:#696969">Aplicando o `Re-schedule the next check of this service` nos serviços: </span>



[![1573143273027](https://github.com/BRVN01/NAGIOS/raw/master/IMG/1573143273027.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/1573143273027.png) 















## <span style="color:#d86c00">**Estados Soft e hard**</span>

<span style="color:#696969">O Nagios funciona verificando se um host ou serviço específico está funcionando corretamente e armazenando seu status. Para evitar a detecção de falhas aleatórias e temporárias, o Nagios usa estados <span style="color:#00CED1">*soft*</span> e <span style="color:#00CED1">*hard*</span> para descrever qual é o status atual de um host ou serviço.</span>

<span style="color:#696969">Imagine que um administrador esteja reiniciando um servidor da Web e essa operação torne a conexão com as páginas da Web indisponível por 5 segundos. Como essas reinicializações geralmente são feitas à noite para diminuir o número de usuários afetados, esse é um período aceitável. No entanto, um problema pode ser que o Nagios tente se conectar ao servidor e observe que ele está realmente inoperante. Se depender apenas de um único resultado, o Nagios poderá acionar um alerta de que um servidor da Web está inoperante. Na verdade, ele voltaria a funcionar em alguns segundos, mas levaria alguns minutos para Nagios descobrir isso.</span>

<span style="color:#696969">Para situações onde o serviço ficou inativo por um curto período de tempo ou ou foi um falha momentânea, foram introduzidos estados de verificações *soft*. Quando um status é desconhecido ou é diferente de um status anterior (para o mesmo host/serviço), o Nagios testará novamente o host ou o serviço algumas vezes para garantir que a alteração seja permanente, ou seja, para garantir que o evento não tenha sido momentâneo. Assim o Nagios assume que o novo resultado é um estado *soft*. Após alguns testes *softs*, se o evento continuar acusando o mesmo status, isso significa que o novo estado é permanente (está mesmo com algum problema), então ele é considerado um estado *hard*.</span>

<span style="color:#696969">Cada verificação de host e serviço define o número de tentativas a serem executadas antes de assumir que uma alteração é permanente. Isso permite mais flexibilidade sobre quantas falhas devem ser tratadas como um problema real em vez de temporário. Definir o número de verificações como 1 fará com que todas as alterações sejam tratadas como um problema real (isso pode causar falsos alertas). </span>