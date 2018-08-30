# Install base system

PACKAGES := $(shell sed '/^\#/d' packages/minimal)

ifeq ($(TARGET),desktop)
PACKAGES += $(shell sed '/^\#/d' packages/desktop)
endif

all:
	@echo "+ install base packages"
	@sudo pacman -S $(PACKAGES)

.PHONY: all
