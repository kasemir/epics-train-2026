# Training settings for /etc/profile.d

alias ..="cd .."

export PATH="/ics/training/bin:$PATH"

export EPICS_CA_ADDR_LIST=127.0.0.255

export PYTHONPATH=`echo /ics/training/tools/p4p/python*/linux-*`
export PYTHONPATH="/ics/training/tools/pyepics:$PYTHONPATH"
export PYEPICS_LIBCA=`echo /ics/training/tools/base/lib/linux-*/libca.so`

