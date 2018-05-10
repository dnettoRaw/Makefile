# ###########################################################
# ###.....................by.:.dnetto.....................###
# ###########################################################

all: $(NAME)

$(NAME): mki libs obj
ifeq ($(suffix $(NAME)), .a)
	$(S_4)$(AR) $(NAME) $(OBJ)
ifneq ($(LIBS), )
	$(S_4)$(JOINLIB) $(NAME) $(NAME) $(patsubst ./, $(LIBA), )
ifneq ($(INTER), yes)
	$(S_4)echo "$(INF_STR) : lib join $(OK_STR)"
endif
endif
	$(S_4)$(RANLIB) $(NAME)
ifneq ($(INTER), yes)
	$(S_4)echo "$(INF_STR) : make lib $(OK_STR)"
endif
else
	$(S_2)$(CC) $(CFLAGS) $(INC) $(INCLIB) -o $@ $(OBJ)
ifneq ($(INTER), yes)
	$(S_4)echo "$(INF_STR) : make a binary file"
endif
endif

#make dirs
mki:
ifneq ($(shell if [ -d objs ] ; then echo yes ; fi ), yes)
	$(S_4)$(foreach D, $(DIRS), $(MK) $(D);)
ifeq ($(filter @, $(S_1)), )	# for visual output 
	$(S_4)echo "$(INF_STR) make objs dirs $(OK_STR)"
endif
ifeq ($(filter @, $(S_2)), )	# for visual output 
	$(S_4)$(foreach D, $(DIRS), echo "$(INF_STR) $(MK) $(D)";)
endif
endif
ifeq ($(filter @, $(S_2)), )	# for visual output 
	$(S_4)echo "$(INF_STR) Dirs alread exist"
endif

libs:
ifneq ($(LIBS), )
	$(S_4)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" ;)
ifeq ($(filter @, $(S_1)), )	# for visual output 
	$(S_4)echo "$(INF_STR) : libs has been created $(OK_STR)"
endif
ifeq ($(filter @, $(S_3)), )	# for visual output 
	$(S_4)$(foreach lb, $(LIBS),echo "$(INF_STR) $(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH=\"$(DEPTH) + 1\"" ;)
endif
else
ifeq ($(filter @, $(S_2)), )	# for visual output 
	$(S_4)echo "$(INF_STR) No libs needed"
endif
endif

obj: $(OBD) msg_objd $(OBJ) msg_objo


# generate  files.d 
$(D_OBD)/%.d: %.c
	$(S_4)$(CC) $(INC) -M -mtbm $(patsubst %.c, $(D_OBJ)/%.o, $(patsubst $(D_SRC), $<, ))  $< -o $@
ifeq ($(filter @, $(S_2)), )
	$(S_4)echo "$(INF_STR) : genration $@ $(OK_STR)"
endif

msg_objd:
ifeq ($(filter @, $(S_2)), )
	$(S_4)echo "$(INF_STR) : $Wall object.d has created$R $(OK_STR)"
endif

# generate  files.o
$(D_OBJ)/%.o: %.c
	$(S_4)$(CC) $(FLAGS) $(INC) -c $< -o $@
ifeq ($(filter @, $(S_2)), )
	$(S_4)echo "$(INF_STR) : genration $@ $(OK_STR)"
endif

msg_objo:
ifeq ($(filter @, $(S_2)), )
	$(S_4)echo "$(INF_STR) : $Wall object.o has created$R $(OK_STR)"
endif

.PHONY: msg_objo msg_objd obj mki all libs



# all: $(NAME) #other_makes

# # auteur file
# auteur:
# ifeq ($(AUTEUR), )
# 	$(S_2)if [ -e ./auteur ] ; then echo "$(INF_STR) : AUTEUR = \c" && cat ./auteur && echo "$(OK_STR)" ; else echo "$(ERR_STR) : AUTEUR don't exist" ; fi
# else
# 	$(S_2)if [ -e ./auteur ] ; then echo "$(INF_STR) : AUTEUR = \c" && cat ./auteur && echo "$(OK_STR)"; else echo "$(AUTEUR)\c" > auteur ; echo "$(INF_STR) : AUTEUR has been created" ; fi
# endif

# # make others makes
# libs:
# ifneq ($(LIBS), )
# 	$(S_4)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" ;)
# ifneq ($(INTER), yes)
# 	$(S_2)echo "$(INF_STR) : libs has been created $(OK_STR)" 
# endif
# else
# ifeq ($(filter @, $(S_1)), )
# 	$(S_2)echo "$(WRN_STR) : No Libs needed for $(TAG_COLOR)$(NAME)$(RESET)" 
# endif
# endif


# $(NAME): libs mki $(OBD) $(OBJ) 
# ifeq ($(suffix $(NAME)), .a)
# 	$(S_4)$(AR) $(NAME) $(OBJ)
# ifneq ($(LIBS), )
# 	$(S_4)$(JOINLIB) $(NAME) $(NAME) $(patsubst ./, $(LIBA), )
# ifneq ($(INTER), yes)
# 	$(S_4)echo "$(INF_STR) : lib join $(OK_STR)"
# endif
# endif
# 	$(S_4)$(RANLIB) $(NAME)
# ifneq ($(INTER), yes)
# 	$(S_4)echo "$(INF_STR) : make lib $(OK_STR)"
# endif
# else
# 	$(S_2)$(CC) $(CFLAGS) $(INC) $(INCLIB) -o $@ $(OBJ)
# ifneq ($(INTER), yes)
# 	$(S_4)echo "$(INF_STR) : make a binary file"
# endif
# endif

# # make dirs
# mki:
# 	$(S_4)$(foreach D, $(DIRS), $(MK) $(D);)
# ifeq ($(filter @, $(S_1)), )
# 	$(S_4)$(foreach D, $(DIRS),echo "$(INF_STR) $(MK) $(D)" ;)
# endif
	

# # generate  files.d 
# $(D_OBD)/%.d: %.c
# 	$(S_4)$(CC) $(INC) -M -mtbm $(patsubst %.c, $(D_OBJ)/%.o, $(patsubst $(D_SRC), $<, ))  $< -o $@
# ifeq ($(filter @, $(S_1)), )
# 	$(S_4)echo "$(INF_STR) : genration $@ $(OK_STR)"
# endif

# #generate files.o
# $(D_OBJ)/%.o: %.c
# 	$(S_4)$(CC) $(FLAGS) $(INC) -c $< -o $@
# ifeq ($(filter @, $(S_1)), )
# 	$(S_4)echo "$(INF_STR) : genration $@ $(OK_STR)"
# endif