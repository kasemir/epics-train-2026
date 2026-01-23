#!/ics/bin/run_actual_ioc ../../bin/*/pid

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/pid.dbd"
pid_registerRecordDeviceDriver(pdbbase) 

## Load record instances
cd ${TOP}
dbLoadRecords("db/rotation_table.db", "S=demo")
dbLoadRecords("db/rotation_control.db", "S=demo")

iocInit()

