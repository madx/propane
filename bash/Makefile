# Install Bash configuration

CURRENT_DIR = $(shell pwd)

BASHRC  = $(HOME)/.bashrc
INPUTRC  = $(HOME)/.inputrc
PROMPT = $(HOME)/.prompt

all: $(BASHRC) $(INPUTRC) $(PROMPT)

$(BASHRC): bashrc
	ln -s $(CURRENT_DIR)/bashrc $(BASHRC)

$(INPUTRC): inputrc
	ln -s $(CURRENT_DIR)/inputrc $(INPUTRC)

$(PROMPT): prompt
	ln -s $(CURRENT_DIR)/prompt $(PROMPT)

.PHONY: all
