#!/bin/bash
#
# Example of running IOC with thread priorities

if [ ! `whoami` == 'root' ]
then
	echo "Must run with sudo!"
	exit
fi

# As 'root', we can Enable thread priorities & lock memory
# From `man ulimit`:
#   -r     The maximum real-time scheduling priority
#   -e     The maximum scheduling priority ("nice")
#   -l     The maximum size that may be locked into memory
ulimit -r 99 -e 99 -l 10000000000

# When we now run the IOC, EPICS will notice that thread priorities
# are enabled and use them.
# We could do this as root:
#    softIoc ...
# but it's better practice to run IOCs as a non-root user,
# so switch back to `epics-dev` for running the IOC
cd /ics/training/examples/01_first_steps
su epics-dev -c "/ics/training/bin/softIoc -m S=training -d very_first.db"


