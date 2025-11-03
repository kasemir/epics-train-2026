#!/ics/bin/run_actual_ioc ../../bin/*/pyioc

< envPaths

dbLoadDatabase "../../dbd/pyioc.dbd"
pyioc_registerRecordDeviceDriver(pdbbase) 

# Import what's used by records
pydev "from datetime import datetime"
pydev "from time import sleep"

cd $(TOP)
dbLoadRecords("db/1_hello.db")

iocInit()

