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
$(info $(call wrn_c) $(shell echo "$BINC$R is not defined, setting it to default $(B)'-I.'$(R)"))
endif

ifeq ($(SRC), )
$(info $(call wrn_c) $(shell echo "$BSRC$R is not defined, setting it to default $B'auto detection files'$R"))
endif

ifeq ($(D_SRC), )
$(info $(call wrn_c) $(shell echo "$BD_SRC$R is not defined, setting it to default $B'./src'$R"))
endif

ifeq ($(OBJ), )
$(info $(call wrn_c) $(shell echo "$BOBJ$R is not defined, setting it to default $B'auto convert files from SRC'$R"))
endif

ifeq ($(D_OBJ), )
$(info $(call wrn_c) $(shell echo "$BD_OBJ$R is not defined, setting it to default $B'./objects/obj_o'$R"))
endif

ifeq ($(OBD), )
$(info $(call wrn_c) $(shell echo "$BOBD$R is not defined, setting it to default $B'auto convert files form OBJ'$R"))
endif

ifeq ($(D_OBD), )
$(info $(call wrn_c) $(shell echo "$BD_OBD$R is not defined, setting it to default $B'./obj_d'$R"))
endif

ifeq ($(LIB), )
$(info $(call wrn_c) $(shell echo "$BLIB$R is not defined, setting it to default $B'.'$R"))
endif

ifeq ($(D_LIB), )
$(info $(call wrn_c) $(shell echo "$BD_LIB$R is not defined, setting it to default $B'.'$R"))
endif

ifeq ($(D_ALLS), )
$(info $(call wrn_c) $(shell echo "$BD_ALLS$R is not defined, setting it to default $B'.'$R"))
endif

ifeq ($(NOFLAG), )
$(info $(call wrn_c) $(shell echo "$BNOFLAGS$R is off, default $B'-Wall -Werror -Wextra'$R"))
endif

ifeq ($(TAG), )
$(info $(call wrn_c) $(shell echo "$BTAG$R is off, default $B$(shell awk -v min=1 -v max=255 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')$R"))
endif
endif

ifeq ($(NAME), )
$(error $(call err_c) NAME was not set, aborting)
endif

ifeq ($(filter *, $(SRC) $(OBJ) $(OBD)), *)
$(error $(call err_c) WILDCAR is not accepted, please fix this)
endif

######################################################################
###########
######################################################################
ifeq ($(D_INC), )
D_INC 	= ./includes
endif
ifeq ($(D_SRC), )
D_SRC	= ./src
endif

FILEBASE_C	= $(foreach V, $(shell find $(D_SRC) -type f | grep "\.c" | rev | cut -f2- -d. | rev | cut -f3- -d/), $(V))
FILEBASE_H	= $(foreach V, $(shell find $(D_INC) -type f | grep "\.h" | rev | cut -f2- -d. | rev | cut -f3- -d/), $(V))
DIRBASE_C	= $(foreach V, $(shell find $(D_SRC) -type d |  cut -f3- -d/ | sed '1d'),$(V))
DIRBASE_H	= $(foreach V, $(shell find $(D_INC) -type d |  cut -f3- -d/ | sed '1d'),$(V))

ifeq ($(D_OBJ), )
D_OBJ	= ./objs/files.o
endif

ifeq ($(D_OBD), )
D_OBD	= ./objs/files.d
endif

ifeq ($(D_NORM), )
D_NORM	= ./objs/files.nr
endif

ifeq ($(D_LIB), )
D_LIB	= ./libs
endif

ifeq ($(LIBS), )
LIBS	= $(shell find $(D_LIB) -type d -maxdepth 1)
endif

ifeq ($(LIBA), )
LIBA	= $(shell find $(LIBS) -type f -iname 'Makefile' -exec grep -m 1  'NAME' {} \; | cut -d '=' -f2- )
endif

ifeq ($(INCLIB), )
INCLIB	= $(foreach lsd, $(LIBS), -L$(lsd)/ -l$(shell find $(lsd) -type f -iname 'Makefile' -maxdepth 1 -exec grep -m 1  'NAME' {} \; | cut -d 'b' -f2- | cut -d '.' -f-1))
endif

ifeq ($(INC), )
INC_FILES = $(addprefix $(FILEBASE_H), .h)
INC 	= $(addprefix -I, $(D_INC)) #$(foreach ins, $(TMP_FIND), -I./includes/$(ins))
endif

ifeq ($(SRC), )
SRC		= $(patsubst %, $(D_SRC)/%.c, $(FILEBASE_C)) #$(wildcard $(D_SRC)/*.c)
endif

ifeq ($(OBJ), )
OBJ		= $(patsubst %, $(D_OBJ)/%.o, $(FILEBASE_C))
endif

ifeq ($(OBD), )
OBD		= $(patsubst %, $(D_OBD)/%.d, $(FILEBASE_C))
endif

ifeq ($(filter ,$(NRM_C), $(NRM_H)), )
NORM_C	= $(patsubst %, $(D_NORM)/%.nr, $(FILEBASE_C))
NORM_H	= $(patsubst %, $(D_NORM)/%.nr, $(FILEBASE_H))
endif

ifeq ($(NOFLAG), )
CFLAGS	=
else 
CFLAGS ?= -Wall -Werror -Wextra
endif

ifeq ($(TAG), )
TAG		:=  $(shell echo $$RANDOM % 255 + 1 | bc) #$(shell awk -v min=1 -v max=255 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
endif
