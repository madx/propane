# Install Bash configuration

CURRENT_DIR = $(shell pwd)

GITCONFIG = $(HOME)/.gitconfig

all: $(GITCONFIG)

$(GITCONFIG): gitconfig
	ln -sfn $(CURRENT_DIR)/gitconfig $(GITCONFIG)

.PHONY: all
