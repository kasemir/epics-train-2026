#!../../bin/linux-aarch64/pyioc
#- You may have to change linux-aarch64 to linux-x86_64

< envPaths

dbLoadDatabase "../../dbd/pyioc.dbd"
pyioc_registerRecordDeviceDriver(pdbbase) 

cd $(TOP)
dbLoadRecords("db/1_hello.db")

iocInit()

