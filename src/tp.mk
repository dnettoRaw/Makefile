#!/bin/sh
###########################################################
###......................template.......................###
###########################################################
if [ -n "$2" ] ; then  U=$2 ; else U=${USER} ; fi
/bin/echo "
###########################################################
###......Clean Makerfile no implicit declaration........###
###.....................................................###
###########################################################

NAME    :=${1}
AUTEUR  :=${2}
D_INC   :=${3}
D_SRC   :=${4}
D_ALLS  :=${5}
D_OBJ   :=${6}
D_OBD   :=${7}
D_LIB   :=${8}
LIBS    :=${9}
LIBA    :=${10}
INCLIB	:=${11}
INC     :=${12}
SRC     :=${13}
OBJ     :=${14}
OBD     :=${15}
CFLAGS  :=${16}
TAG     :=${17}
VPATH   :=${18}


RESET		= \033[0m
WRN_COLOR	= \033[38;5;226m
ERR_COLOR	= \033[38;5;196m
STD_COLOR	= \033[38;5;245m
INF_COLOR	= \033[38;5;191m
RM_COLOR	= \033[38;5;9m
OK_COLOR	= \033[38;5;46m
TAG_COLOR	= \033[38;5;\$(TAG)m
I			= \033[1m
R			= \033[0m

# info text 
OK_STR  = \$(strip \$(OK_COLOR)[ OK ]\$(RESET))
WRN_STR	= \$(strip \$(WRN_COLOR)[ warning ]\$(RESET))
ERR_STR	= \$(strip \$(ERR_COLOR)[ error ]\$(RESET))
ifeq (\$(INTER), yes)
ifneq (\$(DEPTH), )
DEPTH_F = \"\$(shell dep=0 ; while [[ \$\$dep -le \"\$(DEPTH) - 1\" ]] ; do dep=\`expr \$\$dep + 1\` && echo \"╶\" ; done)\"
endif 
DEPTH_F +=\"└─\"
endif 
INF_STR = \$(strip \$(INF_COLOR)[ info ] \$(RESET)\$(DEPTH_F)[\$(TAG_COLOR)\$(NAME)\$(RESET)])
IRM_STR = \$(strip \$(RM_COLOR)[ info ] \$(RESET)\$(DEPTH_F)[\$(TAG_COLOR)\$(NAME)\$(RESET)])


#verbose 1 all steps msg on
ifneq (\$(filter 1, \$(verbose) \$(v) \$(VERBOSE) \$(V)), )
S_1 :=
SIL=1
endif
#verbose 2 all steps debug on
ifneq (\$(filter 2, \$(verbose) \$(v) \$(VERBOSE) \$(V)), )
S_1 :=
S_2 :=
SIL=2
endif
#verbose 3 all commands verbose
ifneq (\$(filter 3, \$(verbose) \$(v) \$(VERBOSE) \$(V)), )
S_1 :=
S_2 :=
S_3 :=
SIL=3
endif
S_1 ?=@
S_2 ?=@
S_3 ?=@

all: auteur libs \$(NAME)

# auteur file
auteur:
ifeq (\$(AUTEUR), )
	\$(S_2)if [ -e ./auteur ] ; then echo \"\$(INF_STR) : AUTEUR = \c\" && cat ./auteur && echo \"\$(OK_STR)\" ; else echo \"\$(ERR_STR) : AUTEUR don't exist\" ; fi
else
	\$(S_2)if [ -e ./auteur ] ; then echo \"\$(INF_STR) : AUTEUR = \c\" && cat ./auteur && echo \"\$(OK_STR)\"; else echo \"\$(AUTEUR)\c\" > auteur ; echo \"\$(INF_STR) : AUTEUR has been created\" ; fi
endif

# make others makes
libs:
ifneq (\$(LIBS), )
	\$(S_3)\$(foreach lb, \$(LIBS),\$(MAKE) -C \$(lb) VERBOSE=\$(SIL) INTER=yes DEPTH=\"\$(DEPTH) + 1\" ;)
	\$(S_2)echo \"\$(INF_STR) : libs has been created \$(OK_STR)\"
else
	\$(S_2)echo \"\$(WRN_STR) : No Libs needed for \$(TAG_COLOR)\$(NAME)\$(RESET)\" 
endif

\$(NAME): \$(OBD) \$(OBJ) libs
ifeq (\$(suffix \$(NAME)), .a)
	\$(S_3)\$(AR) rc \$(NAME) \$(OBJ)
ifneq (\$(LIBS), )
	\$(S_3)libtool -static -o  \$(NAME) \$(NAME) \$(patsubst ./, \$(LIBA), )
	\$(S_2)echo \"\$(INF_STR) : lib join \$(OK_STR)\"
endif
	\$(S_3)ranlib \$(NAME)
	\$(S_2)echo \"\$(INF_STR) : make lib \$(OK_STR)\"
else
	\$(S_2)\$(CC) \$(INC) -c \$< -o \$@ \$(INCLIB)
	\$(S_2)echo \"\$(INF_STR) : make a binary file\"
endif

# make dirs
mki:
	\$(S_3)\$(foreach D, \$(DIRS), mkdir -p \$(D);)
	\$(S_3)\$(foreach D,\$(DIRS),echo \"\$(INF_STR) mkdir -p \$(D)\" ;) 

# generate  files.d 
\$(D_OBD)/%.d: %.c
	\$(S_3)mkdir -p \$(D_OBD)
	\$(S_3)\$(CC) \$(INC) -M -mtbm \$(patsubst %.c, \$(D_OBJ)/%.o, \$(patsubst \$(D_SRC), \$<, ))  \$< -o \$@
ifeq (\$(filter @, \$(S_1)), )
	\$(S_2)echo \"\$(INF_STR) : genration \$@ \$(OK_STR)\"
endif

#generate files.o
\$(D_OBJ)/%.o: %.c
	\$(S_3)mkdir -p \$(D_OBJ)
	\$(S_3)\$(CC) \$(FLAGS) \$(INC) -c \$< -o \$@
ifeq (\$(filter @, \$(S_1)), )
	\$(S_2)echo \"\$(INF_STR) : genration \$@ \$(OK_STR)\"
endif

clean:
	\$(S_3)rm -rf \$(D_ALLS) \$(NAME)
	\$(S_2)echo \"\$(IRM_STR) : clean \$(OK_STR)\" 
ifneq (\$(LIBS), )
	\$(S_3)\$(foreach lb, \$(LIBS), \$(MAKE) -C \$(lb) VERBOSE=\$(SIL) INTER=yes DEPTH=\"\$(DEPTH) + 1\" clean;)
endif

fclean:
	\$(S_3)rm -rf \$(D_ALLS) \$(NAME)
	\$(S_2)echo \"\$(IRM_STR) : fclean \$(OK_STR)\" 
ifneq (\$(LIBS), )
	\$(S_3)\$(foreach lb, \$(LIBS), \$(MAKE) -C \$(lb) VERBOSE=\$(SIL) INTER=yes DEPTH=\"\$(DEPTH) + 1\" fclean;)
endif

re: fclean
	\$(S_3)\$(MAKE) VERBOSE=\$(SIL)
	
.PHONY: all clean fclean re auteur libs " > Makefile
echo "\033[38;5;191m[ info ] \033[0m[\033[38;5;240m${1}\033[0m] : Makefile clean has been created \033[38;5;46m[ OK ]\033[0m"