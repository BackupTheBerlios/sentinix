PKG=snortcenter

include ../sxarchconfig
include sxconfig

$(PKG): compile install

compile:
	./compile.sh

install:
	./install.sh

clean:

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
