###########################################################
###.....................by.:.dnetto.....................###
###########################################################

###########################################################
########...........System compatibility............########
###########################################################
ifeq ($(shell uname),Linux)
CFLAGS := $(LCFLAGS) $(CFLAGS)
PINC := $(LPINC) $(PINC)
CLIB := $(LCLIB) $(CLIB)
LIB := $(LLIB) $(LIB)
LARGS := $(LLARGS) $(LARGS)
endif

ifeq ($(shell uname),Darwin)
CFLAGS := $(MCFLAGS) $(CFLAGS)
PINC := $(MPINC) $(PINC)
CLIB := $(MCLIB) $(CLIB)
LIB := $(MLIB) $(LIB)
LARGS := $(MLARGS) $(LARGS)
endif

###########################################################
########...............check.updates...............########
###########################################################
#defaut off 
#ifeq (UPDATE,yes)
#git pull
#endif

###########################################################
########		 	  gen file.log			       ########
###########################################################

define generate_file
    echo "$(1)" >$(2).log
endef

###########################################################
###....................some includes....................###
###########################################################

MMPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
# some colors and warnings
include $(MMPATH)src/cm.mk
# defaut values set
include $(MMPATH)src/dv.mk
# auto complet vars
include $(MMPATH)src/ac.mk
# create files
include $(MMPATH)src/cf.mk
# run test
include $(MMPATH)src/rt.mk
# create a clean make file no include, no wildchar promisse 
include $(MMPATH)src/fm.mk

###########################################################
###.....................by.:.dnetto.....................###
###########################################################
