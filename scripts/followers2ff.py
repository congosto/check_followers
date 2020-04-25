#!/usr/bin/python
# -*- coding: iso-8859-1 -*-
# author: M. Luz Congosto.
# Creative commons 3.0 spain
# http://creativecommons.org/licenses/by-nc/3.0/es/

import os
import re
import sys
#import time
import datetime
import codecs
import argparse



def main():


  reload(sys)
  sys.setdefaultencoding('utf-8')
  sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

  #defino argumentos de script
  parser = argparse.ArgumentParser(description='conver a profile file a ff formatpata gráfica del NYT')
  parser.add_argument('file_in', type=str, help='name file in with id_tweet')
  parser.add_argument('net', type=str, help='name file in with id_tweet')

  #obtego los argumentos
  args = parser.parse_args()
  file_in= args.file_in
  net=args.net
  file_base=os.path.basename(file_in)
  (prefix,text)=os.path.splitext(file_base)
  try:
    f_in = codecs.open(file_in, 'rU',encoding='utf-8')
    print 'open as unicode'
  except:
    print 'Can not open file',file_in
    exit (1)
  # get start time and end time 
  f_out = codecs.open(prefix +'_ff.csv', 'w',encoding='utf-8')  
  head=True
  n_users=0
  f_out.write('close,date\n')
  for line in f_in:
    if (n_users % 10000) == 0:
      print n_users
    n_users +=1
    if head:
      head=False
    else:
      line= line.strip('\n\r')
      data=line.split('\t')
      try:
        id_user = data[0]
        net_user=data[2]
        since=data[8]
        since=datetime.datetime.strptime(since, '%Y-%m-%d %H:%M:%S')
        if since.year >=2006: 
          since=(since.strftime("%a %b %d %H:%M:%S +0000 %Y"))
          if net_user == net:
            f_out.write ('%s,%s\n' % (id_user,since))
        else:
          print '%s,%s\n' % (id_user,since)
      except:
         pass
  f_out.close()
  f_in.close()
  exit(0)

if __name__ == '__main__':
  main()

