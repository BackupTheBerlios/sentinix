apache: compile install

compile:
	./compile.sh

install:
	installwatch -o installwatch.log ./install.sh

clean:
	./clean.sh

version:
	@source sxconfig && echo apache-$$APACHEVER && echo mod_ssl-$$MODSSLVER && echo php-$$PHPVER
