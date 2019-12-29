<span style="color:#d86c00">**Sumário**</span>

[TOC]

# <span style="color:#d86c00">**Introdução**</span>

<span style="color:#696969">As definições de período de tempo permitem controlar quando o monitoramento e alerta podem ocorrer. Por exemplo, podemos restringir:</span>

- <span style="color:#696969">Quando verificações regulares de host e serviço podem ser executadas;</span>

- <span style="color:#696969">Quando as notificações podem ser enviadas;</span>

- <span style="color:#696969">Quando escalações de notificação podem ser usadas;</span>

- <span style="color:#696969">Quando dependências são válidas.</span>

  

<span style="color:#696969">As definições de host e serviço têm uma diretiva chamada <span style="color:#00CED1">check_period</span> (opcional) que permite especificar um período de tempo que deve ser usado para restringir quando as verificações ativas do host ou serviço podem ser feitas.</span>

<span style="color:#696969">Se não for usado a variável <span style="color:#00CED1">check_period</span> para especificar um período, o Nagios poderá agendar as verificações ativas do host/serviço a qualquer momento. Isso é semelhante ao monitoramento 24x7.</span>



<span style="color:#696969"><span style="color:#C0C0C0">**Nota**</span>: As verificações sob demanda e passivas não são restritas pelo período de tempo especificado na variável <span style="color:#00CED1">check_period</span>. Apenas verificações ativas agendadas regularmente são restringidas.</span>

<span style="color:#FFFF00">Para entender mais sobre timeperiods, consulte o</span> [site oficial](https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/4/en/timeperiods.html).



<span style="color:#696969">Assim como todo objeto, temos opções a ser utilizadas, segue uma breve explicação de cada variável:</span>

```yaml
# Nome desse período
    timeperiod_name				timeperiod_name

# Apelido desse período
    alias						alias

# São os dias da semana
    [weekday]					timeranges

# Você pode adicionar muitas excessões em relação
# ao dia da semana.
    [exception]					timeranges
    
# Nomes de período de tempo, cujos intervalos de tempo 
# devem ser excluídos desse período de tempo.
    exclude						[timeperiod1,timeperiod2,...,timeperiodn]
}
```



## <span style="color:#d86c00">**Opções para criar um timeperiod**</span>

<span style="color:#696969">Vamos revisar alguns intervalos de tempo que podemos usar para refinar nosso período de verificação/notificação.</span>

- <span style="color:#C0C0C0">**[weekday]**</span>
<span style="color:#696969">A opção <span style="color:#00CED1">weekday</span> é uma variável que recebe um intervalo de tempo, esse intervalo de tempo pode ser dias da semana, dias do mês e datas do calendário.</span>
  
  
  
  <span style="color:#696969">Dias da semana:</span>
  
  ```
  sunday		=	domingo
  monday		=	Segunda-feira
  tuesday		=	terça
  wednesday		=	quarta-feira
  thursday		=	quinta-feira
  friday		=	Sexta-feira
  saturday		=	sábado
  ```
  <span style="color:#696969">Cada dia da semana recebe um período em horas, essas horas indicam o horário em que será verificado/notificado naquele dia, o mesmo vale para meses.</span>
  
  ```
  sunday		00:00-24:00		; domingo de 00 h até 23h59.
  monday		00:00-24:00		; Segunda-feira de 00 h até 23h59.
  tuesday		08:00-17:30		; terça de 8 h até 17h30.
  wednesday		08:00-17:30		; quarta-feira de 8 h até 17h30.
  thursday		08:00-17:30		; quinta-feira de 8 h até 17h30.
  friday		09:00-16:00		; Sexta-feira de 9 h até 16 h.
  saturday		00:00-24:00		; sábado de 00 h até 23h59.
  ```
  
  <span style="color:#696969">Dia/Meses:</span>
  
  ```yaml
  # 2° dia de todos os meses, de 00 h até 23h59:
  day 2			00:00-24:00
  
  # 10 de fevereiro de todos os anos, de 00 h até 23h59:
  february 10	00:00-24:00
  
  # Dia 23 de Janeiro de 2019, de 8 h até 17h30:
  2019-11-23	08:00-17:30
  
  # 1° de janeiro de 2019 até 1° de janeiro de 2020, de 00 h até 23h59:
  2019-01-01 - 2020-01-01	00:00-24:00
  
  # Dia 1 até dia 20 de todos os meses, de 8h até 17h30:
  day 1 - 20	08:00-17:30
  
  # Do dia 9 ao dia 18 de Julio de todos os anos, de 9 h até 16 h:
  july 9 - 18	09:00-16:00
  
  # A cada 6 dias, da 1ª terça-feira de abril à 2ª sexta-feira de maio de   cada ano.
  tuesday 1 april - friday 2 may / 6  00:00-24:00        
  ```



- <span style="color:#C0C0C0">**exclude**</span>

  <span style="color:#696969">Exclude é essencialmente usado para excluir um outro *timeperiod*, você deve estar um pouco confuso agora, mas sim, em certos casos, ao criar um *timeperiod* você pode querer escluir um outro já existente, mas nesse caso, excluir não significa que esse *timeperiod* em especifico não será usado, muito pelo contrario, ele será usado e será muito importante, portanto, ao usar a opção ***exclude***, saiba bem o que está fazendo.</span>

  
  
  <span style="color:#696969">Por exemplo, imagine que temos o João, ele tira férias e tem folgas durante o ano, você precisa criar um período em que João será notificado, mas tem que excluir o tempo que João não estará trabalhando, afinal, João não quer ser notificado em sua folga.</span>
  
  
  
<span style="color:#696969">Para isso vamos criar um *timeperiod* em que João deva folgar:</span>
  
  ```yaml
  define timeperiod {
    name                Folgas_Joao
    timeperiod_name     Folgas_Joao
    day 10              00:00-24:00
    day -1              00:00-24:00
    january 2           00:00-24:00
    2019-10-01 - 2019-11-01           00:00-24:00
  }
  ```
  
  

  <span style="color:#696969">Agora vamos criar um outro timeperiod especifico para João, onde ele irá "trabalhar" todos os dias e iremos excluir os dias que ele não trabalha:</span>
  
  ```yaml
  define timeperiod {
      timeperiod_name Trabalho_Joao
      monday          00:00-24:00
      tuesday         00:00-24:00
      wednesday       00:00-24:00
      thursday        00:00-24:00
      friday          00:00-24:00
      exclude         Folgas_Joao
}
  ```
  
  <span style="color:#696969">Dessa forma, a verificação ocorrerá "todos os dias", menos os dias que João irá estará fora do escritório (estabelecido pelo exclude, dentro do timeperiod Folgas_Joao) e João não será notificado enquanto estiver fora do escritório.</span>



## <span style="color:#d86c00">**Modelos de criação de períodos**</span>

<span style="color:#696969">O período abaixo declara o tempo de verificação para 24 horas por dia, 7 dias por semana, ou seja, será verificado a todo momento.</span>

```bash
# Modelo muito usado!!
define timeperiod {

    name                24x7
    timeperiod_name     24x7
    alias               24 horas por dia, 7 dias por semana
    
    sunday              00:00-24:00
    monday              00:00-24:00
    tuesday             00:00-24:00
    wednesday           00:00-24:00
    thursday            00:00-24:00
    friday              00:00-24:00
    saturday            00:00-24:00
}
```



<span style="color:#696969">O período abaixo declara o tempo de verificação apenas para o horário comercial, ou seja, será verificado somente de segunda a sexta, dás 08 às 17 horas da tarde.</span>

```yaml
define timeperiod {
name                Comercial
timeperiod_name     Comercial

monday              08:00-17:00
tuesday             08:00-17:00
wednesday           08:00-17:00
thursday            08:00-17:00
friday              08:00-17:00
}
```



<span style="color:#696969">Algumas opções interessantes que podem ser usadas:</span>


```yaml
# Dia 2 de todo mês:
day 2              00:00-24:00

# Ultima sexta-feira de todo mês:
friday -2          00:00-24:00   ; 2nd to last Friday of every month

# Terceira segunda-feira de todo mês:
monday 3           00:00-24:00

# Do dia 10 ao dia 15 de Julho de todo ano:
july 10 - 15       00:00-24:00

# Do dia 1 ao dia 15 de todo mês:
day 1 - 15         00:00-24:00   

# Do dia 20 até o ultimo dia do mês, de todos os meses:
day 20 - -1        00:00-24:00

# A cada 5 dias, do 1º ao 15º dia de cada mês
# ou seja, de 5 em 5 dias, sendo do 1° ao 15° dia:
day 1 - 15 / 5	   00:00-24:00
```

