<span style="color:#d86c00">**Sumário**</span>

[TOC]

#### <span style="color:#d86c00">**main_config_file**</span>

<span style="color:#696969">Isso especifica o local do seu [arquivo de configuração principal](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html) . Os CGIs precisam saber onde encontrar esse arquivo para obter informações sobre informações de configuração, status atual do host e serviço, etc.</span>



#### <span style="color:#d86c00">**physical_html_path**</span>

<span style="color:#696969">Este é o caminho no qual os arquivos HTML do Nagios são mantidos. O Nagios assume que os arquivos de documentação e imagens (usados pelos CGIs) são armazenados em subdiretórios chamados *docs/* e *images/*, respectivamente.</span>



#### <span style="color:#d86c00">**url_html_path**</span>

<span style="color:#696969">É a parte do caminho da URL usada para acessar as páginas HTML do Nagios (IP/nagios).</span>



#### <span style="color:#d86c00">**use_authentication**</span>

<span style="color:#696969">Esta opção controla se os CGIs usarão ou não a funcionalidade de autenticação e autorização ao determinar a quais informações e comandos os usuários terão acesso.</span>

<span style="color:#696969">Se você decidir não usar autenticação, remova o [comando CGI](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html#cmd_cgi) para impedir que usuários não autorizados emitam comandos para o Nagios. </span>

<span style="color:#696969">Mais informações sobre como configurar a autenticação e configurar a autorização para os CGIs podem ser encontradas [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgiauth.html).</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não use a funcionalidade de autenticação;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Usar funcionalidade de autenticação e autorização (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**default_user_name**</span>

<span style="color:#696969">A configuração dessa variável definirá um nome de usuário padrão que pode acessar os CGIs. Isso permite que pessoas dentro de um domínio seguro (ou seja, atrás de um firewall) acessem os CGIs sem necessariamente ter que se autenticar no servidor da web. Convém usar isso para evitar a autenticação básica, se você não estiver usando um servidor seguro, pois a autenticação básica transmite senhas em texto não criptografado pela Internet.</span>

<span style="color:#696969"><span style="color:#C0C0C0">**Importante:**</span> *Não* defina um nome de usuário padrão, a menos que você estiver executando um servidor web seguro e tenha certeza de que todo mundo que tem acesso à CGIs foi autenticado de alguma maneira! Se você definir essa variável, qualquer pessoa que não tenha se autenticado no servidor da Web herdará todos os direitos que você atribuir a esse usuário!</span>

- <span style="color:#696969">Usuário padrão (<span style="color:#FFDAB9">guest</span>).</span>



#### <span style="color:#d86c00">**authorized_for_system_information**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários que podem visualizar informações de processo/sistema, do [informações estendidas do CGI](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html#extinfo_cgi) . Usuários e grupos nessas listas não estão automaticamente autorizados a emitir comandos do sistema/processo. Se você quiser que os usuários ou grupos possam ser capazes de usar comandos do sistema/processo, você deve adicioná-los aos [authorized_for_system_commands](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html#authorized_for_system_commands) ou [authorized_contactgroup_for_system_commands](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html#authorized_for_system_commands). Mais informações sobre como configurar a autenticação e configurar a autorização para os CGIs podem ser encontradas [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgiauth.html) .</span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_system_information**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem visualizar informações de processo/sistema, do [informações estendidas do CGI](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html#extinfo_cgi) . </span>



#### <span style="color:#d86c00">**authorized_for_system_commands**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários autenticados que podem emitir comandos do sistema, por meio do CGI. Usuários e grupos nessas listas não estão automaticamente autorizados a visualizar informações do sistema/processo. Se você deseja que usuários ou grupos também possam visualizar informações do sistema/processo, inclua-os nas variáveis <span style="color:#00CED1">allowed_for_system_information</span> ou <span style="color:#00CED1">allowed_contactgroup_for_system_information</span>. </span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_system_commands**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem emitir comandos do sistema, por meio do CGI. Usuários e grupos nessas listas não estão automaticamente autorizados a visualizar informações do sistema/processo. Se você deseja que usuários ou grupos também possam visualizar informações do sistema/processo, inclua-os nas variáveis <span style="color:#00CED1">allowed_for_system_information</span> ou <span style="color:#00CED1">allowed_contactgroup_for_system_information</span>. </span>



#### <span style="color:#d86c00">**authorized_for_configuration_information**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários autenticados que podem visualizar informações de configuração no CGI de configuração. Usuários e grupos nesta lista podem visualizar informações sobre todos os hosts, grupos de hosts, serviços, contatos, grupos de contatos, períodos e comandos configurados.</span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_configuration_information**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem visualizar informações de configuração no CGI de configuração. Usuários e grupos nesta lista podem visualizar informações sobre todos os hosts, grupos de hosts, serviços, contatos, grupos de contatos, períodos e comandos configurados.</span>



#### <span style="color:#d86c00">**authorized_for_all_hosts**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários autenticados que podem visualizar informações de status e configuração de hosts (todos os hosts).</span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_all_hosts**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem visualizar informações de status e configuração de hosts (todos os hosts).</span>



#### <span style="color:#d86c00">**authorized_for_all_host_commands**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários autenticados que podem emitir comandos para todos os hosts por meio do comando CGI (navegador).</span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_all_host_commands**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem emitir comandos para todos os hosts por meio do comando CGI (navegador).</span>



#### <span style="color:#d86c00">**authorized_for_all_services**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários autenticados que podem visualizar informações de status e configuração de todos os serviços.</span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_all_services**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem visualizar informações de status e configuração de todos os serviços.</span>



#### <span style="color:#d86c00">**authorized_for_all_service_commands**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários autenticados que podem emitir comandos para todos os serviços através do CGI. </span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_all_service_commands**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos que podem emitir comandos para todos os serviços através do CGI. </span>



#### <span style="color:#d86c00">**authorized_for_read_only**</span>

<span style="color:#696969">Essa opção informa uma lista de usuários que possuem direitos somente leitura nos CGIs. Isso bloqueará qualquer comando de serviço ou host normalmente mostrado nas páginas CGI do extinfo. Ele também impedirá que os comentários sejam mostrados para usuários ou grupos somente leitura.</span>



#### <span style="color:#d86c00">**authorized_contactgroup_for_read_only**</span>

<span style="color:#696969">Essa opção informa uma lista de grupo de contatos possuem direitos somente leitura nos CGIs. Isso bloqueará qualquer comando de serviço ou host normalmente mostrado nas páginas CGI do extinfo. Ele também impedirá que os comentários sejam mostrados para usuários ou grupos somente leitura.</span>



#### <span style="color:#d86c00">**lock_author_names**</span>

<span style="color:#696969">Essa opção permite impedir que os usuários alterem o nome do autor ao enviar comentários, confirmações e tempo de inatividade programado a partir da interface da web. Se essa opção estiver ativada, os usuários não poderão alterar o nome do autor associado à solicitação de comando.</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Permitir que os usuários alterem os nomes dos autores ao enviar comandos;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Impedir que os usuários alterem os nomes dos autores ao enviar comandos (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**statusmap_background_image**</span>

<span style="color:#696969">Esta opção permite especificar uma imagem a ser usada como plano de fundo no CGI do mapa de status se você usar o método de layout de coordenadas fornecido pelo usuário. A imagem de plano de fundo não está disponível em nenhum outro método de layout. Supõe-se que a imagem reside no caminho das imagens HTML (`/usr/local/nagios/share/images`). </span>
<span style="color:#696969">Esse caminho é determinado automaticamente anexando "/images" ao caminho especificado pela diretiva physical_html_path. </span>
<span style="color:#696969">Nota: O arquivo de imagem pode estar no formato GIF, JPEG, PNG ou GD2, no entanto, o formato GD2 (de preferência não compactado) é recomendado, pois reduzirá a carga da CPU quando o CGI gerar a imagem do mapa.</span>



#### <span style="color:#d86c00">**default_statusmap_layout**</span>

<span style="color:#696969">Esta opção permite especificar o método de layout padrão usado pelo CGI do mapa de status. As opções válidas são:</span>

| <layout_number> Value | Layout Method            |
| :-------------------- | :----------------------- |
| 0                     | User-defined coordinates |
| 1                     | Depth layers             |
| 2                     | Collapsed tree           |
| 3                     | Balanced tree            |
| 4                     | Circular                 |
| 5                     | Circular (Marked Up)     |
| 6                     | Circular (Balloon)       |



#### <span style="color:#d86c00">**default_statuswrl_layout**</span>

<span style="color:#696969">Esta opção permite especificar o método de layout padrão usado pelo CGI statuswrl. As opções válidas são:</span>

| <layout_number> Value | Layout Method            |
| :-------------------- | :----------------------- |
| 0                     | User-defined coordinates |
| 2                     | Collapsed tree           |
| 3                     | Balanced tree            |
| 4                     | Circular                 |



#### <span style="color:#d86c00">**refresh_rate**</span>

<span style="color:#696969">Esta opção permite especificar o número de segundos entre as atualizações da página para os status, statusmap e extinfo CGIs.</span>

<span style="color:#FFDAB9">Padrão é 90 segundos</span>



#### <span style="color:#d86c00">**ping_syntax**</span>

<span style="color:#696969">Essa opção determina qual sintaxe deve ser usada ao tentar executar o ping de um host da interface WAP (usando o CGI statuswml. Você deve incluir o caminho completo para o binário de ping, além de todas as opções necessárias. A macro $HOSTADDRESS$ é substituída pela endereço do host antes que o comando seja executado.</span>



#### <span style="color:#d86c00">**escape_html_tags**</span>

<span style="color:#696969">Esta opção determina se as tags HTML na saída do host e do serviço (plugin) são escapadas nos CGIs. Se você habilitar essa opção, a saída do seu plug-in não poderá conter hiperlinks clicáveis (Status do serviço).</span>

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Desabilitado;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Habilitado (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**notes_url_target**</span>

<span style="color:#696969">Esta opção determina o nome do destino do quadro no qual as URLs de anotações devem ser exibidas. As opções válidas incluem _blank, _self, _top, _parent ou qualquer outro nome de destino válido.</span>



#### <span style="color:#d86c00">**action_url_target**</span>

<span style="color:#696969">Essa opção determina o nome do destino do quadro no qual os URLs de ação devem ser exibidos. As opções válidas incluem _blank, _self, _top, _parent ou qualquer outro nome de destino válido.</span>



#### <span style="color:#d86c00">**enable_page_tour**</span>

<span style="color:#696969">Esta opção permite ativar/desativar o tour da página que aparece no canto inferior direito da tela. As opções válidas incluem 0 ou 1, o padrão está ativado. Versão: 4.4.0+</span>



#### <span style="color:#d86c00">**enable_splunk_integration**</span>

<span style="color:#696969">Esta opção determina se a funcionalidade de integração com o Splunk está ativada na interface da web. Se ativado, você verá os links "Splunk It" em vários locais nos CGIs (arquivo de log, histórico de alertas, detalhes de host/serviço, etc.). Útil se você está tentando pesquisar por que ocorreu um problema específico. Para mais informações sobre o Splunk, visite http://www.splunk.com/.</span>



#### <span style="color:#d86c00">**splunk_url**</span>

<span style="color:#696969">Esta opção é usada para definir o URL base para sua interface do Splunk. Essa URL é usada pelos CGIs ao criar links se a opção enable_splunk_integration estiver ativada.</span>



#### <span style="color:#d86c00">**Audio Alerts**</span>

<span style="color:#696969">As opções abaixo permitem especificar um arquivo de áudio que deve ser reproduzido no seu navegador se houver algum problema quando você estiver visualizando o status CGI. Se houver problemas, o arquivo de áudio para o tipo mais crítico de problema será reproduzido. O tipo mais crítico de problema está em ou mais hosts inacessíveis, enquanto o menos crítico é um ou mais serviços em um estado desconhecido. </span>

<span style="color:#696969">Presume-se que os arquivos de áudio estejam em media/ subdiretório do diretório HTML (`/usr/local/nagios/share/media`).</span>



<span style="color:#696969">Exemplo:</span>

- <span style="color:#C0C0C0">**host_unreachable_sound=hostu.wav**</span>

  <span style="color:#696969">Som que será executado quando um host não puder ser alcansado.</span>

  

- <span style="color:#C0C0C0">**host_down_sound=hostd.wav**</span>

  <span style="color:#696969">Som que será executado quando um host estiver down.</span>

  

- <span style="color:#C0C0C0">**service_critical_sound=critical.wav**</span>

  <span style="color:#696969">Som que será executado quando um serviço estiver crítico.</span>

  

- <span style="color:#C0C0C0">**service_warning_sound=warning.wav**</span>

  <span style="color:#696969">Som que será executado quando um serviço estiver Warning.</span>

  

- <span style="color:#C0C0C0">**service_unknown_sound=unknown.wav**</span>

  <span style="color:#696969">Som que será executado quando um serviço for desconhecido (apenas o resultado do check).</span>



#### <span style="color:#d86c00">**Statusmap CGI Color Transparency Indexes**</span>

<span style="color:#696969">Essas opções definem os valores r, g, b da cor de plano de fundo e usam o CGI do mapa de status; portanto, navegadores normais que não podem mostrar transparência png real definem a cor desejada como cor de plano de fundo (para torná-la bonita). O padrão é branco: (R, G, B)=(255.255.255).</span>