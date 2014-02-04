# Install Bash configuration

CURRENT_DIR = $(shell pwd)

BASHRC  = $(HOME)/.bashrc
PROMPT = $(HOME)/.prompt

all: $(BASHRC) $(PROMPT)

$(BASHRC): bashrc
	ln -s $(CURRENT_DIR)/bashrc $(BASHRC)

$(PROMPT): prompt
	ln -s $(CURRENT_DIR)/prompt $(PROMPT)

.PHONY: all
