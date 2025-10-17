#!/bin/sh
#
# Start 'heater' IOC

cd /ics/training/examples/fishtank
softIocPVA -m user=$USER -s -d tank.db -d control.db -d control_diff.db
