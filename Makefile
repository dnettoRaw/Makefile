###########################################################
###.....................by.:.dnetto.....................###
###########################################################

NAME ="Make Init"
MMPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(MMPATH)src/DefautValues.mk
include $(MMPATH)src/VerboseMods.mk
include $(MMPATH)src/ColorMaker.mk
include $(MMPATH)src/Init.mk

help:
	$(S_3)echo "$G###########################################################$R"
	$(S_3)echo "$G###.....................Make.Init.......................###$R"
	$(S_3)echo "$G###########################################################$R"
	$(S_3)echo " "
	$(S_3)echo "exemple:"
	$(S_3)echo "	make path=~/my/folder/NewFolderProject name=MyProject"
	$(S_3)echo " "
	$(S_3)echo "options:"
	$(S_3)echo "		path		required"
	$(S_3)echo " "
	$(S_3)echo "		name		optinal "
	$(S_3)echo "		FOLDERS		optinal "
	$(S_3)echo "		FILES		optinal "
	$(S_3)echo " "
	$(S_3)echo "$G###########################################################$R"
	$(S_3)echo "$G###.....................Make.Init.......................###$R"
	$(S_3)echo "$G###########################################################$R"


#include $(MMPATH)make.mk