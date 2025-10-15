#!/bin/bash
#
# Change setpoint so we have something to look at

while true
do
   caput $USER:setpoint 45
   sleep 120
   caput $USER:setpoint 25
   sleep 240
done
