<span style="color:#d86c00">**Sumário**</span>

[TOC]

# <span style="color:#d86c00">**Introdução**</span>

<span style="color:#696969">Para que possamos fazer a verificação de serviços, enviar notificações, muitas vezes precisamos criar um plugin para isso, essa seção descreve como criar um comando e não como criar um plugin, criando comando a partir de plugins já existentes.</span>

<span style="color:#696969">Apenas para conhecimento, comandos que tenham local em seu nome, são comandos que devem ser executados localmentee, eles por padrão ficam no servidor do Nagios, mas se você quiser executar eles em outras máquinas, deve usar um serviço como o NRPE, comandos sem o 'local' no nome, são comandos que por padrão devem ser executados em outras máquinas (remotas), com algumas ligeiras exceções.</span>

<span style="color:#696969">Vamos mostrar muitos comandos que já são padrões do Nagios para que você possa ver como cada é configurado.</span>

```yaml
# Verifica se o host está UP:
define command {

    command_name    check-host-alive
    command_line    $USER1$/check_ping -H $HOSTADDRESS$ -w 3000.0,80% -c 5000.0,100% -p 5
}

# Verifica o armazenamento do disco:
define command {

    command_name    check_local_disk
    command_line    $USER1$/check_disk -w $ARG1$ -c $ARG2$ -p $ARG3$
}

# Verifica o load avarage:
define command {

    command_name    check_local_load
    command_line    $USER1$/check_load -w $ARG1$ -c $ARG2$
}

# Verifica o FTP:
define command {

    command_name    check_ftp
    command_line    $USER1$/check_ftp -H $HOSTADDRESS$ $ARG1$
}

# Verifica se o snmp está funcionando:
define command {

    command_name    check_snmp
    command_line    $USER1$/check_snmp -H $HOSTADDRESS$ $ARG1$
}

# Verificar se a porta 80 está aberta:
define command {

    command_name    check_http
    command_line    $USER1$/check_http -I $HOSTADDRESS$ $ARG1$
}

# Verificar se a porta 22 está aberta:
define command {

    command_name    check_ssh
    command_line    $USER1$/check_ssh $ARG1$ $HOSTADDRESS$
}
```



## <span style="color:#d86c00">**Argumentos Dinâmicos**</span>

<span style="color:#696969">Quando criamos um serviço, podemos passar argumentos específico, dessa forma teremos apenas 1 plugin que irá funcionar para muitos hosts, geralmente usamos os argumentos para definir limites de warning, critical, mas podemos usar os argumentos para passar qualquer informação ao script.</span>

<span style="color:#696969">De acordo com o [site oficial](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/macrolist.html#arg), para argumentos denominados <span style="color:#00CED1">$ARGn$</span>, temos uma quantidade limitada para 32 argumentos.</span>

![Seleção_015](/home/bruno/git/NAGIOS/IMG/Seleção_015.png)

