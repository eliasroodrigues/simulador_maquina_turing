"""
  Machine File

  The machine functionalities. 

  author: Elias Rodrigues, IFMG, 2022.
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
    self.lista_de_prints = []
    self.cont_interacoes = 0
    self.bloco_atual = None
    self.fitaX = []
    self.alias = {}
    self.pilha_bloco = []

  def get_bloco(self, opcao):
    for b in self.blocos_cod:
      if b[0] == opcao:
        return b

  def get_inicio_bloco(self, nome_bloco):
    for b in self.blocos_cod:
      if b[0] == nome_bloco:
        return b[2]

  # create the block
  # bloco <identificador do bloco> <estado inicial>
  def separa_bloco(self, opcao, param):
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
      if bloco != None:
        self.blocos_cod.append(bloco)

    return self.blocos_cod

  def get_instrucoes(self, bloco, estado):
    instr = []

    for b in bloco:  
      if self.regex.aplica_regex(b) == 'comando' and int(b.split()[0]) == int(estado):
        instr.append(b)
      elif self.regex.aplica_regex(b) == 'especial' and int(b.split()[0]) == int(estado):
        instr.append(b)
      elif self.regex.aplica_regex(b) == 'chaBloco' and int(b.split()[0]) == int(estado):
        instr.append(b)

    return instr

  def get_alias(self, lines_file):
    alias = {}
    aux = []
    char = ''
    string = ''

    for a in lines_file:
      if self.regex.aplica_regex(a) == 'alias':
        char = a.split()[0]
        string = a.split()[2]
        aux = []
        for s in string:
          if s != "\"":
            aux.append(s)
        alias[char] = aux

    return alias

  # execute
  def run(self, palavra, head, lines_file):
    self.lista_de_prints = []
    self.blocos_cod = self.separa_cod_em_blocos(lines_file)
    self.bloco_atual = self.get_bloco('main')
    self.instrucao_atual = self.bloco_atual[1]
    self.fitaX = self.out_line.new_line(self.bloco_atual[0], self.bloco_atual[1].split()[2], '', head, palavra, '', head, '_', '', head, '_')
    self.alias = self.get_alias(lines_file)

    self.cont_interacoes = 0
    if self.instrucao_atual is not None:
      instrucao_pilha = None
      estado_pilha = ''

      while True:
        finalizou = self.exec_bloco(self.bloco_atual, estado_pilha)
        self.cont_interacoes += 1

        if self.cont_interacoes == 1000:
          return None

        # stop the execution
        if finalizou == 'pare' or finalizou == 'aceita' or finalizou == 'rejeita':
          break
        elif finalizou == 'retorne':
          instrucao_pilha = self.pilha_bloco.pop()
          self.bloco_atual = self.get_bloco(instrucao_pilha[0])
          estado_pilha = instrucao_pilha[1]
          if estado_pilha == 'pare' or finalizou == 'aceita' or finalizou == 'rejeita':
             break
        else:
          self.bloco_atual = self.get_bloco(finalizou)
          estado_pilha = ''
      self.lista_de_prints.append(self.fitaX[0])
    else:
      print('Main block not found!')

    return self.lista_de_prints

  # execute block
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
      cabecote = self.out_line.get_cabecote(self.fitaX)

      if instrucoes == []:
        exit()

      for i in instrucoes:
        # <estado atual> <fita atual> <simbolo atual> <movimento atual> -- <novo estado> <nova fita> <novo simbolo> <novo movimento>
        if self.regex.aplica_regex(i) == 'comando':          
          aliases = []
          for cod in self.alias:
            aliases.append(cod)

          simbA = i.split()[2]
          simbB = i.split()[7]

          move1 = i.split()[3]
          move2 = i.split()[8]

          fita1 = i.split()[1]
          fita2 = i.split()[6]

          if cabecote == simbA or simbA == '*' or (simbA in aliases and cabecote in self.alias[simbA]):# or simbB in ['<', '>', '='] or simbA in ['<', '>', '=']:
            # verifica o simbA
            if simbA in aliases:
              if cabecote in self.alias[simbA]:
                simbA = cabecote

            # verifica o simbB
            if simbB in aliases:# and simbB == simbA:
              if cabecote in self.alias[simbB]:
                simbB = cabecote

            # print(cabecote, simbA, simbB)
            
            self.fitaX[2] = self.estado_atual
            self.fitaX = self.out_line.altera_cabecote(self.fitaX, fita2, simbA, simbB)
            self.lista_de_prints.append(self.fitaX[0])
            self.fitaX = self.out_line.move_cabecote(self.fitaX, fita1, move1, fita2, move2)

            novo_estado = i.split()[5]
            self.estado_atual = novo_estado

            break
        elif self.regex.aplica_regex(i) == 'chaBloco':
          atual = i.split()[0]
          nomeBloco = i.split()[1]
          retorno = i.split()[2]

          x = i.split()

          if '!' in x:
            sair = True
          
          # estado atual eh atualizado para proximo estado
          self.pilha_bloco.append([bloco[0], retorno])

          return nomeBloco
        elif self.regex.aplica_regex(i) == 'especial':
          comando = i.split()[1]

          if comando == 'retorne':
            return 'retorne'
          elif comando == 'pare' or comando == 'aceita' or comando == 'rejeita':
            return comando

        if sair is True:
          for x in self.listaDePrints:
            print(x)
            exit()

    return None
