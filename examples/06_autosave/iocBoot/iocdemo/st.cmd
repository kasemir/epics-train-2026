#!../../bin/linux-aarch64/demo

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/demo.dbd"
demo_registerRecordDeviceDriver(pdbbase) 

## Load record instances
cd ${AUTOSAVE}
dbLoadRecords("db/save_restoreStatus.db","P=demo:")

cd ${TOP}
dbLoadRecords("db/autosave.db","S=demo")

### AUTOSAVE: Configure ###############################
# File locations, using some macros
#epicsEnvSet("SAVE_DIR", "${TOP}/iocBoot/${IOC}")
#save_restoreSet_status_prefix("demo:")
#set_requestfile_path("$(SAVE_DIR)")
#set_savefile_path("$(SAVE_DIR)")

# Schedule a maximum of 3 sequenced backups of the .sav file
# every 10 minutes - .sav0, .sav1, .sav2
#save_restoreSet_NumSeqFiles(3)
#save_restoreSet_SeqPeriodInSeconds(600)

# Arrange for restoring saved values into records
#set_pass1_restoreFile("$(IOC).sav")
######################################################


# Start IOC processes
iocInit()


### AUTOSAVE: Create request file and start periodic 'save’ ##
#makeAutosaveFileFromDbInfo("$(SAVE_DIR)/$(IOC).req", "autosaveFields")
#create_monitor_set("$(IOC).req", 5)
######################################################

