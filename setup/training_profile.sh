# Training settings for /etc/profile.d

alias ..="cd .."

export PATH="/ics/bin:$PATH"

export EPICS_CA_ADDR_LIST=127.0.0.255

export PYTHONPATH=`echo /ics/tools/p4p/python*/linux-*`
export PYTHONPATH="/ics/tools/pyepics:$PYTHONPATH"
export PYEPICS_LIBCA=`echo /ics/tools/base/lib/linux-*/libca.so`

