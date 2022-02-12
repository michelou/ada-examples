include ../Makefile.inc

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

.PHONY: all aunit coverage clean
