###########################################################
###.....................by.:.dnetto.....................###
###########################################################

all: auteur libs $(NAME) #other_makes

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
	$(S_2)echo "$(INF_STR) : libs has been created $(OK_STR)"
else
	$(S_2)echo "$(WRN_STR) : No Libs needed for $(TAG_COLOR)$(NAME)$(RESET)" 
endif


$(NAME): $(OBD) $(OBJ) libs
ifeq ($(suffix $(NAME)), .a)
	$(S_3)$(AR) rc $(NAME) $(OBJ)
ifneq ($(LIBS), )
	$(S_3)$(JOINLIB) $(NAME) $(NAME) $(patsubst ./, $(LIBA), )
	$(S_1)echo "$(INF_STR) : lib join $(OK_STR)"
endif
	$(S_3)$(RANLIB) $(NAME)
	$(S_1)echo "$(INF_STR) : make lib $(OK_STR)"
else
	$(S_1)echo "$(INF_STR) : make a binary file"
endif

# make dirs
mki:
	$(S_3)$(foreach D, $(DIRS), $(MK) $(D);)
	$(S_3)$(foreach D,$(DIRS),echo "$(INF_STR) $(MK) $(D)" ;) $(COLOR_OUTPUT)

# generate  files.d 
$(D_OBD)/%.d: %.c
	$(S_3)$(MK) $(D_OBD)
	$(S_3)$(CC) $(INC) -M -mtbm $(patsubst %.c, $(D_OBJ)/%.o, $(patsubst $(D_SRC), $<, ))  $< -o $@
ifeq ($(filter @, $(S_1)), )
	@echo "$(INF_STR) : genration $@ $(OK_STR)"
endif

#generate files.o
$(D_OBJ)/%.o: %.c
	$(S_3)$(MK) $(D_OBJ)
	$(S_3)$(CC) $(FLAGS) $(INC) -c $< -o $@
ifeq ($(filter @, $(S_1)), )
	@echo "$(INF_STR) : genration $@ $(OK_STR)"
endif
