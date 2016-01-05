all: shell git vim

shell:
	make -C shell

git:
	make -C git

vim:
	make -C vim

.PHONY: all shell git vim
