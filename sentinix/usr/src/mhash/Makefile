PKG=mhash

include ../sxarchconfig
include sxconfig

$(PKG): compile install

compile:
	./compile.sh

install:
	installwatch -o installwatch.log ./install.sh
	ldconfig

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
