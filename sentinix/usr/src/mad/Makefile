PKG=mad

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "no \"compile\" for $(PKG), try \"make\" or \"make install\" instead."

install:
	./install.sh
	cat installwatch_?.log > installwatch.log

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
