##
## Copyright (c) 2018-2023 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

##############################################################################
## main rules

all: aunit
	"$(GPRBUILD)" -p -Pharness

aunit:
	@[ -d "$(AUNIT_DIR)" ] || "$(TAR)" xzf "$(AUNIT_DIR).tar.gz" -C "$(ROOT_DIR)"

coverage:
	"$(GPRBUILD)" -p -f -Pharness -XCOVERAGE=yes
	./test_math
	cd obj;	"$(GCOV)" ../tested_lib/obj/*.gcda

clean:
	-"$(GPRCLEAN)" -Pharness
	-"$(GPRCLEAN)" -Ptested_lib/testlib
	"$(RM)" -rf obj tested_lib/obj

##############################################################################
## phony

.PHONY: all aunit coverage clean

.SUFFIXES:
.SUFFIXES: .adb .ads .ali .exe .o
