PKG=sentinix-rc.d

include ../sxarchconfig
include sxconfig

$(PKG): compile install

compile:
	./compile.sh

install:
	installwatch -o installwatch.log ./install.sh

clean:
	rm -f installwatch.log

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
