; operações aritméticas com + e -

$d = "0123456789"
$s = "+-"

; checa validade da entrada
bloco main 01
  01 X $d e -- 02 X $d i
  02 X * i -- 03 X < d
  03 X $d i -- 10 Z < d

  10 valida 11

  11 inicioX 13
  12 inicioY 13
  13 inicioZ 20

  20 Y + i -- 21 Y + i
  20 Y - i -- 22 Y - i
  21 plus 40
  22 minus 40
  
  40 aceita
  50 rejeita
fim main

; valida a entrada copiando ela pra fita Z
bloco valida 1
  01 X $d d -- 01 Z $d d
  01 X $s i -- 04 Z $s d
  01 X = d -- 02 Z = d

  02 X * i -- 03 X > i
  03 Z * i -- 05 Z > i

  04 X $s d -- 01 Y $s i
  
  05 retorne
fim valida

; volta o cabecote da fita X para o inicio
bloco inicioX 01
  01 X > i -- 01 X * e
  01 X = i -- 01 X * e
  01 X $d i -- 01 X $d e
  01 X $s i -- 01 X $s e
  01 X < i -- 05 X * d
  01 X * i -- 05 X * i

  05 retorne
fim inicio

; volta o cabecote da fita Y para o inicio
bloco inicioY 01
  01 Y > i -- 01 Y * e
  01 Y = i -- 01 Y * e
  01 Y $d i -- 01 Y $d e
  01 Y $s i -- 01 Y $s e
  01 Y < i -- 05 Y * d
  01 Y * i -- 05 Y * i

  05 retorne
fim inicio

; volta o cabecote da fita Z para o inicio
bloco inicioZ 01
  01 Z > i -- 01 Z * e
  01 Z = i -- 01 Z * e
  01 Z $d i -- 01 Z $d e
  01 Z $s i -- 01 Z $s e
  01 Z < i -- 05 Z * d
  01 Z * i -- 05 Z * i

  05 retorne
fim inicio

; operacao de soma
bloco plus 01
  01 retorne
fim plus

; operacao de subtracao
bloco minus 01
  01 retorne
fim minus