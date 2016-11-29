#!/usr/bin/python
import RPi.GPIO as GPIO
import time
from time import sleep

GPIO.setmode(GPIO.BCM)     # set up BCM GPIO numbering  
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_UP)    # set GPIO25 as input (button)  


if GPIO.input(23):
    print('Input was HIGH')
else:
    print('Input was LOW')

var = 1

while var == 1:
    if GPIO.input(23) == GPIO.LOW:
        print("YEAH")
