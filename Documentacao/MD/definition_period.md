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




