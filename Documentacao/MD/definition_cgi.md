<span style="color:#d86c00">**Sumário**</span>

[TOC]

#### <span style="color:#d86c00">**main_config_file**</span>

<span style="color:#696969">Isso especifica o local do seu [arquivo de configuração principal](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html) . Os CGIs precisam saber onde encontrar esse arquivo para obter informações sobre informações de configuração, status atual do host e serviço, etc.</span>



#### <span style="color:#d86c00">**physical_html_path**</span>

Este é o caminho no qual os arquivos HTML do Nagios são mantidos. O Nagios assume que os arquivos de documentação e imagens (usados pelos CGIs) são armazenados em subdiretórios chamados *docs/* e *images/*, respectivamente.



#### <span style="color:#d86c00">**url_html_path**</span>

É a parte do caminho da URL usada para acessar as páginas HTML do Nagios (IP/nagios).



#### <span style="color:#d86c00">**use_authentication**</span>

Esta opção controla se os CGIs usarão ou não a funcionalidade de autenticação e autorização ao determinar a quais informações e comandos os usuários terão acesso.

Se você decidir não usar autenticação, remova o [comando CGI](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html#cmd_cgi) para impedir que usuários não autorizados emitam comandos para o Nagios. 

Mais informações sobre como configurar a autenticação e configurar a autorização para os CGIs podem ser encontradas [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgiauth.html).

- <span style="color:#696969"><span style="color:#C0C0C0">**0**</span> = Não use a funcionalidade de autenticação;</span>
- <span style="color:#696969"><span style="color:#C0C0C0">**1**</span> = Usar funcionalidade de autenticação e autorização (<span style="color:#FFDAB9">padrão</span>).</span>



#### <span style="color:#d86c00">**default_user_name**</span>

A configuração dessa variável definirá um nome de usuário padrão que pode acessar os CGIs. Isso permite que pessoas dentro de um domínio seguro (ou seja, atrás de um firewall) acessem os CGIs sem necessariamente ter que se autenticar no servidor da web. Convém usar isso para evitar a autenticação básica, se você não estiver usando um servidor seguro, pois a autenticação básica transmite senhas em texto não criptografado pela Internet.

**Importante:** *Não* defina um nome de usuário padrão, a menos que você estiver executando um servidor web seguro e tenha certeza de que todo mundo que tem acesso à CGIs foi autenticado de alguma maneira! Se você definir essa variável, qualquer pessoa que não tenha se autenticado no servidor da Web herdará todos os direitos que você atribuir a esse usuário!

- <span style="color:#696969">Usuário padrão (<span style="color:#FFDAB9">guest</span>).</span>



#### <span style="color:#d86c00">**authorized_for_system_information**</span>

Essas são listas delimitadas por vírgula de nomes de *usuários autenticados* ou *grupos de contatos* que podem visualizar informações do sistema / processo no [CGI de informações estendidas](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgis.html#extinfo_cgi) . Usuários e grupos nessas listas *não* estão automaticamente autorizados a emitir comandos do sistema / processo. Se você quiser que os usuários ou grupos para ser capaz de comandos do sistema / processo de emissão, bem como, você deve adicioná-los aos [authorized_for_system_commands](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html#authorized_for_system_commands) ou [authorized_contactgroup_for_system_commands](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configcgi.html#authorized_for_system_commands) variáveis. Mais informações sobre como configurar a autenticação e configurar a autorização para os CGIs podem ser encontradas [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/cgiauth.html) .



#### <span style="color:#d86c00">**authorized_contactgroup_for_system_information**</span>





#### <span style="color:#d86c00">**authorized_for_system_commands**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_system_commands**</span>





#### <span style="color:#d86c00">**authorized_for_configuration_information**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_configuration_information**</span>





#### <span style="color:#d86c00">**authorized_for_all_hosts**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_all_hosts**</span>





#### <span style="color:#d86c00">**authorized_for_all_host_commands**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_all_host_commands**</span>





#### <span style="color:#d86c00">**authorized_for_all_services**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_all_services**</span>





#### <span style="color:#d86c00">**authorized_for_all_service_commands**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_all_service_commands**</span>





#### <span style="color:#d86c00">**authorized_for_read_only**</span>





#### <span style="color:#d86c00">**authorized_contactgroup_for_read_only**</span>





#### <span style="color:#d86c00">**lock_author_names**</span>



#### <span style="color:#d86c00">**statusmap_background_image**</span>





#### <span style="color:#d86c00">**default_statusmap_layout**</span>





#### <span style="color:#d86c00">**statuswrl_include**</span>





#### <span style="color:#d86c00">**default_statuswrl_layout**</span>





#### <span style="color:#d86c00">**refresh_rate**</span>





#### <span style="color:#d86c00">**ping_syntax**</span>





#### <span style="color:#d86c00">**escape_html_tags**</span>





#### <span style="color:#d86c00">**notes_url_target**</span>





#### <span style="color:#d86c00">**action_url_target**</span>





#### <span style="color:#d86c00">**enable_page_tour**</span>





#### <span style="color:#d86c00">**enable_splunk_integration**</span>





#### <span style="color:#d86c00">**splunk_url**</span>





#### <span style="color:#d86c00">**Audio Alerts**</span>





#### <span style="color:#d86c00">**Statusmap CGI Color Transparency Indexes**</span>

