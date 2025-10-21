# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = seq
# seq.dbd will be created and installed
DBD += seq.dbd

# seq.dbd will be made up from these files:
seq_DBD += base.dbd

# Add 'tank' sequence
SNCFLAGS += +r
seq_DBD += tank.dbd
seq_SRCS += tank.st
seq_LIBS += seq pv


# seq_registerRecordDeviceDriver.cpp derives from seq.dbd
seq_SRCS += seq_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
seq_SRCS_DEFAULT += seqMain.cpp
seq_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#seq_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
seq_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

