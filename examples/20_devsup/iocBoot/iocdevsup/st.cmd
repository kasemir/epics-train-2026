#!/ics/bin/run_actual_ioc ../../bin/*/devsup

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/devsup.dbd"
devsup_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/my_device.db","user=demo")

iocInit()

