PKG=zoneinfo

include ../sxarchconfig
include sxconfig

$(PKG): compile install

compile:
	@echo "no \"compile\", try \"make\" instead."

install:
	installwatch -o installwatch.log ./install.sh

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
