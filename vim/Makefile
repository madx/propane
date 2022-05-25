# Install Neovim distribution

CURRENT_DIR = $(shell pwd)

VIMRC      = $(HOME)/.vimrc
VIMDIR     = $(HOME)/.vim
SPELL      = $(VIMDIR)/spell
SNIPPETS   = $(VIMDIR)/snippets
MICROPACK  = $(VIMDIR)/autoload/micropack.vim
NVIMDIR    = $(XDG_CONFIG_HOME)/nvim
NVIMRC     = $(NVIMDIR)/init.vim
NVIMLUADIR = $(NVIMDIR)/lua

all: $(VIMRC) $(SPELL) $(NVIMDIR) $(NVIMLUADIR)

$(VIMRC): vimrc
	ln -sfn $(CURRENT_DIR)/vimrc $(VIMRC)

$(SPELL): spell | $(VIMDIR)
	ln -sfn $(CURRENT_DIR)/spell $(SPELL)

$(MICROPACK):
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/madx/micropack.vim/master/micropack.vim

$(VIMDIR):
	mkdir -p $(VIMDIR)

$(NVIMDIR):
	ln -s $(VIMDIR) $(NVIMDIR)
	ln -s $(VIMRC) $(NVIMRC)

$(NVIMLUADIR):
	ln -sfn $(CURRENT_DIR)/lua $(NVIMLUADIR)

.PHONY: all vundle
