PKG=sentinix-mysqldatabases

include ../sxarchconfig
include sxconfig

$(PKG): install

compile:
	@echo "no \"compile\", try \"make\" instead."

install:
	./fakeinstall.sh

clean:
	rm -f installwatch.log

version:
	@echo $(PKG)-$(VERSION)-$(SXARCH)-$(BUILD)
