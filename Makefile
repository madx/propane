all: shell git vim termite

shell:
	make -C shell

git:
	make -C git

vim:
	make -C vim

termite:
	make -C termite

.PHONY: all shell git vim termite
