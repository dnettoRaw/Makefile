##############33
# init folders makefile
##############33


ifeq ($(FOLDERS), )
FOLDERS := src includes libs
$(info $(call wrn_c) $(shell echo "$IFOLDERS$R is not defined, setting it to default $(I)'$(FOLDERS)'$(R)"))
endif

ifeq ($(FILES), )
FILES := auteur src/exemple.c include/exemple.h
$(info $(call wrn_c) $(shell echo "$IFILES$R is not defined, setting it to default $(I)'$(FILES)'$(R)"))
endif

ifeq ($(path), )
$(error $(call err_c) $(shell echo "$Ipath$R is not defined, ex: $$> make path=NewProject"))
endif


# ifeq ($(HI), )
# $(info $(call wrn_c) $(shell echo "$ISRC$R is not defined, setting it to default $I'auto detection files'$R"))
# endif


all:
	$(S_3)echo "teste $(PATH)"

%:
	$(S_3)$(foreach D, $(FOLDERS), echo "$(INF_STR) $(MK) $(D)" ;)