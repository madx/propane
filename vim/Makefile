# Install Vim distribution

CURRENT_DIR = $(shell pwd)

VIMRC    = $(HOME)/.vimrc
VIMDIR   = $(HOME)/.vim
SPELL    = $(VIMDIR)/spell
SNIPPETS = $(VIMDIR)/snippets
VIMPLUG   = $(VIMDIR)/autoload/plug.vim

all: $(VIMRC) $(SPELL) $(SNIPPETS) vimplug

$(VIMRC): vimrc
	ln -s $(CURRENT_DIR)/vimrc $(VIMRC)

$(SPELL): spell | $(VIMDIR)
	ln -s $(CURRENT_DIR)/spell $(SPELL)

$(SNIPPETS): spell | $(VIMDIR)
	ln -s $(CURRENT_DIR)/snippets $(SNIPPETS)

$(VIMPLUG):
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

$(VIMDIR):
	mkdir -p $(VIMDIR)

vimplug: $(VIMPLUG) $(VIMDIR)/bundle
	vim +PlugInstall +qall

$(VIMDIR)/bundle:
	mkdir $@

.PHONY: all vundle
