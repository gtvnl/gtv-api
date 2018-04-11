#!/usr/bin/env python
from datetime import datetime
import serial, io
import time

outfile='/home/pi/gtv-api/temp.dat'

ser = serial.Serial(
    port='/dev/ttyACM0',
    baudrate=9600,
)

sio = io.TextIOWrapper(
    io.BufferedRWPair(ser, ser, 1),
    encoding='ascii', newline='\r'
)

while ser.isOpen():

  trash = sio.readline()
  datastring = sio.readline()
  length = len(datastring.split(','))

  if length == 9:
      print(datastring)
      with open(outfile,'w') as f: #appends to existing file
        f.write(datetime.utcnow().isoformat() + '\t' + datastring + '\n')
        f.flush()

  ser.close()
