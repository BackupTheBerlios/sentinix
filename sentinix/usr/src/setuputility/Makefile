PKG=sentinix-setuputility

include ../sxarchconfig
include sxconfig

$(PKG): compile install

compile:
	./compile.sh

install:
	installwatch -o installwatch.log ./install.sh

clean:

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
