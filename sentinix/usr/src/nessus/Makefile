PKG=nessus

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "sorry, this package can only be installed in one go, try \"make install\" instead."

install:
	./install.sh
	cat installwatch_?.log > installwatch.log

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
