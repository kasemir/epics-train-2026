# Read PV from 'makeBaseApp.pl -t example'
# to check if circle.x and .y are on circle

print("For faster updates,")
print("   caput training:circle:period 0.2")
 
from p4p.client.thread import Context
from time import sleep
from math import sqrt

pva = Context('pva')

def check(value):
    x = value['x']['value']
    y = value['y']['value']
    check = sqrt(x*x + y*y)
    print("%+.4f %+.4f -> %.8f" % (x, y, check))
    # There can be rounding errors, but should be close to 1.0
    if abs(1.0-check) > 0.0000001:
        print("PANIC!!")

with pva.monitor('epics-dev:circle', check):
    sleep(1000)
