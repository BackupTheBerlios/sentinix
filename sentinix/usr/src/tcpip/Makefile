PKG=tcpip

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "sorry, no \"compile\", try \"make\" instead."

install:
	installwatch -o installwatch.log ./install.sh

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
