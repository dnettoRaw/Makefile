###########################################################
###.....................by.:.dnetto.....................###
###########################################################

###########################################################
########	   	    defaut vars makefile           ########
###########################################################
CC		?= gcc
AR 		:= ar
RANLIB 	:= ranlib
MK		:= mkdir -p
RM		:= rm -rf
CFLAGS	?= -Wall -Werror -Wextra
DIRS 	?= $(D_ALLS) $(D_OBJ) $(D_OBD)
VPATH	?= $(D_SRC)
#MAKE 	:= $(MAKE) --no-print-directory  -j$(NB_CORE - 1) -l$(NB_CORE - 2) 
MAKE	:= make
JOINLIB := libtool -static -o 