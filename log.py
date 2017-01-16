#!/usr/bin/env python
from datetime import datetime
import serial, io

fname='/home/pi/gtv-api/temp.dat'
fmode='w'

ser = serial.Serial(
    port='/dev/ttyACM0',
    baudrate=9600,
)



with ser as pt, open(fname,fmode) as outf:
   spb = io.TextIOWrapper(io.BufferedRWPair(pt,pt,1),
     encoding='ascii', errors='ignore', newline='\r',line_buffering=True)
   spb.readline()  # throw away first line; likely to start mid-sentence (incomplete)
while ser.isOpen():
    x = spb.readline() # read one line of text from serial port
    print (x,end='')   #echo line of text on-screen
    outf.write(x)      #write line of text to file
    outf.flush()       #make sure it actually gets written out
    ser.close()
