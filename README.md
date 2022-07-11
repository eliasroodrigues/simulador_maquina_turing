# Simulador da Máquina de Turing

Trabalho realizado para a disciplina de Teoria da Computação do curso de Ciência da Computação,
IFMG Campus Formiga

# Objetivo

Programar um simulador da máquina de turing com três fitas: X, Y e Z. Além disso a máquina aceita
a criação de aliases, exemplo: $d = '1234567890'.

Exemplo de comando:

<estado atual> <fita de leitura> <simbolo de leitura> <movimento> -- <novo estado> <fita de escrita> <simbolo de escrita> <movimento>

# Métodos

O trabalho foi realizado na linguagem python 3 e testado no sistema linux.

# O arquivo MT

Para realizar a programação no simulador é necessário criar um arquivo com a extensão mt, como o arquivo de
teste disponibilizado nesse repositório (teste.mt).

# Excução

Para executar a máquina basta usar o seguinte comando utilizando o python 3 no terminal:

> python3 sim_turing.py [opção] [arquivo.mt]

Onde opçãp pode ser um dos seguintes:

- -r: executa o programa por completo e imprime os movimentos das fitas até a parada.
- -s n: onde n é um valor inteiro referente ao número de passos que deseja imprimir (-s 10).
- -d arquivo.txt: onde arquivo.txt é o nome do arquivo de log que deseja ser criado após a execução do simulador.

Exemplo de execução usando o arquivo teste.mt:

> python3 sim_turing.py -r teste.mt

# O simulador

Após executar o programa com o comando acima, será pedido uma palavra de entrada para ser executado. Basta
fornecer a palavra que deseja ser executada na programação feita no arquivo mt.
