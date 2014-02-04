# Install Vim distribution

CURRENT_DIR = $(shell pwd)

VIMRC  = $(HOME)/.vimrc
VIMDIR = $(HOME)/.vim

all: $(VIMRC) vimfiles

$(VIMRC): vimrc
	ln -s $(CURRENT_DIR)/vimrc $(VIMRC)

$(VIMDIR):
	mkdir -p $(VIMDIR)

vimfiles: $(VIMDIR) vundle
	ln -s $(CURRENT_DIR)/spell $(VIMDIR)/spell

vundle: $(VIMDIR)/bundle/vundle
	vim +BundleInstall +qall

$(VIMDIR)/bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(VIMDIR)/bundle/vundle

.PHONY: all vundle
