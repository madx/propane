# Install Bash configuration

BASHRC  = $(HOME)/.bashrc
PROMPT = $(HOME)/.prompt

all: $(BASHRC) $(PROMPT)

$(BASHRC): bashrc
	cp -f bashrc $(BASHRC)

$(PROMPT): prompt
	cp -f prompt $(PROMPT)

.PHONY: all
