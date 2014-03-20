# Install Vim distribution

CURRENT_DIR = $(shell pwd)

VIMRC    = $(HOME)/.vimrc
VIMDIR   = $(HOME)/.vim
SPELL    = $(VIMDIR)/spell
SNIPPETS = $(VIMDIR)/snippets
VUNDLE   = $(VIMDIR)/bundle/vundle

all: $(VIMRC) $(SPELL) $(SNIPPETS) vundle

$(VIMRC): vimrc
	ln -s $(CURRENT_DIR)/vimrc $(VIMRC)

$(SPELL): spell | $(VIMDIR)
	ln -s $(CURRENT_DIR)/spell $(SPELL)

$(SNIPPETS): spell | $(VIMDIR)
	ln -s $(CURRENT_DIR)/snippets $(SNIPPETS)

$(VUNDLE):
	git clone https://github.com/gmarik/vundle.git $(VIMDIR)/bundle/vundle

$(VIMDIR):
	mkdir -p $(VIMDIR)

vundle: $(VUNDLE)
	vim +BundleInstall +qall

.PHONY: all vundle
