PKG=nagios

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "sorry, $(PKG) has to be installed in one go, try \"make\" or \"make install\" instead."

install:
	./install.sh
	cat installwatch_??.log > installwatch.log

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
