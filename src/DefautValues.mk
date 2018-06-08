###########################################################
########	   	    defaut vars makefile           ########
###########################################################
CC		?= gcc
AR 		:= ar rc
RANLIB 	:= ranlib
MK		:= mkdir -p
RM		:= -rm -r
CFLAGS	?= -Wall -Werror -Wextra
DIRS 	?= $(D_OBJ) $(D_OBD) $(D_NORM)
D_CLEAN ?= ./objs
VPATH	?= $(foreach dir, $(DIRBASE_C), $(D_SRC)/$(dir))
#MAKE 	:= $(MAKE) --no-print-directory  -j$(NB_CORE - 1) -l$(NB_CORE - 2) 
JOINLIB := libtool -static -o
EXEC_NORMINETTE := $(shell whereis ruby) $(MMPATH)src/norminette/norminette.rb