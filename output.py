"""
  Output File

  Format the output for the machine.
"""

class Output(object):
  def __init__(self):
    self.bloco = '....'
    self.estado = '0000'
    self.fita = '_'
    self.esquerda = '__________'
    self.cabecote = '(e)'
    self.direita = '__________'
    self.fitaY = '__________'
    self.fitaZ = '__________'

  def new_line_clear(self):
    return self.bloco + '.' + self.estado + ': ' + self.fita + ': ' + self.esquerda + self.cabecote + self.direita + ' : ' + self.fitaY + ' : ' + self.fitaZ

  def get_cabecote(self, line):
    char = line[5]
    return char[1]

  def move_cabecote(self, line, fita, moveX, moveXYZ):
    esquerda = line[4]
    cabecote = line[5]
    direita  = line[6]

    # move X
    if moveX == 'e':
      self.direita  = cabecote[1] + direita
      self.cabecote = '%s%s%s' % (cabecote[0], esquerda[len(esquerda) - 1], cabecote[2])
      self.esquerda = esquerda[:len(esquerda) - 1]
    elif moveX == 'd':
      self.esquerda = esquerda + cabecote[1]
      self.cabecote = '%s%s%s' % (cabecote[0], direita[0], cabecote[2])
      self.direita  = direita[1:]

    # move X, Y or Z
    if fita == 'X':
      if moveXYZ == 'e':
        self.direita  = cabecote[1] + direita
        self.cabecote = '%s%s%s' % (cabecote[0], esquerda[len(esquerda) - 1], cabecote[2])
        self.esquerda = esquerda[:len(esquerda) - 1]
      elif moveXYZ == 'd':
        self.esquerda  = esquerda + cabecote[1]
        self.cabecote  = '%s%s%s' % (cabecote[0], direita[0], cabecote[2])
        self.direita   = direita[1:]
    elif fita == 'Y':
      if moveXYZ == 'e':
        self.fitaY = cabecote[1] + self.fitaY
      elif moveXYZ == 'd':
        self.fitaY += cabecote[1]
    elif fita == 'Z':
      if moveXYZ == 'e':
        self.fitaZ = cabecote[1] + self.fitaZ
      elif moveXYZ == 'd':
        self.fitaZ += cabecote[1]

    # create a new line
    return self.new_line(line[1], line[2], self.fita, self.esquerda, self.cabecote, self.direita, self.fitaY, self.fitaZ) 

  def altera_cabecote(self, line, fita, read, write):
    head = self.get_cabecote(line)
    if read != '*' and head != read:
      print('Cabecote - Erro de Leitura!')
      print('Cabecote(' + head + ') - read(' + read + ')')
      exit()

    cabecote = line[5]
    if write != '*':
      self.cabecote = '%s%s%s' % (cabecote[0], write, cabecote[2])
    return self.new_line(line[1], line[2], line[3], line[4], self.cabecote, line[6], line[7], line[8])

  def new_line(self, bloco, estado, fita, esquerda, cabecote, direita, fitaY, fitaZ):
    bloco = '{0:>10}'.format(bloco)

    self.bloco = bloco.replace(' ', '.')

    self.estado = '%04d' % (int(estado))

    self.esquerda = '{:_>10}'.format(esquerda)

    if len(cabecote) == 2:
      self.cabecote = '%s%s%s' % (cabecote[0], direita[0], cabecote[1])
      direita = direita[:0] + direita[1:]
    else:
      self.cabecote = cabecote

    self.direita = '{:_<10}'.format(direita)

    model = '{Bloco}.{Estado}: {Fita}: {Esquerda}{Cabecote}{Direita} : {FitaY} : {FitaZ}'
    model = model.format(Bloco=self.bloco, Estado=self.estado, Fita=self.fita, Esquerda=self.esquerda, Cabecote=self.cabecote, Direita=self.direita, FitaY=self.fitaY, FitaZ=self.fitaZ)

    itens = [model, self.bloco, self.estado, self.fita, self.esquerda, self.cabecote, self.direita, self.fitaY, self.fitaZ]
    return itens
