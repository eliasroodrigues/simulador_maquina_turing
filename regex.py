"""
  Regex File

  Regex to match the commands
"""

import re

class Regex(object):
  def __init__(self):
    # block declaration
    expB1 = r'^[ |\t]*bloco\s[a-zA-Z0-9]{1,16}\s[0-9]{1,4}([ |\t]*![ |\t]*)?([ |\t]*;[ |\t]*[\w| ]+)?\s?'
    # block call
    expB2 = r'^[ |\t]*[0-9]{1,4}\s([a-zA-Z]+)\s(pare|[0-9]{1,4})([ |\t]*![ |\t]*)?([ |\t]*;[ |\t]*[\w| ]+)?\s?'
    # end of block
    expB3 = r'^[ |\t]*fim([ |\t]*![ |\t]*)?([ |\t]*;[ |\t]*[\w| ]+)?\s?'
    # commands
    expC1 = r'^[\s|\t]*[0-9]{1,4}\s(\*|[a-zA-Z]*)\s(\*|(\$[a-zA-Z]*)|([a-zA-Z]*))\s[a-z]{1}\s--\s[0-9]{1,4}\s(\*|[a-zA-Z]*)\s(\*|(\$[a-zA-Z]*)|([a-zA-Z]*))\s[a-z]{1}'

    self.regB1 = re.compile(expB1)
    self.regB2 = re.compile(expB2)
    self.regB3 = re.compile(expB3)
    self.regC1 = re.compile(expC1)

  def aplica_regex(self, linha):
    if self.regB1.match(linha) != None:
      return 'iniBloco'
    elif self.regB2.match(linha) != None:
      return 'chaBloco'
    elif self.regB3.match(linha) != None:
      return 'fimBloco'
    elif self.regC1.match(linha) != None:
      return 'comando'
    else:
      return None

  def extrai_param(self, line):
    line = line.replace('--','')
    return line.split()
