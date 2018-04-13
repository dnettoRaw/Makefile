NAME ="Make Init"
MMPATH := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

include $(MMPATH)src/Init.mk
include $(MMPATH)src/DefautValues.mk
include $(MMPATH)src/VerboseMods.mk

#include $(MMPATH)make.mk