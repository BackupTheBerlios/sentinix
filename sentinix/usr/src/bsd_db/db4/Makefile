PKG=db4
ARCH=$(shell source ../../sxarchconfig && echo $$SXARCH)
VERSION=$(shell source sxconfig && echo $$VERSION)
BUILD=$(shell source sxconfig && echo $$BUILD)

$(PKG): compile install

compile:
	./compile.sh

install:
	installwatch -o installwatch.log ./install.sh

clean:
	./clean.sh

version:
	@echo $(PKG)-$(VERSION)-$(ARCH)-$(BUILD)
