###########################################################
###.....................by.:.dnetto.....................###
###########################################################

all: $(NAME) #other_makes

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
	$(S_3)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" ;)
ifneq ($(INTER), yes)
	$(S_2)echo "$(INF_STR) : libs has been created $(OK_STR)" 
endif
else
ifeq ($(filter @, $(S_1)), )
	$(S_2)echo "$(WRN_STR) : No Libs needed for $(TAG_COLOR)$(NAME)$(RESET)" 
endif
endif


$(NAME): libs mki $(OBD) $(OBJ) 
ifeq ($(suffix $(NAME)), .a)
	$(S_3)$(AR) $(NAME) $(OBJ)
ifneq ($(LIBS), )
	$(S_3)$(JOINLIB) $(NAME) $(NAME) $(patsubst ./, $(LIBA), )
ifneq ($(INTER), yes)
	$(S_3)echo "$(INF_STR) : lib join $(OK_STR)"
endif
endif
	$(S_3)$(RANLIB) $(NAME)
ifneq ($(INTER), yes)
	$(S_3)echo "$(INF_STR) : make lib $(OK_STR)"
endif
else
	$(S_2)$(CC) $(CFLAGS) $(INC) $(INCLIB) -o $@ $(OBJ)
ifneq ($(INTER), yes)
	$(S_3)echo "$(INF_STR) : make a binary file"
endif
endif

# make dirs
mki:
	$(S_3)$(foreach D, $(DIRS), $(MK) $(D);)
ifeq ($(filter @, $(S_1)), )
	$(S_3)$(foreach D, $(DIRS),echo "$(INF_STR) $(MK) $(D)" ;)
endif
	

# generate  files.d 
$(D_OBD)/%.d: %.c
	$(S_3)$(CC) $(INC) -M -mtbm $(patsubst %.c, $(D_OBJ)/%.o, $(patsubst $(D_SRC), $<, ))  $< -o $@
ifeq ($(filter @, $(S_1)), )
	$(S_3)echo "$(INF_STR) : genration $@ $(OK_STR)"
endif

#generate files.o
$(D_OBJ)/%.o: %.c
	$(S_3)$(CC) $(FLAGS) $(INC) -c $< -o $@
ifeq ($(filter @, $(S_1)), )
	$(S_3)echo "$(INF_STR) : genration $@ $(OK_STR)"
endif
