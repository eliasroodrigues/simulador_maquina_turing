; operações aritméticas com + e -

$w = "abcdefghij"
$d = "1234567890"
$s = "+-"

; =============================================
; checa validade da entrada
bloco main 01
  01 X $d i -- 02 X $d e
  02 X * i -- 10 X < d
  
  10 valida 11

  11 inicioX 20
  
  20 Y + i -- 21 Y + d
  20 Y - i -- 22 Y - d

  21 plus 40
  22 minus 40
  
  40 aceita
  50 rejeita
fim main

; valida a entrada copiando ela pra fita Z
bloco valida 1
  01 X $d i -- 01 X * d
  01 X $s i -- 04 X * i
  01 X = i -- 02 X * d
  02 X * i -- 05 X > i
  04 X $s d -- 01 Y $s i
  
  05 retorne
fim valida
; =============================================

; =============================================
; volta o cabecote da fita X para o inicio
bloco inicioX 01
  01 X > i -- 01 X * e
  01 X = i -- 01 X * e
  01 X $d i -- 01 X $d e
  01 X $w i -- 01 X $d e
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
  01 Y $w i -- 01 Y $w e
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
  01 Z $w i -- 01 Z $w e
  01 Z $s i -- 01 Z $s e
  01 Z < i -- 05 Z * d
  01 Z * i -- 05 Z * i

  05 retorne
fim inicio
; =============================================

; =============================================
; move o cabecote X para o simbolo =
bloco moveXigual 01
  01 X < i -- 01 X * d
  01 X $d i -- 01 X * d
  01 X $s i -- 01 X * d
  01 X $w i -- 01 X * d
  01 X = i -- 02 X * i
  01 X * i -- 03 X * i

  02 retorne
  03 rejeita
fim moveXigual

; move o cabecote X para o operador
bloco moveXOp 01
  01 X $d i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $s i -- 05 X * i

  05 retorne
fim moveXOp
; =============================================

; =============================================
; troca um numero pela letra
bloco trocaNum 01
  01 X 1 i -- 05 X a i
  01 X 2 i -- 05 X b i
  01 X 3 i -- 05 X c i
  01 X 4 i -- 05 X d i
  01 X 5 i -- 05 X e i
  01 X 6 i -- 05 X f i
  01 X 7 i -- 05 X g i
  01 X 8 i -- 05 X h i
  01 X 9 i -- 05 X i i
  01 X 0 i -- 05 X j i
  01 X * i -- 10 X * i

  05 retorne
  10 rejeita
fim trocaNum
; =============================================

; =============================================
; verifica se tem sobra na fita Z
bloco verificaZ 01
  01 Z $d i -- 02 Y * i
  01 Z * i -- 05 Y * i

  05 retorne
fim verificaZ
; =============================================

; =============================================
; move o cabecote X para procurar um numero ate o operador
bloco findNumOp 01
  01 X = i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $d i -- 05 X * i
  01 X $s i -- 05 X * i
  01 X * i -- 10 X * i

  05 retorne
  10 rejeita
fim findNumOp

; move o cabecote X para procurar um numero ate o <
bloco findNumMenor 01
  01 X $s i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $d i -- 05 X * i
  01 X < i -- 05 X * i
  01 X * i -- 10 X * i

  05 retorne
  10 rejeita
fim findNumMenor
; =============================================

; =============================================
; copia o numero para a fita Y
bloco copiaNumY 01
  01 trocaNum 02

  02 X a i -- 25 Y 1 i
  02 X b i -- 25 Y 2 i
  02 X c i -- 25 Y 3 i
  02 X d i -- 25 Y 4 i
  02 X e i -- 25 Y 5 i
  02 X f i -- 25 Y 6 i
  02 X g i -- 25 Y 7 i
  02 X h i -- 25 Y 8 i
  02 X i i -- 25 Y 9 i
  02 X j i -- 25 Y 0 i
  02 X * i -- 30 Y * i

  25 retorne
  30 rejeita
fim copiaNumY
; =============================================

; =============================================
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
  01 Y * i -- 20 Y * i

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

  25 trocaNum 30

  30 retorne
fim verificaSoma
; =============================================

; =============================================
; soma o valor 0
bloco somaZero 01
  01 X 1 i -- 15 Y 1 d
  01 X 2 i -- 15 Y 2 d
  01 X 3 i -- 15 Y 3 d
  01 X 4 i -- 15 Y 4 d
  01 X 5 i -- 15 Y 5 d
  01 X 6 i -- 15 Y 6 d
  01 X 7 i -- 15 Y 7 d
  01 X 8 i -- 15 Y 8 d
  01 X 9 i -- 15 Y 9 d
  01 X 0 i -- 15 Y 0 d

  15 retorne
fim somaZero

; soma o valor 1
bloco somaUm 01
  01 X 1 i -- 15 Y 2 d
  01 X 2 i -- 15 Y 3 d
  01 X 3 i -- 15 Y 4 d
  01 X 4 i -- 15 Y 5 d
  01 X 5 i -- 15 Y 6 d
  01 X 6 i -- 15 Y 7 d
  01 X 7 i -- 15 Y 8 d
  01 X 8 i -- 15 Y 9 d
  01 X 9 i -- 02 Y 0 i
  01 X 0 i -- 15 Y 1 d

  02 X 9 i -- 15 Y 1 i

  15 retorne
fim somaUm
; =============================================

; =============================================
; operacao de soma
bloco plus 01
  01 moveXigual 02
  02 findNumOp 03

  03 X $s i -- 06 X * i
  03 X $d i -- 04 X * i

  04 copiaNumY 05
  05 moveXOp 06
  06 findNumMenor 07

  07 X < i -- 20 X * i
  07 X $d i -- 08 X * i
  
  08 verificaSoma 01

  15 verificaZ 20

  20 retorne
fim plus
; =============================================

; =============================================
; operacao de subtracao
bloco minus 01
  01 retorne
fim minus
; =============================================
