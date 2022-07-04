"""
  Output File

  Format the output for the machine.

  author: Elias Rodrigues, IFMG, 2022.
"""

class Output(object):
  def __init__(self):
    self.bloco = '....'
    self.estado = '0000'

    self.esquerdaX = '__________'
    self.cabecoteX = '(e)'
    self.direitaX = '__________'

    self.esquerdaY = '__________'
    self.cabecoteY = '(e)'
    self.direitaY = '__________'

    self.esquerdaZ = '__________'
    self.cabecoteZ = '(e)'
    self.direitaZ = '__________'

  def new_line_clear(self):
    return self.bloco + '.' + self.estado + ': ' + self.esquerdaX + self.cabecoteX + self.direitaX + ' : ' + self.esquerdaY + self.cabecoteY + self.direitaY + ' : ' + self.esquerdaZ + self.cabecoteZ + self.direitaZ

  def get_cabecote(self, line):
    char = line[4]
    
    return char[1]

  def move_cabecote(self, line, fita1, move1, fita2, move2):
    esquerdaX = line[3]
    cabecoteX = line[4]
    direitaX  = line[5]

    esquerdaY = line[6]
    cabecoteY = line[7]
    direitaY  = line[8]

    esquerdaZ = line[9]
    cabecoteZ = line[10]
    direitaZ  = line[11]

    if fita1 == 'X':
      if move1 == 'e':
        self.direitaX  = cabecoteX[1] + direitaX
        self.cabecoteX = '%s%s%s' % (cabecoteX[0], esquerdaX[len(esquerdaX) - 1], cabecoteX[2])
        self.esquerdaX = esquerdaX[:len(esquerdaX) - 1]
      elif move1 == 'd':
        self.esquerdaX = esquerdaX + cabecoteX[1]
        self.cabecoteX = '%s%s%s' % (cabecoteX[0], direitaX[0], cabecoteX[2])
        self.direitaX  = direitaX[1:]
    elif fita1 == 'Y':
      if move1 == 'e':
        self.direitaY  = cabecoteY[1] + direitaY
        self.cabecoteY = '%s%s%s' % (cabecoteY[0], esquerdaY[len(esquerdaY) - 1], cabecoteY[2])
        self.esquerdaY = esquerdaY[:len(esquerdaY) - 1]
      elif move1 == 'd':
        self.esquerdaY = esquerdaY + cabecoteY[1]
        self.cabecoteY = '%s%s%s' % (cabecoteY[0], direitaY[0], cabecoteY[2])
        self.direitaY  = direitaY[1:]
    elif fita1 == 'Z':
      if move1 == 'e':
        self.direitaZ  = cabecoteZ[1] + direitaZ
        self.cabecoteZ = '%s%s%s' % (cabecoteZ[0], esquerdaZ[len(esquerdaZ) - 1], cabecoteZ[2])
        self.esquerdaZ = esquerdaZ[:len(esquerdaZ) - 1]
      elif move1 == 'd':
        self.esquerdaZ = esquerdaZ + cabecoteZ[1]
        self.cabecoteZ = '%s%s%s' % (cabecoteZ[0], direitaZ[0], cabecoteZ[2])
        self.direitaZ  = direitaZ[1:]

    if fita2 == 'X':
      if move2 == 'e':
        self.direitaX  = cabecoteX[1] + direitaX
        self.cabecoteX = '%s%s%s' % (cabecoteX[0], esquerdaX[len(esquerdaX) - 1], cabecoteX[2])
        self.esquerdaX = esquerdaX[:len(esquerdaX) - 1]
      elif move2 == 'd':
        self.esquerdaX = esquerdaX + cabecoteX[1]
        self.cabecoteX = '%s%s%s' % (cabecoteX[0], direitaX[0], cabecoteX[2])
        self.direitaX  = direitaX[1:]
    elif fita2 == 'Y':
      if move2 == 'e':
        self.direitaY  = cabecoteY[1] + direitaY
        self.cabecoteY = '%s%s%s' % (cabecoteY[0], esquerdaY[len(esquerdaY) - 1], cabecoteY[2])
        self.esquerdaY = esquerdaY[:len(esquerdaY) - 1]
      elif move2 == 'd':
        self.esquerdaY = esquerdaY + cabecoteY[1]
        self.cabecoteY = '%s%s%s' % (cabecoteY[0], direitaY[0], cabecoteY[2])
        self.direitaY  = direitaY[1:]
    elif fita2 == 'Z':
      if move2 == 'e':
        self.direitaZ  = cabecoteZ[1] + direitaZ
        self.cabecoteZ = '%s%s%s' % (cabecoteZ[0], esquerdaZ[len(esquerdaZ) - 1], cabecoteZ[2])
        self.esquerdaZ = esquerdaZ[:len(esquerdaZ) - 1]
      elif move2 == 'd':
        self.esquerdaZ = esquerdaZ + cabecoteZ[1]
        self.cabecoteZ = '%s%s%s' % (cabecoteZ[0], direitaZ[0], cabecoteZ[2])
        self.direitaZ  = direitaZ[1:]

    return self.new_line(line[1], line[2], self.esquerdaX, self.cabecoteX, self.direitaX, self.esquerdaY, self.cabecoteY, self.direitaY, self.esquerdaZ, self.cabecoteZ, self.direitaZ) 

  def altera_cabecote(self, line, fita, read, write):
    head = self.get_cabecote(line)
    
    # print(line, fita, read, write)

    if read != '*' and head != read:
      print('cabecoteX - Erro de Leitura!')
      print('cabecoteX(' + head + ') - read(' + read + ')')
      exit()

    if fita == 'X':
      cabecoteX = line[4]
      if write != '*':
        self.cabecoteX = '%s%s%s' % (cabecoteX[0], write, cabecoteX[2])
      return self.new_line(line[1], line[2], line[3], self.cabecoteX, line[5], line[6], line[7], line[8], line[9], line[10], line[11])
    elif fita == 'Y':
      cabecoteY = line[7]
      if write != '*':
        self.cabecoteY = '%s%s%s' % (cabecoteY[0], write, cabecoteY[2])
      return self.new_line(line[1], line[2], line[3], line[4], line[5], line[6], self.cabecoteY, line[8], line[9], line[10], line[11])
    elif fita == 'Z':
      cabecoteZ = line[10]
      if write != '*':
        self.cabecoteZ = '%s%s%s' % (cabecoteZ[0], write, cabecoteZ[2])
      return self.new_line(line[1], line[2], line[3], line[4], line[5], line[6], line[7], line[8], line[9], self.cabecoteZ, line[11])
    

  def new_line(self, bloco, estado, esquerdaX, cabecoteX, direitaX, esquerdaY, cabecoteY, direitaY, esquerdaZ, cabecoteZ, direitaZ):
    bloco = '{0:>10}'.format(bloco)

    self.bloco = bloco.replace(' ', '.')

    self.estado = '%04d' % (int(estado))

    self.esquerdaX = '{:_>10}'.format(esquerdaX)
    self.esquerdaY = '{:_>10}'.format(esquerdaY)
    self.esquerdaZ = '{:_>10}'.format(esquerdaZ)

    if len(cabecoteX) == 2:
      self.cabecoteX = '%s%s%s' % (cabecoteX[0], direitaX[0], cabecoteX[1])
      direitaX = direitaX[:0] + direitaX[1:]
    else:
      self.cabecoteX = cabecoteX

    if len(cabecoteY) == 2:
      self.cabecoteY = '%s%s%s' % (cabecoteY[0], direitaY[0], cabecoteY[1])
      direitaY = direitaY[:0] + direitaY[1:]
    else:
      self.cabecoteY = cabecoteY

    if len(cabecoteZ) == 2:
      self.cabecoteZ = '%s%s%s' % (cabecoteZ[0], direitaZ[0], cabecoteZ[1])
      direitaZ = direitaZ[:0] + direitaZ[1:]
    else:
      self.cabecoteZ = cabecoteZ

    self.direitaX = '{:_<10}'.format(direitaX)
    self.direitaY = '{:_<10}'.format(direitaY)
    self.direitaZ = '{:_<10}'.format(direitaZ)

    model = '{Bloco}.{Estado}: {EsquerdaX}{CabecoteX}{DireitaX} : {EsquerdaY}{CabecoteY}{DireitaY} : {EsquerdaZ}{CabecoteZ}{DireitaZ}'
    model = model.format(Bloco=self.bloco, Estado=self.estado, EsquerdaX=self.esquerdaX, CabecoteX=self.cabecoteX, DireitaX=self.direitaX, EsquerdaY=self.esquerdaY, CabecoteY=self.cabecoteY, DireitaY=self.direitaY, EsquerdaZ=self.esquerdaZ, CabecoteZ=self.cabecoteZ, DireitaZ=self.direitaZ)

    # print(model)
    
    itens = [model,
             self.bloco,
             self.estado,

             self.esquerdaX,
             self.cabecoteX,
             self.direitaX,

             self.esquerdaY,
             self.cabecoteY,
             self.direitaY,

             self.esquerdaZ,
             self.cabecoteZ,
             self.direitaZ
            ]

    return itens
