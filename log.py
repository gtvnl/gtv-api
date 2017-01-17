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
    encoding='ascii', newline='\r', line_buffering=True
)

with open(outfile,'w') as f: #appends to existing file
    while ser.isOpen():
      trash = sio.readline()
      time.sleep(10)
      datastring = sio.readline()
      print(datastring)
      #\t is tab; \n is line separator
      f.write(datetime.utcnow().isoformat() + '\t' + datastring + '\n')
      f.flush() #included to force the system to write to disk
      ser.close()
