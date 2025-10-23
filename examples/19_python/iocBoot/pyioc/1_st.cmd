#!../../bin/linux-aarch64/pyioc
#- You may have to change linux-aarch64 to linux-x86_64

< envPaths

dbLoadDatabase "../../dbd/pyioc.dbd"
pyioc_registerRecordDeviceDriver(pdbbase) 

# Import what's used by records
pydev "from datetime import datetime"
pydev "from time import sleep"

cd $(TOP)
dbLoadRecords("db/1_hello.db")

iocInit()

