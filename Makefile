all: bash vim

bash:
	make -C bash

vim:
	make -C vim

.PHONY: all bash vim
