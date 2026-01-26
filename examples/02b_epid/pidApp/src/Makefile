# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
# Build the IOC application

PROD_IOC = pid
DBD += pid.dbd
pid_DBD += base.dbd

## Add EPID record, which is included in the 'std' module
pid_DBD += stdSupport.dbd
pid_LIBS += std

## PVXS
ifneq ($(PVXS),)
    pid_DBD += pvxsIoc.dbd
    pid_LIBS += pvxsIoc
    pid_LIBS += pvxs
endif

pid_SRCS += pid_registerRecordDeviceDriver.cpp

pid_SRCS_DEFAULT += pidMain.cpp
pid_SRCS_vxWorks += -nil-

pid_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

