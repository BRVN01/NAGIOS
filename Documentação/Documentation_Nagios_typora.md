[TOC]

# Prefácio

FAZER



# Capítulo 1: Introdução ao Nagios

Nagios é uma ferramenta para monitoramento de rede/sistema, isso significa que o Nagios verifica computadores e/ou dispositivos na sua rede e garante que eles estejam funcionando como deveriam. 

O Nagios verifica constantemente se as máquinas estão funcionando corretamente (através do ping),  ele também verifica se os serviços monitorados nessas máquinas estão funcionando bem. 

O principal objetivo do monitoramento da infraestrutura de TI é detectar o mais rápido possível qualquer evento que tenha acontecido, para que se possa tomar uma ação antes que os usuários desse sistema relatem o problema.

O monitoramento do sistema no Nagios é dividido em duas categorias de objetos: verificação de hosts e verificação de serviços. 

Os hosts representam um dispositivo físico ou virtual em sua rede (servidores, roteadores, switchs, impressoras entre outros). 

Os serviços são funcionalidades específicas, por exemplo, um servidor SSH (Secure Shell), consumo de memória, uso de HD, serviço de e-mail, entre outros serviços. Cada serviço está associado a um host no qual está sendo executado. Além disso, as máquinas podem ser agrupadas em grupos de hosts.

Para que toda essa monitoração ocorra, existem vários arquivos de configuração diferentes que você precisará criar e/ou editar antes de começar a monitorar um dispositivo.

A mágica do Nagios acontece nas verificações de desempenho, ele usa apenas quatro estados distintos, sendo eles: Ok, Warning, Critical e Unknown, tem também o fato de ser baseado em plugins, significando  que se você quiser verificar algum recurso que ainda não tenha um plugin, bastaria escrever um.

O Nagios já vem com um conjunto de plugins padrão, mas caso você tenha necesidade, pode criar seus próprios plugins.



## Principais características

O Nagios é uma ferramenta muito flexivel, ele pode ser configurado para monitorar sua infraestrutura de TI da maneira que você deseja. Também possui um mecanismo para reagir automaticamente a problemas e possui um poderoso sistema de notificação. Tudo isso é baseado em um sistema de definição de objeto, como mostra a seguir:

- **Comandos**: É a forma que o Nagios vai executar as verificações. Sendo uma parte importante da comunicação do Nagios com os plugins.

- **Períodos de tempo**: São períodos de data e hora em que uma operação deve ou não ser executada. Por exemplo, de segunda a sexta-feira, das 09:00 às 17:00.

- **Hosts e grupos de hosts**: São dispositivos, além da possibilidade de agrupar hosts. Um único host pode ser membro de mais de um grupo.

- **Serviços**: São várias funcionalidades ou recursos para monitorar em um host específico. Por exemplo, uso da CPU, espaço de armazenamento ou servidor da Web e etc.

- **Contatos e grupos de contatos**: São as pessoas que devem ser notificadas com informações sobre um evento no host ou serviço, os contatos podem ser agrupados, e um único contato pode ser membro de mais de um grupo.

- **Notificações**: Definem quem deve ser notificado sobre o que, por exemplo, todos os erros do grupo de servidores Windows devem ir para o grupo de contatos do windows-administration durante o horário de trabalho e para o grupo de contatos da equipe nível 2 fora do horário de trabalho.

- **Escalações**: São extensões de notificações; eles definem que depois que um objeto está no mesmo estado por um período específico de tempo, outras pessoas devem ser notificadas de determinados eventos, por exemplo, um servidor crítico que esteja inativo por mais de 4 horas deve alertar o gerenciamento de TI para que eles acompanhem o problema.

Para qualquer administrador, é óbvio que, se o roteador estiver inativo, todas as máquinas acessadas por ele falharão. Caso você não leve isso em consideração, e esse roteador venha a ficar indisponível, você receberá uma lista de várias máquinas e serviços com falha. O Nagios permite definir dependências entre hosts para refletir a topologia de rede real. 

Por exemplo, se um roteador que o conecta ao resto da sua rede estiver inoperante, o Nagios não executará verificações das máquinas subseqüentes (depois do roteador). Isso é ilustrado na figura a seguir:

![1574354656894](/home/bruno/.config/Typora/typora-user-images/1574354656894.png)

No caso acima, um dos links está fora, mesmo que os switchs e servidores estão funcionando, o Nagios não consegue chegar até eles, dessa forma, será retornado indisponibilidade pelo Nagios.



#### Arquivo de configuração principal

O arquivo de configuração principal contém várias diretivas que afetam como o daemon do Nagios Core opera. Este arquivo de configuração é lido pelo daemon do Nagios Core e pelos CGIs. É aqui que você deve começar suas aventuras de configuração.

A documentação para o arquivo de configuração principal pode ser encontrada [aqui](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/configmain.html) .



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