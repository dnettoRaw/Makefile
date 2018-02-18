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
#MAKE 	:= $(MAKE) --no-print-directory -j
MAKE	:= make
JOINLIB := libtool -static -o 
