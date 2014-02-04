# Install Bash configuration

CURRENT_DIR = $(shell pwd)

GITCONFIG = $(HOME)/.gitconfig

all: $(GITCONFIG)

$(GITCONFIG): gitconfig
	ln -s $(CURRENT_DIR)/gitconfig $(GITCONFIG)

.PHONY: all
