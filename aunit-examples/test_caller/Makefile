include ../Makefile.inc

all: aunit
	"$(GPRBUILD)" -p -Pharness/harness

aunit:
	@[ -d "$(AUNIT_DIR)" ] || "$(TAR)" xzf "$(AUNIT_DIR).tar.gz" -C "$(ROOT_DIR)"

clean:
	"$(GPRCLEAN)" -Pharness/harness
	"$(GPRCLEAN)" -Ptested_lib/testlib

.PHONY: all aunit clean
