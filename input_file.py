"""
  Input File

  Read the input file and store on a list.

  author: Elias Rodrigues, IFMG, 2022.
"""

import os
import re

class InputFile(object):
  def __init__(self):
    self.param = []

  def input_file(self, file_path):
    if os.path.isfile(file_path):
      file = open(file_path, 'r')
      self.param = file.readlines()
      file.close()
    else:
      self.param = None
      print(f'ERROR: where is the file? :(')
      exit()

    return self.param
