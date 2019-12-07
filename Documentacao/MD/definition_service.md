<span style="color:#d86c00">**Sumário**</span>

[TOC]

#### <span style="color:#d86c00">**host_name**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o nome do [host](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#hostgroup) ao qual este serviço está sendo executado ou está associado.</span>



#### <span style="color:#d86c00">**hostgroup_name**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o nome do(s) grupo(s) de [host(s)](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#hostgroup) ao qual este serviço está sendo executado ou está associado. Vários grupos de hosts devem ser separados por vírgulas. O <span style="color:#00CED1">hostgroup_name</span> pode ser usado no lugar da diretiva <span style="color:#00CED1">host_name.</span></span>



#### <span style="color:#d86c00">**service_description**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o nome do serviço, esse nome ficará aparente no Dashboard do Nagios</span>
<span style="color:#696969">Exemplo colocado no `define service` do servidor do Nagios:</span>

```bash
define service {

    use                         local-service
    host_name               	localhost
    service_description     	check_icmp
    check_command           	check_ping!100.0,20%!500.0,60%
}
```

<span style="color:#FFFF00">Segue imagem de como vai ficar o service_description aplicada ao serviço:</span>

[![896621024723724](https://github.com/BRVN01/NAGIOS/raw/master/IMG/896621024723724.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/896621024723724.png) 



#### <span style="color:#d86c00">**display_name**</span>

<span style="color:#696969">Se não especificado, o valor será o valor da diretiva <span style="color:#00CED1">*service_description*</span>. Os CGIs atuais não usam mais essa opção, embora versões futuras da interface web os usem (funciona melhor no Icinga).</span>



#### <span style="color:#d86c00">**parents**</span>

<span style="color:#696969">Os serviços pai normalmente são outros serviços que precisam estar funcionando para que uma verificação do nosso serviço possa ocorrer. Por exemplo, se um serviço que verifica o status de um disco rígido através do SSH, esse serviço de verificação do disco rígido terá o serviço SSH como pai. Isso seria uma dependências simples para nosso serviço poder funcionar.</span>



#### <span style="color:#d86c00">**importance**</span>

<span style="color:#696969">A importância é usada para determinar se as notificações devem ser enviadas para um contato, se o valor de importância do serviço mais os valores de importância de todos os serviços do host forem maiores ou iguais à importância mínima do contato, o contato será notificado. </span>

<span style="color:#696969">Por exemplo, você pode definir um valor (importance) e a importância mínima dos contatos para que um administrador do sistema seja notificado quando um servidor de desenvolvimento for desativado, mas o CIO será notificado apenas quando o servidor de banco de dados de comércio eletrônico de produção da empresa estiver inativo.</span>



#### <span style="color:#d86c00">**servicegroups**</span>
<span style="color:#696969">Esta opção é usada para identificar o(s) nome(s) do(s) grupo(s) que o nosso serviço pertence. Vários grupos de serviços devem ser separados por vírgulas. Esta opção pode ser usada como uma alternativa a opção<span style="color:#00CED1">*membros*</span>nas definições de [grupos de serviços](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#servicegroup).</span>



#### <span style="color:#d86c00">**is_volatile**</span>
<span style="color:#696969">Esta diretiva é usada para indicar se o serviço é "volátil". Os serviços normalmente<span style="color:#00CED1">*não são*</span>voláteis.</span>

<span style="color:#696969">Um serviço volátil seria um serviço que muda de estado sem que o Nagios faça a verificação do serviço, um exemplo para isso seria um <span style="color:#00CED1">Trap SNMP</span>, ou até mesmo algum serviço que precise enviar uma mensagem para o Nagios, para que ele possa tomar alguma providência.</span>

<span style="color:#696969">Para mais informações sobre serviço volátil [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/volatileservices.html). </span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = serviço não é volátil</span>, <span style="color:#4682B4">1 = serviço é volátil.</span>



#### <span style="color:#d86c00">**check_command**</span>





#### <span style="color:#d86c00">**initial_state**</span>

<span style="color:#696969">Por padrão, o Nagios assume que todos os serviço estão *UP* quando iniciados. Você pode substituir o estado inicial de um serviço usando esta diretiva. As opções válidas são: </span>

<span style="color:#696969"><span style="color:#C0C0C0">**o**</span> = Ok</span>
<span style="color:#696969"><span style="color:#C0C0C0">**w**</span> = Warning</span>
<span style="color:#696969"><span style="color:#C0C0C0">**c**</span> = CRITICAL</span>
<span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = UNKNOWN</span>



#### <span style="color:#d86c00">**max_check_attempts**</span>

<span style="color:#696969">Esta diretiva é usada para definir o número de vezes que o Nagios tentará novamente o comando de verificação de serviço se retornar qualquer estado diferente de OK. Definir esse valor como 1 fará com que o Nagios gere um alerta sem tentar novamente a verificação do serviço.</span>

<span style="color:#696969">Nota: Se você não deseja verificar o status do serviço, ainda deve configurá-lo com um valor mínimo de 1. Para ignorar a verificação do serviço, deixe a opção <span style="color:#00CED1">*check_command*</span>em branco.</span>



#### <span style="color:#d86c00">**check_interval**</span>

<span style="color:#696969">Esta diretiva é usada para definir o número de "unidades de tempo" entre verificações agendadas regularmente do serviço. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60, esse número significará minutos. Mais informações sobre esse valor podem ser encontradas na documentação de [agendamento de verificação](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/checkscheduling.html).</span>



#### <span style="color:#d86c00">**retry_interval**</span>

<span style="color:#696969">Esta diretiva é usada para definir o número de "unidades de tempo" a aguardar antes de agendar uma nova verificação dos serviços. Os serviços são reagendados no intervalo de novas tentativas quando mudam para um estado não UP. </span>

<span style="color:#696969">Depois que o serviço tiver sido verificado de novo pela quantidade de vezes estabelecidas pelo <span style="color:#00CED1">max_check_attempts</span> e nenhuma alteração tiver sido verificada, ele voltará a ser agendado na sua taxa "normal", conforme definido pelo valor <span style="color:#00CED1">check_interval</span>. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60, esse número significará minutos.</span>



#### <span style="color:#d86c00">**active_checks_enabled**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se as verificações ativas (agendadas regularmente ou sob demanda) deste serviço estão ativadas. </span>
<span style="color:#696969">Valores: </span><span style="color:#4682B4">0 = desativar verificações de serviço ativo</span>, <span style="color:#4682B4">1 = ativar verificações de serviço ativo</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**passive_checks_enabled**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se as verificações passivas estão ou não ativadas para este serviço. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativar verificações passivas de serviço</span>, <span style="color:#4682B4">1 = ativar verificações passivas de serviço</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**obsess_over_service | obsess**</span>

<span style="color:#696969">Essa diretiva determina se as verificações do serviço serão ou não "obcecadas" pelo uso do comando ochp_com. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**check_freshness**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se as verificações de atualizações dos resultados do serviço estão ativadas ou não. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**freshness_threshold**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o limite de atualização (em segundos) para este serviço. Se você definir esta diretiva como um valor 0, o Nagios determinará um limite de atualização a ser usado automaticamente.</span>



#### <span style="color:#d86c00">**event_handler**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o *nome abreviado* de um comando que deve ser executado sempre que uma alteração no estado do serviço for detectada (ou seja, sempre que for down ou recovers). </span>
<span style="color:#696969">Um uso para manipuladores de eventos é a capacidade do próprio Nagios Core de corrigir proativamente os problemas antes que alguém seja notificado.</span>



#### <span style="color:#d86c00">**event_handler_enabled**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se o manipulador de eventos para este serviço está ativado ou não. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**low_flap_threshold**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o limite de alteração de baixas de estado (flaps), quando o limite de flap cai para um valor menor do que <span style="color:#00CED1">low_flap_threshold</span>, considera-se que o flap parou.</span>



#### <span style="color:#d86c00">**high_flap_threshold**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o limite alto de alteração de estado (flaps), quando o limite de flap ultrapassa o valor de <span style="color:#00CED1">high_flap_threshold</span>, considera-se um inicio de flap.</span>



#### <span style="color:#d86c00">**flap_detection_enabled**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se a detecção de flap está ativada ou não para este serviço. Caso você defina  <span style="color:#00CED1">enable_flap_detection=1</span> no arquivo principal do Nagios, não será necessário definir novamente na sessão de Host/Service, a menos que você queira desativar essa opção para alguns Hosts/Serviços.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

 

#### <span style="color:#d86c00">**flap_detection_options**</span>

<span style="color:#696969">Podemos excluir certos estados de host/serviço no uso da lógica de detecção de flap, evitando receber flap de alguns estados, esta diretiva permite especificar quais estados de host/serviço (UP, DOWN, OK, CRITICAL) você pode desejar usar para a detecção de flap. Se você não usar esta diretiva, todos os estados de host ou serviço serão usados na detecção de flap. </span>
<span style="color:#696969">As opções válidas são uma combinação de um ou mais dos seguintes itens: </span>

<span style="color:#696969"><span style="color:#C0C0C0">**o**</span> = Ok</span>
<span style="color:#696969"><span style="color:#C0C0C0">**w**</span> = Warning</span>
<span style="color:#696969"><span style="color:#C0C0C0">**c**</span> = CRITICAL</span>
<span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = UNKNOWN</span>



#### <span style="color:#d86c00">**process_perf_data**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se o processamento de dados de desempenho está ou não ativado para este serviço. Isso é importante para fazermos levantamento de desempenho com integração ao MRTG por exemplo.</span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**ret_status_information**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se as informações relacionadas ao status do serviço são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a diretiva [reter_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**ret_nonstatus_information**</span>

<span style="color:#696969">Essa diretiva é usada para determinar se as informações que não são de status sobre o serviço são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a diretiva [reter_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**notification_interval**</span>

<span style="color:#696969">Esta diretiva é usada para definir quanto tempo Nagios deve aguardar antes de notificar novamente um contato que este *serviço*ainda está inativo ou inacessível. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60 (minutos). Se você definir esse valor como 0, o Nagios *não* notificará novamente os contatos sobre problemas desse serviço, apenas uma única notificação de problema será enviada.</span>



#### <span style="color:#d86c00">**first_notification_delay**</span>

<span style="color:#696969">Esta diretiva é usada para definir quanto tempo Nagios deve aguardar antes de enviar a primeira notificação de problema quando este serviço entra em um estado não UP. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60 (minutos). <span style="color:#FFFF00">Se você definir esse valor como 0, o Nagios começará a enviar notificações imediatamente.</span></span>



#### <span style="color:#d86c00">**notification_options**</span>

<span style="color:#696969">Esta diretiva é usada para determinar quando as notificações para o serviço devem ser enviadas. As opções válidas são uma combinação de um ou mais dos seguintes itens: </span>

- <span style="color:#C0C0C0">**d**</span> <span style="color:#696969">= enviar notificações em um estado DOWN;</span>
- <span style="color:#C0C0C0">**u**</span> <span style="color:#696969">= enviar notificações em um estado inacessível;</span>
- <span style="color:#C0C0C0">**r**</span> <span style="color:#696969">= enviar notificações em recuperações (estado OK);</span>
- <span style="color:#C0C0C0">**f**</span> <span style="color:#696969">= enviar notificações quando o serviço iniciar e parar flapar;</span>
- <span style="color:#C0C0C0">**s**</span> <span style="color:#696969">= notificações de envio quando [programados de inatividade](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/downtime.html) começa e termina. Se você especificar;</span>
- <span style="color:#C0C0C0">**n**</span> <span style="color:#696969">= nenhuma notificação de serviço será enviada. Se você não especificar nenhuma opção de notificação, o Nagios assumirá que você deseja que as notificações sejam enviadas para todos os estados possíveis.</span>



#### <span style="color:#d86c00">**Notifications_enabled**</span>

<span style="color:#696969">Esta diretiva é usada para determinar se as notificações para este serviço estão ativadas ou não. </span>
<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**notification_period**</span>

<span style="color:#696969">Esta diretiva é usada para especificar o nome abreviado do [período](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#timeperiod) durante o qual as notificações de eventos para este serviço podem ser enviadas aos contatos. Nenhuma notificação de serviço será enviada durante horários não cobertos pelo período.</span>



#### <span style="color:#d86c00">**stalking_options**</span>

<span style="color:#696969">Esta diretiva determina para quais estados "monitorando" o serviço o está ativado. As opções válidas são uma combinação de um ou mais dos seguintes itens:</span>

<span style="color:#696969"><span style="color:#C0C0C0">**o**</span> = Monitorar nos estados Ok.</span>
<span style="color:#696969"><span style="color:#C0C0C0">**w**</span> = Monitorar nos estados Warning.</span>
<span style="color:#696969"><span style="color:#C0C0C0">**c**</span> = Monitorar nos estados Critical.</span>
<span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = Monitorar nos estados Unknown.</span>

  


<span style="color:#8B008B">**Devo ativar o stalking?**</span>

<span style="color:#696969">Antes de tudo, você deve decidir se tem uma necessidade real de analisar dados de log arquivados para encontrar a causa exata de um problema. Você pode decidir que precisa desse recurso para alguns hosts ou serviços, mas dificilmente irá precisar para todos os hosts/serviços. </span>
<span style="color:#696969">Você também pode achar que só precisa ativar o "monitoramento" para alguns estados de host ou serviço, em vez de todos eles. Por exemplo, você pode optar por ativar o "monitoramento" para os estados WARNING e CRÍTICOS de um serviço, mas não para os estados OK e DESCONHECIDO.</span>



#### <span style="color:#d86c00">**notes**</span>

<span style="color:#696969">Esta diretiva é usada para definir uma descrição para o serviço. Se você especificar uma observação aqui, será exibida no CGI de informações estendidas (quando estiver visualizando informações sobre o serviço especificado).</span>

<span style="color:#696969">Exemplo colocado no `define service` do servidor do Nagios:</span>

​			<span style="color:#FFDAB9">notes                             Verifica a disponibilidade</span>



  <span style="color:#FFFF00">Segue imagem de como vai ficar a descrição aplicada ao serviço:</span>

[![a5s2fe2dfddf6df1ee8](https://github.com/BRVN01/NAGIOS/raw/master/IMG/a5s2fe2dfddf6df1ee8.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/a5s2fe2dfddf6df1ee8.png) 


#### <span style="color:#d86c00">**notes_url**</span>

<span style="color:#696969">Essa diretiva é usada para definir uma URL que pode ser usado para fornecer mais informações sobre o serviço.</span>

<span style="color:#696969">Exemplo colocado no `define service` do servidor do Nagios:</span>

​			<span style="color:#FFDAB9">notes_url                            https://www.google.com.br</span>



  <span style="color:#FFFF00">Segue imagem de como vai ficar o notes_url aplicada ao serviço:</span>



[![22824543328586](https://github.com/BRVN01/NAGIOS/raw/master/IMG/22824543328586.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/22824543328586.png) 





#### <span style="color:#d86c00">**action_url**</span>

<span style="color:#696969">Esta diretiva é usada para definir uma URL que pode ser usada para fornecer mais ações a serem executadas no serviço, o icone pode ser atribuido a informações de performance.</span>

<span style="color:#696969">Exemplo colocado no `define service` do servidor do Nagios:</span>

​			<span style="color:#FFDAB9">action_url                             https://www.google.com.br</span>



  <span style="color:#FFFF00">Segue imagem de como vai ficar o action_url aplicada ao serviço:</span>



[![69862363666474](https://github.com/BRVN01/NAGIOS/raw/master/IMG/69862363666474.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/69862363666474.png) 



#### <span style="color:#d86c00">**icon_image**</span>

<span style="color:#696969">Essa variável é usada para definir o nome de uma imagem GIF, PNG ou JPG que deve ser associada a este serviço. Esta imagem será exibida nos vários locais nos CGIs. A imagem ficará melhor se tiver 40x40 pixels de tamanho. </span>
<span style="color:#696969">O diretório padrão para as imagens é `/usr/local/nagios/share/images/logos`.</span>

<span style="color:#696969">Exemplo colocado no `define service` do servidor do Nagios:</span>

​			<span style="color:#FFDAB9">icon_image                             debian.png</span>



  <span style="color:#FFFF00">Segue imagem de como vai ficar o icon_image aplicada ao serviço:</span>



[![105946865472318](https://github.com/BRVN01/NAGIOS/raw/master/IMG/105946865472318.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/105946865472318.png) 



#### <span style="color:#d86c00">**icon_image_alt**</span>

<span style="color:#696969">Essa variável é usada para definir uma sequência opcional que é usada na tag ALT da imagem especificada pelo argumento <icon_image>, basicamente, adiciona um nome abaixo da imagem.</span>



<span style="color:#696969">Exemplo colocado no `define service` do servidor do Nagios:</span>

​			<span style="color:#FFDAB9">icon_image_alt                             debian.png</span>

<span style="color:#FFFF00">Segue imagem de como vai ficar o icon_image_alt aplicada ao serviço:</span>



[![a782162sd1s6f](https://github.com/BRVN01/NAGIOS/raw/master/IMG/a782162sd1s6f.png)](https://github.com/BRVN01/NAGIOS/blob/master/IMG/a782162sd1s6f.png)



## <span style="color:#d86c00">**Opções mais usadas**</span>

<span style="color:#696969">Abaixo segue as propriedades atribuídas para um serviço qualquer:</span>

```bash
define service {
# Nome do modelo que vamos importar algumas variáveis.
    use                          local-service

# Nome do Host que receberá esse serviço.
    host_name			         NOME

# Descrição do serviço, é o nome que vai ficar no campo service
# do Dashboard do Nagios.
    service_description          DESCRICAO

# Comando que será executado para validar esse serviço.
    check_command                check-host-alive # ping.

# Intervalo entre as verificações OK e não OK,
# mesmo após ter passado da quantidade de 'max_check_attempts',
# tudo em minutos (vai verificar de 1 em 1 minuto).
    check_interval               1

# Tempo que o Nagios vai aguardar para agendar uma 
# nova verificação, em minutos, isso só ocorre quando
# o serviço não está OK.
    retry_interval               1

# Tentativas para determinar o estado HARD, se todas tentativas falharem,
# ele considera o serviço como não OK
    max_check_attempts           5

# Nome do período em que as verificações ativas serão feitas.
# Serão verificados a todo momento (24 horas por 7 dias na semana).
    check_period                 24x7

# Grupo de contatos que vão receber a notificação de problemas ou
# de recuperação desse serviço.
    contact_groups               nagiosadmin # Grupo de contatos.

# Tipos de notificações que serão enviadas 
# sendo elas: DOWN, UNKNOWN e Recover).
    notification_options         d,u,r

# Intervalo entre notificações de problemas, a cada X minutos 
# ele vai notificar novamente, caso o problema permaneça.
    notification_interval        30

# Período para efetuar as notificações.
# Vai notificar 24 horas em 7 dias da semana.
    notification_period          24x7

# Habilitar a notificação para este serviço.
    notifications_enabled        1

# Habilitar Manipuladores de Eventos.
    event_handler_enabled	     1

# Habilitar a detecção por flap, se o serviço passar a ficar muito
# instável, ele entra num estado de flap, isso vai impedir que
# os contatos fiquem sendo notificados de estados OK para não OK,
# até que o problema seja corrigido.
    flap_detection_enabled       1

# Habilitar o processamento de dados de desempenho.
    process_perf_data            1
}
```



## <span style="color:#d86c00">**Opções necessárias**</span>

<span style="color:#696969">Abaixo segue as propriedades necessárias para criação de um objeto do tipo Service:</span>

```shell
define service {
# Nome do Host que receberá esse serviço.
    host_name                     NOME

# Tentativas para determinar o estado HARD, se todas tentativas falharem,
# ele considera o serviço como não OK.
    max_check_attempts            5

# Nome do período em que as verificações ativas serão feitas.
# Serão verificados a todo momento (24 horas por 7 dias na semana).
    check_period                  24x7

# Nome dos contatos que vão receber a notificação de problemas ou
# de recuperação desse serviço.
    contacts			          nagiosadmin

# Grupo de contatos que vão receber a notificação de problemas ou
# de recuperação desse serviço.
    contact_groups                nagiosadmin

# Intervalo entre notificações de problemas, a cada X minutos 
# ele vai notificar novamente, caso o problema permaneça.
    notification_interval         30

# Período para efetuar as notificações.
    notification_period           24x7
}
```



