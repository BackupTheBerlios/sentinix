bsd_db: compile install

#
# we only compile db4 in sentinix nowadays
#
compile:
	make -C db4 compile

install:
	make -C db4 install
	cp db4/installwatch.log .

clean:
	make -C db4 clean

version:
	@make -s -C db4 version
