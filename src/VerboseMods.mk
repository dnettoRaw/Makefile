#verbose 0 no output
ifneq ($(filter 0, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 :=@
S_2 :=@
S_3 :=@
SIL := 0
endif
#verbose 1 all steps msg on
ifneq ($(filter 1, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 :=
SIL = 1
endif
#verbose 2 all steps debug on
ifneq ($(filter 2, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 :=
S_2 :=
SIL = 2
endif
#verbose 3 all commands verbose
ifneq ($(filter 3, $(verbose) $(v) $(VERBOSE) $(V)), )
S_1 :=
S_2 :=
S_3 :=
SIL = 3
endif
S_1 ?=@
S_2 ?=@
S_3 ?=@