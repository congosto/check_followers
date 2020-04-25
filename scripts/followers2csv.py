#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
# author: M. Luz Congosto.
# Creative commons 3.0 spain
# http://creativecommons.org/licenses/by-nc/3.0/es/

import os
import re
import sys
import codecs
import argparse
import csv


def main():


  reload(sys)
  sys.setdefaultencoding('utf-8')
  sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

  #defino argumentos de script
  parser = argparse.ArgumentParser(description='conver a profile file a ff formatpata gráfica del NYT')
  parser.add_argument('file_in', type=str, help='name file in with id_tweet')

  #obtego los argumentos
  args = parser.parse_args()
  file_in= args.file_in

  file_base=os.path.basename(file_in)
  (prefix,text)=os.path.splitext(file_base)
  try:
    f_in = codecs.open(file_in, 'rU',encoding='utf-8')
    print 'open as unicode'
  except:
    print 'Can not open file',file_in
    exit (1)
  # get start time and end time 
  f_out = codecs.open(prefix +'.csv', 'w',encoding='utf-8')  
  n_users=0
  writer = csv.writer(f_out,delimiter=',')
  for line in f_in:
    if (n_users % 10000) == 0:
      print n_users
    n_users +=1
    line= line.strip('\n\r')
    row=line.split('\t')
    writer.writerow(row)
  f_in.close()
  f_out.close()
  exit(0)

if __name__ == '__main__':
  main()

