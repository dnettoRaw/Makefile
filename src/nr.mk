###########################################################
###.....................by.:.dnetto.....................###
###########################################################

#	norminette for 42 students


# explicite -j max core
norminette: mki
	$(S_2)make -j$(NB_CORE + 1) -l$(NB_CORE) .nor VERBOSE=$(SIL)
	$(S_2)$(foreach lb, $(LIBS), make -C $(lb) VERBOSE=$(SIL) norminette;)

.nor: $(NORM_C) $(NORM_H)
	$(S_2)echo "\r\033[J\033[36m==== norminette ====\033[0m\nnorme to: $(NAME_COLOR)	\c"
	$(S_2)if [ -e $(D_NORM)/_error_files.nr ]; then echo "$(ERR_STR)" && cat $(D_NORM)/_error_files.nr&& echo "└───── end NORME";else echo "    $(OK_STR)"; fi;

	
$(D_NORM)/%.nr: %.c 
	$(S_2)echo "\r\033[J$(NAME_COLOR)[/] > $<\c"
	$(S_2)echo "├──┬── NORME : $I$<$(R)" > $@
	$(S_2)norminette $< | grep -v 'Norme:' | sed 's/Error/│  ├──/g' >> $@
	$(S_2)echo "\r\033[J$(NAME_COLOR)[\\] > $@\c"
	$(S_2)echo "│  └── end of file\n│" >> $@
	$(S_2)if [ "`sed -n 2p $@`" != "│  └── end of file" ] ; then cat $@ >> $(D_NORM)/_error_files.nr ; fi;

$(D_NORM)/%.nr: %.h 
	$(S_2)echo "\r\033[J$(NAME_COLOR)[/] > $<\c"
	$(S_2)echo "├──┬── NORME : $I$<$(R)" > $@
	$(S_2)norminette $< | grep -v 'Norme:' | sed 's/Error/│  ├──/g' >> $@
	$(S_2)echo "\r\033[J$(NAME_COLOR)[\\] > $@\c"
	$(S_2)echo "│  └── end of file\n│" >> $@
	$(S_2)if [ "`sed -n 2p $@`" != "│  └── end of file" ] ; then cat $@ >> $(D_NORM)/_error_files.nr ; fi;
