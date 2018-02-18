###########################################################
###.....................by.:.dnetto.....................###
###########################################################

# for exemples colors run ./color_tab

# color bases 
RESET          = \033[0m
make_std_color = \033[3$1m      # defined for 1 through 7
make_color     = \033[38;5;$1m  # defined for 1 through 255

WRN_COLOR    = $(strip $(call make_color,226))
ERR_COLOR    = $(strip $(call make_color,196))
STD_COLOR    = $(strip $(call make_color,245))
INF_COLOR    = $(strip $(call make_color,191))
RM_COLOR     = $(strip $(call make_color,9))
OK_COLOR     = $(strip $(call make_color,46))
TAG_COLOR	 = $(strip $(call make_color,$(TAG)))
I			 = \033[1m
R 			 = \033[0m

# info text 
OK_STR  = $(strip $(OK_COLOR)[ OK ]$(RESET))
WRN_STR	= $(strip $(WRN_COLOR)[ warning ]$(RESET))
ERR_STR	= $(strip $(ERR_COLOR)[ error ]$(RESET))
INF_STR = $(strip $(INF_COLOR)[ info ] $(RESET)[$(TAG_COLOR)$(NAME)$(RESET)])

# output error / warning colored
define msg_c
	 $(shell echo "$(1)$(2)$(RESET)")
endef

define info_c
	$(shell echo "\r$(INF_STR) :\c")
endef

define wrn_c
	$(shell echo "\r$(WRN_STR) :\c")
endef

define err_c
	$(shell echo "\r$(ERR_STR) :\c")
endef

define imp_c
	$(shell echo "\b\b\033[1m$(1)\033[0m\c")
endef

define teste_c
	$(shell echo "$(1)")
endef

###########################################################
###.....................by.:.dnetto.....................###
###########################################################