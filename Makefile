# Colors

_R = "\\033[31m"
_G = "\\033[32m"
_Y = "\\033[33m"
_E = "\\033[0m"

CURRENT_DIR = $(shell pwd)

all: system shell git vim

system:
	@echo -e "$(_G)▸ installing base system$(_E)"
	@bash system/ignite.sh

shell:
	@echo -e "$(_G)▸ configuring shell$(_E)"
	@make -C shell

git:
	@echo -e "$(_G)▸ configuring git$(_E)"
	@make -C git

vim:
	@echo -e "$(_G)▸ configuring vim$(_E)"
	@make -C vim

tmux: $(HOME)/.tmux.conf

$(HOME)/.tmux.conf:
	@echo -e "$(_G)▸ configuring tmux$(_E)"
	ln -s $(CURRENT_DIR)/tmux.conf $@

.PHONY: all system shell git vim tmux
