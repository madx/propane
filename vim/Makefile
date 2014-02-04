# Install Vim distribution

VIMRC  = $(HOME)/.vimrc
VIMDIR = $(HOME)/.vim

all: ${VIMRC} vimfiles

$(VIMRC):
	cp -f vimrc $(VIMRC)

$(VIMDIR):
	mkdir -p $(VIMDIR)

vimfiles: $(VIMDIR) vundle
	cp -rf spell $(VIMDIR)/spell

vundle: $(VIMDIR)/bundle/vundle
	vim +BundleInstall +qall

$(VIMDIR)/bundle/vundle:
	git clone https://github.com/gmarik/vundle.git $(VIMDIR)/bundle/vundle

.PHONY: all vundle
