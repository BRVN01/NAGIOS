<span style="color:#d86c00">**Sumário**</span>

[TOC]

# <span style="color:#d86c00">**Introdução**</span>

<span style="color:#696969">Para que as pessoas possam ser notificadas quando algum evento acontece, precisamos definir os contatos, os contatos nada mais são do que as pessoas ou grupo de pessoas que serão notificados quando o serviço/host atingir alguns estados.</span>



<span style="color:#696969">Abaixo encontra-se cada uma das variáveis que podemos utilizar:</span>



#### <span style="color:#d86c00">**contact_name**</span>

<span style="color:#696969">É o nome do nosso objeto, exemplo: ADM (para contatar o setor administrativo), Suporte (para contatar o setor de suporte), dentre outro nome qualquer (Obs.: Esse nome não pode estar em uso num primeiro momento.)</span>



#### <span style="color:#d86c00">**alias**</span>

<span style="color:#696969">É um apelido para nosso objeto.</span>



#### <span style="color:#d86c00">**contactgroups**</span>

<span style="color:#696969">Esta variável é usada para identificar o nome do(s) grupo(s) de contato aos quais o contato pertence.</span>



#### <span style="color:#d86c00">**minimum_importance**</span>

<span style="color:#696969">Essa variável é usada para definir o valor da importância mínima do host ou serviço, se o valor de importância do host mais os valores de importância de todos os serviços do host forem maiores ou iguais à importância mínima do contato, o contato será notificado.</span>

<span style="color:#696969">No Nagios Core 4.0.0 a 4.0.3 esta variável era conhecido como *minimum_value* mas foi substituído por *minimum_importance*.</span>



#### <span style="color:#d86c00">**host_notifications_enabled**</span>

<span style="color:#696969">Essa variável é usada para determinar se o contato receberá ou não notificações de problemas e recuperações do host.</span>

<span style="color:#696969">Valores: </span><span style="color:#4682B4">0 = não envia notificações</span>, <span style="color:#4682B4">1 = envia notificações</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**service_notifications_enabled**</span>

<span style="color:#696969">Esta variável é usada para determinar se o contato receberá ou não notificações sobre problemas e recuperações de serviço. </span>

<span style="color:#696969">Valores: </span><span style="color:#4682B4">0 = não envia notificações</span>, <span style="color:#4682B4">1 = envia notificações</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**host_notification_period**</span>

<span style="color:#696969">Esta variável é usada para especificar o nome do [período](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#timeperiod) durante o qual o contato pode ser notificado sobre problemas ou recuperações do host. Você pode pensar nisso como um horário "de plantão" para notificações de host do contato.</span>



#### <span style="color:#d86c00">**service_notification_period**</span>

<span style="color:#696969">Esta variável é usada para especificar o nome abreviado do [período](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#timeperiod) durante o qual o contato pode ser notificado sobre problemas ou recuperações de serviço. Você pode pensar nisso como um horário "de plantão" para notificações de serviço do contato.</span>



#### <span style="color:#d86c00">**host_notification_options**</span>

<span style="color:#696969">Esta variável é usada para definir os estados do host para os quais as notificações podem ser enviadas para esse contato. As opções válidas são uma combinação de um ou mais dos seguintes itens: </span>

- <span style="color:#696969"><span style="color:#C0C0C0">**d**</span> = Enviar notificações nos estados do host DOWN;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = Enviar notificações nos estados do host UNREACHABLE;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**r**</span> = Enviar notificações nas recuperações do host (estado UP);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**f**</span> = Enviar notificações quando o host inicia e para de flapar;</span>
- <span style="color:#C0C0C0">**s**</span> <span style="color:#696969">= Enviar notificações de envio quando temos um [tempo de inatividade programado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/downtime.html), enviando notificações assim que começar e terminar o período. Se você especificar;</span>

- <span style="color:#C0C0C0">**n**</span> <span style="color:#696969">= Nenhuma notificação do host será enviada.
  </span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">[d,u,r,f,s].</span>



#### <span style="color:#d86c00">**service_notification_options**</span>

<span style="color:#696969">Esta variável é usada para definir os estados de serviço para os quais as notificações podem ser enviadas para esse contato. As opções válidas são uma combinação de um ou mais dos seguintes itens: </span>

- <span style="color:#696969"><span style="color:#C0C0C0">**w**</span> = Enviar notificações sobre estados de serviço WARNING;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**u**</span> = Enviar notificações sobre estados DESCONHECIDOS;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**c**</span> = Enviar notificações sobre estados CRÍTICOS;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**r**</span> = Enviar notificações sobre recuperações de serviços (estados OK);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**f**</span> = Enviar notificações quando o host inicia e para de flapar;</span>
- <span style="color:#C0C0C0">**s**</span> <span style="color:#696969">= Enviar notificações de envio quando temos um [tempo de inatividade programado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/downtime.html), enviando notificações assim que começar e terminar o período. Se você especificar;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**n**</span> = Nenhuma notificação do host será enviada.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">[w,u,c,r,f,s].</span>



#### <span style="color:#d86c00">**host_notification_commands**</span>

<span style="color:#696969">Esta variável é usada para definir uma lista dos nomes dos [comandos](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#command) usados para notificar o contato de um problema ou recuperação do host. Vários comandos de notificação devem ser separados por vírgulas. Todos os comandos de notificação são executados quando o contato precisa ser notificado. A quantidade máxima de tempo que um comando de notificação pode executar é controlada pela opção [notification_timeout](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#notification_timeout).</span>



#### <span style="color:#d86c00">**service_notification_commands**</span>

<span style="color:#696969">Esta variável é usada para definir uma lista dos nomes dos [comandos](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#command) usados para notificar o contato de um problema ou recuperação de serviços. Vários comandos de notificação devem ser separados por vírgulas. Todos os comandos de notificação são executados quando o contato precisa ser notificado. A quantidade máxima de tempo que um comando de notificação pode executar é controlada pela opção [notification_timeout](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#notification_timeout).</span>



#### <span style="color:#d86c00">**email**</span>

<span style="color:#696969">Esta diretiva é usada para definir um endereço de email para o contato. Dependendo de como você configura seus comandos de notificação, ele pode ser usado para enviar um email de alerta ao contato. Nas circunstâncias corretas, a [macro](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/macros.html) <span style="color:#00CED1">$CONTACTEMAIL$</span> conterá esse valor.</span>



#### <span style="color:#d86c00">**addressx**</span>

<span style="color:#696969">Diretivas de endereço são usadas para definir "endereços" adicionais para o contato. Esses endereços podem ser qualquer coisa - números de telefone celular, endereços de mensagens instantâneas, etc. Dependendo de como você configura seus comandos de notificação, eles podem ser usados para enviar um alerta ao contato. Até seis endereços podem ser definidos usando estas directivas (Address1 até address6). </span>
<span style="color:#696969">A [macro](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/macros.html) <span style="color:#00CED1">$CONTACTADDRESSx$</span> conterá esse(s) valor(es).</span>



#### <span style="color:#d86c00">**can_submit_commands**</span>

<span style="color:#696969">Essa diretiva é usada para determinar se o contato pode ou não enviar [comandos externos](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/extcommands.html) para o Nagios a partir das CGIs.</span>

<span style="color:#696969">Valores: </span><span style="color:#4682B4">0 = não permite que o contato envie comandos</span>, <span style="color:#4682B4">1 = permite que o contato envie comandos</span> (<span style="color:#FFDAB9">**padrão**</span>).



#### <span style="color:#d86c00">**retain_status_information**</span>

<span style="color:#696969">Esta opção é usada para determinar se as informações relacionadas ao status do host são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a opção [retain_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). </span>

<span style="color:#696969">Essas informações são salvas no arquivo que fica especificado na opção <span style="color:#00CED1">state_retention_file</span> no arquivo principal do Nagios, aqui nós teremos informações como: status, tempo de inatividade e comentários antes de serem encerradas. Quando o Nagios é reiniciado, ele usa as informações armazenadas neste arquivo para definir os estados iniciais de serviços e hosts antes de começar a monitorar qualquer coisa.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



#### <span style="color:#d86c00">**retain_nonstatus_information**</span>

<span style="color:#696969">Essa opção é usada para determinar se as informações que não são de status sobre o host são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a opção [reter_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). </span>

<span style="color:#696969">Essas informações são salvas no arquivo que fica especificado na opção <span style="color:#00CED1">state_retention_file</span> no arquivo principal do Nagios, aqui nós teremos informações como: status, tempo de inatividade e comentários antes de serem encerradas. Quando o Nagios é reiniciado, ele usa as informações armazenadas neste arquivo para definir os estados iniciais de serviços e hosts antes de começar a monitorar qualquer coisa.</span>

<span style="color:#696969">Valores:</span> <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.



## <span style="color:#d86c00">**Opções mais usadas**</span>

<span style="color:#696969">Abaixo segue as propriedades atribuídas para um contato qualquer:</span>

```bash
define contact {

# Nome do contato
    contact_name                    ADM

# Apelido
    alias							Equipe Admin

# Habilitar notificações de host
    host_notifications_enabled      1

# Habilitar notificações de serviço
    service_notifications_enabled   1

# Nome do Período de notificação para serviços
    service_notification_period     24x7

# Nome do Período de notificação para host
    host_notification_period        24x7

# Estados do serviço que será notificado
    service_notification_options    w,u,c,r,f

# Estados do host que será notificado
    host_notification_options       d,u,r,f,s

# E-mail que será usado para enviar a notificação
    email                           jdoe@localhost.localdomain

# Comando que será usado para notificar (para serviços)
    service_notification_commands   notify-service-by-email

# Comando que será usado para notificar (para hosts)
    host_notification_commands      notify-host-by-email

# Não habilitar comandos externos para o contato
    can_submit_commands             1

# Vamos registrar, para contatos válidos é uma boa prática.
    register                     	0
}
```



## <span style="color:#d86c00">**Opções necessárias**</span>

<span style="color:#696969">Abaixo segue as propriedades necessárias para criação de um objeto do tipo Contact funcional e não apenas um modelo:</span>

```shell
define contact {

# Nome do contato
    contact_name                    NAME

# Habilitar notificações de host
    host_notifications_enabled      1

# Habilitar notificações de serviço
    service_notifications_enabled   1

# Nome do Período de notificação para serviços
    service_notification_period     24x7

# Nome do Período de notificação para host
    host_notification_period        24x7

# Estados do serviço que será notificado
    service_notification_options    w,u,c,r,f

# Estados do host que será notificado
    host_notification_options       d,u,r,f,s

# Comando que será usado para notificar (para serviços)
    service_notification_commands   COMMAND

# Comando que será usado para notificar (para hosts)
    host_notification_commands      COMMAND
}
```



