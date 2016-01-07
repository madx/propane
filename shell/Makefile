# Install Bash configuration

CURRENT_DIR = $(shell pwd)

BASHRC      = $(HOME)/.bashrc
PROFILE     = $(HOME)/.profile
INPUTRC     = $(HOME)/.inputrc
BASH_CONFIG = $(HOME)/.config/bash

all: $(BASHRC) $(INPUTRC) $(PROMPT) $(BASH_CONFIG)

$(BASHRC): bashrc
	ln -sfn $(CURRENT_DIR)/bashrc $(BASHRC)

$(PROFILE): profile
	ln -sfn $(CURRENT_DIR)/profile $(PROFILE)

$(INPUTRC): inputrc
	ln -sfn $(CURRENT_DIR)/inputrc $(INPUTRC)

$(BASH_CONFIG): bash
	ln -sfn $(CURRENT_DIR)/bash $(BASH_CONFIG)

.PHONY: all
