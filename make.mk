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
NB_CORE := $(shell grep -c '^processor' /proc/cpuinfo)
endif

ifeq ($(shell uname),Darwin)
CFLAGS := $(MCFLAGS) $(CFLAGS)
PINC := $(MPINC) $(PINC)
CLIB := $(MCLIB) $(CLIB)
LIB := $(MLIB) $(LIB)
LARGS := $(MLARGS) $(LARGS)
NB_CORE := $(shell sysctl -n hw.ncpu)
endif

###########################################################
########...............check.updates...............########
###########################################################
#defaut off 
#ifeq (UPDATE,yes)
#git  pull
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

MMPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))src
# some colors and warnings
include $(MMPATH)/ColorMaker.mk
include $(MMPATH)/AutoComplete.mk
include $(MMPATH)/VerboseMods.mk
include $(MMPATH)/CreatFiles.mk
include $(MMPATH)/RemoveFiles.mk
include $(MMPATH)/MakeMakefile.mk
include $(MMPATH)/norme42.mk

debug:
	@echo "$(INF_STR)"
#\n\nFILEBASE_C	= $(FILEBASE_C)\n\nFILEBASE_H	= $(FILEBASE_H)\n\nDIRBASE_C	= $(DIRBASE_C)\n\nDIRBASE_H	= $(DIRBASE_H)\n\nsrc	= $(SRC)\n\nobj	= $(OBJ)\n\nobd	= $(OBD)\n\nnorm	=$(NORM_C) || $(NORM_H)"

#"src = $(SRC)\n\nobj = $(OBJ)\n\nobd = $(OBD)\n\nnorm = $(NORM)"

.PHONY: all clean fclean re auteur libs 
###########################################################
###.....................by.:.dnetto.....................###
###########################################################
