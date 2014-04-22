# Install Bash configuration

CURRENT_DIR = $(shell pwd)

BASHRC      = $(HOME)/.bashrc
INPUTRC     = $(HOME)/.inputrc
PROMPT      = $(HOME)/.prompt
BASH_CONFIG = $(HOME)/.config/bash

all: $(BASHRC) $(INPUTRC) $(PROMPT)

$(BASHRC): bashrc
	ln -s $(CURRENT_DIR)/bashrc $(BASHRC)

$(INPUTRC): inputrc
	ln -s $(CURRENT_DIR)/inputrc $(INPUTRC)

$(PROMPT): prompt
	ln -s $(CURRENT_DIR)/prompt $(PROMPT)

$(BASH_CONFIG): bash_config
	ln -s $(CURRENT_DIR)/bash_config $(BASH_CONFIG)

.PHONY: all
