<span style="color:#d86c00">**Sumário**</span>

[TOC]

# <span style="color:#d86c00">**Introdução**</span>

<span style="color:#696969">Para que possamos customizar a criação de um host, configurar variáveis personalizadas e subir equipamentos para serem monitorados, devemos ter conhecimento de como criar objetos do tipo host.</span>



<span style="color:#696969">Abaixo encontra-se cada uma das variáveis que podemos utilizar:</span>



#### <span style="color:#d86c00">**host_name**</span>

<span style="color:#696969">É o nome do nosso host (dispositivo que será gerenciado).</span>



#### <span style="color:#d86c00">**alias**</span>

<span style="color:#696969">É um apelido para o nosso host (dispositivo que será gerenciado).</span>



#### <span style="color:#d86c00">**display_name**</span>

<span style="color:#696969">Se não especificado, o padrão será o valor especificado para a opção <span style="color:#00CED1">*host_name*</span>. Os CGIs atuais não usam essa opção, embora versões futuras da interface da web os usem (funciona melhor no Icinga).</span>



#### <span style="color:#d86c00">**address**</span>

<span style="color:#696969">É o endereço IP do nosso host.</span>



#### <span style="color:#d86c00">**parents**</span>

<span style="color:#696969">O host pai normalmente são outros hosts que precisam estar funcionando para que nosso host possa ser verificado. Por exemplo, um roteador que permite alcançar determinado host, nosso host terá o roteador como pai. Isso seria uma dependências simples para nosso host poder funcionar.</span>



#### <span style="color:#d86c00">**importance**</span>

<span style="color:#696969">A importância é usada para determinar se as notificações devem ser enviadas para um contato, se o valor de importância do host mais os valores de importância de todos os serviços do host forem maiores ou iguais à importância mínima do contato, o contato será notificado. </span>

<span style="color:#696969">Por exemplo, você pode definir esse valor e a importância mínima dos contatos para que um administrador do sistema seja notificado quando um servidor de desenvolvimento for desativado, mas o CIO será notificado apenas quando o servidor de banco de dados de comércio eletrônico de produção da empresa estiver inativo.</span>



#### <span style="color:#d86c00">**hostgroups**</span>

<span style="color:#696969">Esta opção é usada para identificar o(s) nome(s) do(s) grupo(s) que o nosso host pertence. Vários grupos de host devem ser separados por vírgulas.</span>



#### <span style="color:#d86c00">**check_command**</span>

<span style="color:#696969">Esta opção é usada para indicar um comando que irá verificar se nosso host está ativo ou não. Isso é feito através do protocolo ICMP, geralmente usando o comando <span style="color:#00CED1">check-host-alive</span>.</span>



#### <span style="color:#d86c00">**initial_state**</span>

<span style="color:#696969">Por padrão, o Nagios assume que todos os hosts estão *UP* quando é iniciado. Você pode substituir o estado inicial de um host usando as opções abaixo. As opções válidas são: </span>

<span style="color:#696969"><span style="color:#C0C0C0">**o**</span> = UP</span>
<span style="color:#696969"><span style="color:#C0C0C0">**d**</span> = DOWN</span>
<span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = INACESSÍVEL.</span>



#### <span style="color:#d86c00">**max_check_attempts**</span>

<span style="color:#696969">Esta opção é usada para definir um número de vezes em que o Nagios irá executar o comando de verificação (saber se o host está UP ou diferente de UP). Definir esse valor como 1 fará com que o Nagios gere um alerta sem tentar novamente a verificação do host, ou seja, após qualquer evento, mesmo que seja um evento falso ou passageiro, será gerado um estado HARD do host e você será notificado (se assim foi programado).</span>

<span style="color:#696969">Para ignorar a verificação do host, deixe a opção <span style="color:#00CED1">*check_command*</span>em branco.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Tempo em minutos.</span>



#### <span style="color:#d86c00">**check_interval**</span>

<span style="color:#696969">É a quantidade de tempo que vamos esperar até agendar uma nova verificação do host, caso este esteja UP ou não UP. É o intervalo entre as verificações do nosso host,
mesmo que tenha passado da quantidade de <span style="color:#00CED1">max_check_attempts</span> e nosso host esteja num estado HARD, ele vai esperar X minutos para poder agendar uma nova verificação.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Tempo em minutos.</span>



#### <span style="color:#d86c00">**retry_interval**</span>

<span style="color:#696969">É a quantidade de tempo que vamos esperar até agendar uma nova verificação do host, somente se o host não estiver UP, as verificações são reagendados no intervalo de novas tentativas quando mudam para um estado não UP. </span>

<span style="color:#696969">Depois que o host tiver sido verificado de novo pela quantidade de vezes estabelecidas pelo <span style="color:#00CED1">max_check_attempts</span> e nenhuma alteração tiver sido verificada, ele voltará a ser agendado na sua taxa "normal", conforme definido pelo valor <span style="color:#00CED1">check_interval</span>.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Tempo em minutos.</span>



#### <span style="color:#d86c00">**active_checks_enabled**</span>

<span style="color:#696969">Esta opção é usada para determinar se as verificações ativas (agendadas regularmente ou sob demanda) deste host estão ativadas. </span>
<span style="color:#696969">Valores: </span><span style="color:#4682B4">0 = desativar verificações de host ativo</span>, <span style="color:#4682B4">1 = ativar verificações de host ativo</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**passive_checks_enabled**</span>

<span style="color:#696969">Esta opção é usada para determinar se as verificações passivas estão ou não ativadas para este host. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativar verificações passivas de host</span>, <span style="color:#4682B4">1 = ativar verificações passivas de host</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**check_period**</span>

<span style="color:#696969">Nome do período em que as verificações ativas serão feitas, por exemplo: as verificações podem ser feitas 24 horas por dia, durante os 7 dias da semana.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Nome do periodo de verificação.</span>



#### <span style="color:#d86c00">**obsess_over_host | obsess**</span>

<span style="color:#696969">Essa opção determina se as verificações do host serão feitas ou não pelo uso do comando <span style="color:#00CED1">ocsp_command</span>. </span><span style="color:#696969">Essa opção é muito usada em monitoramento distribuído, onde um Gerente recebe informações de outros Gerentes.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**check_freshness**</span>

<span style="color:#696969">Esta opção é usada para determinar se o Nagios irá fazer verificações no host, para ver se ocorreu atualizações no resultado do host (algum evento).</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**freshness_threshold**</span>

<span style="color:#696969">Esta opção é usada para especificar o limite de atualização (em segundos) para este host. Se você definir esta opção como um valor 0, o Nagios determinará um limite de atualização a ser usado automaticamente.</span>



#### <span style="color:#d86c00">**event_handler**</span>

<span style="color:#696969">Esta opção é usada para especificar o nome de um comando que deve ser executado sempre que uma alteração no estado do host for detectada, ou seja, sempre que for DOWN ou RECOVER. </span>
<span style="color:#696969">Um uso para manipuladores de eventos é a capacidade do próprio Nagios Core de corrigir proativamente os problemas antes que alguém seja notificado.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Nome do comando que será executado.</span>

<span style="color:#FFFF00">Para mais detalhes de como funciona o Event Handler, consulte [este link](Documentation_Nagios.html#%3Cspan-style=%22color:%23d86c00%22%3E**event-handler---manipuladores-de-eventos**%3C/span%3E)</span>



#### <span style="color:#d86c00">**event_handler_enabled**</span>

<span style="color:#696969">Esta opção é usada para determinar se o manipulador de eventos para este host está ativado ou não. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**low_flap_threshold**</span>

<span style="color:#696969">Esta opção é usada em conjunto com a opção <span style="color:#00CED1">high_flap_threshold</span>, ambas servem para especificar um limite de flaps no host em sí, quando o flap atinge o limite estabelecido em <span style="color:#00CED1">low_flap_threshold</span>, considera-se que o host está parando de flapar, ou seja, a baixa porcentagem de flap no host está menor do que o limite estabelecido na opção <span style="color:#00CED1">low_flap_threshold</span>. Isso é útil para que os contatos não fiquem sendo notificados a cada alteração de estado do host (UP ou DOWN), sendo notificados apenas uma vez.</span>

<span style="color:#696969">Nota: Essa variável é uma variável específica para esse host, já existe uma variável global para essa verificação de flap, denominada <span style="color:#00CED1">low_host_flap_threshold</span>, que fica no arquivo de configuração principal do Nagios.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Números, exemplo: 5.0 (5%)</span>



#### <span style="color:#d86c00">**high_flap_threshold**</span>

<span style="color:#696969">Esta opção é usada em conjunto com a opção <span style="color:#00CED1">low_flap_threshold</span>, ambas servem para especificar um limite de flaps no host em sí, quando o flap atinge o limite estabelecido em <span style="color:#00CED1">high_flap_threshold</span>, considera-se que o host começou a flapar, ou seja, a alta porcentagem de flap no host está maior do que o limite estabelecido na opção <span style="color:#00CED1">high_flap_threshold</span>. Isso é útil para que os contatos não fiquem sendo notificados a cada alteração de estado do host (UP ou DOWN), sendo notificados apenas uma vez.</span>

<span style="color:#696969">Nota: Essa variável é uma variável específica para esse host, já existe uma variável global para essa verificação de flap, denominada <span style="color:#00CED1">high_host_flap_threshold</span>, que fica no arquivo de configuração principal do Nagios.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Números, exemplo: 20.0 (20%)</span>



#### <span style="color:#d86c00">**flap_detection_enabled**</span>

<span style="color:#696969">Esta opção é usada para determinar se este host terá a detecção de flap ativada ou não. Caso você defina  <span style="color:#00CED1">enable_flap_detection=1</span> no arquivo principal do Nagios, não será necessário definir novamente aqui, a menos que você queira desativar essa opção para este host.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

 

#### <span style="color:#d86c00">**flap_detection_options**</span>

<span style="color:#696969">Podemos excluir certos estados de host/serviço no uso da lógica de detecção de flap, evitando receber flap de alguns estados, esta opção permite especificar quais estados de host/serviço (UP, DOWN, OK, CRITICAL) você pode desejar usar para a detecção de flap. Se você não usar esta opção, todos os estados de host ou serviço serão usados na detecção de flap. </span>
<span style="color:#696969">As opções válidas são uma combinação de um ou mais dos seguintes itens: </span>

<span style="color:#696969"><span style="color:#C0C0C0">**o**</span> = UP</span>
<span style="color:#696969"><span style="color:#C0C0C0">**d**</span> = DOWN</span>
<span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = UNREACHABLE.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">[o,d,u]</span>



#### <span style="color:#d86c00">**process_perf_data**</span>

<span style="color:#696969">Esta opção é usada para determinar se o processamento de dados de desempenho está ou não ativado para este host. Isso é importante para fazermos levantamento de desempenho com integração ao MRTG por exemplo.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**retain_status_information**</span>

<span style="color:#696969">Esta opção é usada para determinar se as informações relacionadas ao status do host são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a opção [retain_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). </span>

<span style="color:#696969">Essas informações são salvas no arquivo que fica especificado na opção <span style="color:#00CED1">state_retention_file</span> no arquivo principal do Nagios, aqui nós teremos informações como: status, tempo de inatividade e comentários antes de serem encerradas. Quando o Nagios é reiniciado, ele usa as informações armazenadas neste arquivo para definir os estados iniciais de serviços e hosts antes de começar a monitorar qualquer coisa.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**retain_nonstatus_information**</span>

<span style="color:#696969">Essa opção é usada para determinar se as informações que não são de status sobre o host são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a opção [reter_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). </span>

<span style="color:#696969">Essas informações são salvas no arquivo que fica especificado na opção <span style="color:#00CED1">state_retention_file</span> no arquivo principal do Nagios, aqui nós teremos informações como: status, tempo de inatividade e comentários antes de serem encerradas. Quando o Nagios é reiniciado, ele usa as informações armazenadas neste arquivo para definir os estados iniciais de serviços e hosts antes de começar a monitorar qualquer coisa.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**contacts**</span>

<span style="color:#696969">Nome dos contatos que vão receber a notificação de problema ou de recuperação desse host.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Nome do contato.</span>



#### <span style="color:#d86c00">**contact_groups**</span>

<span style="color:#696969">Grupo de contatos que vão receber a notificação de problemas ou de recuperação desse host.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Nome do grupo de contato.</span>



#### <span style="color:#d86c00">**notification_interval**</span>

<span style="color:#696969">Esta opção é usada para definir quanto tempo Nagios deve aguardar antes de notificar novamente um contato que este *host*ainda está inativo ou inacessível. Se você definir esse valor como 0, o Nagios *não* notificará novamente os contatos sobre problemas desse host, apenas uma única notificação de problema será enviada.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Números, exemplo: 20 (20 minutos)</span>



#### <span style="color:#d86c00">**first_notification_delay**</span>

<span style="color:#696969">Esta opção é usada para definir quanto tempo Nagios deve aguardar antes de enviar a primeira notificação de problema quando este host entra em um estado não UP. <span style="color:#FFFF00">Se você definir esse valor como 0, o Nagios começará a enviar notificações imediatamente.</span></span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Números, exemplo: 20 (20 minutos)</span>



#### <span style="color:#d86c00">**notification_period**</span>

<span style="color:#696969">Esta opção é usada para especificar o nome do [período](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#timeperiod) durante o qual as notificações de eventos para este host podem ser enviadas aos contatos. Nenhuma notificação de host será enviada durante horários não cobertos pelo período.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">Nome do período.</span>



#### <span style="color:#d86c00">**notification_options**</span>

<span style="color:#696969">Esta opção é usada para determinar que tipo de notificações do host devem ser enviadas. As opções válidas são uma combinação de um ou mais dos seguintes itens: </span>

- <span style="color:#C0C0C0">**d**</span> <span style="color:#696969">= enviar notificações em um estado DOWN;</span>
- <span style="color:#C0C0C0">**u**</span> <span style="color:#696969">= enviar notificações em um estado inacessível;</span>
- <span style="color:#C0C0C0">**r**</span> <span style="color:#696969">= enviar notificações em recuperações (estado OK);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**f**</span> = Enviar notificações quando o host inicia e para de flapar;</span>
- <span style="color:#C0C0C0">**s**</span> <span style="color:#696969">= Enviar notificações de envio quando temos um [tempo de inatividade programado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/downtime.html), enviando notificações assim que começar e terminar o período. Se você especificar;</span>
- <span style="color:#C0C0C0">**n**</span> <span style="color:#696969">= Nenhuma notificação do host será enviada.
  </span>
- <span style="color:#C0C0C0">**n**</span> <span style="color:#696969">= nenhuma notificação do host será enviada.
  </span>
  <span style="color:#FFFF00">Se você não especificar nenhuma opção de notificação, o Nagios assumirá que você deseja que as notificações sejam enviadas para todos os estados possíveis.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">[d,u,r,f,s] ou deixar em branco para todos os valores.</span>



#### <span style="color:#d86c00">**Notifications_enabled**</span>

<span style="color:#696969">Esta opção é usada para determinar se as notificações para este host estão ativadas ou não. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**stalking_options**</span>

<span style="color:#696969">Esta opção determina para quais estados "monitorando" o host o está ativado. As opções válidas são uma combinação de um ou mais dos seguintes itens:</span>

<span style="color:#696969"><span style="color:#C0C0C0">**o**</span> = monitorar nos estados UP</span>
<span style="color:#696969"><span style="color:#C0C0C0">**d**</span> = monitorar nos estados DOWN</span>
<span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = monitorar nos estados UNREACHABLE.</span>
<span style="color:#696969"><span style="color:#C0C0C0">**N**</span> = monitorar estados de eventos de quando as notificações são enviadas.</span>

  

<span style="color:#8B008B">**Devo ativar o stalking?**</span>

<span style="color:#696969">Antes de tudo, você deve decidir se tem uma necessidade real de analisar dados de log arquivados para encontrar a causa exata de um problema. Você pode decidir que precisa desse recurso para alguns hosts ou serviços, mas dificilmente irá precisar para todos os hosts/serviços. </span>
<span style="color:#696969">Você também pode achar que só precisa ativar o "monitoramento" para alguns estados do host, em vez de todos os estados. Por exemplo, você pode optar por ativar o "monitoramento" para os estados UP e DOWN de um host, mas não para o estado UNREACHABLE.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">[o,d,u,N]</span>



#### <span style="color:#d86c00">**notes**</span>

<span style="color:#696969">Esta opção é usada para definir uma descrição para o host. Se você especificar uma observação aqui, será exibida no CGI de informações estendidas (quando estiver visualizando informações sobre o host especificado).</span>
<span style="color:#696969">Exemplo colocado no `define host` do servidor do Nagios:</span>

```bash
define host {

    use                         linux-server
    host_name            		localhost
    alias                   	localhost
    address                 	127.0.0.1
    notes                   	Servidor do Nagios
}
```

<span style="color:#FFFF00">Segue imagem de como vai ficar a descrição aplicada ao host:</span>

[![65466549864654](https://github.com/BRVN01/NAGIOS/raw/master/IMG/65466549864654.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/65466549864654.png)

  

#### <span style="color:#d86c00">**notes_url**</span>

<span style="color:#696969">Essa opção é usada para definir uma URL que pode ser usado para fornecer mais informações sobre o host.</span>
<span style="color:#696969">Exemplo colocado no `define host` do servidor do Nagios:</span>

```bash
define host {

    use                         linux-server
    host_name            		localhost
    alias                   	localhost
    address                 	127.0.0.1
    notes_url              		https://www.google.com.br
    }
```

<span style="color:#FFFF00">Segue imagem de como vai ficar o notes_url aplicada ao host:</span>

[![5454aas2s1d](https://github.com/BRVN01/NAGIOS/raw/master/IMG/5454aas2s1d.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/5454aas2s1d.png) 



#### <span style="color:#d86c00">**action_url**</span>

<span style="color:#696969">Esta opção é usada para definir uma URL que pode ser usada para fornecer mais ações a serem executadas no host, o icone pode ser atribuido a informações de performance.</span>
<span style="color:#696969">Exemplo colocado no `define host` do servidor do Nagios:</span>
```bash
define host {

    use                         linux-server
    host_name            		localhost
    alias                   	localhost
    address                 	127.0.0.1
    action_url             		https://www.google.com.br
    }
```
<span style="color:#FFFF00">Segue imagem de como vai ficar o action_url aplicada ao host:</span>

[![a5fr51s5fr8y42f](https://github.com/BRVN01/NAGIOS/raw/master/IMG/a5fr51s5fr8y42f.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/a5fr51s5fr8y42f.png) 



#### <span style="color:#d86c00">**icon_image**</span>

<span style="color:#696969">Essa variável é usada para definir o nome de uma imagem GIF, PNG ou JPG que deve ser associada a este host. Esta imagem será exibida nos vários locais nos CGIs. A imagem ficará melhor se tiver 40x40 pixels de tamanho. </span>
<span style="color:#696969">O diretório padrão para as imagens é `/usr/local/nagios/share/images/logos`.</span>

<span style="color:#696969">Exemplo colocado no `define host` do servidor do Nagios:</span>

```bash
define host {

    use                         linux-server
    host_name            		localhost
    alias                   	localhost
    address                 	127.0.0.1
    icon_image             		debian.png
    }
```

<span style="color:#FFFF00">Segue imagem de como vai ficar o icon_image aplicada ao host:</span>

[![a21asd65sf2nhk](https://github.com/BRVN01/NAGIOS/raw/master/IMG/a21asd65sf2nhk.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/a21asd65sf2nhk.png) 



#### <span style="color:#d86c00">**icon_image_alt**</span>

<span style="color:#696969">Essa variável é usada para definir uma sequência opcional que é usada na tag ALT da imagem especificada pelo argumento <icon_image>, basicamente, adiciona um nome abaixo da imagem.</span>

<span style="color:#696969">Exemplo colocado no `define host` do servidor do Nagios:</span>

```bash
define host {

    use                         linux-server
    host_name            		localhost
    alias                   	localhost
    address                 	127.0.0.1
    icon_image             		debian.png
    icon_image_alt				debian.png
    }
```

<span style="color:#FFFF00">Segue imagem de como vai ficar o icon_image_alt aplicada ao host:</span>

[![a782162sd1s6f](https://github.com/BRVN01/NAGIOS/raw/master/IMG/a782162sd1s6f.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/a782162sd1s6f.png)



#### <span style="color:#d86c00">**vrml_image**</span>

<span style="color:#696969">Esta opção cria um modelo VRML 3D de todos os hosts que você definiu na sua rede. As coordenadas usadas ao desenhar os hosts (bem como os mapas de textura bonita) são obtidas das definições de [host](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#host) . Se você preferir permitir que o CGI gere automaticamente coordenadas de desenho para você, use a diretiva [default_statuswrl_layout](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html#default_statuswrl_layout) para especificar um algoritmo de layout que deve ser usado. Você precisará de um navegador VRML (como [Cortona](http://www.parallelgraphics.com/cortona/) , [Cosmo Player](http://www.cosmosoftware.com/) ou [WorldView](http://www.intervista.com/) ) instalado em seu sistema antes de poder visualizar o modelo gerado. </span>

<span style="color:#696969">O diretório padrão para as imagens é `/usr/local/nagios/share/images/logos`.</span>




#### <span style="color:#d86c00">**statusmap_image**</span>

<span style="color:#696969">Essa variável é usada para definir o nome de uma imagem que deve ser associada a esse host no CGI do mapa de status . Você pode especificar uma imagem JPEG, PNG e GIF, se desejar, embora eu sugira fortemente o uso de uma imagem no formato GD2, pois outros formatos resultam em muito tempo desperdiçado da CPU quando a imagem do statusmap é gerada. As imagens GD2 podem ser criadas a partir de imagens PNG usando o utilitário pngtogd2 fornecido com a biblioteca gd de Thomas Boutell. As imagens GD2 devem ser criadas em arquivos descompactadospara minimizar a carga da CPU quando o CGI do mapa de status estiver gerando a imagem do mapa de rede. A imagem ficará melhor se tiver 40x40 pixels de tamanho. Você pode deixar essas opções em branco se não estiver usando o CGI do mapa de status.</span>
<span style="color:#696969">O diretório padrão para as imagens é `/usr/local/nagios/share/images/logos`.</span>



#### <span style="color:#d86c00">**2d_coords**</span>

<span style="color:#696969">Essa variável é usada para definir coordenadas a serem usadas ao desenhar o host no mapa de status CGI. As coordenadas devem ser dadas em números inteiros positivos, pois correspondem a pixels físicos na imagem gerada. A origem do desenho (0,0) está no canto superior esquerdo da imagem e se estende na direção x positiva (à direita) ao longo da parte superior da imagem e na direção y positiva (para baixo) ao longo da mão esquerda lado da imagem. Para referência, o tamanho dos ícones desenhados é geralmente de cerca de 40x40 pixels (o texto ocupa um pouco de espaço extra). As coordenadas que você especificar aqui são para o canto superior esquerdo do ícone do host que é desenhado. Nota: Não se preocupe com o máximo de coordenadas x e y que você pode usar. O CGI calculará automaticamente as dimensões máximas da imagem criada com base nas maiores coordenadas x e y que você especificar.</span>



#### <span style="color:#d86c00">**3d_coords**</span>

<span style="color:#696969">Essa variável é usada para definir coordenadas a serem usadas ao desenhar o host no CGI statuswrl. As coordenadas podem ser números reais positivos ou negativos. A origem do desenho é (0.0,0.0,0.0). Para referência, o tamanho dos cubos do host desenhados é de 0,5 unidades de cada lado (o texto ocupa um pouco mais de espaço). As coordenadas que você especificar aqui são usadas como o centro do cubo host.</span>



## <span style="color:#d86c00">**Opções mais usadas**</span>

<span style="color:#696969">Abaixo segue as propriedades atribuídas para um host qualquer:</span>

```bash
define host {
# Nome do Host que será monitorado:
    host_name			         NOME

# Apelido do Host:
    alias				         APELIDO

# Endereço IP do host:
    address                      IP

# Nome do modelo que vamos importar as propriedades
    use                          NOME

# Pai(s) do nosso host.
    parents                      PAIS 

# Comando que será usado para verificar se o host
# está UP.
    check_command                check-host-alive

# Intervalo entre as verificações OK e não OK,
# mesmo após ter passado da quantidade de 'max_check_attempts',
# tudo em minutos (vai verificar de 1 em 1 minuto).
    check_interval               1

# Tempo que o Nagios vai aguardar para agendar uma 
# nova verificação, em minutos, isso só ocorre quando
# o host não está OK.
    retry_interval               1 

# Tentativas para determinar o estado HARD, se todas tentativas falharem,
# ele considera o host como não OK.
    max_check_attempts           5

# Nome do período em que as verificações ativas serão feitas.
# Serão verificados a todo momento (24 horas por 7 dias na semana).
    check_period                 24x7 

# Grupo de contatos que vão receber a notificação de problemas ou
# de recuperação desse host.
    contact_groups               nagiosadmin

# Tipos de notificações que serão enviadas 
# sendo elas: DOWN, UNKNOWN e Recover).
    notification_options         d,u,r

# Intervalo entre notificações de problemas, a cada X minutos 
# ele vai notificar novamente, caso o problema permaneça.
    notification_interval        30

# Período para efetuar as notificações.
# Vai notificar 24 horas em 7 dias da semana.
    notification_period          24x7

# Habilitar a notificação para este host.
    notifications_enabled        1

# Habilitar Manipuladores de Eventos.
    event_handler_enabled	     1

# Habilitar a detecção por flap, se o host passar a ficar muito
# instável, ele entra num estado de flap, isso vai impedir que
# os contatos fiquem sendo notificados de estados OK para não OK,
# até que o problema seja corrigido.
    flap_detection_enabled       1

# Habilitar o processamento de dados de desempenho.
    process_perf_data            1

# Não queremos registar como um host válido:
    register                     0
}
```



## <span style="color:#d86c00">**Opções necessárias**</span>

<span style="color:#696969">Abaixo segue as propriedades necessárias para criação de um objeto do tipo Host funcional e não apenas um modelo:</span>

```shell
define host {
# Nome do Host que será monitorado:
    host_name                     NOME

# Tentativas para determinar o estado HARD, se todas tentativas falharem,
# ele considera o host como não OK.
    max_check_attempts            5

# Nome do período em que as verificações ativas serão feitas.
# Serão verificados a todo momento (24 horas por 7 dias na semana).
    check_period                  24x7 

# Contato que vai receber a notificação de problemas ou
# de recuperação desse host.
    contacts			          nagiosadmin

# Grupo de contatos que vão receber a notificação de problemas ou
# de recuperação desse host.
    contact_groups                nagiosadmin # Grupo de contatos.

# Intervalo entre notificações de problemas, a cada X minutos 
# ele vai notificar novamente, caso o problema permaneça.
    notification_interval         30

# Período para efetuar as notificações.
# Vai notificar 24 horas em 7 dias da semana.
    notification_period           24x7 # Período para notificações.
}
```



