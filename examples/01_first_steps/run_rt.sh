#!/bin/bash
#
# Example of running IOC with thread priorities

if [ ! `whoami` == 'root' ]
then
	echo "Must run with sudo!"
	exit
fi

# Enable thread priorities, lock memory
ulimit -r 99 -e 99 -l 10000000000

cd /home/epics-dev/training/examples/01_first_steps
su epics-dev -c "/home/epics-dev/training/bin/softIoc -m S=demo -d very_first.db"


