; =================================================================
; Programação de expressão aritmética simples envolvendo números
; inteiros positivos e um dos operadores - ou +.
;
; ENTRADA: "23 + 652 ="
;
; SAÍDA: caso a entrada fornecida seja válida, o programa deverá
; explicitar o resultado do reconhecimento com ACEITA ou REJEITA.
; Além disso, caso a entrada fornecida seja válida, deverá calcular
; o resultado da operação e apresentar isso nas fitas X, Y, Z.
;
; Autor: Elias Rodrigues, IFMG, 2022
; =================================================================

; aliases
$w = "abcdefghij"
$d = "1234567890"
$s = "+-"

; =================================================================
; executa a operação
bloco main 01
  01 X $d i -- 02 X $d e
  01 X * i -- 50 X * i
  02 X * i -- 03 X < i
  03 X < d -- 10 Z < d
  
  10 valida 11

  11 inicioX 20
  
  20 Y + i -- 21 Y + d
  20 Y - i -- 22 Y - d

  21 plus 30
  22 minus 30

  30 monta 40
  
  40 aceita
  50 rejeita
fim main
; =================================================================

; =================================================================
; valida a entrada da fita X e copia o operador para a fita Y
bloco valida 1
  01 X $d i -- 01 X * d
  01 X $s i -- 15 X * i
  01 X * i -- 10 X * i

  15 X $s d -- 02 Y $s i

  02 X $d i -- 02 X * d
  02 X = i -- 03 X * i
  02 X * i -- 10 X * i 

  03 X = i -- 04 X * d
  04 X * i -- 05 X > i

  05 retorne
  10 rejeita
fim valida

; monta a resposta
bloco monta 01
  01 verificaZ 02

  02 Z * i -- 03 Z 1 i
  03 Y $d i -- 04 Y $d d
  03 Y * i -- 05 Y > i
  04 Y * i -- 05 Y > i

  05 inicioZ 06
  06 copiaXZ 15

  15 retorne
fim monta

; copia a entrada da fita X e o resultado da fita Y para a fita Z
bloco copiaXZ 01
  01 X < d -- 02 Z < d

  02 X a d -- 02 Z 1 d
  02 X b d -- 02 Z 2 d
  02 X c d -- 02 Z 3 d
  02 X d d -- 02 Z 4 d
  02 X e d -- 02 Z 5 d
  02 X f d -- 02 Z 6 d
  02 X g d -- 02 Z 7 d
  02 X h d -- 02 Z 8 d
  02 X i d -- 02 Z 9 d
  02 X j d -- 02 Z 0 d
  02 X $s d -- 02 Z $s d
  02 X = i -- 03 Z = d

  03 Y > i -- 03 Y > e
  03 Y $d e -- 03 Z $d d
  03 Y - e -- 03 Z - d
  03 Y + i -- 04 Y + i
  03 Y < i -- 04 Y < i

  04 Z * i -- 05 Z > i

  05 retorne
fim copiaXZ
; =================================================================

; =================================================================
; volta o cabecote da fita X para o simbolo <
bloco inicioX 01
  01 X > i -- 01 X * e
  01 X = i -- 01 X * e
  01 X $d i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $s i -- 01 X * e
  01 X < i -- 05 X * d
  01 X * i -- 05 X * i

  05 retorne
fim inicio

; volta o cabecote da fita Z para o simbolo <
bloco inicioZ 01
  01 Z $d i -- 01 Z $d e
  01 Z $s i -- 01 Z $s e
  01 Z < i -- 05 Z < i

  05 retorne
fim inicio

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
; =================================================================

; =================================================================
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
; =================================================================

; =================================================================
; verifica se tem sobra na fita Z
bloco verificaZ 01
  01 Z $d i -- 05 Y $d d
  01 Z * i -- 05 Z * i

  05 retorne
fim verificaZ
; =================================================================

; =================================================================
; move o cabecote X para procurar um numero do = ate o operador
bloco findNumOp 01
  01 X = i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $d i -- 05 X * i
  01 X $s i -- 05 X * i
  01 X * i -- 10 X * i

  05 retorne
  10 rejeita
fim findNumOp

; move o cabecote X para procurar um numero do operador ate o <
bloco findNumMenor 01
  01 X $s i -- 01 X * e
  01 X $w i -- 01 X * e
  01 X $d i -- 05 X * i
  01 X < i -- 05 X * i
  01 X * i -- 10 X * i

  05 retorne
  10 rejeita
fim findNumMenor
; =================================================================

; =================================================================
; copia o numero do cabeçote da fita X para a fita Y
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

  25 retorne
fim copiaNumY
; =================================================================

; =================================================================
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

; soma o valor 0
bloco somaZero 01
  01 X 1 i -- 11 Y 1 i
  01 X 2 i -- 12 Y 2 i
  01 X 3 i -- 13 Y 3 i
  01 X 4 i -- 14 Y 4 i
  01 X 5 i -- 15 Y 5 i
  01 X 6 i -- 16 Y 6 i
  01 X 7 i -- 17 Y 7 i
  01 X 8 i -- 18 Y 8 i
  01 X 9 i -- 19 Y 9 i
  01 X 0 i -- 20 Y 0 i

  11 Z 1 i -- 31 Y 2 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 3 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 4 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 5 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 6 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 7 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 8 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 9 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 30 Y 0 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 31 Y 1 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaZero

; soma o valor 1
bloco somaUm 01
  01 X 1 i -- 11 Y 2 i
  01 X 2 i -- 12 Y 3 i
  01 X 3 i -- 13 Y 4 i
  01 X 4 i -- 14 Y 5 i
  01 X 5 i -- 15 Y 6 i
  01 X 6 i -- 16 Y 7 i
  01 X 7 i -- 17 Y 8 i
  01 X 8 i -- 18 Y 9 i
  01 X 9 i -- 19 Y 0 i
  01 X 0 i -- 20 Y 1 i

  11 Z 1 i -- 31 Y 3 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 4 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 5 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 6 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 7 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 8 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 9 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 30 Y 0 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 30 Y 1 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 2 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaUm

; soma o valor 2
bloco somaDois 01
  01 X 1 i -- 11 Y 3 i
  01 X 2 i -- 12 Y 4 i
  01 X 3 i -- 13 Y 5 i
  01 X 4 i -- 14 Y 6 i
  01 X 5 i -- 15 Y 7 i
  01 X 6 i -- 16 Y 8 i
  01 X 7 i -- 17 Y 9 i
  01 X 8 i -- 18 Y 0 i
  01 X 9 i -- 19 Y 1 i
  01 X 0 i -- 20 Y 2 i

  11 Z 1 i -- 31 Y 4 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 5 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 6 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 7 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 8 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 9 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 30 Y 0 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 30 Y 1 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 2 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 3 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaDois

; soma o valor 3
bloco somaTres 01
  01 X 1 i -- 11 Y 4 i
  01 X 2 i -- 12 Y 5 i
  01 X 3 i -- 13 Y 6 i
  01 X 4 i -- 14 Y 7 i
  01 X 5 i -- 15 Y 8 i
  01 X 6 i -- 16 Y 9 i
  01 X 7 i -- 17 Y 0 i
  01 X 8 i -- 18 Y 1 i
  01 X 9 i -- 19 Y 2 i
  01 X 0 i -- 20 Y 3 i

  11 Z 1 i -- 31 Y 5 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 6 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 7 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 8 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 9 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 30 Y 0 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 30 Y 1 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 2 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 3 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 4 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaTres

; soma o valor 4
bloco somaQuatro 01
  01 X 1 i -- 11 Y 5 i
  01 X 2 i -- 12 Y 6 i
  01 X 3 i -- 13 Y 7 i
  01 X 4 i -- 14 Y 8 i
  01 X 5 i -- 15 Y 9 i
  01 X 6 i -- 16 Y 0 i
  01 X 7 i -- 17 Y 1 i
  01 X 8 i -- 18 Y 2 i
  01 X 9 i -- 19 Y 3 i
  01 X 0 i -- 20 Y 4 i

  11 Z 1 i -- 31 Y 6 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 7 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 8 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 9 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 30 Y 0 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 30 Y 1 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 2 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 3 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 4 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 5 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaQuatro

; soma o valor 5
bloco somaCinco 01
  01 X 1 i -- 11 Y 6 i
  01 X 2 i -- 12 Y 7 i
  01 X 3 i -- 13 Y 8 i
  01 X 4 i -- 14 Y 9 i
  01 X 5 i -- 15 Y 0 i
  01 X 6 i -- 16 Y 1 i
  01 X 7 i -- 17 Y 2 i
  01 X 8 i -- 18 Y 3 i
  01 X 9 i -- 19 Y 4 i
  01 X 0 i -- 20 Y 5 i

  11 Z 1 i -- 31 Y 7 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 8 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 9 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 30 Y 0 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 30 Y 1 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 2 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 3 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 4 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 5 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 6 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaCinco

; soma o valor 6
bloco somaSeis 01
  01 X 1 i -- 11 Y 7 i
  01 X 2 i -- 12 Y 8 i
  01 X 3 i -- 13 Y 9 i
  01 X 4 i -- 14 Y 0 i
  01 X 5 i -- 15 Y 1 i
  01 X 6 i -- 16 Y 2 i
  01 X 7 i -- 17 Y 3 i
  01 X 8 i -- 18 Y 4 i
  01 X 9 i -- 19 Y 5 i
  01 X 0 i -- 20 Y 6 i

  11 Z 1 i -- 31 Y 8 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 9 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 30 Y 0 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 30 Y 1 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 2 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 3 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 4 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 5 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 6 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 7 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaSeis

; soma o valor 7
bloco somaSete 01
  01 X 1 i -- 11 Y 8 i
  01 X 2 i -- 12 Y 9 i
  01 X 3 i -- 13 Y 0 i
  01 X 4 i -- 14 Y 1 i
  01 X 5 i -- 15 Y 2 i
  01 X 6 i -- 16 Y 3 i
  01 X 7 i -- 17 Y 4 i
  01 X 8 i -- 18 Y 5 i
  01 X 9 i -- 19 Y 6 i
  01 X 0 i -- 20 Y 7 i

  11 Z 1 i -- 31 Y 1 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 30 Y 0 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 30 Y 1 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 2 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 3 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 4 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 5 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 6 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 7 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 8 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaSete

; soma o valor 8
bloco somaOito 01
  01 X 1 i -- 11 Y 9 i
  01 X 2 i -- 12 Y 0 i
  01 X 3 i -- 13 Y 1 i
  01 X 4 i -- 14 Y 2 i
  01 X 5 i -- 15 Y 3 i
  01 X 6 i -- 16 Y 4 i
  01 X 7 i -- 17 Y 5 i
  01 X 8 i -- 18 Y 6 i
  01 X 9 i -- 19 Y 7 i
  01 X 0 i -- 20 Y 8 i

  11 Z 1 i -- 30 Y 0 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 30 Y 1 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 2 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 3 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 4 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 5 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 6 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 7 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 8 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 31 Y 9 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaOito

; soma o valor 9
bloco somaNove 01
  01 X 1 i -- 11 Y 0 i
  01 X 2 i -- 12 Y 1 i
  01 X 3 i -- 13 Y 2 i
  01 X 4 i -- 14 Y 3 i
  01 X 5 i -- 15 Y 4 i
  01 X 6 i -- 16 Y 5 i
  01 X 7 i -- 17 Y 6 i
  01 X 8 i -- 18 Y 7 i
  01 X 9 i -- 19 Y 8 i
  01 X 0 i -- 20 Y 9 i

  11 Z 1 i -- 30 Y 1 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 2 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 3 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 4 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 5 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 6 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 7 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 8 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 9 i
  19 Z * i -- 30 Z 1 i
  20 Z 1 i -- 30 Y 0 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim somaNove
; =================================================================

; =================================================================
; verifica se tem algo pra somar na fita Z
bloco somaZ 01
  01 Z 1 i -- 02 Z 1 d
  01 Z * i -- 11 Z * i

  02 Y 1 i -- 10 Y 2 d
  02 Y 2 i -- 10 Y 3 d
  02 Y 3 i -- 10 Y 4 d
  02 Y 4 i -- 10 Y 5 d
  02 Y 5 i -- 10 Y 6 d
  02 Y 6 i -- 10 Y 7 d
  02 Y 7 i -- 10 Y 8 d
  02 Y 8 i -- 10 Y 9 d
  02 Y 9 i -- 03 Y 0 d
  02 Y 0 i -- 10 Y 1 d
  02 Y * i -- 10 Y 1 d

  03 Y * i -- 10 Z 1 i

  11 Y $d i -- 10 Y $d d
  11 Y * i -- 10 Y * i

  10 retorne
fim somaZ

; verifica se tem algo pra subtrair na fita Z
bloco subtraiZ 01
  01 Z 1 i -- 02 Z 1 d
  01 Z * i -- 11 Z * i

  02 Y 1 i -- 10 Y 0 d
  02 Y 2 i -- 10 Y 1 d
  02 Y 3 i -- 10 Y 2 d
  02 Y 4 i -- 10 Y 3 d
  02 Y 5 i -- 10 Y 4 d
  02 Y 6 i -- 10 Y 5 d
  02 Y 7 i -- 10 Y 6 d
  02 Y 8 i -- 10 Y 7 d
  02 Y 9 i -- 10 Y 8 d
  02 Y 0 i -- 03 Y 9 d
  02 Y * i -- 10 Y 1 d

  03 Y * i -- 10 Z 1 i

  11 Y $d i -- 10 Y $d d
  11 Y * i -- 10 Y * i

  10 retorne
fim subtraiZ

; verifica se tem mais numeros do lado direito do operador
bloco restoPlus 01
  01 moveXigual 02
  02 findNumOp 03
  
  03 X $s i -- 05 X * i
  03 X $d i -- 04 X * i

  04 copiaNumY 12
  12 somaZ 01

  05 inicioX 06

  06 X $w i -- 10 X $w e

  10 retorne
fim restoPlus

; verifica se tem mais numeros do lado direito do operador
bloco restoMinus 01
  01 moveXigual 02
  02 findNumOp 03
  
  03 X $s i -- 05 X * i
  03 X $d i -- 04 X * i

  04 copiaNumY 12
  12 subtraiZ 01

  05 inicioX 06

  06 X $w i -- 10 X $w e

  10 retorne
fim restoMinus
; =================================================================

; =================================================================
; operacao de soma
bloco plus 01
  01 moveXigual 02
  02 findNumOp 03

  03 X $s i -- 06 X * i
  03 X $d i -- 04 X * i

  04 copiaNumY 05
  05 moveXOp 06
  06 findNumMenor 07

  07 X < i -- 15 X * i
  07 X $d i -- 08 X * i
  
  08 verificaSoma 01

  15 somaZ 20

  20 restoPlus 30

  30 retorne
fim plus

; operacao de subtracao
bloco minus 01
  01 verificaMaior 02

  02 Z + i -- 03 Z * i
  02 Z - i -- 04 Z * i
  02 Z * i -- 03 Z * i

  03 conserta 05
  04 conserta 06

  05 menosMais 30
  06 menosMenos 07

  07 Y * i -- 30 Y - d

  30 retorne
fim minus

; conserta as fitas
bloco conserta 01
  01 X < i -- 01 X < d
  01 X a i -- 01 X 1 d
  01 X b i -- 01 X 2 d
  01 X c i -- 01 X 3 d
  01 X d i -- 01 X 4 d
  01 X e i -- 01 X 5 d
  01 X f i -- 01 X 6 d
  01 X g i -- 01 X 7 d
  01 X h i -- 01 X 8 d
  01 X i i -- 01 X 9 d
  01 X j i -- 01 X 0 d
  01 X $s i -- 01 X $s d
  01 X $d i -- 01 X $d d
  01 X = i -- 02 X = i

  02 Y $d i -- 03 Y < d

  03 inicioX 05

  05 retorne
fim conserta

; lado esquerdo é maior ou igual oa lado direito
bloco menosMais 01
  01 moveXigual 02
  02 findNumOp 03

  03 X $s i -- 06 X * i
  03 X $d i -- 04 X * i

  04 copiaNumY 05
  05 moveXOp 06
  06 findNumMenor 07

  07 X < i -- 15 X * i
  07 X $d i -- 08 X * i

  08 verificaMenos 01

  15 subtraiZ 20

  20 restoMinus 30

  30 retorne
fim menosMais

; move X ate o operador
bloco moveXoperador 01
  01 X $d i -- 01 X $d d
  01 X $w i -- 01 X $w d
  01 X $s i -- 05 X $s i

  05 retorne
fim moveXoperador

; lado esquerdo é menor que o lado direito
bloco menosMenos 01
  01 moveXoperador 02
  02 findNumMenor 03

  03 X < i -- 05 X * i
  03 X $d i -- 04 X * i

  04 copiaNumY 05
  05 moveXigual 06
  06 findNumOp 07

  07 X $s i -- 15 X * i
  07 X $d i -- 08 X * i

  08 verificaMenos 09

  09 inicioX 01

  15 subtraiZ 20

  20 restoMinus 30

  30 retorne
fim menosMenos

; verifica qual lado é maior
bloco verificaMaior 01
  01 moveXigual 02
  02 findNumOp 03

  03 X $s i -- 05 X * i
  03 X $d i -- 04 Y $d i

  04 copiaNumY 05
  05 moveXOp 06
  06 findNumMenor 07

  07 X < i -- 09 X < i
  07 X $d i -- 08 X $d i

  08 diferenca 01

  09 Y $d i -- 10 Z - i
  09 Y * i -- 10 Y 1 i

  10 retorne
fim verificaMaior

; qual valor é maior
bloco diferenca 01
  01 Y 1 i -- 11 Y 1 d
  01 Y 2 i -- 12 Y 2 d
  01 Y 3 i -- 13 Y 3 d
  01 Y 4 i -- 14 Y 4 d
  01 Y 5 i -- 15 Y 5 d
  01 Y 6 i -- 16 Y 6 d
  01 Y 7 i -- 17 Y 7 d
  01 Y 8 i -- 18 Y 8 d
  01 Y 9 i -- 19 Y 9 d
  01 Y 0 i -- 20 Y 0 d
  01 Y * i -- 25 Z + i

  11 X 0 i -- 25 Z - i
  11 X 1 i -- 25 Z * i
  11 X * i -- 25 Z + i
  12 X 0 i -- 25 Z - i
  12 X 1 i -- 25 Z - i
  12 X 2 i -- 25 Z * i
  12 X * i -- 25 Z + i
  13 X 0 i -- 25 Z - i
  13 X 1 i -- 25 Z - i
  13 X 2 i -- 25 Z - i
  13 X 3 i -- 25 Z * i
  13 X * i -- 25 Z + i
  14 X 0 i -- 25 Z - i
  14 X 1 i -- 25 Z - i
  14 X 2 i -- 25 Z - i
  14 X 3 i -- 25 Z - i
  14 X 4 i -- 25 Z * i
  14 X * i -- 25 Z + i
  15 X 0 i -- 25 Z - i
  15 X 1 i -- 25 Z - i
  15 X 2 i -- 25 Z - i
  15 X 3 i -- 25 Z - i
  15 X 4 i -- 25 Z - i
  15 X 5 i -- 25 Z * i
  15 X * i -- 25 Z + i
  16 X 0 i -- 25 Z - i
  16 X 1 i -- 25 Z - i
  16 X 2 i -- 25 Z - i
  16 X 3 i -- 25 Z - i
  16 X 4 i -- 25 Z - i
  16 X 5 i -- 25 Z - i
  16 X 6 i -- 25 Z * i
  16 X * i -- 25 Z + i
  17 X 0 i -- 25 Z - i
  17 X 1 i -- 25 Z - i
  17 X 2 i -- 25 Z - i
  17 X 3 i -- 25 Z - i
  17 X 4 i -- 25 Z - i
  17 X 5 i -- 25 Z - i
  17 X 6 i -- 25 Z - i
  17 X 7 i -- 25 Z * i
  17 X * i -- 25 Z + i
  18 X 0 i -- 25 Z - i
  18 X 1 i -- 25 Z - i
  18 X 2 i -- 25 Z - i
  18 X 3 i -- 25 Z - i
  18 X 4 i -- 25 Z - i
  18 X 5 i -- 25 Z - i
  18 X 6 i -- 25 Z - i
  18 X 7 i -- 25 Z - i
  18 X 8 i -- 25 Z * i
  18 X * i -- 25 Z + i
  19 X 0 i -- 25 Z - i
  19 X 1 i -- 25 Z - i
  19 X 2 i -- 25 Z - i
  19 X 3 i -- 25 Z - i
  19 X 4 i -- 25 Z - i
  19 X 5 i -- 25 Z - i
  19 X 6 i -- 25 Z - i
  19 X 7 i -- 25 Z - i
  19 X 8 i -- 25 Z - i
  19 X 9 i -- 25 Z * i
  19 X * i -- 25 Z + i
  20 X * i -- 25 Z * i

  25 trocaNum 30

  30 retorne
fim diferenca
; =================================================================

; =================================================================
; verifica o valor a ser subtraído
bloco verificaMenos 01
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
  01 Y * i -- 20 Y * i

  11 menosUm 25
  12 menosDois 25
  13 menosTres 25
  14 menosQuatro 25
  15 menosCinco 25
  16 menosSeis 25
  17 menosSete 25
  18 menosOito 25
  19 menosNove 25
  20 menosZero 25

  25 trocaNum 30

  30 retorne
fim verificaMenos

; subtrai o valor 0
bloco menosZero 01
  01 X 1 i -- 11 Y 1 i
  01 X 2 i -- 12 Y 2 i
  01 X 3 i -- 13 Y 3 i
  01 X 4 i -- 14 Y 4 i
  01 X 5 i -- 15 Y 5 i
  01 X 6 i -- 16 Y 6 i
  01 X 7 i -- 17 Y 7 i
  01 X 8 i -- 18 Y 8 i
  01 X 9 i -- 19 Y 9 i
  01 X 0 i -- 20 Y 0 i

  11 Z 1 i -- 31 Y 0 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 1 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 2 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 3 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 4 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 5 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 6 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 7 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 8 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 9 i
  20 Z * i -- 30 Z * i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosZero

; subtrai o valor 1
bloco menosUm 01
  01 X 1 i -- 11 Y 0 i
  01 X 2 i -- 12 Y 1 i
  01 X 3 i -- 13 Y 2 i
  01 X 4 i -- 14 Y 3 i
  01 X 5 i -- 15 Y 4 i
  01 X 6 i -- 16 Y 5 i
  01 X 7 i -- 17 Y 6 i
  01 X 8 i -- 18 Y 7 i
  01 X 9 i -- 19 Y 8 i
  01 X 0 i -- 20 Y 9 i

  11 Z 1 i -- 30 Y 9 i
  11 Z * i -- 30 Z * i
  12 Z 1 i -- 31 Y 0 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 1 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 2 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 3 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 4 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 5 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 6 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 7 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 8 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosUm

; subtrai o valor 2
bloco menosDois 01
  01 X 1 i -- 11 Y 9 i
  01 X 2 i -- 12 Y 0 i
  01 X 3 i -- 13 Y 1 i
  01 X 4 i -- 14 Y 2 i
  01 X 5 i -- 15 Y 3 i
  01 X 6 i -- 16 Y 4 i
  01 X 7 i -- 17 Y 5 i
  01 X 8 i -- 18 Y 6 i
  01 X 9 i -- 19 Y 7 i
  01 X 0 i -- 20 Y 8 i

  11 Z 1 i -- 30 Y 8 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 9 i
  12 Z * i -- 30 Z * i
  13 Z 1 i -- 31 Y 0 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 1 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 2 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 3 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 4 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 5 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 6 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 7 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosDois

; subtrai o valor 3
bloco menosTres 01
  01 X 1 i -- 11 Y 8 i
  01 X 2 i -- 12 Y 9 i
  01 X 3 i -- 13 Y 0 i
  01 X 4 i -- 14 Y 1 i
  01 X 5 i -- 15 Y 2 i
  01 X 6 i -- 16 Y 3 i
  01 X 7 i -- 17 Y 4 i
  01 X 8 i -- 18 Y 5 i
  01 X 9 i -- 19 Y 6 i
  01 X 0 i -- 20 Y 7 i

  11 Z 1 i -- 30 Y 7 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 8 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 9 i
  13 Z * i -- 30 Z * i
  14 Z 1 i -- 31 Y 0 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 1 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 2 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 3 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 4 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 5 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 6 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosTres

; subtrai o valor 4
bloco menosQuatro 01
  01 X 1 i -- 11 Y 7 i
  01 X 2 i -- 12 Y 8 i
  01 X 3 i -- 13 Y 9 i
  01 X 4 i -- 14 Y 0 i
  01 X 5 i -- 15 Y 1 i
  01 X 6 i -- 16 Y 2 i
  01 X 7 i -- 17 Y 3 i
  01 X 8 i -- 18 Y 4 i
  01 X 9 i -- 19 Y 5 i
  01 X 0 i -- 20 Y 6 i

  11 Z 1 i -- 30 Y 6 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 7 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 8 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 9 i
  14 Z * i -- 30 Z * i
  15 Z 1 i -- 31 Y 0 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 1 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 2 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 3 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 4 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 5 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosQuatro

; subtrai o valor 5
bloco menosCinco 01
  01 X 1 i -- 11 Y 6 i
  01 X 2 i -- 12 Y 7 i
  01 X 3 i -- 13 Y 8 i
  01 X 4 i -- 14 Y 9 i
  01 X 5 i -- 15 Y 0 i
  01 X 6 i -- 16 Y 1 i
  01 X 7 i -- 17 Y 2 i
  01 X 8 i -- 18 Y 3 i
  01 X 9 i -- 19 Y 4 i
  01 X 0 i -- 20 Y 5 i

  11 Z 1 i -- 30 Y 5 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 6 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 7 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 8 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 9 i
  15 Z * i -- 30 Z * i
  16 Z 1 i -- 31 Y 0 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 1 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 2 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 3 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 4 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosCinco

; subtrai o valor 6
bloco menosSeis 01
  01 X 1 i -- 11 Y 5 i
  01 X 2 i -- 12 Y 6 i
  01 X 3 i -- 13 Y 7 i
  01 X 4 i -- 14 Y 8 i
  01 X 5 i -- 15 Y 9 i
  01 X 6 i -- 16 Y 0 i
  01 X 7 i -- 17 Y 1 i
  01 X 8 i -- 18 Y 2 i
  01 X 9 i -- 19 Y 3 i
  01 X 0 i -- 20 Y 4 i

  11 Z 1 i -- 30 Y 4 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 5 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 6 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 7 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 8 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 9 i
  16 Z * i -- 30 Z * i
  17 Z 1 i -- 31 Y 0 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 1 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 2 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 3 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosSeis

; subtrai o valor 7
bloco menosSete 01
  01 X 1 i -- 11 Y 4 i
  01 X 2 i -- 12 Y 5 i
  01 X 3 i -- 13 Y 6 i
  01 X 4 i -- 14 Y 7 i
  01 X 5 i -- 15 Y 8 i
  01 X 6 i -- 16 Y 9 i
  01 X 7 i -- 17 Y 0 i
  01 X 8 i -- 18 Y 1 i
  01 X 9 i -- 19 Y 2 i
  01 X 0 i -- 20 Y 3 i

  11 Z 1 i -- 30 Y 3 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 4 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 5 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 6 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 7 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 8 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 9 i
  17 Z * i -- 30 Z * i
  18 Z 1 i -- 31 Y 0 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 1 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 2 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosSete

; subtrai o valor 8
bloco menosOito 01
  01 X 1 i -- 11 Y 3 i
  01 X 2 i -- 12 Y 4 i
  01 X 3 i -- 13 Y 5 i
  01 X 4 i -- 14 Y 6 i
  01 X 5 i -- 15 Y 7 i
  01 X 6 i -- 16 Y 8 i
  01 X 7 i -- 17 Y 9 i
  01 X 8 i -- 18 Y 0 i
  01 X 9 i -- 19 Y 1 i
  01 X 0 i -- 20 Y 2 i

  11 Z 1 i -- 30 Y 2 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 3 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 4 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 5 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 6 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 7 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 8 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 9 i
  18 Z * i -- 30 Z * i
  19 Z 1 i -- 31 Y 0 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 1 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosOito

; subtrai o valor 9
bloco menosNove 01
  01 X 1 i -- 11 Y 2 i
  01 X 2 i -- 12 Y 3 i
  01 X 3 i -- 13 Y 4 i
  01 X 4 i -- 14 Y 5 i
  01 X 5 i -- 15 Y 6 i
  01 X 6 i -- 16 Y 7 i
  01 X 7 i -- 17 Y 8 i
  01 X 8 i -- 18 Y 9 i
  01 X 9 i -- 19 Y 0 i
  01 X 0 i -- 20 Y 1 i

  11 Z 1 i -- 30 Y 1 i
  11 Z * i -- 30 Z 1 i
  12 Z 1 i -- 30 Y 2 i
  12 Z * i -- 30 Z 1 i
  13 Z 1 i -- 30 Y 3 i
  13 Z * i -- 30 Z 1 i
  14 Z 1 i -- 30 Y 4 i
  14 Z * i -- 30 Z 1 i
  15 Z 1 i -- 30 Y 5 i
  15 Z * i -- 30 Z 1 i
  16 Z 1 i -- 30 Y 6 i
  16 Z * i -- 30 Z 1 i
  17 Z 1 i -- 30 Y 7 i
  17 Z * i -- 30 Z 1 i
  18 Z 1 i -- 30 Y 8 i
  18 Z * i -- 30 Z 1 i
  19 Z 1 i -- 30 Y 9 i
  19 Z * i -- 30 Z * i
  20 Z 1 i -- 30 Y 0 i
  20 Z * i -- 30 Z 1 i

  30 Y $d i -- 40 Y $d d
  31 Z 1 i -- 30 Z 1 d

  40 retorne
fim menosNove
; =================================================================
