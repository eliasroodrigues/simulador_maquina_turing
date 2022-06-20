"""
  Turing Machine Simulator

  The execution of the simulation.
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
  print(f'Entry arguments: {param_args}')

  opcao = 'r'
  steps = -1
  log_file = 'log.txt'
  head = '()'

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
    exit(1)
  
  # Execute based on the given arguments.
  lines_file = imp_file.input_file(path_file)
  prints = machine.run(palavra, head, lines_file)

  # resume mode
  if opcao == 'r':
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

    # while (True):
    #   op = input('\nForneça opção (-r, -v, -s) : ')
    #   print(op)
    #   if op != '':
    #     opcao = op.split()
    #     # print('opcao: '+op)
    #     # executa e imprime apenas o final da fita
    #     if opcao[0] == '-r':
    #       # Executa a maquina
    #       # prints = machine.run(palavra, head, lines_file)
    #       if prints == None:
    #         print('500 interações')
    #       else:
    #         print(prints.pop())
    #     # executa e imprime passo a passo a fita
    #     elif opcao[0] == '-v':
    #       # prints = machine.run(palavra, head, lines_file)
    #       if prints == None:
    #         print('500 interações')
    #       else:
    #         for p in prints:
    #           print(p)
    #     # executa e imprime n passos da fita
    #     elif (opcao[0] == '-s'):
    #       # prints = machine.run(palavra, head, lines_file)
    #       steps = int(opcao[1])
    #       if steps > int(len(prints)):
    #         steps = len(prints)-1
    #       cont = steps
    #       cont2 = 0
    #       for p in prints:
    #         if cont2 <= numSteps:
    #           cont2 += 1
    #         else:
    #           # print('if not none -s')
    #           if(cont != 0):
    #             print(p)
    #             cont -= 1
    #       numSteps += steps
    #     else:
    #       exit(1)
    #   else:
    #     # print('op '+op)
    #     # print('con '+str(cont))
    #     # if len(opcao) > 1:
    #     #   cont = int(opcao[1])
    #     #   steps = cont
    #     # else:
    #     cont = steps
    #     if steps > int(len(prints)):
    #       steps = len(prints)-1
    #     cont = steps
    #     cont2 = 0
    #     for p in prints:
    #       if cont2 <= numSteps:
    #         cont2 += 1
    #       else:
    #         # print('if not none -s')/
    #         if(cont != 0):
    #           print(p)
    #           cont -= 1
    #     numSteps += steps
