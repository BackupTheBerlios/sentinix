#
# Makefile for SENTINIX
#
# $Id: Makefile,v 1.9 2004/01/17 22:34:10 replikan Exp $
#
none:
	@echo
	@echo "To compile and install everything (except the kernel), type:"
	@echo "    make sentinix"
	@echo
	@echo "To create binary packages from the installwatch logs, type:"
	@echo "    make packages"
	@echo
	@echo "To compile the kernels and create the initrd (embedded) system, type:"
	@echo "    make isotope"
	@echo "This can only be done after \"make sentinix packages\"."
	@echo
	@echo "To clean up the source tree, type:"
	@echo "    make clean"
	@echo
	@echo "To make both sentinix and isotope, type:"
	@echo "    make everything"
	@echo "    (the same as \"make clean sentinix packages isotope\")"
	@echo
	@echo "To list versions of all packages, type:"
	@echo "    make version"
	@echo

sentinix:
	@./install-all.sh

packages:
	@./mkpackages.sh

isotope:
	@echo "not implemented yet."

clean:
	@./clean-all.sh

everything: sentinix packages isotope

versions: version
version:
	@./list-all-versions.sh
