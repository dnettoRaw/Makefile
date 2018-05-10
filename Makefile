NAME ="Make Init"
MMPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TAG=46

include $(MMPATH)src/DefautValues.mk
include $(MMPATH)src/VerboseMods.mk
include $(MMPATH)src/ColorMaker.mk
include $(MMPATH)src/Init.mk

help:
	$(S_4)echo "$G###########################################################$R"
	$(S_4)echo "$G###.....................Make.Init.......................###$R"
	$(S_4)echo "$G###########################################################$R"
	$(S_4)echo " "
	$(S_4)echo "exemple:"
	$(S_4)echo "	make path=~/my/folder/NewFolderProject name=MyProject"
	$(S_4)echo " "
	$(S_4)echo "options:"
	$(S_4)echo "		path		required"
	$(S_4)echo " "
	$(S_4)echo "		name		optinal "
	$(S_4)echo "		FOLDERS		optinal "
	$(S_4)echo "		FILES		optinal "
	$(S_4)echo " "
	$(S_4)echo "$G###########################################################$R"
	$(S_4)echo "$G###.....................Make.Init.......................###$R"
	$(S_4)echo "$G###########################################################$R"

#include $(MMPATH)make.mk
