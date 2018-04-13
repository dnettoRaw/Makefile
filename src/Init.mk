##############33
# init folders makefile
##############33


ifeq ($(FOLDERS), )
FOLDERS := src includes libs
$(info $(call wrn_c) $(shell echo "$IFOLDERS$R is not defined, setting it to default $(I)'$(FOLDERS)'$(R)"))
endif

ifeq ($(FILES), )
FILES := auteur src/.c include/exemple.h
$(info $(call wrn_c) $(shell echo "$IFILES$R is not defined, setting it to default $(I)'$(FILES)'$(R)"))
endif

# ifeq ($(HI), )
# $(info $(call wrn_c) $(shell echo "$ISRC$R is not defined, setting it to default $I'auto detection files'$R"))
# endif


all:
	$(S_3)echo "teste"

%:
	$(S_3)$(foreach D, $(FOLDERS), echo "$(INF_STR) $(MK) $(D)" ;)