; operações aritméticas com + e -

$d = "0123456789"
$s = "+-"

; checa validade da entrada
bloco main 01
  01 X $d e -- 02 X $d i
  02 X $d i -- 03 X < d
  03 X $d i -- 10 Z < d

  10 valida 40
  
  40 aceita
  50 rejeita
fim main

; valida a entrada copiando ela pra fita Z
bloco valida 1
  01 X $d d -- 01 Z $d d
  01 X $s d -- 01 Z $s d
  01 X * d -- 01 Z * d
  01 X = i -- 05 Z = i
  
  05 retorne
fim valida