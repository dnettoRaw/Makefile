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

MMPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
# some colors and warnings
include $(MMPATH)src/cm.mk
# defaut values set
include $(MMPATH)src/dv.mk
# auto complet vars
include $(MMPATH)src/ac.mk
# create files
include $(MMPATH)src/cf.mk
# clean, fclean, re
include $(MMPATH)src/re.mk
# run test
include $(MMPATH)src/rt.mk
# create a clean make file no include, no wildchar promisse 
include $(MMPATH)src/fm.mk
# norminette
include $(MMPATH)src/nr.mk

debug:
	$(S_3)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="expr $(DEPTH) + 1" debug;)
	@echo "\n$(INC)\n$(INC_FILES)"
#"src = $(SRC)\n\nobj = $(OBJ)\n\nobd = $(OBD)\n\nnorm = $(NORM)"

.PHONY: all clean fclean re auteur libs 
###########################################################
###.....................by.:.dnetto.....................###
###########################################################
