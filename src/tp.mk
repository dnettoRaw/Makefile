# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    tp.mk                                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dnetto <dnetto@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/17 12:11:12 by dnetto            #+#    #+#              #
#    Updated: 2018/02/17 12:15:46 by dnetto           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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

NAME    :=$1
AUTEUR  :=$U
D_INC   :=$3
D_SRC   :=$4
D_ALLS  :=$5
D_OBJ   :=$6
D_OBD   :=$7
D_NR	:=./norm
D_LIB   :=$8
LIBS    :=$9
LIBA    :=${10}
INCLIB	:=${11}
INC     :=${12}
SRC     :=${13}
OBJ     :=${14}
OBD     :=${15}
NORM 	:=./norm/ft_atoi.nr ./norm/ft_bzero.nr ./norm/ft_count.nr ./norm/ft_doubledel.nr ./norm/ft_doubledup.nr ./norm/ft_doublefree.nr ./norm/ft_doublelen.nr ./norm/ft_doublenew.nr ./norm/ft_doublepur.nr ./norm/ft_doubleread.nr ./norm/ft_doublestr.nr ./norm/ft_epur.nr ./norm/ft_fullblanks.nr ./norm/ft_isalnum.nr ./norm/ft_isalpha.nr ./norm/ft_isascii.nr ./norm/ft_isdigit.nr ./norm/ft_isprint.nr ./norm/ft_isval.nr ./norm/ft_itoa.nr ./norm/ft_memalloc.nr ./norm/ft_memccpy.nr ./norm/ft_memchr.nr ./norm/ft_memcmp.nr ./norm/ft_memcpy.nr ./norm/ft_memdel.nr ./norm/ft_memmove.nr ./norm/ft_memset.nr ./norm/ft_putchar.nr ./norm/ft_putchar_fd.nr ./norm/ft_putendl.nr ./norm/ft_putendl_fd.nr ./norm/ft_putnbr.nr ./norm/ft_putnbr_fd.nr ./norm/ft_putnbrl.nr ./norm/ft_putstr.nr ./norm/ft_putstr_fd.nr ./norm/ft_sortit.nr ./norm/ft_sortrev.nr ./norm/ft_split_whitespaces.nr ./norm/ft_strcat.nr ./norm/ft_strchr.nr ./norm/ft_strclr.nr ./norm/ft_strcmp.nr ./norm/ft_strcpy.nr ./norm/ft_strcut.nr ./norm/ft_strdel.nr ./norm/ft_strdup.nr ./norm/ft_strendl.nr ./norm/ft_strequ.nr ./norm/ft_striter.nr ./norm/ft_striteri.nr ./norm/ft_strjoin.nr ./norm/ft_strlcat.nr ./norm/ft_strlen.nr ./norm/ft_strmap.nr ./norm/ft_strmapi.nr ./norm/ft_strncat.nr ./norm/ft_strncmp.nr ./norm/ft_strncpy.nr ./norm/ft_strnequ.nr ./norm/ft_strnew.nr ./norm/ft_strnstr.nr ./norm/ft_strrchr.nr ./norm/ft_strrev.nr ./norm/ft_strsplit.nr ./norm/ft_strstr.nr ./norm/ft_strsub.nr ./norm/ft_strtolower.nr ./norm/ft_strtoupper.nr ./norm/ft_strtrim.nr ./norm/ft_takeout.nr ./norm/ft_tolower.nr ./norm/ft_toupper.nr ./norm/ft_triplendl.nr ./norm/ft_triplendl_fd.nr ./norm/ft_triplestr.nr ./norm/ft_triplestr_fd.nr ./norm/get_next_line.nr
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
	\$(S_3)\$(foreach lb, \$(LIBS),\$(MAKE) -C \$(lb) VERBOSE=\$(SIL) INTER=yes DEPTH=\"$(DEPTH) + 1\" ;)
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

norminette:
	\$(S_2)make -j 4 .nor VERBOSE=$(SIL)
	\$(S_2)$(foreach lb, $(LIBS), $(MAKE) -C $(lb) nr VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1";)

.nor: \$(NORM)
	\$(S_2)echo \"\\r\\033[J\\033[36m==== norminette ====\\033[0m\\nnorme  	  \\c\"
	\$(S_2)if [ -e norm/_error_norme_files.nr ]; then echo \"\$(ERR_STR)\" && cat norm/_error_norme_files.nr && echo \"└───── end NORME\";else echo \"    \$(OK_STR)\"; fi;
	\$(S_2)rm -rf norm/_error_norme_files.nr
	
norm/%.nr: %.c 
	\$(S_2)echo \"\\r\\033[J\$(NAME)[/] > \$<\\c\"
	\$(S_2)mkdir -p norm
	\$(S_2)echo \"├──┬── NORME : \$(TAG_COLOR)\$<\$(R)\" > \$@
	\$(S_2)norminette \$< | grep -v 'Norme:' | sed 's/Error/│  ├──/g' >> \$@
	\$(S_2)echo \"\\r\\033[J\$(NAME)[\\\\] > \$@\\c\"
	\$(S_2)echo \"│  └── end file\\n│\" >> \$@
	\$(S_2)if [ \"\`sed -n 2p \$@\`\" != \"│  └── end file\" ] ; then cat \$@ >> norm/_error_norme_files.nr ; fi;
	
.PHONY: all clean fclean re auteur libs nr" > Makefile
echo "\033[38;5;191m[ info ] \033[0m[\033[38;5;240m${1}\033[0m] : Makefile clean has been created \033[38;5;46m[ OK ]\033[0m"