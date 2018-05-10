
###########################################################
###......Clean Makerfile no implicit declaration........###
###.....................................................###
###########################################################

NAME    :=(NAME)
AUTEUR  :=(AUTEUR)
D_INC   :=(D_INC)
D_SRC   :=(D_SRC)
D_ALLS  :=(D_ALLS)
D_OBJ   :=(D_OBJ)
D_OBD   :=(D_OBD)
D_NR	:=(D_NORM)
D_LIB   :=(D_LIB)
LIBS    :=(LIBS)
LIBA    :=(LIBA)
INCLIB	:=(INCLIB)
INC     :=(INC)
SRC     :=(SRC)
OBJ     :=(OBJ)
OBD     :=(OBD)
CFLAGS  :=(NORM)
TAG     :=(CFLAGS)
VPATH   :=(TAG)


RESET		= \033[0m
WRN_COLOR	= \033[38;5;226m
ERR_COLOR	= \033[38;5;196m
STD_COLOR	= \033[38;5;245m
INF_COLOR	= \033[38;5;191m
RM_COLOR	= \033[38;5;9m
OK_COLOR	= \033[38;5;46m
TAG_COLOR	= \033[38;5;$(TAG)m
I			= \033[1m
R			= \033[0m

# info text 
OK_STR  = $(strip $(OK_COLOR)[ OK ]$(RESET))
WRN_STR	= $(strip $(WRN_COLOR)[ warning ]$(RESET))
ERR_STR	= $(strip $(ERR_COLOR)[ error ]$(RESET))
ifeq ($(INTER), yes)
ifneq ($(DEPTH), )
DEPTH_F = "$(shell dep=0 ; while [[ $$dep -le "$(DEPTH) - 1" ]] ; do dep=`expr $$dep + 1` && echo "╶" ; done)"
endif 
DEPTH_F +="└─"
endif 

all: auteur libs $(NAME)

# auteur file
auteur:
ifeq ($(AUTEUR), )
	$(S_2)if [ -e ./auteur ] ; then echo "$(INF_STR) : AUTEUR = \c" && cat ./auteur && echo "$(OK_STR)" ; else echo "$(ERR_STR) : AUTEUR don't exist" ; fi
else
	$(S_2)if [ -e ./auteur ] ; then echo "$(INF_STR) : AUTEUR = \c" && cat ./auteur && echo "$(OK_STR)"; else echo "$(AUTEUR)\c" > auteur ; echo "$(INF_STR) : AUTEUR has been created" ; fi
endif

# make others makes
libs:
ifneq ($(LIBS), )
	$(S_4)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" ;)
	$(S_2)echo "$(INF_STR) : libs has been created $(OK_STR)"
else
	$(S_2)echo "$(WRN_STR) : No Libs needed for $(TAG_COLOR)$(NAME)$(RESET)" 
endif

$(NAME): $(OBD) $(OBJ) libs
ifeq ($(suffix $(NAME)), .a)
	$(S_4)$(AR) rc $(NAME) $(OBJ)
ifneq ($(LIBS), )
	$(S_4)libtool -static -o  $(NAME) $(NAME) $(patsubst ./, $(LIBA), )
	$(S_2)echo "$(INF_STR) : lib join $(OK_STR)"
endif
	$(S_4)ranlib $(NAME)
	$(S_2)echo "$(INF_STR) : make lib $(OK_STR)"
else
	$(S_2)$(CC) $(INC) -c $< -o $@ $(INCLIB)
	$(S_2)echo "$(INF_STR) : make a binary file"
endif

# make dirs
mki:
	$(S_4)$(foreach D, $(DIRS), mkdir -p $(D);)
	$(S_4)$(foreach D,$(DIRS),echo "$(INF_STR) mkdir -p $(D)" ;) 

# generate  files.d 
$(D_OBD)/%.d: %.c
	$(S_4)mkdir -p $(D_OBD)
	$(S_4)$(CC) $(INC) -M -mtbm $(patsubst %.c, $(D_OBJ)/%.o, $(patsubst $(D_SRC), $<, ))  $< -o $@
ifeq ($(filter @, $(S_1)), )
	$(S_2)echo "$(INF_STR) : genration $@ $(OK_STR)"
endif

#generate files.o
$(D_OBJ)/%.o: %.c
	$(S_4)mkdir -p $(D_OBJ)
	$(S_4)$(CC) $(FLAGS) $(INC) -c $< -o $@
ifeq ($(filter @, $(S_1)), )
	$(S_2)echo "$(INF_STR) : genration $@ $(OK_STR)"
endif


	
.PHONY: all clean fclean re auteur libs 
