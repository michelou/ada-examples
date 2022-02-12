include ../Makefile.inc

all: aunit
	"$(GPRBUILD)" -p -Pharness

aunit:
	@[ -d "$(AUNIT_DIR)" ] || "$(TAR)" xzf "$(AUNIT_DIR).tar.gz" -C "$(ROOT_DIR)"

clean:
	-"$(GPRCLEAN)" -Pharness
	-"$(GPRCLEAN)" -Ptested_lib/testlib
	"$(RM)" -rf obj tested_lib/obj

.PHONY: all aunit clean
