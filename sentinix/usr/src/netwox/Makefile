PKG=netwox

include ../sxarchconfig
include sxconfig

$(PKG): compile install

compile:
	@echo "no \"compile\" target, try \"make\" or \"make install\" instead."

install:
	./install.sh

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
