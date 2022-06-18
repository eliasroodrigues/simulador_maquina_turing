"""
  Machine File

  The machine functionalities. 
"""

from regex import Regex
from output import Output

class Machine(object):
  def __init__(self):
    self.regex = Regex()
    self.out_line = Output()
    self.instrucao_atual = None
    self.param_bloco = []
    self.blocos_cod = []
    self.estado_atual = ''
    self.fita = ''
    self.lista_de_prints = []
    self.cont_interacoes = 0
    self.bloco_atual = None
    self.fitaX = []
    self.fitaY = '_'
    self.fitaZ = '_'
    self.pilha_bloco = []

  def get_bloco(self, opcao):
    for b in self.blocos_cod:
      if b[0] == opcao:
        print('####  achou o bloco = ' + b[0])
        return b

  def get_inicio_bloco(self, nome_bloco):
    for b in self.blocos_cod:
      if b[0] == nome_bloco:
        return b[2]

  # create the block
  def separa_bloco(self, opcao, param):
    # inicio de bloco
    # bloco <identificador do bloco> <estado inicial>
    # bloco main 1
    if opcao == 'iniBloco':
      self.param_bloco = []
      nome_bloco = param.split()
      self.param_bloco.insert(0, nome_bloco[1])
      self.param_bloco.append(param)
    elif opcao == 'fimBloco':
      self.param_bloco.append(param)
      return self.param_bloco
    else:
      self.param_bloco.append(param)
    return None

  # split the code of each block
  def separa_cod_em_blocos(self, lines_file):
    bloco = []
    for l in lines_file:
      bloco = self.separa_bloco(self.regex.aplica_regex(l), l)
      if (bloco != None):
        self.blocos_cod.append(bloco)

    return self.blocos_cod

  def get_instrucoes(self, bloco, estado):
    instr = []
    print('GETInstricoes: ' + estado)
    print('GETInstricoes: ' + bloco[0])
    print(bloco)

    for b in bloco:
      if (self.regex.aplica_regex(b) == 'comando') and (int(b.split()[0]) == int(estado)):
        instr.append(b)
      elif (self.regex.aplica_regex(b) == 'chaBloco') and (int(b.split()[0]) == int(estado)):
        instr.append(b)

    return instr

  # execute
  def run(self, palavra, head, lines_file):
    self.lista_de_prints = []
    self.blocos_cod = self.separa_cod_em_blocos(lines_file)
    self.bloco_atual = self.get_bloco('main')
    self.instrucao_atual = self.bloco_atual[1]
    self.fitaX = self.out_line.new_line(self.bloco_atual[0], self.bloco_atual[1].split()[2], self.bloco_atual[2], '', head, palavra, self.fitaY, self.fitaZ)

    print(self.fitaX)

    self.cont_interacoes = 0

    if self.instrucao_atual is not None:
      instrucao_pilha = None
      estado_pilha = ''
      while True:
        finalizou = self.exec_bloco(self.bloco_atual, estado_pilha)
        self.cont_interacoes += 1

        if self.cont_interacoes == 500:
          return None

        # stop the execution
        if (finalizou == 'pare') or (finalizou == 'aceite'):
          print('End of execution!')
          break
        elif finalizou == 'retorne':
          instrucao_pilha = self.pilha_bloco.pop()
          self.bloco_atual = self.get_bloco(instrucao_pilha[0])
          estado_pilha = instrucao_pilha[1]
          if (estado_pilha == 'pare') or (finalizou == 'aceite'):
            print('End of execution!')
            breako
        else:
          self.bloco_atual = self.get_bloco(finalizou)
          estado_pilha = ''
      self.lista_de_prints.append(self.fitaX[0])
    else:
      print('Main block not found!')

    return self.lista_de_prints

  def exec_bloco(self, bloco, estado_atual):
    if estado_atual == '':
      self.estado_atual = bloco[1].split()[2]
    else:
      self.estado_atual = estado_atual

    self.fitaX[1] = bloco[0]
    self.fitaX[2] = self.estado_atual

    sair = False
    
    while True:
      instrucoes = self.get_instrucoes(bloco, self.estado_atual)
      cabecote = self.outLine.get_cabecote(self.fitaX)

      if instrucoes == []:
        exit(1)

      print(instrucoes)
      print(cabecote)

      break

      # for i in instrucoes:
      #   # <estado atual> <fita atual> <simbolo atual> <movimento atual> -- <novo estado> <nova fita> <novo simbolo> <novo movimento>
      #   if self.regex.aplica_regex(i) == 'comando':
      #     if ((i.split()[1])[0] == '['):
      #       #print(self.fita2)
      #       #print((i.split()[1])[1])
      #       if((i.split()[1])[1] == self.fita2) or ((i.split()[1])[1] == '*'):
      #         #print('ricochete')
      #         self.fitaX[2] = self.estado_atual
      #         # le o que está na fita 2
      #         #if(self.fita2 == '.'):
      #         # exit(1)
      #         self.fitaX = self.outLine.alteraCabecoteCochete(self.fitaX, self.fita2, i.split()[3])
      #         self.lista_de_prints.append(self.fitaX[0])
      #         #print(self.fitaX[0])
      #         self.fitaX = self.outLine.moveCabecote(self.fitaX, i.split()[4])
      #         if (i.split()[5] == 'retorne'):
      #           return 'retorne'
      #         elif ((i.split()[5] == 'pare') or (i.split()[5] == 'aceite')):
      #           # print('pare')
      #           return i.split()[5]
      #         else:
      #           # estado atual eh atualizado para proximo estado
      #           self.estado_atual = i.split()[5]
      #           break

      #     # letra do cabecote corresponde
      #     elif (i.split()[1] == cabecote) or (i.split()[1] == '*'):
      #       #print('###Executa ### Instrucao: '+i)
      #       x = i.split()
      #       for s in x:
      #         if s is '!':
      #           sair = True

      #       self.fitaX[2] = self.estado_atual
      #       self.fitaX = self.outLine.alteraCabecote(self.fitaX, i.split()[1], i.split()[3])
      #       self.lista_de_prints.append(self.fitaX[0])
      #       #print('antes'+self.fitaX[0])
      #       self.fitaX = self.outLine.moveCabecote(self.fitaX, i.split()[4])
      #       #print('depois'+self.fitaX[0])
      #       if (i.split()[5] == 'retorne'):
      #         return 'retorne'
      #       elif ((i.split()[5] == 'pare') or (i.split()[5] == 'aceite')):
      #         # print('pare')
      #         return i.split()[5]
      #       else:
      #         # estado atual eh atualizado para proximo estado
      #         self.estado_atual = i.split()[5]
      #         break

      #   elif (self.regex.aplicaRegex(i) == 'chaBloco'):
      #     #print('chamou um bloco')
          
      #     atual = i.split()[0]
      #     nomeBloco = i.split()[1]
      #     retorno = i.split()[2]

      #     x = i.split()
      #     for s in x:
      #       if s is '!':
      #         sair = True
      #     # print('chamou bloco: '+i)

      #     # estado atual eh atualizado para proximo estado
      #     self.pilha_bloco.append([bloco[0], retorno])
      #     #print('Empilhou: '+bloco[0]+' - '+retorno)
      #     return nomeBloco

    return None
