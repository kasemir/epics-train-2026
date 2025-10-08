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

PROD_IOC = demo
# demo.dbd will be created and installed
DBD += demo.dbd

# demo.dbd will be made up from these files:
demo_DBD += base.dbd

## Autosave ##################
demo_DBD += asSupport.dbd
demo_LIBS += autosave

## PVXS ######################
ifneq ($(PVXS),)
    demo_DBD += pvxsIoc.dbd
    demo_LIBS += pvxsIoc
    demo_LIBS += pvxs
endif

# demo_registerRecordDeviceDriver.cpp derives from demo.dbd
demo_SRCS += demo_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
demo_SRCS_DEFAULT += demoMain.cpp
demo_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#demo_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
demo_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

