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





#### <span style="color:#d86c00">**minimum_importance**</span>





#### <span style="color:#d86c00">**host_notifications_enabled**</span>





#### <span style="color:#d86c00">**service_notifications_enabled**</span>





#### <span style="color:#d86c00">**host_notification_period**</span>





#### <span style="color:#d86c00">**service_notification_period**</span>





#### <span style="color:#d86c00">**host_notification_options**</span>





#### <span style="color:#d86c00">**service_notification_options**</span>





#### <span style="color:#d86c00">**host_notification_commands**</span>





#### <span style="color:#d86c00">**service_notification_commands**</span>





#### <span style="color:#d86c00">**email**</span>





#### <span style="color:#d86c00">**addressx**</span>





#### <span style="color:#d86c00">**can_submit_commands**</span>





#### <span style="color:#d86c00">**retain_status_information**</span>





#### <span style="color:#d86c00">**retain_nonstatus_information**</span>





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

# Não queremos registar como um "modelo":
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



