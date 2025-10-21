# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG

# Build the IOC application
PROD_IOC = busy
DBD += busy.dbd
busy_DBD += base.dbd

## Add busy record #########
busy_DBD += busySupport.dbd
busy_LIBS += busy
############################

## Add PVXS ################
busy_DBD += softIoc.dbd
busy_DBD += pvxsIoc.dbd
busy_LIBS += pvxsIoc
busy_LIBS += pvxs
############################

busy_SRCS += busy_registerRecordDeviceDriver.cpp
busy_SRCS_DEFAULT += busyMain.cpp
busy_SRCS_vxWorks += -nil-
busy_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES

