#!/bin/bash

while true
do

VALUE=$(</sys/class/gpio/gpio11/edge)

if [ "$VALUE" == "1" ]; then
	COUNTER=$(</home/pi/gtv-api/value)

	(( COUNTER++ ))

	echo $COUNTER > /home/pi/gtv-api/value

	echo $COUNTER
	sleep 1
else
echo $VALUE
fi
#sleep 0.025
done
