###########################################################
########	   	 generate defaut makefile          ########
###########################################################

finish:
#$(S_1)$(foreach lb, $(LIBS),$(MAKE) -C $(lb) finish ;)
	$(S_1) /bin/sh $(MMPATH)src/tp.mk \
	"$(NAME)" "$(AUTEUR)" "$(D_INC)" \
	"$(D_SRC)" "$(D_ALLS)" "$(D_OBJ)" \
	"$(D_OBD)" "$(D_LIB)" \
	"$(LIBS)" "$(LIBA)" "$(INCLIB)" \
	"$(INC)" "$(SRC)" "$(OBJ)" \
	"$(OBD)" "$(CFLAGS)" \
	"$(TAG)" "$(VPATH)"