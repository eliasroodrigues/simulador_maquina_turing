; copia o inteiro na fita X, fornecido na entrada, para as fitas Y e Z

$n = "0123456789"
$s = "+-"
$d = "<>="

bloco main 01
  01 X $n d -- 01 X $n d
  01 X $s i -- 04 X $s i
  03 copiaX 04
  04 aceita
  05 rejeita
fim main

bloco copiaX 01
  01 X $n i -- 03 Y $n d
  03 X $n i -- 01 Z $n d
fim copiaX