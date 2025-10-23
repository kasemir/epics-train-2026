#!/bin/env python3
# Example for interacting with the 'fishtank' IOC
from os import environ
from time import sleep
from epics import caget, caput, camonitor, camonitor_clear

user = environ['USER']

# The first call actually creates the PV and establishes a 'monitor'
print("Tank temperature is %f" % caget(user + ':tank'))

# Calling it again just returns the last received value
print("Tank temperature is %f" % caget(user + ':tank'))

# Consider automation! After
#    caput("something", 42)
# we will very soon receive an update where "something" is 42,
# but by default, caget will return what we've received so far,
# and 'now' will not be 42, yet:
#    now = caget("something")
# To force a 'get', disable the default behavior:
print("Tank temperature is %f" % caget(user + ':tank', use_monitor=False))


# Caput defaults to fire-and-forget
caput(user + ':setpoint', 30)

# To use put-callback and await completsion.
# Only makes a difference for PVs that actually support completion
# (see 'busy' record)
caput(user + ':setpoint', 30, wait=True)


# To receive updates on received values
def handle_value_update(pvname, value, **kw):
    print("%s = %s" % (pvname, str(value)))
    # print("Stuff: " + str(kw))

camonitor(user + ':tank', callback=handle_value_update)
sleep(5)
camonitor_clear(user + ':tank')
