#!../../bin/linux-aarch64/pyioc
#- You may have to change linux-aarch64 to linux-x86_64

< envPaths

# Usual PYTHONPATH, needed to locate 'demo.py'
epicsEnvSet("PYTHONPATH", "$(TOP)/pyiocApp/Db")

dbLoadDatabase "../../dbd/pyioc.dbd"
pyioc_registerRecordDeviceDriver(pdbbase) 

# Make 'demo' available
# to the record in 2_pyioc.db that will use it
pydev "import demo"

cd $(TOP)
dbLoadRecords("db/2_pyioc.db", "user=training")

iocInit()

