include colors.make

all: system shell git vim

system:
	@echo -e "$(_G)▸ installing base system$(_E)"
	@make -C system

shell:
	@echo -e "$(_G)▸ configuring shell$(_E)"
	@make -C shell

git:
	@echo -e "$(_G)▸ configuring git$(_E)"
	@make -C git

vim:
	@echo -e "$(_G)▸ configuring vim$(_E)"
	@make -C vim

.PHONY: all system shell git vim
