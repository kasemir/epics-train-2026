TOP=../..

include $(TOP)/configure/CONFIG

# Use typed structures (since 3.16.2, see release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET -DUSE_TYPED_DSET

# Build the IOC application
PROD_IOC = devsup
DBD += devsup.dbd
# devsup.dbd will be made up from these files:
devsup_DBD += base.dbd
devsup_DBD += my_device.dbd

# Out driver & device support sources
devsup_SRCS += drvRandom.cpp
devsup_SRCS += devAiRnd.cpp

# devsup_registerRecordDeviceDriver.cpp derives from devsup.dbd
devsup_SRCS += devsup_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
devsup_SRCS_DEFAULT += devsupMain.cpp
devsup_SRCS_vxWorks += -nil-

# Finally link to the EPICS Base libraries
devsup_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES


