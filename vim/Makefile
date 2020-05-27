# Install Vim distribution

CURRENT_DIR = $(shell pwd)

VIMRC    = $(HOME)/.vimrc
VIMDIR   = $(HOME)/.vim
SPELL    = $(VIMDIR)/spell
SNIPPETS = $(VIMDIR)/snippets
VIMPLUG  = $(VIMDIR)/autoload/plug.vim
NVIMDIR  = $(XDG_CONFIG_HOME)/nvim
NVIMRC   = $(NVIMDIR)/init.vim

all: $(VIMRC) $(SPELL) vimplug $(NVIMDIR)

$(VIMRC): vimrc
	ln -s $(CURRENT_DIR)/vimrc $(VIMRC)

$(SPELL): spell | $(VIMDIR)
	ln -sfn $(CURRENT_DIR)/spell $(SPELL)

$(VIMPLUG):
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(VIMDIR):
	mkdir -p $(VIMDIR)

vimplug: $(VIMPLUG) $(VIMDIR)/bundle
	vim +PlugInstall +qall

$(VIMDIR)/bundle:
	mkdir $@

$(NVIMDIR):
	ln -s $(VIMDIR) $(NVIMDIR)
	ln -s $(VIMRC) $(NVIMRC)

.PHONY: all vundle
