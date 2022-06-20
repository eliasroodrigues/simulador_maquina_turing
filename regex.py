"""
  Regex File

  Regex to match the commands
"""

import re

class Regex(object):
  def __init__(self):
    # block declaration
    expB1 = r'^[\s|\t]*bloco\s[a-zA-Z0-9]{1,16}\s[0-9]{1,4}'
    # block call
    expB2 = r'^[\s|\t]*[0-9]{1,4}\s([a-zA-Z]+)\s(pare|[0-9]{1,4})'
    # end of block
    expB3 = r'^[\s|\t]*fim[\s|\t]*[a-zA-Z0-9]*'
    # commands
    expC1 = r'^[\s|\t]*[0-9]{1,4}\s[X-Z]{1}\s(\*|(\${1}[a-zA-Z]*)|([a-zA-Z0-9]*))\s[a-z]{1}\s\-{2}\s[0-9]{1,4}\s([X-Z]{1})\s(\*|(\${1}[a-zA-Z]*)|([a-zA-Z0-9]*))\s[a-z]{1}(\s\!?)'
    # special
    expC2 = r'^[\s|\t]*[0-9]{1,4}\s(aceita|rejeita|retorne|pare)'
    # aliases
    expAl = r'^\${1}[a-z]*\s\={1}\s(\"[a-zA-Z0-9]*\")'

    self.regB1 = re.compile(expB1)
    self.regB2 = re.compile(expB2)
    self.regB3 = re.compile(expB3)
    self.regC1 = re.compile(expC1)
    self.regC2 = re.compile(expC2)
    self.regAl = re.compile(expAl)

  def aplica_regex(self, linha):
    if self.regB1.match(linha) != None:
      return 'iniBloco'
    elif self.regB2.match(linha) != None:
      return 'chaBloco'
    elif self.regB3.match(linha) != None:
      return 'fimBloco'
    elif self.regC1.match(linha) != None:
      return 'comando'
    elif self.regC2.match(linha) != None:
      return 'especial'
    elif self.regAl.match(linha) != None:
      return 'alias'
    else:
      return None

  def extrai_param(self, line):
    line = line.replace('--', '')
    return line.split()
