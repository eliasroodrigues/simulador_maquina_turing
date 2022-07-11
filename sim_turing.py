"""
  Turing Machine Simulator

  The execution of the simulation.

  author: Elias Rodrigues, IFMG, 2022.
"""

import argparse
import os.path
from input_args import InputArgs
from input_file import InputFile
from output import Output
from machine import Machine
from regex import Regex

class simturing:
  imp_args = InputArgs()
  imp_file = InputFile()
  out_line = Output()
  machine  = Machine()
  regex = Regex()
  prints = []
  numSteps = 0

  print('Simulador de Máquina de Turing Suave ver 1.0\nDesenvolvido como trabalho prático para a disciplina de Teoria da Computação\nAutor Elias Rodrigues, IFMG - Formiga, 2022.\n')

  param_args = imp_args.inputs()
  print(f'Entry arguments: {param_args}\n')

  # default options
  opcao = 'r'
  steps = -1
  log_file = 'log.txt'
  head = '()'

  # verify the arguments
  for p in param_args:
    if p[0] == 'r':
      opcao = p[0]
      path_file = p[1]
    elif p[0] == 's':
      opcao = p[0]
      steps = int(p[1])
      path_file = p[2]
    elif p[0] == 'd':
      opcao = p[0]
      log_file = p[1]
      path_file = p[2]

  if param_args is None:
    print('Give the entry arguments.')
    exit()

  palavra = input('Entry word: ')
  
  if palavra == '':
    print('No entry given...')
    exit()

  new_palavra = []
  for word in palavra:
    if word != ' ':
      new_palavra.append(word)
  palavra = ''.join(new_palavra)
  
  # execute based on the given arguments.
  lines_file = imp_file.input_file(path_file)

  prints, tipo = machine.run(palavra, head, lines_file)

  # execution modes
  if opcao == 'r':
    for p in prints:
      print(p)
    print(tipo)
  elif opcao == 'd':
    fileD = open(log_file, 'w')
    fileD.write(opcao + '\n')
    for p in prints:
      fileD.write(p + '\n')
    fileD.close()
    for p in prints:
      print(p)
  elif opcao == 's':
    if steps > len(prints):
      steps = len(prints) - 1
    
    cont = steps
    
    for p in prints:
      if cont != 0:
        print(p)
        cont -= 1

    numSteps += steps

    while True:
      op = input('\nForneça opção (-r, -s): ')

      if op != '':
        opcao = op.split()
        
        if opcao[0] == '-r':
          for p in prints:
              print(p)
          exit()
        elif opcao[0] == '-s':
          steps = int(opcao[1])
          
          if steps > len(prints):
            steps = len(prints) - 1
          
          cont = steps
          cont2 = 0
          
          for p in prints:
            if cont2 <= numSteps:
              cont2 += 1
            else:
              if cont != 0:
                print(p)
                cont -= 1
          numSteps += steps
        else:
          exit()
      else:
        cont = steps
        
        if steps > len(prints):
          steps = len(prints) - 1
        
        cont = steps
        cont2 = 0
        
        for p in prints:
          if cont2 <= numSteps:
            cont2 += 1
          else:
            if cont != 0:
              print(p)
              cont -= 1

          exit()

        numSteps += steps
