#!/ics/bin/run_actual_ioc ../../bin/*/demo

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/demo.dbd"
demo_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/demoApp/Db")

drvAsynIPPortConfigure ("NC", "127.0.0.1:6543")

# What to log
# ASYN_TRACE_ERROR     0x0001
# ASYN_TRACEIO_DEVICE  0x0002
# ASYN_TRACEIO_FILTER  0x0004
# ASYN_TRACEIO_DRIVER  0x0008
# ASYN_TRACE_FLOW      0x0010
# ASYN_TRACE_WARNING   0x0020
asynSetTraceMask("NC", 0, 0xE)

# How to show the logged text
# ASYN_TRACEIO_NODATA 0x0000
# ASYN_TRACEIO_ASCII  0x0001
# ASYN_TRACEIO_ESCAPE 0x0002
# ASYN_TRACEIO_HEX    0x0004
asynSetTraceIOMask("NC", 0, 6)

## Load record instances
cd ${TOP}
dbLoadRecords("db/stream-demo.db")

iocInit()

