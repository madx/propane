# Install termite configuration

CURRENT_DIR = $(shell pwd)

CONFDIR = $(HOME)/.config/termite
CONFIG = $(CONFDIR)/config

all: $(CONFIG)

$(CONFIG): $(CONFDIR) config
	ln -s $(CURRENT_DIR)/config $(CONFIG)

$(CONFDIR):
	mkdir -p $(CONFDIR)

.PHONY: all
