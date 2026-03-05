#!/ics/bin/run_actual_ioc ../../bin/*/demo

dbLoadDatabase "../../dbd/demo.dbd"
demo_registerRecordDeviceDriver(pdbbase) 

## Load record instances

# Plain database
dbLoadRecords("../../db/plain.db")

# Database file with macros, load with different settings
#dbLoadRecords("../../db/macro.db","NUM=1,LIMIT=10")
#dbLoadRecords("../../db/macro.db","NUM=2,LIMIT=100")

# File where macros have already been expanded
#dbLoadRecords("../../db/macros.db")

iocInit()

