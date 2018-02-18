###########################################################
###.....................by.:.dnetto.....................###
###########################################################

# you can modifie level of verbose mode
# make v=? /or/ verbose=?
# 0 to normal
# 1 to some warnings
# 2 to + compilations objs
# 3 to all verbose
# 4 to output log file with verbose 3


ifneq ($(filter 1 2 3,$(verbose) $(v) $(VERBOSE) $(V)), )
S :=

ifeq ($(INC), )
$(info $(call wrn_c) $(shell echo "$IINC$R is not defined, setting it to default $(I)'-I.'$(R)"))
endif

ifeq ($(SRC), )
$(info $(call wrn_c) $(shell echo "$ISRC$R is not defined, setting it to default $I'auto detection files'$R"))
endif

ifeq ($(D_SRC), )
$(info $(call wrn_c) $(shell echo "$ID_SRC$R is not defined, setting it to default $I'./src'$R"))
endif

ifeq ($(OBJ), )
$(info $(call wrn_c) $(shell echo "$IOBJ$R is not defined, setting it to default $I'auto convert files from SRC'$R"))
endif

ifeq ($(D_OBJ), )
$(info $(call wrn_c) $(shell echo "$ID_OBJ$R is not defined, setting it to default $I'./objects/obj_o'$R"))
endif

ifeq ($(OBD), )
$(info $(call wrn_c) $(shell echo "$IOBD$R is not defined, setting it to default $I'auto convert files form OBJ'$R"))
endif

ifeq ($(D_OBD), )
$(info $(call wrn_c) $(shell echo "$ID_OBD$R is not defined, setting it to default $I'./obj_d'$R"))
endif

ifeq ($(LIB), )
$(info $(call wrn_c) $(shell echo "$ILIB$R is not defined, setting it to default $I'.'$R"))
endif

ifeq ($(D_LIB), )
$(info $(call wrn_c) $(shell echo "$ID_LIB$R is not defined, setting it to default $I'.'$R"))
endif

ifeq ($(D_ALLS), )
$(info $(call wrn_c) $(shell echo "$ID_ALLS$R is not defined, setting it to default $I'.'$R"))
endif

ifeq ($(NOFLAG), )
$(info $(call wrn_c) $(shell echo "$INOFLAGS$R is off, default $I'-Wall -Werror -Wextra'$R"))
endif

ifeq ($(TAG), )
$(info $(call wrn_c) $(shell echo "$ITAG$R is off, default $I$(shell awk -v min=1 -v max=255 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')$R"))
endif

else
#verbose 1 all steps msg on
ifeq ($(filter 1, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 := @
endif
#verbose 2 all steps debug on
ifeq ($(filter 2, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 := @
S_2 := @
endif
#verbose 3 all commands verbose
ifeq ($(filter 3, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 := @
S_2 := @
S_3 := @
endif
endif

ifeq ($(NAME), )
$(error $(call err_c) NAME was not set, aborting)
endif

ifeq ($(filter *, $(SRC) $(OBJ) $(OBD)), *)
$(error $(call err_c) WILDCAR is not accepted, please fix this)
endif

ifeq ($(D_INC), )
D_INC := ./includes
endif

ifeq ($(D_SRC), )
D_SRC	:= ./src
endif

ifeq ($(D_ALLS), )
D_ALLS	:=	./objs
endif

ifeq ($(D_OBJ), )
D_OBJ	:= $(addprefix $(D_ALLS)/, obj)
endif

ifeq ($(D_OBD), )
D_OBD	:=$(addprefix $(D_ALLS)/, obd)
endif

ifeq ($(D_LIB), )
D_LIB	:= ./libs
endif

ifeq ($(LIBS), )
LIBS	:= $(shell find $(D_LIB) -type d -not -path $(D_LIB) -maxdepth 1)
endif

ifeq ($(LIBA), )
LIBA	:= $(shell find $(LIBS) -type f -iname 'Makefile' -exec grep -m 1  'NAME' {} \; | cut -d '=' -f2- )
endif

ifeq ($(INCLIB), )
INCLIB	:= $(foreach lsd, $(LIBS), -L$(lsd)/ -l$(shell find $(lsd) -type f -iname 'Makefile' -exec grep -m 1  'NAME' {} \; | cut -d 'b' -f2- ))
endif

ifeq ($(INC), )
TMP_FIND = $(shell find $(D_INC) -type f -maxdepth 1 | grep \\.h$ | rev | cut -d '/' -f1 | rev)
INC 	:= $(addprefix -I, $(D_INC)) #$(foreach ins, $(TMP_FIND), -I./includes/$(ins))
endif

TMP_FIND = $(shell find $(D_SRC) | grep \\.c$ | rev | cut -d '/' -f1 | rev)

ifeq ($(SRC), )
SRC		:= $(shell find $(D_SRC) | grep \\.c$)
endif

ifeq ($(OBJ), )
OBJ		:= $(addprefix $(D_OBJ)/, $(TMP_FIND:.c=.o))
endif

ifeq ($(OBD), )
OBD		:= $(addprefix $(D_OBD)/, $(TMP_FIND:.c=.d))
endif

ifeq ($(NOFLAG), )
CFLAGS	:=
endif

ifeq ($(TAG), )
TAG		:= $(shell awk -v min=1 -v max=255 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
endif