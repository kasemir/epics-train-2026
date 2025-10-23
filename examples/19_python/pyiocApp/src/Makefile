TOP=../..
include $(TOP)/configure/CONFIG

# Build the IOC application
PROD_IOC = pyioc
DBD += pyioc.dbd
pyioc_DBD += base.dbd

# Add PyDevice ###############
include $(PYDEVICE)/configure/CONFIG.PyDevice
pyioc_DBD += pydev.dbd
pyioc_DBD += pycalcRecord.dbd
pyioc_LIBS += pydev
##############################

## PVXS ######################
pyioc_DBD += pvxsIoc.dbd
pyioc_LIBS += pvxsIoc
pyioc_LIBS += pvxs

pyioc_SRCS += pyioc_registerRecordDeviceDriver.cpp
pyioc_SRCS_DEFAULT += pyiocMain.cpp
pyioc_SRCS_vxWorks += -nil-
pyioc_LIBS += $(EPICS_BASE_IOC_LIBS)


include $(TOP)/configure/RULES

