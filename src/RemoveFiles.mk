clean:
	$(S_4)rm -rf $(D_CLEAN)
ifeq ($(filter @, $(S_1)), )	# for visual output 
	$(S_4)echo "$(IRM_STR) : clean $(OK_STR)" 
endif
ifneq ($(LIBS), )
	$(S_4)$(foreach lb, $(LIBS), $(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" clean;)
endif

fclean:
	$(S_4)rm -rf $(D_CLEAN) $(NAME)
ifeq ($(filter @, $(S_1)), )	# for visual output 
	$(S_4)echo "$(IRM_STR) : fclean $(OK_STR)" 
endif
ifneq ($(LIBS), )
	$(S_4)$(foreach lb, $(LIBS), $(MAKE) -C $(lb) VERBOSE=$(SIL) INTER=yes DEPTH="$(DEPTH) + 1" fclean;)
endif

re: fclean
	$(S_4)$(MAKE) VERBOSE=$(SIL) 


ifeq ($(filter @, $(S_2)), )	# for visual output 
	$(S_4)$(foreach D, $(DIRS), echo "$(INF_STR) $(MK) $(D)";)
endif