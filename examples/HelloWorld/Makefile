##
## Copyright (c) 2018-2023 Stéphane Micheloud
##
## Licensed under the MIT License.
##
##############################################################################

include ../Makefile.inc

PROJ_NAME      = HelloWorld

SOURCE_DIR     = src
TARGET_DIR     = target
TARGET_OBJ_DIR = $(TARGET_DIR)/obj

##############################################################################
## main rules

SOURCES = $(wildcard $(SOURCE_DIR)/main/ada/*.adb)
TARGET  = $(TARGET_DIR)/$(PROJ_NAME)$(TARGET_EXT)

## adactl expects absolute path arguments
ARU_FILE = $(realpath ../rules.aru)
LOG_FILE = $(realpath $(TARGET_DIR))/adactl_log.txt

lint:
	cd $(TARGET_DIR); \
	"$(ADACTL)" -v -f "$(ARU_FILE)" -o "$(LOG_FILE)" -w "$(realpath $(SOURCE_DIR))/*.adb"
 
all: build run

build: $(TARGET)

$(TARGET): $(SOURCES)
	[[ -d "$(TARGET_OBJ_DIR)" ]] || "$(MKDIR)" -p "$(TARGET_OBJ_DIR)"
	"$(GNATMAKE)" $(XXX_OPTS) -d -gnat2022 -we -D "$(TARGET_OBJ_DIR)" -o "$(TARGET)" $^

clean:
	"$(RM)" -rf "$(TARGET_DIR)"

run: build
	"$(TARGET)"
  
help:
	@$(ECHO) "Usage: make all|build|clean|help|lint|run"
	@$(ECHO) ""
	@$(ECHO) "   Subcommands:"
	@$(ECHO) "     all    alias for build"
	@$(ECHO) "     build  compile Ada source files"
	@$(ECHO) "     clean  delete generated files"
	@$(ECHO) "     help   display this help message"
	@$(ECHO) "     lint   analyze Ada source files"
	@$(ECHO) "     run    execute main program \"$(TARGET)\""

##############################################################################
## phony

.PHONY: all build clean help run

.SUFFIXES:
.SUFFIXES: .adb .adc .ads .o .obj .exe
