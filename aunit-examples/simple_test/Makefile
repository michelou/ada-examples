##
## Copyright (c) 2018-2025 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

all: aunit
	"$(GPRBUILD)" -p -Pharness

aunit:
	@[ -d "$(AUNIT_DIR)" ] || "$(TAR)" xzf "$(AUNIT_DIR).tar.gz" -C "$(ROOT_DIR)"

clean:
	-"$(GPRCLEAN)" -Pharness
	-"$(GPRCLEAN)" -Ptested_lib/testlib
	"$(RM)" -rf obj tested_lib/obj

##############################################################################
## phony

.PHONY: all aunit clean
