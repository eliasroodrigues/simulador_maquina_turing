; operações aritméticas com + e -

$d = "0123456789"
$s = "+-"

; checa validade da entrada
bloco main 01
  01 X $d e -- 2 X $d i
  02 X * i -- 03 X < d
  03 X $d i -- 10 Z < d

  10 valida 11
  11 inicio 40
  12 operacao 40
  
  40 aceita
  50 rejeita
fim main

; valida a entrada copiando ela pra fita Z
bloco valida 1
  01 X $d d -- 01 Z $d d
  01 X $s d -- 01 Z $s d
  01 X = d -- 02 Z = d

  02 X * i -- 05 X > i
  
  05 retorne
fim valida

; volta o cabecote da fita X para o inicio
bloco inicio 01
  01 X > i -- 01 X * e
  01 X = i -- 01 X * e
  01 X $d i -- 01 X $d e
  01 X $s i -- 01 X $s e
  01 X < i -- 05 X * d

  05 retorne
fim inicio

; verifica o tipo de oprecao
bloco operacao 01
  01 X
fim operacao