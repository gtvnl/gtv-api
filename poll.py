#!/usr/bin/python
import RPi.GPIO as GPIO
import time
from time import sleep

GPIO.setmode(GPIO.BCM)     # set up BCM GPIO numbering  
GPIO.setup(37, GPIO.IN)    # set GPIO25 as input (button)  
  
# Define a threaded callback function to run in another thread when events are detected  
def my_callback(channel):  
    if GPIO.input(37):     # if port 25 == 1  
        print "Pulse detected: " + time.ctime()  
  
# when a changing edge is detected on port 25, regardless of whatever   
# else is happening in the program, the function my_callback will be run  
GPIO.add_event_detect(37, GPIO.FALLING, callback=my_callback, bouncetime=10)  
  
raw_input("Press Enter when ready\n>")  
  
try:  
    print "Waiting for pulse ..."  
    sleep(300)         # wait 30 seconds  
    print "Time's up. Finished!"  
  
finally:                   # this block will run no matter how the try block exits  
    GPIO.cleanup()         # clean up after yourself  
