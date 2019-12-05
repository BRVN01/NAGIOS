- **display_name** - Se não especificado, o padrão será o valor especificado para a diretiva *host_name*. Os CGIs atuais não usam essa opção, embora versões futuras da interface da web os usem (funciona melhor no Icinga).

  

- **importance** - A importância é usada para determinar se as notificações devem ser enviadas para um contato, se o valor de importância do host mais os valores de importância de todos os serviços do host forem maiores ou iguais à importância mínima do contato, o contato será notificado. 

  Por exemplo, você pode definir esse valor e a importância mínima dos contatos para que um administrador do sistema seja notificado quando um servidor de desenvolvimento for desativado, mas o CIO será notificado apenas quando o servidor de banco de dados de comércio eletrônico de produção da empresa estiver inativo.

  

- **parents** - Podemos colocar mais de um pai para um host, bastando apenas separar por vírgula.

  

- **initial_state** -  Por padrão, o Nagios assume que todos os hosts estão *UP* quando iniciados. Você pode substituir o estado inicial de um host usando esta diretiva. As opções válidas são: **o** = UP, **d** = DOWN e **u** = INACESSÍVEL.

  

- **max_check_attempts** - Esta diretiva é usada para definir o número de vezes que o Nagios tentará novamente o comando de verificação do host se retornar qualquer estado diferente de OK. Definir esse valor como 1 fará com que o Nagios gere um alerta sem tentar novamente a verificação do host. Nota: Se você não deseja verificar o status do host, ainda deve configurá-lo com um valor mínimo de 1. Para ignorar a verificação do host, deixe a opção *check_command em* branco.

  

- **check_interval** -  Esta diretiva é usada para definir o número de "unidades de tempo" entre verificações agendadas regularmente do host. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60, esse número significará minutos. Mais informações sobre esse valor podem ser encontradas na documentação de [agendamento de verificação](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/checkscheduling.html).

  

- **retry_interval** -  Esta diretiva é usada para definir o número de "unidades de tempo" a aguardar antes de agendar uma nova verificação dos hosts. Os hosts são reagendados no intervalo de novas tentativas quando mudam para um estado não UP. 

  Depois que o host tiver sido verificado de novo pela quantidade de vezes estabelecidas pelo <span style="color:#2E8B57">max_check_attempts</span> e nenhuma alteração tiver sido verificada, ele voltará a ser agendado na sua taxa "normal", conforme definido pelo valor <span style="color:#2E8B57">check_interval</span>. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60, esse número significará minutos.

  

- **active_checks_enabled** - Esta diretiva é usada para determinar se as verificações ativas (agendadas regularmente ou sob demanda) deste host estão ativadas. 
  Valores: <span style="color:#4682B4">0 = desativar verificações de host ativo</span>, <span style="color:#4682B4">1 = ativar verificações de host ativo</span> (<span style="color:red">**padrão**</span>).

  

- **passive_checks_enabled** - Esta diretiva é usada para determinar se as verificações passivas estão ou não ativadas para este host. 
  Valores: <span style="color:#4682B4">0 = desativar verificações passivas de host</span>, <span style="color:#4682B4">1 = ativar verificações passivas de host</span> (<span style="color:red">**padrão**</span>).

  

- **obsess_over_host | obsess** - Essa diretiva determina se as verificações do host serão ou não "obcecadas" pelo uso do comando ochp_com. 
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:red">**padrão**</span>).

  

- **check_freshness** -  Esta diretiva é usada para determinar se as verificações de atualizações dos resultados do host estão ativadas ou não. 
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:red">**padrão**</span>).

  

- **freshness_threshold** - Esta diretiva é usada para especificar o limite de atualização (em segundos) para este host. Se você definir esta diretiva como um valor 0, o Nagios determinará um limite de atualização a ser usado automaticamente.

  ​	

- **event_handler** -  Esta diretiva é usada para especificar o *nome abreviado* de um comando que deve ser executado sempre que uma alteração no estado do host for detectada (ou seja, sempre que for down ou recovers). 
  Um uso para manipuladores de eventos é a capacidade do próprio Nagios Core de corrigir proativamente os problemas antes que alguém seja notificado.

  

- **event_handler_enabled** - Esta diretiva é usada para determinar se o manipulador de eventos para este host está ativado ou não. 
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span> (<span style="color:red">**padrão**</span>).

  

- **low_flap_threshold** - Esta diretiva é usada para especificar o limite de alteração de baixas de estado (flaps), quando o limite de flap cai para um valor menor do que <span style="color:#2E8B57">low_flap_threshold</span>, considera-se que o flap parou.

  

- **high_flap_threshold** - Esta diretiva é usada para especificar o limite alto de alteração de estado (flaps), quando o limite de flap ultrapassa o valor de <span style="color:#2E8B57">high_flap_threshold</span>, considera-se um inicio de flap.

  

- **flap_detection_enabled** - Esta diretiva é usada para determinar se a detecção de flap está ativada ou não para este host. Caso você defina  <span style="color:#2E8B57">enable_flap_detection=1</span> no arquivo principal do Nagios, não será necessário definir novamente na sessão de Host/Service, a menos que você queira desativar essa opção para alguns Hosts/Serviços.
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

   

- **flap_detection_options** - Podemos excluir certos estados de host/serviço no uso da lógica de detecção de flap, esta diretiva permite especificar quais estados de host/serviço (UP, DOWN, OK, CRITICAL) você pode desejar usar para a detecção de flap. Se você não usar esta diretiva, todos os estados de host ou serviço serão usados na detecção de flap. 
  As opções válidas são uma combinação de um ou mais dos seguintes itens: **o** = UP, **d** = DOWN, **u** = UNREACHABLE.

  

- **process_perf_data** - Esta diretiva é usada para determinar se o processamento de dados de desempenho está ou não ativado para este host. Isso é importante para fazermos levantamento de desempenho com integração ao MRTG por exemplo.
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

  

- **ret_status_information** - Esta diretiva é usada para determinar se as informações relacionadas ao status do host são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a diretiva [reter_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). 
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

  

- **ret_nonstatus_information** - Essa diretiva é usada para determinar se as informações que não são de status sobre o host são mantidas ou não durante a reinicialização do programa. Isso é útil apenas se você tiver ativado a retenção de estado usando a diretiva [reter_state_information](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information). 
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

  

- **notification_interval** - Esta diretiva é usada para definir quanto tempo Nagios deve aguardar antes de notificar novamente um contato que este host *ainda* está inativo ou inacessível. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60 (minutos). Se você definir esse valor como 0, o Nagios *não* notificará novamente os contatos sobre problemas desse host, apenas uma única notificação de problema será enviada.

  

- **first_notification_delay** - Esta diretiva é usada para definir quanto tempo Nagios deve aguardar antes de enviar a primeira notificação de problema quando este host entra em um estado não UP. A menos que você tenha alterado a diretiva [interval_length](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#interval_length) do valor padrão de 60 (minutos). <span style="color:red">Se você definir esse valor como 0, o Nagios começará a enviar notificações imediatamente.</span>

  

- **notification_options** - Esta diretiva é usada para determinar quando as notificações para o host devem ser enviadas. As opções válidas são uma combinação de um ou mais dos seguintes itens: 

  - **d** = enviar notificações em um estado DOWN;
  - **u** = enviar notificações em um estado inacessível;
  - **r** = enviar notificações em recuperações (estado OK);
  - **f** = enviar notificações quando o host iniciar e parar flapar;
  - **s** = notificações de envio quando [programados de inatividade](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/downtime.html) começa e termina. Se você especificar;
  - **n** = nenhuma notificação de host será enviada. Se você não especificar nenhuma opção de notificação, o Nagios assumirá que você deseja que as notificações sejam enviadas para todos os estados possíveis.

  

- **Notifications_enabled** - Esta diretiva é usada para determinar se as notificações para este host estão ativadas ou não. 
  Valores: <span style="color:#4682B4">0 = desativado</span>, <span style="color:#4682B4">1 = ativado</span>.

  

- **stalking_options** - Esta diretiva determina para quais estados "monitorando" o host o está ativado. As opções válidas são uma combinação de um ou mais dos seguintes itens:

  - **o** = monitorar nos estados UP;

  - **d** = monitorar nos estados DOWN;

  - **u** = monitorar nos estados UNREACHABLE. 

    
    <span style="color:#d86c00">**Devo ativar o stalking?**</span>

    Antes de tudo, você deve decidir se tem uma necessidade real de analisar dados de log arquivados para encontrar a causa exata de um problema. Você pode decidir que precisa desse recurso para alguns hosts ou serviços, mas dificilmente irá precisar para todos os hosts/serviços. 
    Você também pode achar que só precisa ativar o "monitoramento" para alguns estados de host ou serviço, em vez de todos eles. Por exemplo, você pode optar por ativar o "monitoramento" para os estados WARNING e CRÍTICOS de um serviço, mas não para os estados OK e DESCONHECIDO.