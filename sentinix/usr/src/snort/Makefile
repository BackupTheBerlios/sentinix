PKG=snort+acid

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "no \"compile\", try \"make\" or \"make install\" instead."

install:
	./install.sh

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
