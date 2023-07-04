# Install Neovim distribution

CURRENT_DIR = $(shell pwd)

PACKER = $(HOME)/.local/share/nvim/site/pack/packer/start/packer.nvim
NVIMDIR = $(XDG_CONFIG_HOME)/nvim
LUADIR = $(XDG_CONFIG_HOME)/nvim/lua
AFTERDIR = $(XDG_CONFIG_HOME)/nvim/after
INITLUA = $(XDG_CONFIG_HOME)/nvim/init.lua

all: $(PACKER) $(INITLUA) $(LUADIR) $(AFTERDIR)

$(INITLUA): $(NVIMDIR)
	ln -sfn $(CURRENT_DIR)/init.lua $@

$(LUADIR): $(NVIMDIR)
	ln -sfn $(CURRENT_DIR)/lua $@

$(AFTERDIR): $(NVIMDIR)
	ln -sfn $(CURRENT_DIR)/after $@

$(NVIMDIR):
	mkdir -p $@

$(PACKER):
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $@

.PHONY: all
