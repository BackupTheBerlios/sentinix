PKG=miscrequired

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "sorry, try \"make\" or \"make install\" instead."

install:
	./install.sh

clean:
	rm -f installwatch.log

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
