##############33
# init folders makefile
##############33


ifeq ($(FOLDERS), )
FOLDERS := src includes libs
$(info $(call wrn_c) $(shell echo "$W$BFOLDERS$R is not defined, setting it to default $B'$(FOLDERS)'$(R)"))
endif

ifeq ($(FILES), )
FILES := auteur Makefile src/exemple.c includes/exemple.h libs/place_your_libs_folders_here
$(info $(call wrn_c) $(shell echo "$W$BFILES$R is not defined, setting it to default $B'$(FILES)'$(R)"))
endif

ifeq ($(path), )
$(error $(call err_c) $(shell echo "$W$Bpath$R is not defined, ex: $B$U$$> make path=NewProject help$R for more inf"))
endif

ifeq ($(name), )
name := $(shell echo "$(path)" | rev | cut -d '/' -f 1 | rev )
$(info $(call wrn_c) $(shell echo "$W$Bname$R is not defined, setting it to default $B'$(name)'$(R)"))
endif



# ifeq ($(HI), )
# $(info $(call wrn_c) $(shell echo "$BSRC$R is not defined, setting it to default $B'auto detection files'$R"))
# endif


all: test_only
	$(S_3)$(MK) $(path)
	$(S_3)$(foreach D, $(FOLDERS), $(MK) $(path)/$(D) ;)
	$(S_3)$(foreach F, $(FILES), touch $(path)/$(F);)
	$(S_3)echo "$(USER)" > $(path)/auteur
	$(S_3)echo "###########################################################" > $(path)/Makefile
	$(S_3)echo "###.....................Makefile........................###" >> $(path)/Makefile
	$(S_3)echo "###########################################################" >> $(path)/Makefile
	$(S_3)echo "NAME=$(name)" >> $(path)/Makefile
	$(S_3)echo "\n\c" >> $(path)/Makefile
	$(S_3)echo "include $(MMPATH)make.mk" >> $(path)/Makefile
	$(S_3)echo "###########################################################" >> $(path)/Makefile
	$(S_3)echo "###.....................by.:.dnetto.....................###" >> $(path)/Makefile
	$(S_3)echo "###########################################################" >> $(path)/Makefile

test_only:
	$(S_3)echo "$(INF_STR) $(MK) $(path)"
	$(S_3)echo "$(INF_STR) auteur : $W$B$(USER)$R"
	$(S_3)echo "$(INF_STR) Project Name $W$B$(name)$R"
	$(S_3)echo "$(INF_STR) $(path)/makefile"
	$(S_3)$(foreach D, $(FOLDERS), echo "$(INF_STR) $(MK) $(path)/$(D)" ;)
	$(S_3)$(foreach F, $(FILES), echo "$(INF_STR) touch $(path)/$(F)" ;)
	