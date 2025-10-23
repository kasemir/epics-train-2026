#!/bin/env python3
from p4p.client.thread import Context
from time import sleep

pva = Context('pva')

print("Setpoint:", pva.get('epics-dev:setpoint'))
print("Tank temperature:")
for i in range(10):
    print(pva.get('epics-dev:tank'))
    sleep(1)

pva.put('epics-dev:setpoint', 40)
print("Setpoint:", pva.get('epics-dev:setpoint'))

print("Tank temperature:")
for i in range(10):
    print(pva.get('epics-dev:tank'))
    sleep(1)

pva.put('epics-dev:setpoint', 30)

