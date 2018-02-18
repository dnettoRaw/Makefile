###########################################################
###.....................by.:.dnetto.....................###
###########################################################

#	norminette for 42 students
#
#

# explicite -j max core
norminette:
	$(S_2)make -j$(NB_CORE + 1) -l$(NB_CORE) .nor VERBOSE=$(SIL)
	$(S_2)$(foreach lb, $(LIBS), $(MAKE) -C $(lb) nr VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1";)

.nor: $(NORM)
	$(S_2)echo "\r\033[J\033[36m==== norminette ====\033[0m\nnorme  	  \c"
	$(S_2)if [ -e norm/_error_norme_files.nr ]; then echo "$(ERR_STR)" && cat norm/_error_norme_files.nr && echo "└───── end NORME";else echo "    $(OK_STR)"; fi;
	$(S_2)rm -rf norm/_error_norme_files.nr
	
norm/%.nr: %.c 
	$(S_2)echo "\r\033[J$(NAME)[/] > $<\c"
	$(S_2)mkdir -p norm
	$(S_2)echo "├──┬── NORME : $(TAG_COLOR)$<$(R)" > $@
	$(S_2)norminette $< | grep -v 'Norme:' | sed 's/Error/│  ├──/g' >> $@
	$(S_2)echo "\r\033[J$(NAME)[\\] > $@\c"
	$(S_2)echo "│  └── end file\n│" >> $@
	$(S_2)if [ "`sed -n 2p $@`" != "│  └── end file" ] ; then cat $@ >> norm/_error_norme_files.nr ; fi;
