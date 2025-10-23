#!/bin/env python3
# Example for interacting with the 'fishtank' IOC
from os import environ
from time import sleep
from epics import caget, caput

user = environ['USER']

sp = caget(user + ':setpoint')
rb = caget(user + ':tank')
print("Temperature setpoint is at %f and tank temperature is %f" % (sp, rb))

if sp < 40:
    caput(user + ':setpoint', 40)
    print("Changed setpoint to 40...")
    while True:
        rb = caget(user + ':tank')
        print("Tank temperature is %f" % rb)
        if rb > 39.5:
            break
        sleep(1)
else:        
    caput(user + ':setpoint', 30)
    print("Changed setpoint to 30...")
    while True:
        rb = caget(user + ':tank')
        print("Tank temperature is %f" % rb)
        if rb < 30.5:
            break
        sleep(1)
print("Got there, I think")

