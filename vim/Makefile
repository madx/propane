# Install Vim distribution

CURRENT_DIR = $(shell pwd)

VIMRC    = $(HOME)/.vimrc
VIMDIR   = $(HOME)/.vim
VIMSPELL = $(HOME)/.vim/spell

all: $(VIMRC) $(VIMSPELL) vundle

$(VIMRC): vimrc
	ln -s $(CURRENT_DIR)/vimrc $(VIMRC)

$(VIMSPELL): spell | $(VIMDIR)
	ln -s $(CURRENT_DIR)/spell $(VIMSPELL)

$(VIMDIR):
	mkdir -p $(VIMDIR)

vundle: $(VIMDIR)/bundle/vundle
	vim +BundleInstall +qall

$(VIMDIR)/bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(VIMDIR)/bundle/vundle

.PHONY: all vundle
