#!/ics/bin/run_actual_ioc ../../bin/linux-*/busy

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/busy.dbd"
busy_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/plc_on_off.db")

iocInit()
