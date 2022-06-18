"""
  Input Args File

  Get the arguments for the execution.
"""

import argparse
import os

PATH_CFG = os.getcwd()+'/config.cfg'

class InputArgs(object):
  def __init__(self):
    self.param = []

  def write_file(self, argumentos, tipo_opc):
    fileCFG = open(PATH_CFG, 'w')
    fileCFG.write(tipo_opc + '\n')
    fileCFG.write(argumentos)
    fileCFG.close()

  def append_file(self, argumentos, tipo_opc):
    fileCFG = open(PATH_CFG, 'a')
    fileCFG.write('\n' + tipo_opc + '\n')
    fileCFG.write(argumentos)
    fileCFG.close()

  def read_file(self):
    fileCFG = open(PATH_CFG, 'r')
    
    linhas = []
    nova_lista = None

    for l in fileCFG:
      l = l.replace('\n', '')
      if l == 'r' or l == 's' or l == 'd':
        if nova_lista != None: 
          linhas.append(nova_lista)
        nova_lista = []
        nova_lista.append(l)
      else:
        nova_lista.append(l)

    linhas.append(nova_lista)        
    fileCFG.close()

    return linhas

  def inputs(self):
    parser = argparse.ArgumentParser(description='Simulador de Máquina de Turing Suave ver 1.0 - Desenvolvido como trabalho prático para a disciplina de Teoria da Computação - Autor Elias Rodrigues, IFMG - Formiga, 2022.')

    parser.add_argument('-r', '-resume', action='store', dest='fileR', required=False, help='Show the entire execution.')
    parser.add_argument('-s', '-step'  , action='store', nargs=2, dest='n', required=False, help='Show the first n executions, then wait for the next command (-s, -r).')
    parser.add_argument('-d', '-debug' , action='store', nargs=2, dest='fileD', required=False, help='Produce a log.')

    arguments = parser.parse_args();

    if arguments.fileR != None:
      self.write_file(arguments.fileR, 'r')
    elif arguments.n != None:
      strAux = arguments.n[0] + '\n' + arguments.n[1]
      self.write_file(strAux, 's')
    elif arguments.fileD != None:
      strAux = arguments.fileD[0] + '\n' + arguments.fileD[1]
      self.write_file(strAux, 'd')

    if os.path.isfile(PATH_CFG):
      self.param = self.read_file()
    else:
      self.param = None

    return self.param
