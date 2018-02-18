clean:
	$(S_3)rm -rf $(D_ALLS) $(NAME)
	$(S_2)echo "$(IRM_STR) : clean $(OK_STR)" 
ifneq ($(LIBS), )
	$(S_3)$(foreach lb, $(LIBS), $(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" clean;)
endif

fclean:
	$(S_3)rm -rf $(D_ALLS) $(NAME)
	$(S_2)echo "$(IRM_STR) : fclean $(OK_STR)" 
ifneq ($(LIBS), )
	$(S_3)$(foreach lb, $(LIBS), $(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" fclean;)
endif

re: fclean
	$(S_3)$(MAKE) VERBOSE=$(SIL) 