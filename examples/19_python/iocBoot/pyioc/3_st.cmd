#!/ics/bin/run_actual_ioc ../../bin/*/pyioc

< envPaths

# Usual PYTHONPATH, needed to locate 'demo.py'
epicsEnvSet("PYTHONPATH", "$(TOP)/pyiocApp/Db")

dbLoadDatabase "../../dbd/pyioc.dbd"
pyioc_registerRecordDeviceDriver(pdbbase) 

# Make 'getWeather' available
pydev "from weather import getWeather"

cd $(TOP)
dbLoadRecords("db/3_weather.db", "user=training")

iocInit()

