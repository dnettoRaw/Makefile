###########################################################
########	   	 generate defaut makefile          ########
###########################################################

finish:
	$(S_1)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) finish ;)
	$(S_1) /bin/sh $(MMPATH)src/tp.mk \
	"$(NAME)" "$(AUTEUR)" "$(D_INC)" \
	"$(D_SRC)" "$(D_ALLS)" "$(D_OBJ)" \
	"$(D_OBD)" "$(D_LIB)" \
	"$(LIBS)" "$(LIBA)" "$(INCLIB)" \
	"$(INC)" "$(SRC)" "$(OBJ)" \
	"$(OBD)" "$(CFLAGS)" \
	"$(TAG)" "$(VPATH)"

init:
	$(S_2)$(MK) $(D_INC) $(D_SRC) $(D_LIB)
	$(S_2)if [ -e makefile ] ; then rm makefile ; fi
	$(S_2)echo "NAME = $(NAME)\n\ninclude $(MMPATH)make.mk" > Makefile
	$(S_3)echo "$(INF_STR) Start dirs has seted, good job for you !!"