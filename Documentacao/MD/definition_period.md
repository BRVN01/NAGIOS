<span style="color:#d86c00">**Sumário**</span>

[TOC]

# <span style="color:#d86c00">**Introdução**</span>

<span style="color:#696969">Muitas vezes necessitamos de períodos de verificações e notificações diferentes do habitual, normalmente essas verificações e notificações ocorrem no mesmo período, o que muda são as pessoas notificadas (grupos de pessoas que serão notificadas em tempos diferentes).</span>

<span style="color:#696969">Portanto, vamos ver alguns modelos de criação de períodos de tempos:</span>



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


```bash
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



<span style="color:#696969">Aplicando a variável ***name***, criamos um modelo que poderá ser importado pela variável ***use***, dessa forma, poderemos importar propriedades que não tenham em nosso período.</span>

<span style="color:#696969">Algumas opções interessantes que podem ser usadas:</span>

```bash
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

