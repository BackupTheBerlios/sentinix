#
# Makefile for SENTINIX
#
# $Id: Makefile,v 1.1 2004/01/11 20:10:15 replikan Exp $
#
none:
	@echo
	@echo "To compile and install everything (except the kernel), type:"
	@echo "    make sentinix"
	@echo
	@echo "To compile the kernels and create the initrd (embedded) system, type:"
	@echo "    make isotope"
	@echo "This can only be done after \"make install\"."
	@echo
	@echo "To clean up the source tree, type:"
	@echo "    make clean"
	@echo
	@echo "To make both sentinix and isotope, type:"
	@echo "    make everything"
	@echo "    (the same as \"make clean sentinix isotope\")"
	@echo
	@echo "To list versions of all packages, type:"
	@echo "    make version"
	@echo

sentinix:
	./install-all.sh

clean:
	./clean-all.sh

isotope:
	@echo "not implemented yet."

everything: clean sentinix isotope

version:
	@./list-all-versions.sh
