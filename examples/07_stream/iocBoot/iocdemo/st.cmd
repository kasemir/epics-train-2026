#!../../bin/linux-aarch64/demo

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/demo.dbd"
demo_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/demoApp/Db")

drvAsynIPPortConfigure ("NC", "127.0.0.1:6543")

# Log some asyn info and in/out texts
# ASYN_TRACE_ERROR     0x0001
# ASYN_TRACEIO_DEVICE  0x0002
# ASYN_TRACEIO_FILTER  0x0004
# ASYN_TRACEIO_DRIVER  0x0008
# ASYN_TRACE_FLOW      0x0010
# ASYN_TRACE_WARNING   0x0020
asynSetTraceMask("NC", 0, 4)
asynSetTraceIOMask("NC", 0, 6)


## Load record instances
cd ${TOP}
dbLoadRecords("db/stream-demo.db")

iocInit()

## Start any sequence programs
#seq sncdemo,"user=epics-dev"
