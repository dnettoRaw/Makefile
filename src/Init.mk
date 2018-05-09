##############33
# init folders makefile
##############33


ifeq ($(FOLDERS), )
FOLDERS := src includes libs
$(info $(call wrn_c) $(shell echo "$BFOLDERS$R is not defined, setting it to default $(I)'$(FOLDERS)'$(R)"))
endif

ifeq ($(FILES), )
FILES := auteur src/exemple.c includes/exemple.h libs/place_your_libs_folders_here
$(info $(call wrn_c) $(shell echo "$BFILES$R is not defined, setting it to default $(I)'$(FILES)'$(R)"))
endif

ifeq ($(path), )
$(error $(call err_c) $(shell echo "$Bpath$R is not defined, ex: $B$U$$> make path=NewProject$R"))
endif


# ifeq ($(HI), )
# $(info $(call wrn_c) $(shell echo "$BSRC$R is not defined, setting it to default $B'auto detection files'$R"))
# endif


all: test_only
	$(S_3)$(MK) $(path)
	$(S_3)$(foreach D, $(FOLDERS), $(MK) $(path)/$(D) ;)
	$(S_3)$(foreach F, $(FILES), touch $(path)/$(F);)
	$(S_3)echo "$(USER)" > $(path)/auteur
test_only:
	$(S_3)echo "$(INF_STR) $(MK) $(path)"
	$(S_3)echo "$(INF_STR) auteur : $B$(USER)$R"
	$(S_3)$(foreach D, $(FOLDERS), echo "$(INF_STR) $(MK) $(path)/$(D)" ;)
	$(S_3)$(foreach F, $(FILES), echo "$(INF_STR) touch $(path)/$(F)" ;)
	