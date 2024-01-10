##
## Copyright (c) 2018-2024 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

##############################################################################
## main rules

all: aunit
	"$(GPRBUILD)" -p -f -Pharness

aunit:
	@[ -d "$(AUNIT_DIR)" ] || "$(TAR)" xzf "$(AUNIT_DIR).tar.gz" -C "$(ROOT_DIR)"

coverage:
	"$(GPRBUILD)" -p -f -Pharness -XCOVERAGE=yes
	./test_calculator
	cd obj;	"$(GCOV)" ../tested_lib/obj/*.gcda

clean:
	-"$(GPRCLEAN)" -Pharness
	-"$(GPRCLEAN)" -Ptested_lib/testlib
	"$(RM)" -rf obj
	"$(RM)" -rf tested_lib/obj
	"$(RM)" -rf tested_lib/lib

##############################################################################
## phony

.PHONY: all aunit coverage clean

.SUFFIXES:
.SUFFIXES: .adb .ads .ali .exe .o
