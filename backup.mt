; operações aritméticas com + e -

$w = "abcdefghijklmniopqrstuvwxyz"
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

  20 Y + i -- 21 Y + d
  20 Y - i -- 22 Y - d
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

; move o cabecote X para o simbolo =
bloco moveXigual 01
  01 X < i -- 01 X * d
  01 X $d i -- 01 X * d
  01 X $s i -- 01 X * d
  01 X = i -- 02 X * i
  01 X * i -- 03 X * i

  02 retorne
  03 rejeita
fim moveXigual

; move o cabecote X para procurar um numero
bloco procuraNum 01
  01 X = i -- 01 X * e
  01 X + i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $d i -- 05 X $d i
  01 X < i -- 05 X < i

  05 retorne
fim procuraNum

; verifica qual o numero
bloco verificaNum 01
  01 X 1 i -- 11 X a i
  01 X 2 i -- 12 X b i
  01 X 3 i -- 13 X c i
  01 X 4 i -- 14 X d i
  01 X 5 i -- 15 X e i
  01 X 6 i -- 16 X f i
  01 X 7 i -- 17 X g i
  01 X 8 i -- 18 X h i
  01 X 9 i -- 19 X i i
  01 X 0 i -- 20 X j i
  01 X * i -- 30 X * i

  11 X a i -- 25 Y 1 i
  12 X b i -- 25 Y 2 i
  13 X c i -- 25 Y 3 i
  14 X d i -- 25 Y 4 i
  15 X e i -- 25 Y 5 i
  16 X f i -- 25 Y 6 i
  17 X g i -- 25 Y 7 i
  18 X h i -- 25 Y 8 i
  19 X i i -- 25 Y 9 i
  20 X j i -- 25 Y 0 i

  25 retorne
  30 rejeita
fim verificaNum

; move o cabecote X para o operador
bloco moveXOp 01
  01 X $w i -- 01 X * e
  01 X $s i -- 05 X * i

  05 retorne
fim moveXOp

; verifica qual o valor a ser somado
bloco verificaSoma 01
  01 Y 1 i -- 11 Y * i
  01 Y 2 i -- 12 Y * i
  01 Y 3 i -- 13 Y * i
  01 Y 4 i -- 14 Y * i
  01 Y 5 i -- 15 Y * i
  01 Y 6 i -- 16 Y * i
  01 Y 7 i -- 17 Y * i
  01 Y 8 i -- 18 Y * i
  01 Y 9 i -- 19 Y * i
  01 Y 0 i -- 20 Y * i

  11 somaUm 25
  12 somaDois 25
  13 somaTres 25
  14 somaQuatro 25
  15 somaCinco 25
  16 somaSeis 25
  17 somaSete 25
  18 somaOito 25
  19 somaNove 25
  20 somaZero 25

  25 retorne
fim verificaSoma

; soma o valor 1
bloco somaUm 01
  01 X 1 i -- 11
fim somaUm

; operacao de soma
bloco plus 01
  01 moveXigual 02
  02 procuraNum 03

  03 X < i -- 15 X * i
  03 X $d i -- 04 X * i

  04 verificaNum 05
  05 moveXOp 05
  05 procuraNum 06

  06 X < i -- 15 X * i
  06 X $d i -- 07 X * i
  
  07 verificaSoma 15

  15 retorne
fim plus

; operacao de subtracao
bloco minus 01
  01 retorne
fim minus