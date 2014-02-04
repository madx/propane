all: bash git vim

bash:
	make -C bash

git:
	make -C git

vim:
	make -C vim

.PHONY: all bash git vim
