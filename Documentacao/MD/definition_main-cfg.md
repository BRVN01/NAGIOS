<span style="color:#d86c00">**Sumário**</span>

[TOC]

<span style="color:#FFFF00">**Para as outras explicações de cada configuração, vou deixar um link  do conteúdo oficial para que você possa verificar cada opção existente a ser utilizada no arquivo de configuração principal, acesse  [neste link](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html).**</span>



#### <span style="color:#d86c00">**LOG_FILE **</span>

<span style="color:#696969">Especifica onde o Nagios deve criar seu arquivo de log principal. Essa deve ser a primeira variável que você define no seu arquivo de configuração, pois o Nagios tentará gravar neste arquivo os erros que encontrar nos demais dados de configuração.</span>



#### <span style="color:#d86c00">**LOG_ROTATION_METHOD **</span>
<span style="color:#696969">É de quanto em quanto tempo o arquivo de log será sobrescrito, as opções são:</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**n**</span> = Nenhum (não sobrescreva o log, esse é o padrão);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**h**</span> = De hora em hora (sobrescreva o registro na parte superior de cada hora);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**d**</span> = Diariamente (sobrescreva o registro à meia-noite, todos os dias) (<span style="color:#FFDAB9">padrão</span>);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**w**</span> = Semanal (sobrescreva o registro à meia-noite de sábado);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**m**</span> = mensalmente (sobrescreva o log à meia-noite no último dia do mês).</span>



#### <span style="color:#d86c00">**LOG_ARCHIVE_PATH **</span>

<span style="color:#696969">Diretório onde ficará os logs que foram rotacionados.</span>



#### <span style="color:#d86c00">**USE_SYSLOG**</span>
<span style="color:#696969">Determina se as mensagem vão ser registradas no SysLog, as opções são:</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não use o recurso syslog;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Usar recurso syslog (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_NOTIFICATIONS**</span>

<span style="color:#696969">Informa se as mensagens de notificação serão registradas.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não registrar notificações de log;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Registrar notificações de log (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_SERVICE_RETRIES**</span>

<span style="color:#696969">Informa se as verificações 'SOFTS' serão registradas para os serviços.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não registrar tentativas de verificação de serviço;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Registrar tentativas de verificação de serviço (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_HOST_RETRIES**</span>

<span style="color:#696969">Informa se as verificações 'SOFTS' serão registradas para os hosts.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não registrar tentativas de verificação de host;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Registrar tentativas de verificação de host (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_EVENT_HANDLERS**</span>

<span style="color:#696969">Determina se os manipuladores de eventos de serviço e host serão ou não registrados. Manipuladores de eventos são comandos opcionais que podem ser executados sempre que um serviço ou host muda de estado.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não registra manipuladores de eventos;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Registrar manipuladores de eventos (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_CURRENT_STATES**</span>

<span style="color:#696969">Faz com que o Nagios grave o estado atual dos dispositivos gerenciados após sobrescrever um arquivo de log.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Desativar o estado atual do log após sobrescrever o log;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Ativar o estado atual do log após a  sobrescrever o log (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_EXTERNAL_COMMANDS**</span>

<span style="color:#696969">Registra ou não comandos externos (através da CGI).</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não registrar comandos externos;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Registrar comandos externos (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**LOG_PASSIVE_CHECKS**</span>

<span style="color:#696969">Após aplicar um comando externo, o check passivo irá registrar em log essa ação, só que, o Nagios não pode verificar checks passivos, isso porque esses checks são feitos por outros NMSs, o Nagios apenas recebe uma informação do estado do check, portanto, não é interessante usar essa opção de registro, isso só encheria mais nosso arquivo de log sem necessidade.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não registra verificações passivas (<span style="color:red">interessante</span>);</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Registra verificações passivas (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**CFG_FILE**</span>

<span style="color:#696969">É usada para especificar um arquivo de configuração de objeto, contendo definições de objetos que o Nagios deve usar para monitorar. Os arquivos de configuração de objeto contêm definições para hosts, grupos de hosts, contatos, grupos de contatos, serviços, comandos etc.</span>



#### <span style="color:#d86c00">**OBJECT_CACHE_FILE**</span>
<span style="color:#696969">Especifica um arquivo no qual uma cópia em cache das definições de objetos deve ser armazenada. O arquivo de cache é recriado toda vez que o Nagios é reiniciado/iniciado e é usado pelos CGIs. </span>

<span style="color:#696969">O objetivo é acelerar o cache do arquivo de configuração nos CGIs e permitir que você edite os arquivos de configuração do objeto de origem enquanto o Nagios estiver em execução sem afetar a saída exibida nos CGIs. </span>

<span style="color:#696969">No Nagios Core 4, configurar o caminho do arquivo object_cache_file como '/dev/null' fará com que o Nagios Core não armazene em cache as informações do objeto. Isso pode ser feito para acelerar as operações, mas não deve ser feito se os CGIs forem usados.</span>



#### <span style="color:#d86c00">**PRECACHED_OBJECT_FILE**</span>
<span style="color:#696969">Especifica um arquivo no qual uma cópia pré processada e pré armazenada em cache das definições de objetos deve ser armazenada. Este arquivo pode ser usado para melhorar drasticamente os tempos de inicialização em instalações Nagios grandes/complexas.</span>



#### <span style="color:#d86c00">**RESOURCE_FILE**</span>
<span style="color:#696969">É usado para especificar um arquivo de recurso opcional, que pode conter variáveis que serão reconhecidas apenas pelo Nagios ($USERn$). </span>

<span style="color:#696969">As variáveis '$USERn' são úteis para armazenar nomes de usuário, senhas e itens comumente usados em definições de comando (como caminhos de diretório). </span>

<span style="color:#696969">Os CGIs não tentam ler os arquivos de recursos, portanto, você pode definir permissões restritivas (600 ou 660) para proteger informações confidenciais.</span>



#### <span style="color:#d86c00">**STATUS_FILE**</span>
<span style="color:#696969">É o arquivo que o Nagios usa para armazenar as informações atuais de status, comentários e tempo de inatividade. Esse arquivo é usado pelos CGIs para que o status atual do monitoramento possa ser relatado por meio de uma interface da web. </span>

<span style="color:#696969">Os CGIs devem ter acesso de leitura a esse arquivo para funcionar corretamente. Este arquivo é excluído toda vez que o Nagios para e é recriado quando é iniciado. </span>

<span style="color:#696969">No Nagios Core 4, definir o caminho do status_flie como '/dev/null' fará com que o Nagios Core não armazene informações de status. Isso pode ser feito para acelerar as operações, mas não deve ser feito se os CGIs forem usados.</span>



#### <span style="color:#d86c00">**NAGIOS USER e GROUP**</span>
<span style="color:#696969">Especifica o usuário e grupo que o Nagios vai utilizar após ser inicializado.</span>



#### <span style="color:#d86c00">**TEMP_FILE**</span>
<span style="color:#696969">Arquivo temporário que o Nagios cria periodicamente para usar na atualização de dados de comentários, status, etc. O arquivo é excluído quando não é mais necessário.</span>



#### <span style="color:#d86c00">**TEMP_PATH**</span>
<span style="color:#696969">É um diretório que o Nagios pode usar como espaço temporário para criar arquivos temporários usados durante o processo de monitoramento.</span>



#### <span style="color:#d86c00">**SERVICE_INTER_CHECK_DELAY_METHOD / HOST_INTER_CHECK_DELAY_METHOD**</span>
<span style="color:#696969">Quando o Nagios é reiniciado, ele tenta agendar a verificações iniciais de todos os objetos, de uma maneira que minimize a carga imposta aos hosts locais e remotos. Isso é feito espaçando as verificações iniciais e intercalando-as. O espaçamento das verificações (também conhecido como atraso entre verificações) é usado para minimizar/equalizar a carga no host local (servidor do Nagios) e a intercalação é usada para minimizar/equalizar a carga imposta aos hosts remotos. </span>

<span style="color:#696969">s = Use um cálculo de atraso "inteligente" para espalhar as verificações de serviço uniformemente (padrão).</span>



#### <span style="color:#d86c00">**MAX_SERVICE_CHECK_SPREAD**</span>
<span style="color:#696969">Assim que o Nagios for iniciado, ele tem um certo tempo para garantir que as verificações iniciais de todos os serviços ocorram dentro do prazo especificado, como é somente após a inicialização do Nagios, você tem que medir o tempo baseando no total de serviços ativos.</span>



#### <span style="color:#d86c00">**SERVICE_INTERLEAVE_FACTOR**</span>
<span style="color:#696969">Essa variável determina como as verificações de serviço são intercaladas. A intercalação permite uma distribuição mais uniforme das verificações de serviço, carga reduzida em hosts remotos e detecção geral mais rápida de problemas do host. Definir esse valor como 1 é equivalente a não intercalar as verificações de serviço. Defina esse valor como s (inteligente) para o cálculo automático do fator de intercalação, a menos que você tenha um motivo específico para alterá-lo. A melhor maneira de entender como a intercalação funciona é observar o status CGI (visão detalhada) quando o Nagios está apenas começando. Você deve ver que os resultados da verificação de serviço são espalhados quando começam a aparecer.</span>



#### <span style="color:#d86c00">**MAX_CONCURRENT_CHECKS**</span>
<span style="color:#696969">Esta opção permite especificar o número máximo de verificações de serviço que podem ser executadas em paralelo a qualquer momento. A especificação de um valor 0 (padrão) não impõe restrições ao número de verificações simultâneas. Você precisará modificar esse valor com base nos recursos do sistema disponíveis na máquina que executa o Nagios, pois afeta diretamente a carga máxima que será imposta ao sistema (utilização do processador, memória, etc.).</span>



#### <span style="color:#d86c00">**CHECK_RESULT_REAPER_FREQUENCY**</span>
<span style="color:#696969">Determina com que frequência o Nagios deve verificar se há resultados de verificação de host e serviço que precisam ser processados. A quantidade máxima de tempo que ele pode gastar processando esses resultados é determinada pelo tempo máximo da ceifeira (veja abaixo). Se a frequência da sua ceifeira for muito alta (pouco frequente), você poderá ver altas latências nas verificações de host e serviço.</span>



#### <span style="color:#d86c00">**MAX_CHECK_RESULT_REAPER_TIME**</span>
<span style="color:#696969">Determinam a quantidade máxima de tempo que o daemon Nagios pode gastar processando os resultados das verificações de host e serviço antes de passar para outras coisas - como executar novas verificações de host e serviço. Um valor muito alto pode resultar em grandes latências para as verificações de host e serviço. Um valor muito baixo pode ter o mesmo efeito. Se você estiver enfrentando altas latências, ajuste essa variável e veja qual efeito ela tem.</span>



#### <span style="color:#d86c00">**CHECK_RESULT_PATH**</span>
<span style="color:#696969">Esta opção determina qual diretório o Nagios usará para armazenar temporariamente os resultados da verificação de host e serviço antes de serem processados. Este diretório não deve ser usado para armazenar outros arquivos, pois o Nagios limpará periodicamente esse diretório do arquivo antigo.</span>



#### <span style="color:#d86c00">**MAX_CHECK_RESULT_FILE_AGE**</span>
<span style="color:#696969">Esta opção determina a quanto tempo no máximo (em segundos), que o Nagios considerará válidos os arquivos de resultado da verificação encontrados no diretório `check_result_path`.</span>



#### <span style="color:#d86c00">**CACHED_HOST_CHECK_HORIZON/CACHED_SERVICE_CHECK_HORIZON**</span>
<span style="color:#696969">Esta opção determina a quantidade máxima de tempo (em segundos) em que o estado de uma verificação anterior do host/serviço é considerado atual. </span>

<span style="color:#696969">Os estados do host/serviço em cache (das verificações do host/serviço que foram executadas mais recentemente do que o tempo especificado por esse valor) podem melhorar imensamente o desempenho da verificação do host/serviço. Um valor muito alto para esta opção pode resultar em estados de host/serviço (temporariamente) imprecisos, enquanto um valor muito baixo pode resultar em um impacto no desempenho das verificações de host/serviço. Use um valor 0 se desejar desativar o cache de verificação do host/serviço.</span>



#### <span style="color:#d86c00">**ENABLE_PREDICTIVE_HOST/SERVICE_DEPENDENCY_CHECKS**</span>
<span style="color:#696969">Esta opção determina se o Nagios executará ou não verificações preditivas de hosts dos quais dependem (conforme definido nas [dependências do host](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/objectdefinitions.html#hostdependency)) para um host específico quando ele mudar de estado. As verificações preditivas ajudam a garantir que a lógica da dependência seja a mais precisa possível.</span>



#### <span style="color:#d86c00">**AUTO_RESCHEDULE_CHECKS**</span>
<span style="color:#696969">Esta opção determina se o Nagios tentará reagendar automaticamente as verificações de host e serviço ativas para "suavizá-las" ao longo do tempo. Isso pode ajudar a equilibrar a carga no servidor de monitoramento, pois ele tentará manter o tempo entre verificações consecutivas consistentes, às custas da execução de verificações em um planejamento mais rígido.</span>



#### <span style="color:#d86c00">**AUTO_RESCHEDULING_INTERVAL**</span>
<span style="color:#696969">Esta opção determina com que frequência (em segundos) o Nagios tentará reagendar automaticamente as verificações. Esta opção terá efeito apenas se a opção [auto_reschedule_checks](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#auto_reschedule_checks) estiver ativada. O padrão é 30 segundos.</span>



#### <span style="color:#d86c00">**AUTO_RESCHEDULING_WINDOW**</span>
<span style="color:#696969">Esta opção determina a "janela" de tempo (em segundos) que o Nagios observará ao reagendar automaticamente as verificações. Somente as verificações de host e serviço que ocorrem nos próximos X segundos (determinadas por esta variável) serão reagendadas. Esta opção terá efeito apenas se a opção [auto_reschedule_checks](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#auto_reschedule_checks) estiver ativada. O padrão é 180 segundos (3 minutos).</span>



#### <span style="color:#d86c00">**SERVICE_CHECK_TIMEOUT**</span>
<span style="color:#696969">Este é o número máximo de segundos que o Nagios permitirá que as verificações de serviço sejam executadas. Se as verificações excederem esse limite, elas serão eliminadas e um estado CRÍTICO será retornado. Um erro de tempo limite também será registrado.</span>

<span style="color:#696969">Muitas vezes há uma confusão generalizada sobre o que essa opção realmente faz. Ele deve ser usado como o último mecanismo para eliminar plug-ins que se comportam mal e não saem em tempo hábil. Ele deve ser definido como algo alto (como 60 segundos ou mais), para que cada verificação de serviço normalmente termine de executar dentro desse prazo. Se uma verificação de serviço for mais longa que esse limite, o Nagios o matará pensando que é um processo descontrolado.</span>



#### <span style="color:#d86c00">**HOST_CHECK_TIMEOUT**</span>
<span style="color:#696969">Este é o número máximo de segundos que o Nagios permitirá que as verificações de host sejam executadas. Se as verificações excederem esse limite, elas serão eliminadas e um estado CRÍTICO será retornado e o host será considerado BAIXO. Um erro de tempo limite também será registrado.</span>



#### <span style="color:#d86c00">**EVENT_HANDLER_TIMEOUT**</span>
<span style="color:#696969">Este é o número máximo de segundos que o Nagios permitirá [que os manipuladores de eventos](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/eventhandlers.html) sejam executados. Se um manipulador de eventos exceder esse limite de tempo, ele será eliminado e um aviso será registrado.</span>

<span style="color:#696969">Manipuladores de eventos são comandos opcionais que podem ser executados sempre que um serviço ou host muda de estado.</span>



#### <span style="color:#d86c00">**NOTIFICATION_TIMEOUT**</span>
<span style="color:#696969">Este é o número máximo de segundos que o Nagios permitirá que comandos de notificação sejam executados. Se um comando de notificação exceder esse limite de tempo, ele será eliminado e um aviso será registrado.</span>



#### <span style="color:#d86c00">**OCSP_TIMEOUT**</span>
<span style="color:#696969">Este é o número máximo de segundos que o Nagios permitirá que um comando obsessivo do processador de serviço compulsivo seja executado. Se um comando exceder esse limite de tempo, ele será eliminado e um aviso será registrado.</span>



#### <span style="color:#d86c00">**OCHP_TIMEOUT**</span>
<span style="color:#696969">Esse é o número máximo de segundos que o Nagios permitirá que um comando obsessivo compulsivo do processador host seja executado. Se um comando exceder esse limite de tempo, ele será eliminado e um aviso será registrado.</span>



#### <span style="color:#d86c00">**PERFDATA_TIMEOUT**</span>
<span style="color:#696969">Este é o número máximo de segundos que o Nagios permitirá que um comando do processador de dados de desempenho do host ou um comando do processador de dados de desempenho do serviço seja executado. Se um comando exceder esse limite de tempo, ele será eliminado e um aviso será registrado.</span>



#### <span style="color:#d86c00">**RETAIN_STATE_INFORMATION**</span>
<span style="color:#696969">Esta opção determina se o Nagios manterá ou não as informações de estado para hosts e serviços entre as reinicializações do programa. Se você habilitar essa opção, deverá fornecer um valor para a variável state_retention_file. Quando ativado, o Nagios salva todas as informações de estado dos hosts e serviços antes de serem desligadas (ou reiniciadas) e lê as informações de estado salvas anteriormente quando reiniciadas.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não retém informações do estado;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Retém informações do estado (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**STATE_RETENTION_FILE**</span>

<span style="color:#696969">Este é o arquivo que o Nagios usará para armazenar informações de status, tempo de inatividade e comentários antes de serem encerradas. Quando o Nagios é reiniciado, ele usa as informações armazenadas neste arquivo para definir os estados iniciais de serviços e hosts antes de começar a monitorar qualquer coisa. Para fazer com que o Nagios retenha as informações de estado entre as reinicializações do programa, você deve habilitar a opção reter_state_informações.</span>



#### <span style="color:#d86c00">**RETENTION_UPDATE_INTERVAL**</span>
<span style="color:#696969">Esta configuração determina com que frequência (em minutos) o Nagios salvará automaticamente os dados de retenção durante a operação normal. Se você definir esse valor como 0, o Nagios não salvará os dados de retenção em intervalos regulares, mas ainda salvará os dados de retenção antes de desligar ou reiniciar. Se você desativou a retenção de estado (com a opção reter_stato_informações ), essa opção não terá efeito.</span>



#### <span style="color:#d86c00">**USE_RETAINED_PROGRAM_STATE**</span>
<span style="color:#696969">Essa configuração determina se o Nagios definirá ou não várias variáveis de estado em todo o programa com base nos valores salvos no arquivo de retenção. Algumas dessas variáveis de estado de todo o programa que normalmente são salvas no reinício do programa se a retenção de estado estiver ativada incluem as opções enable_notifications, enable_flap_detection, enable_event_handlers, execute_service_checks e accept_passive_service_checks . Se você não tiver a retenção de estado ativada, essa opção não terá efeito.</span>



#### <span style="color:#d86c00">**USE_RETAINED_SCHEDULING_INFO**</span>
<span style="color:#696969">Essa configuração determina se o Nagios manterá ou não as informações de agendamento (próximas horas de verificação) para hosts e serviços quando reiniciar.<span style="color:#FFFF00"> Se você estiver adicionando um grande número (ou porcentagem) de hosts e serviços, eu recomendaria desabilitar essa opção quando você reiniciar o Nagios, pois isso pode prejudicar a propagação das verificações iniciais</span>. Caso contrário, você provavelmente desejará deixá-lo ativado.</span>



#### <span style="color:#d86c00">**RETAINED_HOST_ATTRIBUTE_MASK**</span>
<span style="color:#696969">AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.</span>

<span style="color:#696969">Essas opções determinam quais atributos de host ou serviço NÃO são retidos nas reinicializações do programa. Os valores para essas opções são AND, bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos de host e serviço são mantidos.</span>



#### <span style="color:#d86c00">**RETAINED_SERVICE_ATTRIBUTE_MASK**</span>
<span style="color:#696969">AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.</span>

<span style="color:#696969">Essas opções determinam quais atributos de host ou serviço NÃO são retidos nas reinicializações do programa. Os valores para essas opções são AND, bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos de host e serviço são mantidos.</span>



#### <span style="color:#d86c00">**RETAINED_PROCESS_HOST_ATTRIBUTE_MASK**</span>
<span style="color:#696969">AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.</span>

<span style="color:#696969">Essas opções determinam quais atributos do processo NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de processo de host e serviço separados que podem ser alterados. Por exemplo, as verificações de host podem ser desativadas no nível do programa, enquanto as verificações de serviço ainda estão ativadas. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.</span>



#### <span style="color:#d86c00">**RETAINED_PROCESS_SERVICE_ATTRIBUTE_MASK**</span>
<span style="color:#696969">AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.</span>

<span style="color:#696969">Essas opções determinam quais atributos do processo NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de processo de host e serviço separados que podem ser alterados. Por exemplo, as verificações de host podem ser desativadas no nível do programa,iscover interesting projects and people to populate your personal news fe enquanto as verificações de serviço ainda estão ativadas. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.</span>



#### <span style="color:#d86c00">**RETAINED_CONTACT_HOST_ATTRIBUTE_MASK**</span>
<span style="color:#696969">AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.</span>

<span style="color:#696969">Essas opções determinam quais atributos de contato NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de contato de host e serviço separados que podem ser alterados. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.</span>



#### <span style="color:#d86c00">**RETAINED_CONTACT_SERVICE_ATTRIBUTE_MASK**</span>
<span style="color:#696969">AVISO: Este é um recurso avançado. Você precisará ler o código fonte do Nagios para usar essa opção de maneira eficaz.</span>

<span style="color:#696969">Essas opções determinam quais atributos de contato NÃO são retidos nas reinicializações do programa. Existem duas máscaras porque geralmente existem atributos de contato de host e serviço separados que podem ser alterados. Os valores para essas opções são AND bit a bit dos valores especificados nas definições "MODATTR_" no arquivo de código-fonte include /common.h. Por padrão, todos os atributos do processo são mantidos.</span>



#### <span style="color:#d86c00">**INTERVAL_LENGTH**</span>
<span style="color:#696969">Esse é o número de segundos por "intervalo de unidade" usado para cronometrar na fila de agendamento, renotificação, etc. "Intervalos de unidades" são usados no arquivo de configuração do objeto para determinar com que frequência executar uma verificação de serviço, com que frequência irá ocorrer a renotificação de um contato etc.</span>



#### <span style="color:#d86c00">**BARE_UPDATE_CHECK**</span>
<span style="color:#696969">Esta opção impede que dados do Nagios seja envido para o api.nagios.org quando procurar atualizações. Por padrão, o Nagios enviará informações sobre a versão atual do Nagios que você instalou, bem como um indicador sobre se essa foi uma nova instalação ou não. O Nagios Enterprises usa esses dados para determinar o número de usuários executando uma versão específica do Nagios. Habilite esta opção se não desejar que essas informações sejam enviadas.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Desativado;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Ativado (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**USE_AGGRESSIVE_HOST_CHECKING**</span>

<span style="color:#696969">O Nagios tenta ser inteligente sobre como e quando verifica o status dos hosts. Em geral, desabilitar esta opção permitirá ao Nagios tomar algumas decisões mais inteligentes e verificar os hosts um pouco mais rápido. A ativação dessa opção aumentará a quantidade de tempo necessária para verificar os hosts, mas poderá melhorar um pouco a confiabilidade. A menos que você tenha problemas com o Nagios em não reconhecer que um host foi recuperado, sugiro não ativar esta opção.</span>



#### <span style="color:#d86c00">**EXECUTE_SERVICE_CHECKS**</span>
<span style="color:#696969">Esta opção determina se o Nagios executará ou não as verificações de serviço quando reiniciado/iniciado inicialmente. Se esta opção estiver desabilitada, o Nagios não executará ativamente nenhuma verificação de serviço e permanecerá em uma espécie de modo " inativo " (ainda poderá aceitar verificações passivas, a menos que você as tenha desativado ). Essa opção é usada com mais frequência ao configurar servidores de monitoramento de backup, conforme descrito na documentação sobre [redundância](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/redundancy.html), ou ao configurar um ambiente de monitoramento distribuído. </span>

<span style="color:#696969">Nota: Se você tiver a retenção de estado ativada, o Nagios ignorará essa configuração quando reiniciado/iniciado e usará a última configuração conhecida para esta opção (conforme armazenada no arquivo de retenção de estado), a menos que você desativa a opção use_retained_program_state . Se você deseja alterar esta opção quando a retenção de estado estiver ativa (e o use_retained_program_state estiver ativado), será necessário usar o comando externo apropriado ou alterá-lo através da interface da web.</span>



#### <span style="color:#d86c00">**ACCEPT_PASSIVE_SERVICE_CHECKS**</span>
<span style="color:#696969">Esta opção determina se o Nagios aceitará ou não [as verificações passivas de serviço](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/passivechecks.html) quando reiniciado/iniciado inicialmente. Se esta opção estiver desabilitada, o Nagios não aceitará nenhuma verificação passiva de serviço.</span>



#### <span style="color:#d86c00">**EXECUTE_HOST_CHECKS**</span>
<span style="color:#696969">Esta opção determina se o Nagios executará ou não verificações de host sob demanda e agendadas regularmente quando for reiniciado/iniciado inicialmente. Se esta opção estiver desabilitada, o Nagios não executará nenhuma verificação de host ativamente, embora ainda possa aceitar [verificações passivas de host, a](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/passivechecks.html) menos que você as tenha [desativado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#accept_passive_host_checks) . Essa opção é usada com mais frequência ao configurar servidores de monitoramento de backup, conforme descrito na documentação sobre [redundância](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/redundancy.html) , ou ao configurar um ambiente de monitoramento [distribuído](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/distributed.html) . Nota: Se você tiver a [retenção de estado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#retain_state_information) ativada, o Nagios ignorará essa configuração quando reiniciado/iniciado e usará a última configuração conhecida para esta opção (conforme armazenada no [arquivo de retenção de estado](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#state_retention_file) ), a *menos que*você desativa a opção [use_retained_program_state](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#use_retained_program_state) . Se você deseja alterar esta opção quando a retenção de estado estiver ativa (e o [use_retained_program_state](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html#use_retained_program_state) estiver ativado), será necessário usar o [comando externo](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/extcommands.html) apropriado ou alterá-lo através da interface da web.</span>



#### <span style="color:#d86c00">**ACCEPT_PASSIVE_HOST_CHECKS**</span>
<span style="color:#696969">Esta opção determina se o Nagios aceitará ou não verificações passivas de host quando reiniciado/iniciado inicialmente. Se esta opção estiver desabilitada, o Nagios não aceitará nenhuma verificação passiva de host. Nota: Se você tiver a retenção de estado ativada, o Nagios ignorará essa configuração quando reiniciado/iniciado e usará a última configuração conhecida para esta opção (conforme armazenada no arquivo de retenção de estado ), a menos que você desative a opção use_retained_program_state . Se você quiser alterar essa opção quando a retenção de estado estiver ativa (e o use_retained_program_state estiver ativado), será necessário usar o comando externo apropriado ou alterá-lo através da interface da web.</span>