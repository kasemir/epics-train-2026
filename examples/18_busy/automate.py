#!/bin/env python3

from epics import caput
while True:
    print("Going to 3 ...")
    caput("DemoDevice", 3, wait=True, timeout=10)
    print("Going to 5 ...")
    caput("DemoDevice", 5, wait=True, timeout=10)
done
